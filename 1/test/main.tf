provider "azurerm" {
  skip_provider_registration = true
  features {}
}

module "vm1" {
  source = "./../src"
  #
  vm_rg       = "key-test"
  rg_location = "eastus"
  vnet_name   = "key-test-vnet"
  subnet_name = "default"

  #nic
  nic_name                          = local.vm1_nic_name
  nic_config_name                   = "vm_internal"
  nic_private_ip_address_allocation = "Dynamic"

  #key-vault
  vm_key_name        = local.vm1_key_name
  key_vault_name     = "test-key-vault4589"
  keyvault_vm_secret = local.vm1_keyvault_vm_secret

  #vm
  virtual_machine_name                 = local.virtual_machine1_name
  vm_size                              = "Standard_D4s_v3"
  vm_storage_image_id                  = ""
  vm_storage_image_publisher           = "OpenLogic"
  vm_storage_image_offer               = "CentOS"
  vm_storage_image_sku                 = "7.4"
  vm_storage_image_version             = "latest"
  vm_storage_os_disk_name              = "osdisk"
  vm_storage_os_disk_caching           = "ReadWrite"
  vm_storage_os_disk_create_option     = "FromImage"
  vm_storage_os_disk_managed_disk_type = "Standard_LRS"
  disk_name                            = var.disk_name
  vm_computer_name                     = "aipuser1"
  vm_admin_username                    = "aipuser1"

  #ansible
  vm_packages          = ["jdk-11.0.12_linux-x64_bin.rpm", "apache-zookeeper-3.5.6-bin.tar.gz"]
playbook     = "main1"
zookeeper_host_name = "aipuser1"
elasticsearch_host_name = "null"
  private_key          = "./${local.virtual_machine1_name}/${local.vm1_key_name}.pem"
  client_id            = "c9ce8279-a623-4c97-90fa-4b7fa1e90ef4"
  client_secret        = "uOyMqb1rmHIywV.LACrDp~psEVcaVUyVrt"
  tenant_id            = "675c705c-2aae-4d47-9a2a-25476ddc9ccf"
  subscription_id      = "f1acf2de-6f0e-4092-ae5f-72618cfc297a"
  storage_account_name = "teststorage75487567"
  container_name       = "test"


  # #vm backup
  # recovery_services_vault_name = local.recovery_services_vault_name
  # recovery_services_vault_sku  = "Standard"
  # vm_backup_policy_name        = local.vm_backup_policy_name
  # # policy
  # time_zone                      = "UTC"
  # instant_restore_retention_days = 2
  # backup_frequency               = "Daily"
  # backup_time                    = "06:30"
  # retention_daily_count          = 10
  # soft_delete_enabled            = true
}


module "vm2" {
  source = "./../src"
  #
  vm_rg       = "key-test"
  rg_location = "eastus"
  vnet_name   = "key-test-vnet"
  subnet_name = "default"

  #nic
  nic_name                          = local.vm2_nic_name
  nic_config_name                   = "vm_internal"
  nic_private_ip_address_allocation = "Dynamic"

  #key-vault
  vm_key_name        = local.vm2_key_name
  key_vault_name     = "test-key-vault4589"
  keyvault_vm_secret = local.vm2_keyvault_vm_secret

  #vm
  virtual_machine_name                 = local.virtual_machine2_name
  vm_size                              = "Standard_D3_v2"
  vm_storage_image_id                  = ""
  vm_storage_image_publisher           = "OpenLogic"
  vm_storage_image_offer               = "CentOS"
  vm_storage_image_sku                 = "7.4"
  vm_storage_image_version             = "latest"
  vm_storage_os_disk_name              = "osdisk"
  vm_storage_os_disk_caching           = "ReadWrite"
  vm_storage_os_disk_create_option     = "FromImage"
  vm_storage_os_disk_managed_disk_type = "Standard_LRS"
  disk_name                            = var.disk_name
  vm_computer_name                     = "aipuser2"
  vm_admin_username                    = "aipuser2"

  #ansible
  vm_packages          = ["jdk-11.0.12_linux-x64_bin.rpm", "elasticsearch-7.2.1-x86_64.rpm", "Saga-1.2.1.5.zip" ]
playbook     = "main2"
zookeeper_host_name = "aipuser1"
elasticsearch_host_name = "aipuser2"
  private_key          = "./${local.virtual_machine2_name}/${local.vm2_key_name}.pem"
  client_id            = "c9ce8279-a623-4c97-90fa-4b7fa1e90ef4"
  client_secret        = "uOyMqb1rmHIywV.LACrDp~psEVcaVUyVrt"
  tenant_id            = "675c705c-2aae-4d47-9a2a-25476ddc9ccf"
  subscription_id      = "f1acf2de-6f0e-4092-ae5f-72618cfc297a"
  storage_account_name = "teststorage75487567"
  container_name       = "test"


  # #vm backup
  # recovery_services_vault_name = local.recovery_services_vault_name
  # recovery_services_vault_sku  = "Standard"
  # vm_backup_policy_name        = local.vm_backup_policy_name
  # # policy
  # time_zone                      = "UTC"
  # instant_restore_retention_days = 2
  # backup_frequency               = "Daily"
  # backup_time                    = "06:30"
  # retention_daily_count          = 10
  # soft_delete_enabled            = true
  depends_on = [module.vm1]
}

module "vm3" {
  source = "./../src"
  #
  vm_rg       = "key-test"
  rg_location = "eastus"
  vnet_name   = "key-test-vnet"
  subnet_name = "default"

  #nic
  nic_name                          = local.vm3_nic_name
  nic_config_name                   = "vm_internal"
  nic_private_ip_address_allocation = "Dynamic"

  #key-vault
  vm_key_name        = local.vm3_key_name
  key_vault_name     = "test-key-vault4589"
  keyvault_vm_secret = local.vm3_keyvault_vm_secret

  #vm
  virtual_machine_name                 = local.virtual_machine3_name
  vm_size                              = "Standard_D3_v2"
  vm_storage_image_id                  = ""
  vm_storage_image_publisher           = "OpenLogic"
  vm_storage_image_offer               = "CentOS"
  vm_storage_image_sku                 = "7.4"
  vm_storage_image_version             = "latest"
  vm_storage_os_disk_name              = "osdisk"
  vm_storage_os_disk_caching           = "ReadWrite"
  vm_storage_os_disk_create_option     = "FromImage"
  vm_storage_os_disk_managed_disk_type = "Standard_LRS"
  disk_name                            = var.disk_name
  vm_computer_name                     = "aipuser3"
  vm_admin_username                    = "aipuser3"

  #ansible
  vm_packages          = ["jdk-11.0.12_linux-x64_bin.rpm", "python-lxml-3.2.1-4.el7.x86_64.rpm", "aspire-4.0-SNAPSHOT.tar.gz"]
playbook     = "main3"
zookeeper_host_name = "aipuser1"
elasticsearch_host_name = "aipuser2"
  private_key          = "./${local.virtual_machine3_name}/${local.vm3_key_name}.pem"
  client_id            = "c9ce8279-a623-4c97-90fa-4b7fa1e90ef4"
  client_secret        = "uOyMqb1rmHIywV.LACrDp~psEVcaVUyVrt"
  tenant_id            = "675c705c-2aae-4d47-9a2a-25476ddc9ccf"
  subscription_id      = "f1acf2de-6f0e-4092-ae5f-72618cfc297a"
  storage_account_name = "teststorage75487567"
  container_name       = "test"


  # #vm backup
  # recovery_services_vault_name = local.recovery_services_vault_name
  # recovery_services_vault_sku  = "Standard"
  # vm_backup_policy_name        = local.vm_backup_policy_name
  # # policy
  # time_zone                      = "UTC"
  # instant_restore_retention_days = 2
  # backup_frequency               = "Daily"
  # backup_time                    = "06:30"
  # retention_daily_count          = 10
  # soft_delete_enabled            = true
  depends_on = [module.vm2]
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



module "vm4" {
  source = "./../src"
  #
  vm_rg       = "key-test"
  rg_location = "eastus"
  vnet_name   = "key-test-vnet"
  subnet_name = "default"
elastic = false
  #niic
  nic_name                          = local.vm4_nic_name
  nic_config_name                   = "vm_internal"
  nic_private_ip_address_allocation = "Dynamic"

  #key-vault
  vm_key_name        = local.vm4_key_name
  key_vault_name     = "test-key-vault4589"
  keyvault_vm_secret = local.vm4_keyvault_vm_secret

  #vm
  virtual_machine_name                 = local.virtual_machine4_name
  vm_size                              = "Standard_D4s_v3"
  vm_storage_image_id                  = ""
  vm_storage_image_publisher           = "OpenLogic"
  vm_storage_image_offer               = "CentOS"
  vm_storage_image_sku                 = "7.4"
  vm_storage_image_version             = "latest"
  vm_storage_os_disk_name              = "osdisk"
  vm_storage_os_disk_caching           = "ReadWrite"
  vm_storage_os_disk_create_option     = "FromImage"
  vm_storage_os_disk_managed_disk_type = "Standard_LRS"
  disk_name                            = var.disk_name
  vm_computer_name                     = "aipuser4"
  vm_admin_username                    = "aipuser4"

  #ansible
  vm_packages          = ["jdk-11.0.12_linux-x64_bin.rpm",  "python-lxml-3.2.1-4.el7.x86_64.rpm", "aspire-4.0-SNAPSHOT.tar.gz"]
playbook     = "main4"
zookeeper_host_name = "aipuser1"
elasticsearch_host_name = "aipuser2"
  private_key          = "./${local.virtual_machine4_name}/${local.vm4_key_name}.pem"
  client_id            = "c9ce8279-a623-4c97-90fa-4b7fa1e90ef4"
  client_secret        = "uOyMqb1rmHIywV.LACrDp~psEVcaVUyVrt"
  tenant_id            = "675c705c-2aae-4d47-9a2a-25476ddc9ccf"
  subscription_id      = "f1acf2de-6f0e-4092-ae5f-72618cfc297a"
  storage_account_name = "teststorage75487567"
  container_name       = "test"


  # #vm backup
  # recovery_services_vault_name = local.recovery_services_vault_name
  # recovery_services_vault_sku  = "Standard"
  # vm_backup_policy_name        = local.vm_backup_policy_name
  # # policy
  # time_zone                      = "UTC"
  # instant_restore_retention_days = 2
  # backup_frequency               = "Daily"
  # backup_time                    = "06:30"
  # retention_daily_count          = 10
  # soft_delete_enabled            = true
}
