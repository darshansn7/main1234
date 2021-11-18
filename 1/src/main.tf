resource "azurerm_network_interface" "vm_nic" {
  name                = var.nic_name
  location            = var.rg_location
  resource_group_name = var.vm_rg

  ip_configuration {
    name                          = var.nic_config_name
    subnet_id                     = data.azurerm_subnet.main.id
    private_ip_address_allocation = var.nic_private_ip_address_allocation
  }
}


resource "azurerm_linux_virtual_machine" "linux_vm" {
  name                  = var.virtual_machine_name
  resource_group_name   = var.vm_rg
  location              = var.rg_location
  network_interface_ids = ["${azurerm_network_interface.vm_nic.id}"]
  size                  = var.vm_size

  source_image_reference {
    publisher = var.vm_source_image_publisher
    offer     = var.vm_source_image_offer
    sku       = var.vm_source_image_sku
    version   = var.vm_source_image_version
  }

  os_disk {
    name                 = "${var.virtual_machine_name}-${var.vm_os_disk_name}"
    caching              = var.vm_os_disk_caching
    storage_account_type = var.vm_os_disk_storage_account_type
  }

  admin_ssh_key {
    username   = var.vm_admin_username
    public_key = azurerm_ssh_public_key.main.public_key
  }

  computer_name                   = var.vm_computer_name
  admin_username                  = var.vm_admin_username
  admin_password                  = random_password.password.result
  disable_password_authentication = false
  custom_data                     = var.custom_data
  tags                            = var.common_tags
}