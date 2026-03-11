data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id = data.alicloud_vpcs.default.ids[0]
}

resource "alicloud_nat_gateway" "this" {
  vpc_id           = data.alicloud_vpcs.default.ids[0]
  vswitch_id       = data.alicloud_vswitches.default.vswitches[0].id
  nat_gateway_name = "tf-example-advanced-nat-gateway"
  nat_type         = "Enhanced"
}

module "route_table" {
  source = "../.."

  route_table_name         = "tf-example-advanced-route-table"
  vpc_id                   = data.alicloud_vpcs.default.ids[0]
  description              = "Advanced route table with multiple routes and associations"
  route_propagation_enable = true

  tags = {
    Environment = "production"
    Project     = "networking"
  }

  route_entries = {
    default_nat_route = {
      destination_cidrblock = "192.168.0.0/16"
      nexthop_type          = "NatGateway"
      nexthop_id            = alicloud_nat_gateway.this.id
      name                  = "default-nat-route"
      description           = "Default route to NAT Gateway"
    }
  }

  vswitch_ids = {
    for idx, vs in slice(data.alicloud_vswitches.default.vswitches, 0, min(2, length(data.alicloud_vswitches.default.vswitches))) :
    "vsw_${idx}" => vs.id
  }
}
