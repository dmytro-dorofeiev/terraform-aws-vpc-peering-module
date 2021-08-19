# Terraform vpc peering module

## Examples

This example will created VPC Peering from dev to qa VPC.

**Note:** _To use this module you have to have owner and accepter profile name configured in you ~/.aws/credentials and ~/.aws/config_

```txt
module "vpc_peering_qa" {
  source               = "../modules/terraform-aws-vpc-peering-module"
  owner_profile        = "dev"
  accepter_profile     = "qa"
  owner_vpc_id         = var.owner_vpc_id
  owner_route_names    = ["mgm"]
  accepter_vpc_id      = var.accepter_vpc_id
  accepter_route_names = ["web", "db"]
}
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_aws.accepter"></a> [aws.accepter](#provider\_aws.accepter) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route.accepter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.owner](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_vpc_peering_connection.owner](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection) | resource |
| [aws_vpc_peering_connection_accepter.accepter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection_accepter) | resource |
| [aws_caller_identity.accepter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_route_tables.accepter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route_tables) | data source |
| [aws_route_tables.owner](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route_tables) | data source |
| [aws_vpc.accepter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |
| [aws_vpc.owner](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_accepter_profile"></a> [accepter\_profile](#input\_accepter\_profile) | AWS Profile | `any` | n/a | yes |
| <a name="input_accepter_region"></a> [accepter\_region](#input\_accepter\_region) | AWS region for accepter vpc | `string` | `"eu-west-1"` | no |
| <a name="input_accepter_route_names"></a> [accepter\_route\_names](#input\_accepter\_route\_names) | Accepter subnet names that should be routed | `set(string)` | n/a | yes |
| <a name="input_accepter_vpc_id"></a> [accepter\_vpc\_id](#input\_accepter\_vpc\_id) | Accepter VPC Id | `any` | n/a | yes |
| <a name="input_owner_profile"></a> [owner\_profile](#input\_owner\_profile) | AWS Profile | `any` | n/a | yes |
| <a name="input_owner_region"></a> [owner\_region](#input\_owner\_region) | AWS region for owner vpc | `string` | `"eu-west-1"` | no |
| <a name="input_owner_route_names"></a> [owner\_route\_names](#input\_owner\_route\_names) | Owner subnet names that should be routed | `set(string)` | n/a | yes |
| <a name="input_owner_vpc_id"></a> [owner\_vpc\_id](#input\_owner\_vpc\_id) | Owner VPC Id | `any` | n/a | yes |

## Outputs

No outputs.
