##########################################################################
### lambda_function
##########################################################################
variable "create_lambda_function" {
  default     = true
  description = "Determinate to create `lambda_function` resources or not"
  type        = bool
}

variable "lambda_function_name" {
  default     = null
  description = "Required if `create_lambda_function` or `create_lambda_permission` or `create_lambda_alias` is set to `true`. Unique name for your Lambda Function"
  type        = string
}

variable "lambda_function_role" {
  default     = null
  description = "Required if `create_lambda_function` is set to `true`. Amazon Resource Name (ARN) of the function's execution role. The role provides the function's identity and access to AWS services and resources"
  type        = string
}

variable "lambda_function_architectures" {
  default     = ["x86_64"]
  description = "Instruction set architecture for your Lambda function. Valid values are [\"x86_64\"] and [\"arm64\"]. Default is [\"x86_64\"]"
  type        = list(string)
}

variable "lambda_function_code_signing_config_arn" {
  default     = null
  description = "To enable code signing for this function, specify the ARN of a code-signing configuration. A code-signing configuration includes a set of signing profiles, which define the trusted publishers for this function"
  type        = string
}

variable "lambda_function_dead_letter_config" {
  default     = null
  description = "Dead letter queue configuration that specifies the queue or topic where Lambda sends asynchronous events when they fail processing"
  type = object({
    target_arn = string
  })
}

variable "lambda_function_description" {
  default     = null
  description = "Description of what your Lambda Function does"
  type        = string
}

variable "lambda_function_environment" {
  default     = null
  description = "Map of environment variables that are accessible from the function code during execution"
  type = object({
    variables = map(string)
  })
}

variable "lambda_function_ephemeral_storage" {
  default     = null
  description = "The amount of Ephemeral storage(/tmp) to allocate for the Lambda Function in MB. This parameter is used to expand the total amount of Ephemeral storage available, beyond the default amount of 512MB"
  type = object({
    size = number
  })
}

variable "lambda_function_file_system_config" {
  default     = null
  description = "Connection settings for an EFS file system. Before creating or updating Lambda functions with `file_system_config`, EFS mount targets must be in available lifecycle state. Use `depends_on` to explicitly declare this dependency"
  type = object({
    arn              = string
    local_mount_path = string
  })
}
variable "lambda_function_filename" {
  default     = null
  description = "Path to the function's deployment package within the local filesystem. Conflicts with `image_uri`, `s3_bucket`, `s3_key`, and `s3_object_version`"
  type        = string
}

variable "lambda_function_handler" {
  default     = null
  description = "Function entrypoint in your code"
  type        = string
}

variable "lambda_function_image_config" {
  default     = null
  description = "Container image configuration values that override the values in the container image Dockerfile"
  type = object({
    command           = optional(list(string))
    entry_point       = optional(list(string))
    working_directory = optional(string)
  })
}
variable "lambda_function_image_uri" {
  default     = null
  description = "ECR image URI containing the function's deployment package. Conflicts with `filename`, `s3_bucket`, `s3_key`, and `s3_object_version`"
  type        = string
}

variable "lambda_function_kms_key_arn" {
  default     = null
  description = "Amazon Resource Name (ARN) of the AWS Key Management Service (KMS) key that is used to encrypt environment variables. If this configuration is not provided when environment variables are in use, AWS Lambda uses a default service key. If this configuration is provided when environment variables are not in use, the AWS Lambda API does not save this configuration and Terraform will show a perpetual difference of adding the key. To fix the perpetual difference, remove this configuration"
  type        = string
}

variable "lambda_function_layers" {
  default     = null
  description = "List of Lambda Layer Version ARNs (maximum of 5) to attach to your Lambda Function"
  type        = list(string)
}

variable "lambda_function_memory_size" {
  default     = 128
  description = "Amount of memory in MB your Lambda Function can use at runtime. Defaults to `128`"
  type        = number
}

variable "lambda_function_package_type" {
  default     = "Zip"
  description = "Lambda deployment package type. Valid values are `Zip` and `Image`. Defaults to `Zip`"
  type        = string
}

variable "lambda_function_publish" {
  default     = false
  description = "Whether to publish creation/change as new Lambda Function Version. Defaults to `false`"
  type        = bool
}

variable "lambda_function_reserved_concurrent_executions" {
  default     = -1
  description = "Amount of reserved concurrent executions for this lambda function. A value of 0 disables lambda from being triggered and -1 removes any concurrency limitations. Defaults to Unreserved Concurrency Limits -1"
  type        = number
}

variable "lambda_function_runtime" {
  default     = null
  description = "Identifier of the function's runtime"
  type        = string
}

variable "lambda_function_s3_bucket" {
  default     = null
  description = "S3 bucket location containing the function's deployment package. Conflicts with `filename` and `image_uri`. This bucket must reside in the same AWS region where you are creating the Lambda function"
  type        = string
}

variable "lambda_function_s3_key" {
  default     = null
  description = "S3 key of an object containing the function's deployment package. Conflicts with `filename` and `image_uri`"
  type        = string
}

variable "lambda_function_s3_object_version" {
  default     = null
  description = "Object version containing the function's deployment package. Conflicts with `filename` and `image_uri`"
  type        = string
}

variable "lambda_function_source_code_hash" {
  default     = null
  description = "Used to trigger updates. Must be set to a base64-encoded SHA256 hash of the package file specified with either `filename` or `s3_key`. The usual way to set this is `filebase64sha256(\"file.zip\")` (Terraform 0.11.12 and later) or `base64sha256(file(\"file.zip\"))` (Terraform 0.11.11 and earlier), where \"file.zip\" is the local filename of the lambda function source archive"
  type        = string
}

variable "lambda_function_tags" {
  default     = null
  description = "Map of tags to assign to the object"
  type        = map(string)
}

variable "lambda_function_timeout" {
  default     = 3
  description = "Amount of time your Lambda Function has to run in seconds. Defaults to `3`"
  type        = number
}

variable "lambda_function_tracing_config" {
  default     = null
  description = "Whether to to sample and trace a subset of incoming requests with AWS X-Ray"
  type = object({
    mode = string
  })
}
variable "lambda_function_vpc_config" {
  default     = null
  description = "For network connectivity to AWS resources in a VPC, specify a list of security groups and subnets in the VPC. When you connect a function to a VPC, it can only access resources and the internet through that VPC"
  type = object({
    security_group_ids = list(string)
    subnet_ids         = list(string)
  })
}

##########################################################################
### lambda_permission
##########################################################################
variable "create_lambda_permission" {
  default     = false
  description = "Determinate to create `lambda_permission` resources or not"
  type        = bool
}

variable "lambda_permission_action" {
  default     = null
  description = "Required if `create_lambda_permission` is set to `true`. The AWS Lambda action you want to allow in this statement"
  type        = string
}

variable "lambda_permission_principal" {
  default     = null
  description = "Required if `create_lambda_permission` is set to `true`. The principal who is getting this permission e.g., `s3.amazonaws.com`, an AWS account ID, or any valid AWS service principal such as `events.amazonaws.com` or `sns.amazonaws.com`"
  type        = string
}

variable "lambda_permission_event_source_token" {
  default     = null
  description = "The Event Source Token to validate"
  type        = string
}

variable "lambda_permission_function_url_auth_type" {
  default     = null
  description = "Lambda Function URLs authentication type. Valid values are: `AWS_IAM` or `NONE`"
  type        = string
}

variable "lambda_permission_qualifier" {
  default     = null
  description = "Query parameter to specify function version or alias name. The permission will then apply to the specific qualified ARN e.g., `arn:aws:lambda:aws-region:acct-id:function:function-name:2`"
  type        = string
}

variable "lambda_permission_source_account" {
  default     = null
  description = "This parameter is used for S3 and SES. The AWS account ID (without a hyphen) of the source owner"
  type        = string
}

variable "lambda_permission_source_arn" {
  default     = null
  description = " When the principal is an AWS service, the ARN of the specific resource within that service to grant permission to"
  type        = string
}

variable "lambda_permission_statement_id" {
  default     = null
  description = "A unique statement identifier. By default generated by Terraform"
  type        = string
}

variable "lambda_permission_use_statement_id_prefix" {
  default     = false
  description = "A statement identifier prefix. Terraform will generate a unique suffix. Conflicts with `statement_id`"
  type        = string
}

variable "lambda_permission_principal_org_id" {
  default     = null
  description = "The identifier for your organization in AWS Organizations. Use this to grant permissions to all the AWS accounts under this organization"
  type        = string
}

##########################################################################
### lambda_alias
##########################################################################
variable "create_lambda_alias" {
  default     = false
  description = "Determinate to create `lambda_alias` resources or not"
  type        = bool
}

variable "lambda_alias_name" {
  default     = null
  description = "Required if `create_lambda_alias` is set to `true`. Name for the alias you are creating"
  type        = string
}

variable "lambda_alias_function_version" {
  default     = null
  description = "Required if `create_lambda_alias` is set to `true`. Lambda function version for which you are creating the alias"
  type        = string
}

variable "lambda_alias_description" {
  default     = null
  description = "Description of the alias"
  type        = string
}

variable "lambda_alias_routing_config" {
  default     = null
  description = " The Lambda alias' route configuration settings"
  type = object({
    additional_version_weights = map(string)
  })
}
