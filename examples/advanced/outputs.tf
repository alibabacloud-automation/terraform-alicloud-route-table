output "route_table_id" {
  description = "The ID of the route table."
  value       = module.route_table.id
}

output "route_table_name" {
  description = "The name of the route table."
  value       = module.route_table.name
}

output "route_entries" {
  description = "The route entry resource objects."
  value       = module.route_table.route_entries
}

output "attachments" {
  description = "The route table attachment resource objects."
  value       = module.route_table.attachments
}

output "nat_gateway_id" {
  description = "The ID of the NAT Gateway."
  value       = alicloud_nat_gateway.this.id
}
