
output "vpn_gateway_name" {
  description = "Name of the Azure VPN Gateway created"
  value       = azurerm_virtual_network_gateway.virtual_network_gateway.name
  }

output "vpn_gateway_public_ip" {
  description = "The Public IP of the Virtual Network Gateway."
  value       = azurerm_public_ip.public_ip.id
}
