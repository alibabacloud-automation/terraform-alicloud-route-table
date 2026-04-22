# terraform-alicloud-route-table

English | [简体中文](https://github.com/alibabacloud-automation/terraform-alicloud-route-table/blob/main/README-CN.md)

Terraform module which creates Route Table on Alibaba Cloud. This module supports creating a custom route table in a specified VPC, managing route entries, and associating the route table with VSwitches.

## Usage

Create a route table with route entries and VSwitch associations.

```terraform
module "route_table" {
  source = "alibabacloud-automation/route-table/alicloud"

  route_table_name = "my-route-table"
  vpc_id           = "vpc-xxxxx"

  route_entries = {
    nat_route = {
      destination_cidrblock = "0.0.0.0/0"
      nexthop_type          = "NatGateway"
      nexthop_id            = "ngw-xxxxx"
    }
  }

  vswitch_ids = {
    vsw1 = "vsw-xxxxx"
  }
}
```

## Examples

* [Basic Example](https://github.com/alibabacloud-automation/terraform-alicloud-route-table/tree/main/examples/basic)
* [Advanced Example](https://github.com/alibabacloud-automation/terraform-alicloud-route-table/tree/main/examples/advanced)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.194.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | >= 1.194.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alicloud_route_entry.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/route_entry) | resource |
| [alicloud_route_table.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/route_table) | resource |
| [alicloud_route_table_attachment.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/route_table_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_associate_type"></a> [associate\_type](#input\_associate\_type) | The type of cloud resource that is bindable to the route table. Valid values: `VSwitch`, `Gateway`. | `string` | `"VSwitch"` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the route table. | `string` | `null` | no |
| <a name="input_route_entries"></a> [route\_entries](#input\_route\_entries) | A map of route entries to create in the route table. Each entry includes destination CIDR block, next hop type, and optional next hop ID, name, and description. | <pre>map(object({<br/>    destination_cidrblock = string<br/>    nexthop_type          = string<br/>    nexthop_id            = optional(string)<br/>    name                  = optional(string)<br/>    description           = optional(string)<br/>  }))</pre> | `{}` | no |
| <a name="input_route_propagation_enable"></a> [route\_propagation\_enable](#input\_route\_propagation\_enable) | Whether to enable route propagation for the route table. | `bool` | `null` | no |
| <a name="input_route_table_name"></a> [route\_table\_name](#input\_route\_table\_name) | The display name of the route table. If not specified, the value of `name` will be used. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the route table. | `map(string)` | `null` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC to which the route table belongs. | `string` | n/a | yes |
| <a name="input_vswitch_ids"></a> [vswitch\_ids](#input\_vswitch\_ids) | A map of VSwitch IDs to associate with the route table. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_attachments"></a> [attachments](#output\_attachments) | The route table attachment resource objects. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the route table. |
| <a name="output_name"></a> [name](#output\_name) | The name of the route table. |
| <a name="output_route_entries"></a> [route\_entries](#output\_route\_entries) | The route entry resource objects. |
| <a name="output_route_table"></a> [route\_table](#output\_route\_table) | The route table resource object. |
<!-- END_TF_DOCS -->

## Submit Issues

If you have any problems when using this module, please opening
a [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend opening an issue on this repo.

## Authors

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com).

## License

MIT Licensed. See LICENSE for full details.

## Reference

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
