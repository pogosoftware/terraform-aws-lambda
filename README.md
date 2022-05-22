# terraform-aws-lambda

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lambda_function"></a> [lambda\_function](#module\_lambda\_function) | ./modules/lambda_function | n/a |
| <a name="module_lambda_permission"></a> [lambda\_permission](#module\_lambda\_permission) | ./modules/lambda_permission | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_lambda_function"></a> [create\_lambda\_function](#input\_create\_lambda\_function) | Determinate to create `lambda_function` resources or not | `bool` | `true` | no |
| <a name="input_create_lambda_permission"></a> [create\_lambda\_permission](#input\_create\_lambda\_permission) | Determinate to create `lambda_permission` resources or not | `bool` | `false` | no |
| <a name="input_lambda_function_architectures"></a> [lambda\_function\_architectures](#input\_lambda\_function\_architectures) | Instruction set architecture for your Lambda function. Valid values are ["x86\_64"] and ["arm64"]. Default is ["x86\_64"] | `list(string)` | <pre>[<br>  "x86_64"<br>]</pre> | no |
| <a name="input_lambda_function_code_signing_config_arn"></a> [lambda\_function\_code\_signing\_config\_arn](#input\_lambda\_function\_code\_signing\_config\_arn) | To enable code signing for this function, specify the ARN of a code-signing configuration. A code-signing configuration includes a set of signing profiles, which define the trusted publishers for this function | `string` | `null` | no |
| <a name="input_lambda_function_dead_letter_config"></a> [lambda\_function\_dead\_letter\_config](#input\_lambda\_function\_dead\_letter\_config) | Dead letter queue configuration that specifies the queue or topic where Lambda sends asynchronous events when they fail processing | <pre>object({<br>    target_arn = string<br>  })</pre> | `null` | no |
| <a name="input_lambda_function_description"></a> [lambda\_function\_description](#input\_lambda\_function\_description) | Description of what your Lambda Function does | `string` | `null` | no |
| <a name="input_lambda_function_environment"></a> [lambda\_function\_environment](#input\_lambda\_function\_environment) | Map of environment variables that are accessible from the function code during execution | <pre>object({<br>    variables = map(string)<br>  })</pre> | `null` | no |
| <a name="input_lambda_function_ephemeral_storage"></a> [lambda\_function\_ephemeral\_storage](#input\_lambda\_function\_ephemeral\_storage) | The amount of Ephemeral storage(/tmp) to allocate for the Lambda Function in MB. This parameter is used to expand the total amount of Ephemeral storage available, beyond the default amount of 512MB | <pre>object({<br>    size = number<br>  })</pre> | `null` | no |
| <a name="input_lambda_function_file_system_config"></a> [lambda\_function\_file\_system\_config](#input\_lambda\_function\_file\_system\_config) | Connection settings for an EFS file system. Before creating or updating Lambda functions with `file_system_config`, EFS mount targets must be in available lifecycle state. Use `depends_on` to explicitly declare this dependency | <pre>object({<br>    arn              = string<br>    local_mount_path = string<br>  })</pre> | `null` | no |
| <a name="input_lambda_function_filename"></a> [lambda\_function\_filename](#input\_lambda\_function\_filename) | Path to the function's deployment package within the local filesystem. Conflicts with `image_uri`, `s3_bucket`, `s3_key`, and `s3_object_version` | `string` | `null` | no |
| <a name="input_lambda_function_handler"></a> [lambda\_function\_handler](#input\_lambda\_function\_handler) | Function entrypoint in your code | `string` | `null` | no |
| <a name="input_lambda_function_image_config"></a> [lambda\_function\_image\_config](#input\_lambda\_function\_image\_config) | Container image configuration values that override the values in the container image Dockerfile | <pre>object({<br>    command           = optional(list(string))<br>    entry_point       = optional(list(string))<br>    working_directory = optional(string)<br>  })</pre> | `null` | no |
| <a name="input_lambda_function_image_uri"></a> [lambda\_function\_image\_uri](#input\_lambda\_function\_image\_uri) | ECR image URI containing the function's deployment package. Conflicts with `filename`, `s3_bucket`, `s3_key`, and `s3_object_version` | `string` | `null` | no |
| <a name="input_lambda_function_kms_key_arn"></a> [lambda\_function\_kms\_key\_arn](#input\_lambda\_function\_kms\_key\_arn) | Amazon Resource Name (ARN) of the AWS Key Management Service (KMS) key that is used to encrypt environment variables. If this configuration is not provided when environment variables are in use, AWS Lambda uses a default service key. If this configuration is provided when environment variables are not in use, the AWS Lambda API does not save this configuration and Terraform will show a perpetual difference of adding the key. To fix the perpetual difference, remove this configuration | `string` | `null` | no |
| <a name="input_lambda_function_layers"></a> [lambda\_function\_layers](#input\_lambda\_function\_layers) | List of Lambda Layer Version ARNs (maximum of 5) to attach to your Lambda Function | `list(string)` | `null` | no |
| <a name="input_lambda_function_memory_size"></a> [lambda\_function\_memory\_size](#input\_lambda\_function\_memory\_size) | Amount of memory in MB your Lambda Function can use at runtime. Defaults to `128` | `number` | `128` | no |
| <a name="input_lambda_function_name"></a> [lambda\_function\_name](#input\_lambda\_function\_name) | Required if `create_lambda_function` is set to `true`. Unique name for your Lambda Function | `string` | `null` | no |
| <a name="input_lambda_function_package_type"></a> [lambda\_function\_package\_type](#input\_lambda\_function\_package\_type) | Lambda deployment package type. Valid values are `Zip` and `Image`. Defaults to `Zip` | `string` | `"Zip"` | no |
| <a name="input_lambda_function_publish"></a> [lambda\_function\_publish](#input\_lambda\_function\_publish) | Whether to publish creation/change as new Lambda Function Version. Defaults to `false` | `bool` | `false` | no |
| <a name="input_lambda_function_reserved_concurrent_executions"></a> [lambda\_function\_reserved\_concurrent\_executions](#input\_lambda\_function\_reserved\_concurrent\_executions) | Amount of reserved concurrent executions for this lambda function. A value of 0 disables lambda from being triggered and -1 removes any concurrency limitations. Defaults to Unreserved Concurrency Limits -1 | `number` | `-1` | no |
| <a name="input_lambda_function_role"></a> [lambda\_function\_role](#input\_lambda\_function\_role) | Required if `create_lambda_function` is set to `true`. Amazon Resource Name (ARN) of the function's execution role. The role provides the function's identity and access to AWS services and resources | `string` | `null` | no |
| <a name="input_lambda_function_runtime"></a> [lambda\_function\_runtime](#input\_lambda\_function\_runtime) | Identifier of the function's runtime | `string` | `null` | no |
| <a name="input_lambda_function_s3_bucket"></a> [lambda\_function\_s3\_bucket](#input\_lambda\_function\_s3\_bucket) | S3 bucket location containing the function's deployment package. Conflicts with `filename` and `image_uri`. This bucket must reside in the same AWS region where you are creating the Lambda function | `string` | `null` | no |
| <a name="input_lambda_function_s3_key"></a> [lambda\_function\_s3\_key](#input\_lambda\_function\_s3\_key) | S3 key of an object containing the function's deployment package. Conflicts with `filename` and `image_uri` | `string` | `null` | no |
| <a name="input_lambda_function_s3_object_version"></a> [lambda\_function\_s3\_object\_version](#input\_lambda\_function\_s3\_object\_version) | Object version containing the function's deployment package. Conflicts with `filename` and `image_uri` | `string` | `null` | no |
| <a name="input_lambda_function_source_code_hash"></a> [lambda\_function\_source\_code\_hash](#input\_lambda\_function\_source\_code\_hash) | Used to trigger updates. Must be set to a base64-encoded SHA256 hash of the package file specified with either `filename` or `s3_key`. The usual way to set this is `filebase64sha256("file.zip")` (Terraform 0.11.12 and later) or `base64sha256(file("file.zip"))` (Terraform 0.11.11 and earlier), where "file.zip" is the local filename of the lambda function source archive | `string` | `null` | no |
| <a name="input_lambda_function_tags"></a> [lambda\_function\_tags](#input\_lambda\_function\_tags) | Map of tags to assign to the object | `map(string)` | `null` | no |
| <a name="input_lambda_function_timeout"></a> [lambda\_function\_timeout](#input\_lambda\_function\_timeout) | Amount of time your Lambda Function has to run in seconds. Defaults to `3` | `number` | `3` | no |
| <a name="input_lambda_function_tracing_config"></a> [lambda\_function\_tracing\_config](#input\_lambda\_function\_tracing\_config) | Whether to to sample and trace a subset of incoming requests with AWS X-Ray | <pre>object({<br>    mode = string<br>  })</pre> | `null` | no |
| <a name="input_lambda_function_vpc_config"></a> [lambda\_function\_vpc\_config](#input\_lambda\_function\_vpc\_config) | For network connectivity to AWS resources in a VPC, specify a list of security groups and subnets in the VPC. When you connect a function to a VPC, it can only access resources and the internet through that VPC | <pre>object({<br>    security_group_ids = list(string)<br>    subnet_ids         = list(string)<br>  })</pre> | `null` | no |
| <a name="input_lambda_permission_action"></a> [lambda\_permission\_action](#input\_lambda\_permission\_action) | The AWS Lambda action you want to allow in this statement | `string` | `null` | no |
| <a name="input_lambda_permission_event_source_token"></a> [lambda\_permission\_event\_source\_token](#input\_lambda\_permission\_event\_source\_token) | The Event Source Token to validate | `string` | `null` | no |
| <a name="input_lambda_permission_function_name"></a> [lambda\_permission\_function\_name](#input\_lambda\_permission\_function\_name) | Name of the Lambda function whose resource policy you are updating | `string` | `null` | no |
| <a name="input_lambda_permission_function_url_auth_type"></a> [lambda\_permission\_function\_url\_auth\_type](#input\_lambda\_permission\_function\_url\_auth\_type) | Lambda Function URLs authentication type. Valid values are: `AWS_IAM` or `NONE` | `string` | `null` | no |
| <a name="input_lambda_permission_principal"></a> [lambda\_permission\_principal](#input\_lambda\_permission\_principal) | The principal who is getting this permission e.g., `s3.amazonaws.com`, an AWS account ID, or any valid AWS service principal such as `events.amazonaws.com` or `sns.amazonaws.com` | `string` | `null` | no |
| <a name="input_lambda_permission_principal_org_id"></a> [lambda\_permission\_principal\_org\_id](#input\_lambda\_permission\_principal\_org\_id) | The identifier for your organization in AWS Organizations. Use this to grant permissions to all the AWS accounts under this organization | `string` | `null` | no |
| <a name="input_lambda_permission_qualifier"></a> [lambda\_permission\_qualifier](#input\_lambda\_permission\_qualifier) | Query parameter to specify function version or alias name. The permission will then apply to the specific qualified ARN e.g., `arn:aws:lambda:aws-region:acct-id:function:function-name:2` | `string` | `null` | no |
| <a name="input_lambda_permission_source_account"></a> [lambda\_permission\_source\_account](#input\_lambda\_permission\_source\_account) | This parameter is used for S3 and SES. The AWS account ID (without a hyphen) of the source owner | `string` | `null` | no |
| <a name="input_lambda_permission_source_arn"></a> [lambda\_permission\_source\_arn](#input\_lambda\_permission\_source\_arn) | When the principal is an AWS service, the ARN of the specific resource within that service to grant permission to | `string` | `null` | no |
| <a name="input_lambda_permission_statement_id"></a> [lambda\_permission\_statement\_id](#input\_lambda\_permission\_statement\_id) | A unique statement identifier. By default generated by Terraform | `string` | `null` | no |
| <a name="input_lambda_permission_use_statement_id_prefix"></a> [lambda\_permission\_use\_statement\_id\_prefix](#input\_lambda\_permission\_use\_statement\_id\_prefix) | A statement identifier prefix. Terraform will generate a unique suffix. Conflicts with `statement_id` | `string` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lambda_function_arn"></a> [lambda\_function\_arn](#output\_lambda\_function\_arn) | Amazon Resource Name (ARN) identifying your Lambda Function |
| <a name="output_lambda_function_invoke_arn"></a> [lambda\_function\_invoke\_arn](#output\_lambda\_function\_invoke\_arn) | ARN to be used for invoking Lambda Function from API Gateway - to be used in aws\_api\_gateway\_integration's uri |
| <a name="output_lambda_function_qualified_arn"></a> [lambda\_function\_qualified\_arn](#output\_lambda\_function\_qualified\_arn) | ARN identifying your Lambda Function Version |
| <a name="output_lambda_function_signing_job_arn"></a> [lambda\_function\_signing\_job\_arn](#output\_lambda\_function\_signing\_job\_arn) | ARN of the signing job |
| <a name="output_lambda_function_signing_profile_version_arn"></a> [lambda\_function\_signing\_profile\_version\_arn](#output\_lambda\_function\_signing\_profile\_version\_arn) | ARN of the signing profile version |
| <a name="output_lambda_function_source_code_size"></a> [lambda\_function\_source\_code\_size](#output\_lambda\_function\_source\_code\_size) | Size in bytes of the function .zip file |
| <a name="output_lambda_function_version"></a> [lambda\_function\_version](#output\_lambda\_function\_version) | Latest published version of your Lambda Function |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->