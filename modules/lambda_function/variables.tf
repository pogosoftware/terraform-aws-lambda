##########################################################################
### REQUIRED
##########################################################################
variable "function_name" {
  description = "Unique name for your Lambda Function"
  type        = string
}

variable "role" {
  description = "Amazon Resource Name (ARN) of the function's execution role. The role provides the function's identity and access to AWS services and resources"
  type        = string
}

##########################################################################
### OPTIONAL
##########################################################################
variable "architectures" {
  default     = ["x86_64"]
  description = "Instruction set architecture for your Lambda function. Valid values are [\"x86_64\"] and [\"arm64\"]. Default is [\"x86_64\"]"
  type        = list(string)
}

variable "code_signing_config_arn" {
  default     = null
  description = "To enable code signing for this function, specify the ARN of a code-signing configuration. A code-signing configuration includes a set of signing profiles, which define the trusted publishers for this function"
  type        = string
}

variable "dead_letter_config" {
  default     = null
  description = "Dead letter queue configuration that specifies the queue or topic where Lambda sends asynchronous events when they fail processing"
  type = object({
    target_arn = string
  })
}

variable "description" {
  default     = null
  description = "Description of what your Lambda Function does"
  type        = string
}

variable "environment" {
  default     = null
  description = "Map of environment variables that are accessible from the function code during execution"
  type = object({
    variables = map(string)
  })
}

variable "ephemeral_storage" {
  default     = null
  description = "The amount of Ephemeral storage(/tmp) to allocate for the Lambda Function in MB. This parameter is used to expand the total amount of Ephemeral storage available, beyond the default amount of 512MB"
  type = object({
    size = number
  })
}

variable "file_system_config" {
  default     = null
  description = "Connection settings for an EFS file system. Before creating or updating Lambda functions with `file_system_config`, EFS mount targets must be in available lifecycle state. Use `depends_on` to explicitly declare this dependency"
  type = object({
    arn              = string
    local_mount_path = string
  })
}
variable "filename" {
  default     = null
  description = "Path to the function's deployment package within the local filesystem. Conflicts with `image_uri`, `s3_bucket`, `s3_key`, and `s3_object_version`"
  type        = string
}

variable "handler" {
  default     = null
  description = "Function entrypoint in your code"
  type        = string
}

variable "image_config" {
  default     = null
  description = "Container image configuration values that override the values in the container image Dockerfile"
  type = object({
    command           = optional(list(string))
    entry_point       = optional(list(string))
    working_directory = optional(string)
  })
}
variable "image_uri" {
  default     = null
  description = "ECR image URI containing the function's deployment package. Conflicts with `filename`, `s3_bucket`, `s3_key`, and `s3_object_version`"
  type        = string
}

variable "kms_key_arn" {
  default     = null
  description = "Amazon Resource Name (ARN) of the AWS Key Management Service (KMS) key that is used to encrypt environment variables. If this configuration is not provided when environment variables are in use, AWS Lambda uses a default service key. If this configuration is provided when environment variables are not in use, the AWS Lambda API does not save this configuration and Terraform will show a perpetual difference of adding the key. To fix the perpetual difference, remove this configuration"
  type        = string
}

variable "layers" {
  default     = null
  description = "List of Lambda Layer Version ARNs (maximum of 5) to attach to your Lambda Function"
  type        = list(string)
}

variable "memory_size" {
  default     = 128
  description = "Amount of memory in MB your Lambda Function can use at runtime. Defaults to `128`"
  type        = number
}

variable "package_type" {
  default     = "Zip"
  description = "Lambda deployment package type. Valid values are `Zip` and `Image`. Defaults to `Zip`"
  type        = string
}

variable "publish" {
  default     = false
  description = "Whether to publish creation/change as new Lambda Function Version. Defaults to `false`"
  type        = bool
}

variable "reserved_concurrent_executions" {
  default     = -1
  description = "Amount of reserved concurrent executions for this lambda function. A value of 0 disables lambda from being triggered and -1 removes any concurrency limitations. Defaults to Unreserved Concurrency Limits -1"
  type        = number
}

variable "runtime" {
  default     = null
  description = "Identifier of the function's runtime"
  type        = string
}

variable "s3_bucket" {
  default     = null
  description = "S3 bucket location containing the function's deployment package. Conflicts with `filename` and `image_uri`. This bucket must reside in the same AWS region where you are creating the Lambda function"
  type        = string
}

variable "s3_key" {
  default     = null
  description = "S3 key of an object containing the function's deployment package. Conflicts with `filename` and `image_uri`"
  type        = string
}

variable "s3_object_version" {
  default     = null
  description = "Object version containing the function's deployment package. Conflicts with `filename` and `image_uri`"
  type        = string
}

variable "source_code_hash" {
  default     = null
  description = "Used to trigger updates. Must be set to a base64-encoded SHA256 hash of the package file specified with either `filename` or `s3_key`. The usual way to set this is `filebase64sha256(\"file.zip\")` (Terraform 0.11.12 and later) or `base64sha256(file(\"file.zip\"))` (Terraform 0.11.11 and earlier), where \"file.zip\" is the local filename of the lambda function source archive"
  type        = string
}

variable "tags" {
  default     = null
  description = "Map of tags to assign to the object"
  type        = map(string)
}

variable "timeout" {
  default     = 3
  description = "Amount of time your Lambda Function has to run in seconds. Defaults to `3`"
  type        = number
}

variable "tracing_config" {
  default     = null
  description = "Whether to to sample and trace a subset of incoming requests with AWS X-Ray"
  type = object({
    mode = string
  })
}
variable "vpc_config" {
  default     = null
  description = "For network connectivity to AWS resources in a VPC, specify a list of security groups and subnets in the VPC. When you connect a function to a VPC, it can only access resources and the internet through that VPC"
  type = object({
    security_group_ids = list(string)
    subnet_ids         = list(string)
  })
}
