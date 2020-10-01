#RKE
provider "rke" {}

resource "rke_cluster" "rkecluster" {
  dynamic nodes {
    for_each = var.airgapped_nodes
    content{
      address = nodes.value
      user    = "ubuntu"
      role    = ["controlplane", "worker", "etcd"]
      ssh_key = file(var.ssh_private_key)
   }
  }
  upgrade_strategy {
      drain = true
      max_unavailable_worker = "20%"
  }
  private_registries {
      url = var.private_registry_url
      user = var.private_registry_username
      password = var.private_registry_password
      is_default = true
    }

}

#
#
#
#
#
#
#Kubernetes  namespace and secrets
provider "kubernetes" {
  load_config_file = "false"

  host = rke_cluster.rkecluster.api_server_url

  client_certificate     = rke_cluster.rkecluster.client_cert
  client_key             = rke_cluster.rkecluster.client_key
  cluster_ca_certificate = rke_cluster.rkecluster.ca_crt
}
resource "kubernetes_namespace" "cattle-sys" {
    metadata {
      name = "cattle-system"
   }
}

resource "kubernetes_secret" "tls-secret" {

      metadata {
        name      = "tls-rancher-ingress"
        namespace = "cattle-system"
      }

      data = {
        "tls.crt" = file(var.tls_crt)
        "tls.key" = file(var.tls_key)
      }

    }

resource "kubernetes_secret" "tls-ca-secret" {

              metadata {
                name      = "tls-ca"
                namespace = "cattle-system"
              }

              data = {
                "cacerts.pem" = file(var.ca_crt)
            }
          }
resource "kubernetes_secret" "helm_image_pull_secret" {

              metadata {
                    name      = var.helm_image_pull_secret_name
                        }
                  type = "Opeque"
                  data = {
                      "username" = var.helm_secret_username
                      "password" = var.helm_secret_password
            }
          }

#
#
#
#
#
#
#
#
#
#
#Rancher installation on RKE


provider "helm" {
  kubernetes {
    load_config_file = false
    host = rke_cluster.rkecluster.api_server_url
    client_certificate     = rke_cluster.rkecluster.client_cert
    client_key             = rke_cluster.rkecluster.client_key
    cluster_ca_certificate = rke_cluster.rkecluster.ca_crt
 }
}
resource "helm_release" "rancher_server" {

            repository       = var.helm_repository_url
            name             = "rancher"
            chart            = "rancher"
            version          = var.rancher_version
            namespace        = "cattle-system"

            set {
              name  = "hostname"
              value = var.rancher_fqdn
            }

            set {
              name = "imagePullSecrets[0].name"
              value = var.helm_image_pull_secret_name
            }

            set {
              name = "systemDefaultRegistry"
              value = var.system_default_registry
            }

            set {
              name = "rancherImage"
              value = var.rancher_image
            }

            set {
              name = "ingress.tls.source"
              value = "secret"
            }

            set {
              name = "privateCA"
              value = "true"
            }
          }
