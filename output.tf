output "rancher_url" {
  value = "https://${var.rancher_server_dns}"
}

output "kubeconfig_yaml" {
  value = rke_cluster.rkecluster.kube_config_yaml
  sensitive = true
}

output "kubeconfig_api_server_url" {
  value = rke_cluster.rkecluster.api_server_url
}

output "kubeconfig_client_cert" {
  value = rke_cluster.rkecluster.client_cert
  sensitive = true
}

output "kubeconfig_client_key" {
  value = rke_cluster.rkecluster.client_key
  sensitive = true
}

output "kubeconfig_ca_crt" {
  value = rke_cluster.rkecluster.ca_crt
  sensitive = true
}
