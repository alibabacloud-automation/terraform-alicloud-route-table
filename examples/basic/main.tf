data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id = data.alicloud_vpcs.default.ids[0]
}

module "route_table" {
  source = "../.."

  route_table_name = "tf-example-basic-route-table"
  vpc_id           = data.alicloud_vpcs.default.ids[0]

  vswitch_ids = {
    default = data.alicloud_vswitches.default.vswitches[0].id
  }
}
