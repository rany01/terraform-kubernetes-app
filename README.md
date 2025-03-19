# Terraform Kubernetes App Module

Este módulo implanta uma aplicação no Kubernetes, incluindo Deployment, service e Ingress.

## Como Usar

```hcl
module "app" {
  source = "github.com/rany01/terraform-kubernetes-app?ref=v1.0.0"

  cluster_endpoint                  = module.eks.cluster_endpoint
  cluster_certificate_authority_data = module.eks.cluster_certificate_authority_data
  cluster_token                     = data.aws_eks_cluster_auth.cluster.token
  app_name                          = "giropops-senhas"
  app_image                         = "rrany/giropops-senhas:latest"
  app_replicas                      = 2
  app_port                          = 5000
  redis_host                        = "redis-service"
  ingress_host                      = "giropops.rany.fun"
  cert_manager_issuer               = "letsencrypt-prod"
}