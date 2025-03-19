# arquivo de definição de saídas do módulo,
# que podem ser usadas em outros módulos ou no projeto principal

output "app_service_name" {
    description = "Nome do serviço da aplicação"
    value       = kubernetes_service.app.metadata.0.name
}

output "app_service_endpoint" {
    description = "Endpoint do serviço da aplicação"
    value       = kubernetes_service.app.status.0.load_balancer.0.ingress.0.hostname
}

output "ingress_host" {
    description = "Host do Ingress da aplicação"
    value       = var.app_ingress_host
}