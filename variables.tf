variable "nginx_ingress_class_name" {
  default = "nginx"
}

variable "argo_cd_domain_name" {
  default = "example.com"
}

variable "argo_cd_subdomain_name" {
  default = "sub"
}

variable "lets_encrypt_issuer_name" {
  default = "<your-issuer>"
}

variable "argo_cd_namespace_name" {
  default = "argocd"
}

variable "argocd_ip_whitelist" {
  default = "0.0.0.0/0"
}

variable "argo_cd_image_global_version" {
  default = "v2.11.0"
}

variable "argo_cd_chart_version" {
  default     = "6.8.0"
  description = "https://artifacthub.io/packages/helm/argo/argo-cd"
}

variable "github_secret" {}
variable "github_key" {}