resource "alicloud_route_table" "this" {
  vpc_id                   = var.vpc_id
  route_table_name         = var.route_table_name
  description              = var.description
  associate_type           = var.associate_type
  route_propagation_enable = var.route_propagation_enable
  tags                     = var.tags
}

resource "alicloud_route_entry" "this" {
  for_each = var.route_entries

  route_table_id        = alicloud_route_table.this.id
  destination_cidrblock = each.value.destination_cidrblock
  nexthop_type          = each.value.nexthop_type
  nexthop_id            = each.value.nexthop_id
  name                  = each.value.name
  description           = each.value.description
}

resource "alicloud_route_table_attachment" "this" {
  for_each = var.vswitch_ids

  vswitch_id     = each.value
  route_table_id = alicloud_route_table.this.id
}
