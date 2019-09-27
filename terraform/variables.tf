variable "prefix" {
  description = "The prefix which should be used for all resources in this project"
  default = "azure-spark-pred"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  default = "East US"
}

variable "hdi_admin_username" {
  description = "The administrator username for Ambari and SSH username for head, zookeeper, and worker nodes"
  default = "hdiadmin"
}

variable "hdi_admin_password" {
  description = "The administrator username for Ambari and SSH username for head, zookeeper, and worker nodes"
  default = "Pa$$w0rd123"
}
