output "id" {
  description = "The ID of the route table."
  value       = alicloud_route_table.this.id
}

output "name" {
  description = "The name of the route table."
  value       = alicloud_route_table.this.route_table_name
}

output "route_table" {
  description = "The route table resource object."
  value       = alicloud_route_table.this
}

output "route_entries" {
  description = "The route entry resource objects."
  value       = alicloud_route_entry.this
}

output "attachments" {
  description = "The route table attachment resource objects."
  value       = alicloud_route_table_attachment.this
}
