
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

variable "google_credentials" {
  default = "/tmp/gcloud_credentials.json"
}

variable "google_region" {
  default = "<your-region>"
}

variable "argo_cd_chart_version" {
  default     = "7.6.8"
  description = "https://artifacthub.io/packages/helm/argo/argo-cd"
}

variable "github_secret" {
  description = "GitHub secret for accessing the repository"
  type        = string
  default     = null
  sensitive   = true
}

variable "github_key" {
  description = "GitHub key for accessing the repository"
  type        = string
  default     = null
  sensitive   = true
}

variable "github_org" {
  default     = "<your-github-org-name>"
  type        = string
  description = "Name of your organization as shown in the GitHub URL path"
}

variable "enable_web_terminal" {
  default     = false
  type        = bool
  description = "Whether to enable web terminal on ArgoCD console"
}