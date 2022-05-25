# Module: aws_lambda_function

Provides a Lambda Function resource. Lambda allows you to trigger execution of code in response to events in AWS, enabling serverless backend solutions. The Lambda Function itself includes source code and runtime configuration.

For information about Lambda and how to use it, see [What is AWS Lambda?](https://docs.aws.amazon.com/lambda/latest/dg/welcome.html)

For a detailed example of setting up Lambda and API Gateway, see [Serverless Applications with AWS Lambda and API Gateway.](https://learn.hashicorp.com/terraform/aws/lambda-api-gateway)

> **NOTE:** <br>
Due to [AWS Lambda improved VPC networking changes that began deploying in September 2019](https://aws.amazon.com/blogs/compute/announcing-improved-vpc-networking-for-aws-lambda-functions/), EC2 subnets and security groups associated with Lambda Functions can take up to 45 minutes to successfully delete. Terraform AWS Provider version 2.31.0 and later automatically handles this increased timeout, however prior versions require setting the customizable deletion timeouts of those Terraform resources to 45 minutes (`delete = "45m"`). AWS and HashiCorp are working together to reduce the amount of time required for resource deletion and updates can be tracked in this [GitHub issue](https://github.com/hashicorp/terraform-provider-aws/issues/10329).

> **NOTE:** <br>
To give an external source (like an EventBridge Rule, SNS, or S3) permission to access the Lambda function, use the `aws_lambda_permission` resource. See [Lambda Permission Model](https://docs.aws.amazon.com/lambda/latest/dg/intro-permission-model.html) for more details. On the other hand, the `role` argument of this resource is the function's execution role for identity and access to AWS services and resources.

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
| [aws_lambda_function.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_architectures"></a> [architectures](#input\_architectures) | Instruction set architecture for your Lambda function. Valid values are ["x86\_64"] and ["arm64"]. Default is ["x86\_64"] | `list(string)` | <pre>[<br>  "x86_64"<br>]</pre> | no |
| <a name="input_code_signing_config_arn"></a> [code\_signing\_config\_arn](#input\_code\_signing\_config\_arn) | To enable code signing for this function, specify the ARN of a code-signing configuration. A code-signing configuration includes a set of signing profiles, which define the trusted publishers for this function | `string` | `null` | no |
| <a name="input_dead_letter_config"></a> [dead\_letter\_config](#input\_dead\_letter\_config) | Dead letter queue configuration that specifies the queue or topic where Lambda sends asynchronous events when they fail processing | <pre>object({<br>    target_arn = string<br>  })</pre> | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of what your Lambda Function does | `string` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Map of environment variables that are accessible from the function code during execution | <pre>object({<br>    variables = map(string)<br>  })</pre> | `null` | no |
| <a name="input_ephemeral_storage"></a> [ephemeral\_storage](#input\_ephemeral\_storage) | The amount of Ephemeral storage(/tmp) to allocate for the Lambda Function in MB. This parameter is used to expand the total amount of Ephemeral storage available, beyond the default amount of 512MB | <pre>object({<br>    size = number<br>  })</pre> | `null` | no |
| <a name="input_file_system_config"></a> [file\_system\_config](#input\_file\_system\_config) | Connection settings for an EFS file system. Before creating or updating Lambda functions with `file_system_config`, EFS mount targets must be in available lifecycle state. Use `depends_on` to explicitly declare this dependency | <pre>object({<br>    arn              = string<br>    local_mount_path = string<br>  })</pre> | `null` | no |
| <a name="input_filename"></a> [filename](#input\_filename) | Path to the function's deployment package within the local filesystem. Conflicts with `image_uri`, `s3_bucket`, `s3_key`, and `s3_object_version` | `string` | `null` | no |
| <a name="input_function_name"></a> [function\_name](#input\_function\_name) | Unique name for your Lambda Function | `string` | n/a | yes |
| <a name="input_handler"></a> [handler](#input\_handler) | Function entrypoint in your code | `string` | `null` | no |
| <a name="input_image_config"></a> [image\_config](#input\_image\_config) | Container image configuration values that override the values in the container image Dockerfile | <pre>object({<br>    command           = optional(list(string))<br>    entry_point       = optional(list(string))<br>    working_directory = optional(string)<br>  })</pre> | `null` | no |
| <a name="input_image_uri"></a> [image\_uri](#input\_image\_uri) | ECR image URI containing the function's deployment package. Conflicts with `filename`, `s3_bucket`, `s3_key`, and `s3_object_version` | `string` | `null` | no |
| <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn) | Amazon Resource Name (ARN) of the AWS Key Management Service (KMS) key that is used to encrypt environment variables. If this configuration is not provided when environment variables are in use, AWS Lambda uses a default service key. If this configuration is provided when environment variables are not in use, the AWS Lambda API does not save this configuration and Terraform will show a perpetual difference of adding the key. To fix the perpetual difference, remove this configuration | `string` | `null` | no |
| <a name="input_layers"></a> [layers](#input\_layers) | List of Lambda Layer Version ARNs (maximum of 5) to attach to your Lambda Function | `list(string)` | `null` | no |
| <a name="input_memory_size"></a> [memory\_size](#input\_memory\_size) | Amount of memory in MB your Lambda Function can use at runtime. Defaults to `128` | `number` | `128` | no |
| <a name="input_package_type"></a> [package\_type](#input\_package\_type) | Lambda deployment package type. Valid values are `Zip` and `Image`. Defaults to `Zip` | `string` | `"Zip"` | no |
| <a name="input_publish"></a> [publish](#input\_publish) | Whether to publish creation/change as new Lambda Function Version. Defaults to `false` | `bool` | `false` | no |
| <a name="input_reserved_concurrent_executions"></a> [reserved\_concurrent\_executions](#input\_reserved\_concurrent\_executions) | Amount of reserved concurrent executions for this lambda function. A value of 0 disables lambda from being triggered and -1 removes any concurrency limitations. Defaults to Unreserved Concurrency Limits -1 | `number` | `-1` | no |
| <a name="input_role"></a> [role](#input\_role) | Amazon Resource Name (ARN) of the function's execution role. The role provides the function's identity and access to AWS services and resources | `string` | n/a | yes |
| <a name="input_runtime"></a> [runtime](#input\_runtime) | Identifier of the function's runtime | `string` | `null` | no |
| <a name="input_s3_bucket"></a> [s3\_bucket](#input\_s3\_bucket) | S3 bucket location containing the function's deployment package. Conflicts with `filename` and `image_uri`. This bucket must reside in the same AWS region where you are creating the Lambda function | `string` | `null` | no |
| <a name="input_s3_key"></a> [s3\_key](#input\_s3\_key) | S3 key of an object containing the function's deployment package. Conflicts with `filename` and `image_uri` | `string` | `null` | no |
| <a name="input_s3_object_version"></a> [s3\_object\_version](#input\_s3\_object\_version) | Object version containing the function's deployment package. Conflicts with `filename` and `image_uri` | `string` | `null` | no |
| <a name="input_source_code_hash"></a> [source\_code\_hash](#input\_source\_code\_hash) | Used to trigger updates. Must be set to a base64-encoded SHA256 hash of the package file specified with either `filename` or `s3_key`. The usual way to set this is `filebase64sha256("file.zip")` (Terraform 0.11.12 and later) or `base64sha256(file("file.zip"))` (Terraform 0.11.11 and earlier), where "file.zip" is the local filename of the lambda function source archive | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of tags to assign to the object | `map(string)` | `null` | no |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | Amount of time your Lambda Function has to run in seconds. Defaults to `3` | `number` | `3` | no |
| <a name="input_tracing_config"></a> [tracing\_config](#input\_tracing\_config) | Whether to to sample and trace a subset of incoming requests with AWS X-Ray | <pre>object({<br>    mode = string<br>  })</pre> | `null` | no |
| <a name="input_vpc_config"></a> [vpc\_config](#input\_vpc\_config) | For network connectivity to AWS resources in a VPC, specify a list of security groups and subnets in the VPC. When you connect a function to a VPC, it can only access resources and the internet through that VPC | <pre>object({<br>    security_group_ids = list(string)<br>    subnet_ids         = list(string)<br>  })</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | Amazon Resource Name (ARN) identifying your Lambda Function |
| <a name="output_function_name"></a> [function\_name](#output\_function\_name) | The Lambda Function name |
| <a name="output_invoke_arn"></a> [invoke\_arn](#output\_invoke\_arn) | ARN to be used for invoking Lambda Function from API Gateway - to be used in aws\_api\_gateway\_integration's uri |
| <a name="output_qualified_arn"></a> [qualified\_arn](#output\_qualified\_arn) | ARN identifying your Lambda Function Version |
| <a name="output_signing_job_arn"></a> [signing\_job\_arn](#output\_signing\_job\_arn) | ARN of the signing job |
| <a name="output_signing_profile_version_arn"></a> [signing\_profile\_version\_arn](#output\_signing\_profile\_version\_arn) | ARN of the signing profile version |
| <a name="output_source_code_size"></a> [source\_code\_size](#output\_source\_code\_size) | Size in bytes of the function .zip file |
| <a name="output_version"></a> [version](#output\_version) | Latest published version of your Lambda Function |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->