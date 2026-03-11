# terraform-alicloud-route-table

[English](https://github.com/alibabacloud-automation/terraform-alicloud-route-table/blob/main/README.md) | 简体中文

在阿里云上创建[路由表](https://help.aliyun.com/zh/vpc/user-guide/route-tables)的 Terraform 模块。

该模块支持在指定 VPC 中创建自定义路由表，管理路由条目，并将路由表与交换机进行关联。

## 使用方法

创建包含路由条目和交换机关联的路由表。

```terraform
module "route_table" {
  source = "alibabacloud-automation/route-table/alicloud"

  name   = "my-route-table"
  vpc_id = "vpc-xxxxx"

  route_entries = {
    nat_route = {
      destination_cidrblock = "0.0.0.0/0"
      nexthop_type          = "NatGateway"
      nexthop_id            = "ngw-xxxxx"
      name                  = "default-nat-route"
      description           = "Default route to NAT Gateway"
    }
  }

  vswitch_ids = {
    vsw1 = "vsw-xxxxx"
  }
}
```

## 示例

* [基础示例](https://github.com/alibabacloud-automation/terraform-alicloud-route-table/tree/main/examples/basic)
* [高级示例](https://github.com/alibabacloud-automation/terraform-alicloud-route-table/tree/main/examples/advanced)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | 1.272.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alicloud_route_entry.this](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/route_entry) | resource |
| [alicloud_route_table.this](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/route_table) | resource |
| [alicloud_route_table_attachment.this](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/route_table_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_associate_type"></a> [associate\_type](#input\_associate\_type) | The type of cloud resource that is bindable to the route table. Valid values: `VSwitch`, `Gateway`. | `string` | `"VSwitch"` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the route table. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the route table. | `string` | n/a | yes |
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

## 提交问题

如果您在使用此模块时遇到任何问题，请提交一个 [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) 并告知我们。

**注意：** 不建议在此仓库中提交问题。

## 作者

由阿里云 Terraform 团队创建和维护(terraform@alibabacloud.com)。

## 许可证

MIT 许可。有关完整详细信息，请参阅 LICENSE。

## 参考

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
