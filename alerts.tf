resource "kubernetes_manifest" "argocd_app_health_alert" {
  count = var.alerts_enabled ? 1 : 0
  manifest = {
    "apiVersion" = "monitoring.coreos.com/v1"
    "kind"       = "PrometheusRule"
    "metadata" = {
      "name"      = "argocd-degraded-app-alert"
      "namespace" = "${var.argo_cd_namespace_name}"
      "labels" = {
        "release" = "${var.prometheus_release}"
      }
    }
    "spec" = {
      "groups" = [
        {
          "name" = "argocd-app-health"
          "rules" = [
            {
              "alert" = "ArgoCDDegradedApp"
              "expr"  = "sum(argocd_app_info{namespace=~\"argocd\",health_status=\"Degraded\"}) > ${var.degraded_app_treshold}"
              "for"   = "5m"
              "labels" = {
                "severity" = "critical"
              }
              "annotations" = {
                "summary"     = "ArgoCD Degraded App Alert"
                "description" = "More than ${var.degraded_app_treshold} ArgoCD applications found degraded here: <https://${var.argo_cd_subdomain_name}.${var.argo_cd_domain_name}/applications?health=Degraded | ${var.argo_cd_subdomain_name}.${var.argo_cd_domain_name}>."
              }
            }
          ]
        }
      ]
    }
  }
}
