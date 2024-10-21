
variable "nginx_ingress_class_name" {
  default = "nginx"
}

variable "argo_cd_domain_name" {
  default = "<your-domain.com>"
}

variable "argo_cd_subdomain_name" {
  default = "<your-subdomain>"
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

variable "env" {
  default = "dev"
}

variable "gce_project" {
  default = "<your-project>"
}

variable "gce_zone" {
  default = "<your-zone>"
}

variable "storage_project" {
  default = "<your-storage-project>"
}

variable "gke_cluster_name" {
  default = "<your-cluster-name>"
}

variable "google_region" {
  default = "<your-region>"
}

variable "argo_cd_chart_version" {
  default     = "7.6.12"
  description = "https://artifacthub.io/packages/helm/argo/argo-cd"
}

variable "client_secret" {
  description = "GitHub secret for accessing the repository"
  type        = string
  default     = null
  sensitive   = true
}

variable "client_key" {
  description = "GitHub key for accessing the repository"
  type        = string
  default     = null
  sensitive   = true
}

variable "github_org" {
  default     = ""
  type        = string
  description = "Name of your organization as shown in the GitHub URL path for ArgoCD Dex authentication."
}

variable "enable_web_terminal" {
  default     = false
  type        = bool
  description = "Whether to enable web terminal on ArgoCD console"
}

variable "platform" {
  description = "Choose between 'github' or 'bitbucket-cloud'"
  type        = string
  validation {
    condition     = contains(["github", "bitbucket-cloud"], var.platform)
    error_message = "Platform must be either 'github' or 'bitbucket-cloud'"
  }
}