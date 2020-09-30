variable "rancher_version" {
  default = "v2.4.8"
  # Taken by helm_chart to specify which rancher version to install
}

variable "rancher_fqdn" {
  default = ""
  #Fully Qualified Domain Name for your Rancher Server
}

variable "ssh_private_key" {
  default = "/path/to/ssh.key"
  #Private ssh key to access the nodes
}

variable "private_registry_url" {
  default = ""
  #URL of private registry where it will pull the RKE related  docker images from, example="http://10.0.1.0:8888/docker"
}

variable "private_registry_username" {
  default = ""
}

variable "private_registry_password" {
  default = ""
}

variable "tls_crt" {
  default = "path/to/custom.crt"
  # this variable takes the path of the custom ssl cert
}

variable "tls_key" {
  default = "path/to/custom.key"
  # this variable takes the path of the custom ssl key
}

variable "ca_crt" {
  default = "/path/to/CA.pem"
  # this variable takes the path of the custom CA certificate
}

variable "helm_secret_username" {
  default = ""
  #provide the helm repo username and it will create a secret(imagePullSecret)
}

variable "helm_secret_password" {
  default = ""
  #provide the helm repo password as helm passoword and it will create a secret(imagePullSecret)
}

variable "helm_image_pull_secret_name" {
  default = "helmimagesecret"
  #Takes the secret name
}


variable "helm_repository_url" {
  default = "http://0.0.0.0/repository"
}

variable "system_default_registry" {
  default = "10.0.3.222:8082/docker"
}

variable "rancher_image" {
  default = "10.0.3.222:8082/docker/rancher/rancher"
}
