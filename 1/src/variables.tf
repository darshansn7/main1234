#nic variables
variable "nic_name" {
  type        = string
  description = "network interferance name"
  default     = ""
}

variable "nic_config_name" {
  type        = string
  description = "network interferance config name"
  default     = ""
}

variable "nic_private_ip_address_allocation" {
  type        = string
  description = "specifies private address allocation type"
  default     = ""
}

variable "subnet_name" {
  type        = string
  description = "subnet name"
  default     = ""
}

variable "vnet_name" {
  type        = string
  description = "vnet name"
  default     = ""
}

#virtual machine variables
variable "virtual_machine_name" {
  type        = string
  description = "virtual machine name"
  default     = ""
}

variable "rg_location" {
  type        = string
  description = "resource group location"
  default     = "eastus"
}

variable "vm_rg" {
  type        = string
  description = "virtual machine resource group name"
  default     = ""
}

variable "vm_size" {
  type        = string
  description = "size of the virtual machine"
  default     = ""
}

variable "vm_storage_image_id" {
  type        = string
  description = "vm image id"
  default     = ""
}

variable "vm_storage_image_publisher" {
  type        = string
  description = "publisher of the image used to create the virtual machine"
  default     = "Canonical"
}

variable "vm_storage_image_offer" {
  type        = string
  description = "offer of the image used to create the virtual machine"
  default     = "UbuntuServer"
}

variable "vm_storage_image_sku" {
  type        = string
  description = "SKU of the image used to create the virtual machine"
  default     = "16.04-LTS"
}

variable "vm_storage_image_version" {
  type        = string
  description = "version of the image used to create the virtual machine"
  default     = "latest"
}

variable "vm_storage_os_disk_name" {
  type        = string
  description = "name of the OS Disk."
  default     = ""
}

variable "vm_storage_os_disk_caching" {
  type        = string
  description = "Specifies the caching requirements for the OS Disk"
  default     = ""
}

variable "vm_storage_os_disk_create_option" {
  type        = string
  description = "Specifies how the OS Disk should be created ,Possible values are Attach and FromImage"
  default     = ""
}

variable "vm_storage_os_disk_managed_disk_type" {
  type        = string
  description = "Specifies the type of Managed Disk which should be created"
  default     = ""
}

variable "disk_name" {
  type = set(object(
    {
      name              = string
      lun               = string
      disk_size_gb      = string
      create_option     = string
      managed_disk_type = string

    }
  ))
  default = [

    {
      name              = "st1"
      lun               = "0"
      disk_size_gb      = 100
      create_option     = "Empty"
      managed_disk_type = "Standard_LRS"
  }]
}

variable "vm_computer_name" {
  type        = string
  description = "virtual machine computer name"
  default     = ""
}

variable "vm_admin_username" {
  type        = string
  description = "virtual machine admin user name"
  default     = ""
}

#key
variable "vm_key" {
  type        = string
  description = "vm-key"
  default     = ""
}

variable "vm_key_name" {
  type        = string
  description = "vm-name"
  default     = ""
}

variable "key_vault_name" {
  type = string
}

variable "keyvault_vm_secret" {
  type = string
}

#ansible
variable "vm_packages" {
  type    = list(string)
  default = [""]
}

variable "ansible_playbook" {
  type        = list(string)
  description = "ansible play book names"
  default     = [""]
}

variable "private_key" {
  type        = string
  description = "key"
  #default     = "./vm-key.pem"
}

variable "client_id" {
  type        = string
  description = "client id"
  default     = ""
}

variable "client_secret" {
  type        = string
  description = "client secret"
  default     = ""
}

variable "tenant_id" {
  type        = string
  description = "tenant id"
  default     = ""
}

variable "subscription_id" {
  type        = string
  description = "subscription id"
  default     = ""
}

variable "storage_account_name" {
  type = string
}

variable "container_name" {
  type = string
}
