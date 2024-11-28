locals {
  enable_workload_identity = var.service_acc_name == "" ? true : false
}