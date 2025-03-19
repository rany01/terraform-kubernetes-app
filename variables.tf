# arquivo de definição de variáveis que o módulo espera receber

variable "cluster_endpoint" {
  description = "Endpoint do cluster EKS" # variável para armazenar o endpoint do cluster
  type        = string
}

variable "cluster_certificate_authority_data" { # variável para armazenar o certificado de autoridade do cluster
    description = "Dados do certificado de autoria do cluster EKS"
    type        = string
}

variable "cluster_token" { # variável para armazenar o token de acesso ao cluster
    description = "Token de acesso ao cluster EKS"
    type        = string
}

variable "app_name" { # variável para armazenar o nome do aplicativo
    description = "Nome do aplicativo"
    type        = string
}

variable "app_image" { # variável para armazenar a imagem do aplicativo
    description = "Imagem Docker da aplicação"
    type        = string
}

variable "app_replicas" { # variável para armazenar o número de réplicas do aplicativo
    description = "Número de réplicas da aplicação"
    type        = number
    default     = 2
}

variable "app_port" { # variável para armazenar a porta do aplicativo
    description = "Porta da aplicação"
    type        = number
    default     = 5000
}

variable "redis_host" { # variável para armazenar o host do Redis
    description = "Host do Redis"
    type        = string
    default     = "redis-service"
}

variable "app_ingress_host" { # variável para armazenar o host do Ingress
    description = "Host do Ingress"
    type        = string
}

variable "cert_manager_issuer" { # variável para armazenar o Cluster Issuer do cert-manager
    description = "Cluser Issuer do cert-manager para TLS"
    type        = string
    default     = "letsencrypt-prod"
}