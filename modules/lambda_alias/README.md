# Module: aws_lambda_alias

Creates a Lambda function alias. Creates an alias that points to the specified Lambda function version.

For information about Lambda and how to use it, see [What is AWS Lambda?](http://docs.aws.amazon.com/lambda/latest/dg/welcome.html) For information about function aliases, see [CreateAlias](http://docs.aws.amazon.com/lambda/latest/dg/API_CreateAlias.html) and [AliasRoutingConfiguration](https://docs.aws.amazon.com/lambda/latest/dg/API_AliasRoutingConfiguration.html) in the API docs.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.10 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.15.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_lambda_alias.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_alias) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | Description of the alias | `string` | `null` | no |
| <a name="input_function_name"></a> [function\_name](#input\_function\_name) | Lambda Function name or ARN | `string` | n/a | yes |
| <a name="input_function_version"></a> [function\_version](#input\_function\_version) | Lambda function version for which you are creating the alias | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name for the alias you are creating | `string` | n/a | yes |
| <a name="input_routing_config"></a> [routing\_config](#input\_routing\_config) | The Lambda alias' route configuration settings | <pre>object({<br>    additional_version_weights = map(string)<br>  })</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The Amazon Resource Name (ARN) identifying your Lambda function alias |
| <a name="output_invoke_arn"></a> [invoke\_arn](#output\_invoke\_arn) | The ARN to be used for invoking Lambda Function from API Gateway - to be used in `aws_api_gateway_integration`'s uri |
| <a name="output_name"></a> [name](#output\_name) | The name of alias |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->