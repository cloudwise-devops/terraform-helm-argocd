<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.17.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.35.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_my-app-workload-identity"></a> [my-app-workload-identity](#module\_my-app-workload-identity) | terraform-google-modules/kubernetes-engine/google//modules/workload-identity | 33.1.0 |

## Resources

| Name | Type |
|------|------|
| [helm_release.argocd](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_manifest.argocd_app_health_alert](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_namespace.argocd](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alerts_enabled"></a> [alerts\_enabled](#input\_alerts\_enabled) | Enables Prometheus monitoring. | `bool` | `false` | no |
| <a name="input_argo_cd_chart_version"></a> [argo\_cd\_chart\_version](#input\_argo\_cd\_chart\_version) | https://artifacthub.io/packages/helm/argo/argo-cd | `string` | `"7.7.11"` | no |
| <a name="input_argo_cd_domain_name"></a> [argo\_cd\_domain\_name](#input\_argo\_cd\_domain\_name) | domain name for ArgoCD | `string` | n/a | yes |
| <a name="input_argo_cd_namespace_name"></a> [argo\_cd\_namespace\_name](#input\_argo\_cd\_namespace\_name) | n/a | `string` | `"argocd"` | no |
| <a name="input_argo_cd_subdomain_name"></a> [argo\_cd\_subdomain\_name](#input\_argo\_cd\_subdomain\_name) | subdomain name for ArgoCD | `string` | `"argocd"` | no |
| <a name="input_argocd_ip_whitelist"></a> [argocd\_ip\_whitelist](#input\_argocd\_ip\_whitelist) | n/a | `string` | `"0.0.0.0/0"` | no |
| <a name="input_client_key"></a> [client\_key](#input\_client\_key) | GitHub or Bitbucket key for accessing the repository | `string` | `null` | no |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | GitHub or Bitbucket secret for accessing the repository | `string` | `null` | no |
| <a name="input_degraded_app_treshold"></a> [degraded\_app\_treshold](#input\_degraded\_app\_treshold) | Degraded app level in argoCD installation. | `string` | `"0"` | no |
| <a name="input_enable_web_terminal"></a> [enable\_web\_terminal](#input\_enable\_web\_terminal) | Whether to enable web terminal on ArgoCD console | `bool` | `false` | no |
| <a name="input_env"></a> [env](#input\_env) | n/a | `string` | `"dev"` | no |
| <a name="input_gce_project"></a> [gce\_project](#input\_gce\_project) | The GCP project ID where the resources will be created | `string` | n/a | yes |
| <a name="input_github_org"></a> [github\_org](#input\_github\_org) | For Github: name of your organization as shown in the GitHub URL path for ArgoCD Dex authentication. | `string` | `null` | no |
| <a name="input_lets_encrypt_issuer_name"></a> [lets\_encrypt\_issuer\_name](#input\_lets\_encrypt\_issuer\_name) | n/a | `string` | `"cloudflare-issuer"` | no |
| <a name="input_metrics_enabled"></a> [metrics\_enabled](#input\_metrics\_enabled) | Enables Prometheus monitoring. | `bool` | `false` | no |
| <a name="input_nginx_ingress_class_name"></a> [nginx\_ingress\_class\_name](#input\_nginx\_ingress\_class\_name) | nginx ingress controller class name | `string` | `"nginx"` | no |
| <a name="input_platform"></a> [platform](#input\_platform) | Choose between 'github' or 'bitbucket-cloud' | `string` | n/a | yes |
| <a name="input_prometheus_release"></a> [prometheus\_release](#input\_prometheus\_release) | Prometheus release name which alert will be attached. | `string` | `"prometheus-community"` | no |
| <a name="input_service_account_name"></a> [service\_account\_name](#input\_service\_account\_name) | Service account name for ArgoCD to use. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_argocd_gcp_iam_service_account_email"></a> [argocd\_gcp\_iam\_service\_account\_email](#output\_argocd\_gcp\_iam\_service\_account\_email) | n/a |
| <a name="output_argocd_gcp_iam_service_account_name"></a> [argocd\_gcp\_iam\_service\_account\_name](#output\_argocd\_gcp\_iam\_service\_account\_name) | n/a |
| <a name="output_argocd_kubernetes_namespace"></a> [argocd\_kubernetes\_namespace](#output\_argocd\_kubernetes\_namespace) | n/a |
<!-- END_TF_DOCS -->