# aqui contém a configuração principal para implantar um aplicativo no Kubernetes
# incluindo Deployment, Service e Ingress

provider "kubernetes" {
    host                  = var.cluster_endpoint
    cluster_ca_certificate = base64decode(var.cluster_certificate_authority_data)
#    cluster_ca_certificate = var.cluster_certificate_authority_data
    token                 = var.cluster_token
}

resource "kubernetes_deployment" "app" {
    metadata {
      name = var.app_name
      labels = {
        app = var.app_name
      }
    }

    spec {
      replicas = var.app_replicas

      selector {
        match_labels = {
          app = var.app_name
        }
      }

      template {
        metadata {
          labels = {
            app = var.app_name
          }
        }

        spec {
          container {
            name = var.app_name
            image = var.app_image

            port {
              container_port = var.app_port
            }

            env {
              name = "REDIS_HOST"
              value = var.redis_host
            }
          }
        }
      }
    }
}

resource "kubernetes_service" "app" {
    metadata {
      name = "${var.app_name}-service"
    }

    spec {
      selector = {
        app = var.app_name
      }

      port {
        port = 80
        target_port = var.app_port
      }

      type = "LoadBalancer"
    }
}

resource "kubernetes_ingress_v1" "app" {
  metadata {
    name = "${var.app_name}-ingress"
    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
      "cert-manager.io/cluster-issuer" = var.cert_manager_issuer
    }
  }

  spec {
    rule {
      host = var.app_ingress_host
      http {
        path {
          path = "/"
          backend {
            service {
              name = kubernetes_service.app.metadata[0].name
              port {
                number = 80
              }
            }
          }
        }
      }
    }

    tls {
      hosts = [var.app_ingress_host]
      secret_name = "${var.app_name}-tls"
    }
  }
}
