###############################################################################
####################  node 1 ###################################
#############################################################################
resource "null_resource" "azcli" {
  provisioner "remote-exec" {
    inline = [
      "echo 'build ssh connection' "
    ]
  }
  connection {
    host        = azurerm_network_interface.vm_nic.private_ip_address
    type        = "ssh"
    user        = var.vm_admin_username
    private_key = local.private_key
    agent       = false
  }
  provisioner "local-exec" {
    command = "ansible-playbook -i ${azurerm_network_interface.vm_nic.private_ip_address}, --private-key ${var.private_key} ${path.module}/ansible/azcli.yml -u ${var.vm_admin_username}"
  }
  depends_on = [azurerm_virtual_machine.linux_vm]
}



resource "null_resource" "packages_download" {
  count = length(var.vm_packages)
  provisioner "remote-exec" {
    inline = [
      "echo 'build ssh connection' "
    ]
  }
  connection {
    host        = azurerm_network_interface.vm_nic.private_ip_address
    type        = "ssh"
    user        = var.vm_admin_username
    private_key = local.private_key
    agent       = false
  }
  #download package
  provisioner "remote-exec" {
    inline = ["cd /tmp",
      "az login --service-principal --username '${var.client_id}' --password '${var.client_secret}' --tenant '${var.tenant_id}'",
      "az account set --subscription '${var.subscription_id}'",
      "az account list --output table",
      "az storage blob download --account-name '${var.storage_account_name}' --container-name '${var.container_name}' --name '${var.vm_packages[count.index]}' --file '${var.vm_packages[count.index]}'"
    ]
  }
  depends_on = [null_resource.azcli]
}

resource "null_resource" "install_package1" {
  provisioner "remote-exec" {
    inline = [
      "echo 'build ssh connection' "
    ]
  }
  connection {
    host        = azurerm_network_interface.vm_nic.private_ip_address
    type        = "ssh"
    user        = var.vm_admin_username
    private_key = local.private_key
    agent       = false
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i ${azurerm_network_interface.vm_nic.private_ip_address}, --private-key ${var.private_key} ${path.module}/ansible/${var.playbook}.yml -u ${var.vm_admin_username}"
  }
  depends_on = [null_resource.packages_download]
}

variable "playbook" {
  type = string
  
}

