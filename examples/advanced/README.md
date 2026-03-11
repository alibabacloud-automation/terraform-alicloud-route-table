# Advanced Route Table Example

This example demonstrates how to create a route table with multiple route entries, VSwitch associations, tags, and route propagation enabled.

## Usage

```bash
terraform init
terraform plan
terraform apply
```

To clean up resources:

```bash
terraform destroy
```

## Cost

This example will create the following resources:
- NAT Gateway (Charged based on specification and data transfer)
- Route Table (Free)
- Route Entries (Free)
- Route Table Attachments (Free)

Note: The NAT Gateway will incur costs. Please check the [Alibaba Cloud pricing page](https://www.alibabacloud.com/product/nat-gateway/pricing) for details.
