
data "google_client_config" "default" {}

data "google_container_cluster" "k8s" {
  name     = var.gke_cluster_name
  location = var.gce_location
  project  = var.gce_project
}

provider "kubernetes" {
  host                   = "https://${data.google_container_cluster.k8s.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(data.google_container_cluster.k8s.master_auth[0].cluster_ca_certificate)
}
provider "helm" {
  kubernetes {
    host                   = "https://${data.google_container_cluster.k8s.endpoint}"
    token                  = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(data.google_container_cluster.k8s.master_auth[0].cluster_ca_certificate)
  }
}