<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_networkfirewall_firewall_policy.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/networkfirewall_firewall_policy) | resource |
| [aws_networkfirewall_logging_configuration.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/networkfirewall_logging_configuration) | resource |
| [aws_networkfirewall_rule_group.stateful](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/networkfirewall_rule_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudwatch_log_group_name"></a> [cloudwatch\_log\_group\_name](#input\_cloudwatch\_log\_group\_name) | Name of CloudWatch log group to ship logs to | `string` | n/a | yes |
| <a name="input_fw_arn"></a> [fw\_arn](#input\_fw\_arn) | ARN of firewall for logging configuration | `string` | n/a | yes |
| <a name="input_fw_policy_name"></a> [fw\_policy\_name](#input\_fw\_policy\_name) | n/a | `string` | n/a | yes |
| <a name="input_fw_rulegroup_capacity"></a> [fw\_rulegroup\_capacity](#input\_fw\_rulegroup\_capacity) | n/a | `string` | `"10000"` | no |
| <a name="input_fw_rulegroup_name"></a> [fw\_rulegroup\_name](#input\_fw\_rulegroup\_name) | n/a | `string` | n/a | yes |
| <a name="input_rules"></a> [rules](#input\_rules) | A map of values supplied to create firewall rules | `map(any)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of keys and values used to create resource metadata tags | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fw_policy_arn"></a> [fw\_policy\_arn](#output\_fw\_policy\_arn) | n/a |
<!-- END_TF_DOCS -->