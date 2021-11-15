locals {
test = <<-EOT
zookeeper: "${var.zookeeper_host_name}"
elasticsearch: "${var.elasticsearch_host_name}"
aspire_download_url: "aspire-4.0-SNAPSHOT.tar.gz"
saga_download_url: "Saga_Server.zip"
elastic_data_url: "elasticsearch-7.2.1-x86_64.rpm"
zookeeper_download_link: "apache-zookeeper-3.5.6-bin.tar.gz" 
EOT
}

resource "local_file" "update_vars_yaml" {
    content     = local.test
    filename = "${path.module}/ansible/vars.yml"
    depends_on = [azurerm_network_interface.vm_nic]
}

variable "zookeeper_host_name" {
type=string
default = "aipuser1"
}

variable "elasticsearch_host_name" {
type=string
default = "aipuser2"
}