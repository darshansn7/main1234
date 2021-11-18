output "virtual_machine_name" {
  description = ""
  value       = azurerm_linux_virtual_machine.linux_vm.name
}

output "virtual_machine_private_ip_address" {
  description = ""
  value       = azurerm_linux_virtual_machine.linux_vm.private_ip_address
}

output "virtual_machine_id" {
  description = ""
  value       = azurerm_linux_virtual_machine.linux_vm.id
}
output "virtual_machine_computer_name" {
  description = ""
  value       = azurerm_linux_virtual_machine.linux_vm.computer_name
}

output "virtual_machine_admin_username" {
  description = ""
  value       = azurerm_linux_virtual_machine.linux_vm.admin_username
}