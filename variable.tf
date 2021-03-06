variable "rancher_version" {
  default = "v2.4.8"
  # Taken by helm_chart to specify which rancher version to install
}

variable "rke_user" {
  default = "ubuntu"
  # the user created in all the nodes in rke cluster
}

variable "airgapped_nodes" {
  default = ["ip-1","ip-2","ip=3"]
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
  #URL of private registry where it will pull the RKE related  docker images from, example="10.0.1.0:8082/docker"
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
  #takes the username and converts it into base64
}

variable "helm_secret_password" {
  default = ""
  #takes the password and converts it into base64
}

variable "helm_image_pull_secret_name" {
  default = "helmimagesecret"
  #This will be the name of secret created.
}


variable "helm_repository_url" {
  default = "http://0.0.0.0/repository"
  #URL of the private helm repository where it will pull the rancher charts from
}

variable "system_default_registry" {
  default = "10.0.3.222:8082/docker"
  # Mention the default registry where images must be pulled from
}

variable "rancher_image" {
  default = "10.0.3.222:8082/docker/rancher/rancher"
  #Image that should be pulled from the private docker registry to install rancher.
}
