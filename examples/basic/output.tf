
output "app_service_endpoint" {
  description = "Endpoint do serviço da aplicação"
  value       = module.app.app_service_endpoint
}