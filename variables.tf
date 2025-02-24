
variable "nginx_ingress_class_name" {
  default     = "nginx"
  type        = string
  description = "nginx ingress controller class name"
}

variable "argo_cd_domain_name" {
  type        = string
  description = "domain name for ArgoCD"
}

variable "argo_cd_subdomain_name" {
  default     = "argocd"
  type        = string
  description = "subdomain name for ArgoCD"
}

variable "lets_encrypt_issuer_name" {
  default = "cloudflare-issuer"
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
  type        = string
  description = "The GCP project ID where the resources will be created"
}


variable "argo_cd_chart_version" {
  default     = "7.8.5"
  description = "https://artifacthub.io/packages/helm/argo/argo-cd"
}

variable "client_secret" {
  description = "GitHub or Bitbucket secret for accessing the repository"
  type        = string
  default     = null
  sensitive   = true
}

variable "client_key" {
  description = "GitHub or Bitbucket key for accessing the repository"
  type        = string
  default     = null
  sensitive   = true
}

variable "github_org" {
  default     = null
  type        = string
  description = "For Github: name of your organization as shown in the GitHub URL path for ArgoCD Dex authentication."
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

variable "metrics_enabled" {
  default     = false
  type        = bool
  description = "Enables Prometheus monitoring."
}

variable "alerts_enabled" {
  default     = false
  type        = bool
  description = "Enables Prometheus monitoring."
}

variable "prometheus_release" {
  default     = "prometheus-community"
  type        = string
  description = "Prometheus release name which alert will be attached."
}

variable "degraded_app_treshold" {
  default     = "0"
  type        = string
  description = "Degraded app level in argoCD installation."
}

variable "service_account_name" {
  type        = string
  default     = null
  description = "Service account name for ArgoCD to use."
}
