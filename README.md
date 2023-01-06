# AWS_tf_modules

If you wish to run all tf modules at once in all env, cd /terragrunt  and run - "terragrunt run-all apply", to destroy - "terragrunt run-all destroy"

## Examples

- [VPC](https://github.com/parkura/AWS_tf_modules/tree/main/modules/VPC)
- [S3](https://github.com/parkura/AWS_tf_modules/tree/main/modules/S3)
- [Route_53](https://github.com/parkura/AWS_tf_modules/tree/main/modules/route_53)
- [RDS](https://github.com/parkura/AWS_tf_modules/tree/main/modules/RDS)
- [EC2](https://github.com/parkura/AWS_tf_modules/tree/main/modules/EC2)
- [ASG](https://github.com/parkura/AWS_tf_modules/tree/main/modules/ASG)
- [ALB](https://github.com/parkura/AWS_tf_modules/tree/main/modules/ALB)


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_terragrunt"></a> [terragrunt](#requirement\_terragrunt) | 0.42.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.47 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.47 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.0 |


##VPC Resources

| Name | Type |
|------|------|
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | Data Source |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc.html) | resource |
| [aws_internet_gateway.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_subnet.public_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet.html) | resource |
| [aws_route_table.public_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table.html) | resource |
| [aws_security_group.web-ssh-http-https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_route_table_association.public_routes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_eip.nat](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip.html) | resource |
| [aws_nat_gateway.nat](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway.html) | resource |
| [aws_subnet.private_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet.html) | resource |
| [aws_route_table.private_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table.html) | resource |
| [aws_route_table_association.private_routes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |


##VPC Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_env"></a> [env](#input\_env) | The name of the environment. | `string` | `null` | no |
| <a name="input_public_subnet_cidrs"></a> [azs](#input\_public_subnet_cidrs) | The IPv4 CIDR block for the VPC. | `list` | `[]` | no |
| <a name="input_vpc_cidr"></a> [vpc_cidr](#input\_vpc_cidr) | The name of the environment. | `string` | `null` | no |
| <a name="input_web_sg_name"></a> [web_sg_name](#input\_web_sg_name) | Name of the security group for ec2. | `string` | `null` | no |
| <a name="input_private_subnet_cidrs"></a> [private_subnet_cidrs](#input\_private_subnet_cidrs) | Private_subnet_ipv4_cidrs. | `list` | `[]` | no |


##VPC Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpc_id"></a> [vpc_id](#output\_vpc_id) | The ID of the VPC. |
| <a name="output_vpc_cidr"></a> [vpc_cidr](#output\_vpc_cidr) | The CIDR block of the VPC. |
| <a name="output_public_subnet_ids"></a> [public_subnet_ids](#output\_public_subnet_ids) | List of IDs of public subnets. |
| <a name="output_private_subnet_ids"></a> [private_subnet_ids](#output\_private_subnet_ids) | List of IDs of private subnets. |
| <a name="output_availability_zones"></a> [availability_zones](#output\_availability_zones) | A list of availability zones to this module. |
| <a name="output_ec2_sg_id"></a> [ec2_sg_id](#output\_ec2_sg_id) | ID  of the ec2 security group. |
