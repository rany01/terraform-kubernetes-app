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
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.36.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_deployment.app](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment) | resource |
| [kubernetes_ingress_v1.app](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/ingress_v1) | resource |
| [kubernetes_service.app](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_image"></a> [app\_image](#input\_app\_image) | Imagem Docker da aplicação | `string` | n/a | yes |
| <a name="input_app_ingress_host"></a> [app\_ingress\_host](#input\_app\_ingress\_host) | Host do Ingress | `string` | n/a | yes |
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | Nome do aplicativo | `string` | n/a | yes |
| <a name="input_app_port"></a> [app\_port](#input\_app\_port) | Porta da aplicação | `number` | `5000` | no |
| <a name="input_app_replicas"></a> [app\_replicas](#input\_app\_replicas) | Número de réplicas da aplicação | `number` | `2` | no |
| <a name="input_cert_manager_issuer"></a> [cert\_manager\_issuer](#input\_cert\_manager\_issuer) | Cluser Issuer do cert-manager para TLS | `string` | `"letsencrypt-prod"` | no |
| <a name="input_cluster_certificate_authority_data"></a> [cluster\_certificate\_authority\_data](#input\_cluster\_certificate\_authority\_data) | Dados do certificado de autoria do cluster EKS | `string` | n/a | yes |
| <a name="input_cluster_endpoint"></a> [cluster\_endpoint](#input\_cluster\_endpoint) | Endpoint do cluster EKS | `string` | n/a | yes |
| <a name="input_cluster_token"></a> [cluster\_token](#input\_cluster\_token) | Token de acesso ao cluster EKS | `string` | n/a | yes |
| <a name="input_redis_host"></a> [redis\_host](#input\_redis\_host) | Host do Redis | `string` | `"redis-service"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_service_endpoint"></a> [app\_service\_endpoint](#output\_app\_service\_endpoint) | Endpoint do serviço da aplicação |
| <a name="output_app_service_name"></a> [app\_service\_name](#output\_app\_service\_name) | Nome do serviço da aplicação |
| <a name="output_ingress_host"></a> [ingress\_host](#output\_ingress\_host) | Host do Ingress da aplicação |
<!-- END_TF_DOCS -->