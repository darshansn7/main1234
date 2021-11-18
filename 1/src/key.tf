
#random password
resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#&)/?_%@"
}


################################################
# Create keypair (generate if needed)
################################################
resource "null_resource" "create_key_file" {
  count = var.vm_key == "" ? 1 : 0
  provisioner "local-exec" {
    command     = "mkdir -p ${abspath(path.root)}/${var.virtual_machine_name}"
    interpreter = ["/bin/bash", "-c"]
    working_dir = path.module
  }
  provisioner "local-exec" {
    command     = "openssl genrsa -out ${abspath(path.root)}/${var.virtual_machine_name}/${local.vm_name}.pem 4096"
    interpreter = ["/bin/bash", "-c"]
    working_dir = path.module
  }
  provisioner "local-exec" {
    command     = "sudo chmod 600 ${abspath(path.root)}/${var.virtual_machine_name}/${local.vm_name}.pem"
    interpreter = ["/bin/bash", "-c"]
    working_dir = path.module
  }
  provisioner "local-exec" {
    command     = "ssh-keygen -y -f ${abspath(path.root)}/${var.virtual_machine_name}/${local.vm_name}.pem > ${abspath(path.root)}/${var.virtual_machine_name}/${local.vm_name}.pub"
    interpreter = ["/bin/bash", "-c"]
    working_dir = path.module
  }
  provisioner "local-exec" {
    command     = "sudo chmod 600 ${abspath(path.root)}/${var.virtual_machine_name}/${local.vm_name}.pub"
    interpreter = ["/bin/bash", "-c"]
    working_dir = path.module
  }
}

data "local_file" "public_key" {
  count      = var.vm_key == "" ? 1 : 0
  filename   = "${abspath(path.root)}/${var.virtual_machine_name}/${local.vm_name}.pub"
  depends_on = [null_resource.create_key_file]
}

data "local_file" "private_key" {
  count      = var.vm_key == "" ? 1 : 0
  filename   = "${abspath(path.root)}/${var.virtual_machine_name}/${local.vm_name}.pem"
  depends_on = [null_resource.create_key_file]
}

locals {
  public_key  = var.vm_key == "" ? data.local_file.public_key[0].content : var.vm_key
  private_key = var.vm_key == "" ? data.local_file.private_key[0].content : var.vm_key
  vm_name     = var.vm_key_name
}

resource "azurerm_ssh_public_key" "main" {
  name                = local.vm_name
  resource_group_name = var.vm_rg
  location            = var.rg_location
  public_key          = local.public_key
}



