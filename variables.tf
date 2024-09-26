
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

variable "env" {
  default = "dev"
}

variable "gce_project" {
  default = "mock-project-id"
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
  default     = "6.8.0"
  description = "https://artifacthub.io/packages/helm/argo/argo-cd"
}

variable "github_secret" {
  description = "GitHub secret for accessing the repository"
  type        = string
  default     = null
}

variable "github_key" {
  description = "GitHub key for accessing the repository"
  type        = string
  default     = null
}

variable "github_org" {
  default = "example-org"
}