# CREDENTIALS
variable "client_id" {}

variable "client_secret" {}

variable "tenant_id" {}

variable "subscription_id" {}


# NAME OF INSTANCE

variable "env_name" {}
#LOCATION OF INSTANCE

variable "location" {
  type = string
  description  = "---- "
  default  = "North Europe"
}

# USERNAME ADMIN

variable "admin_username" {
  type = string
  description  = "---- "
  default  = "ubuntu"
}

# RESOURCE GROUP


variable "vm_resource_group_name" {
  type = string
  description  = "---- "
  default  = "Test_Resource_Group"
}


# SECURITY GROUP

variable "vm_sg_name" {
  type = string
  description  = "---- "
  default  = "TestSG"
}

# REQUIREMENTS OF VM

variable "vm_size" {
  type = string
  description  = "---- "
  default  = "Standard_B2ms"
}


variable "volume_size_instance1" {
type = string
 description  = "---- "
default  = "20"
}

variable "storage_os_disk_name" {
  type = string
  description  = "---- "
  default  = "TestOS_disk"
}

variable "storage_os_disk_caching" {
  type = string
  description  = "---- "
  default  = "ReadWrite"
}

variable "storage_os_disk_create_option" {
  type = string
  description  = "----"
  default  = "FromImage"
}

variable "storage_os_disk_managed_disk_type" {
  type = string
  description  = "----"
  default  = "Standard_LRS"
}

variable "storage_data_disk_lun" {
  type = string
  description  = "----"
  default  = "1"
}


  # storage_image_reference

variable "storage_image_reference_publisher" {
  type = string
  description  = "----"
  default  = "Canonical"
}


variable "storage_image_reference_offer" {
  type = string
  description  = "----"
  default  = "UbuntuServer"
}

variable "storage_image_reference_sku" {
  type = string
  description  = "----"
  default  = "18.04-LTS"
}


variable "storage_image_reference_version" {
  type = string
  description  = "----"
  default  = "latest"
}

  # storage_data_disk

variable "storage_data_disk_name" {
  type = string
  description  = "----"
  default  = ""
}


variable "storage_data_disk_managed_disk_type" {
  type = string
  description  = "----"
  default  = "x"
}


variable "storage_data_disk_create_option" {
  type = string
  description  = "----"
  default  = "Empty"
}

  # os_profile_linux_config

variable "os_profile_linux_config_disable_password_authentication" {
  type = string
  description  = "----"
  default  = "true"
}


# NETWORK

variable "network_name" {
  type = string
  description  = "az-CI"
  default  = "az_CI_Test"
}


variable "network_address_space" {
  type = list
  description  = "---"
  default = ["10.0.0.0/16"]
}


variable "publicip_name" {
  type = string
  description  = " ---- "
  default  = "PublicIpTest"
}

variable "publicip_allocation_method" {
  type = string
  description  = " ---- "
  default  = "Dynamic"
}


variable "subnet_name" {
  type = string
  description  = "subnet1"
  default = "subnet1_Test"
}


variable "subnet_address_prefix" {
  type = string
  description  = "---"
  default = "10.0.1.0/24"
}


variable "nic_name" {
  type = string
  description  = " ---- "
  default = "nic_Test"
}


variable "nic_ip_configuration_name" {
  type = string
  description  = " ---- "
  default = "nic_ip_Test"
}

variable "nic_ip_configuration_private_ip_address_allocation" {
  type = string
  description  = " ---- "
  default = "Dynamic"
}

# TAGS
  # TAGS INSTANCE
variable "tag_client" {
  type = string
  description  = "babel-internal"
  default  = "babel-internal-test"
}

variable "tag_project" {
  type = string
  description  = "ci-il25"
  default  = "CI-il25-test"
}

variable "tag_clientApp" {
  type = string
  description  = "---- "
  default  = "x"
}

  # INSTALLATION SCRIPT

variable scfile{
    type = string
    default = "userdata.bash"
}


  # TAGS ENVIRONMENT

variable "tags_environment_instance" {
  type = string
  description  = "----"
  default  = "dev-test"
}

variable "tags_component_instance" {
  type = string
  description  = "----"
  default  = "Test"
}

variable "tags_environment_resource_group" {
  type = string
  description  = " ---- "
  default  = "Test"
}

variable "tags_environment_network" {
  type = string
  description  = " ---- "
  default  = "CI-network-test"
}

variable "tags_environment_publicip" {
  type = string
  description  = " ---- "
  default  = ""
}

variable "tags_environment_vm_sg" {
  type = string
  description  = " ---- "
  default = ""
}


variable "tags_environment_nic" {
  type = string
  description  = " ---- "
  default = ""
}
