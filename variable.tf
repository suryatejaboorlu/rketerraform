variable "rancher_version" {
  default = "v2.4.8"
}

variable "rancher_server_dns" {
  default = ""
}

variable "ssh_path" {
  default = "/path/to/ssh.key"
}

variable "private_registry_url" {
  default = ""
}

variable "private_registry_username" {
  default = ""
}

variable "private_registry_password" {
  default = ""
}

variable "tls_crt" {
  default = "path/to/tls.crt"
}

variable "tls_key" {
  default = "path/to/tls.key"
}

variable "ca_key" {
  default = "/path/to/myCA.pem"
}

variable "helm_repository_url" {
  default = ""
}

variable "system_default_registry" {
  default = ""
}

variable "image_pull_secret" {
  default = ""
}

variable "rancher_image" {
  default = "10.0.3.222:8082/docker/rancher/rancher"
}
