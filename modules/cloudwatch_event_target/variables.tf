##########################################################################
### REQUIRED
##########################################################################
variable "rule" {
  description = "The name of the rule you want to add targets to"
  type        = string
}

variable "arn" {
  description = "The Amazon Resource Name (ARN) of the target"
  type        = string
}

##########################################################################
### OPTIONAL
##########################################################################
variable "event_bus_name" {
  default     = null
  description = "The event bus to associate with the rule. If you omit this, the `default` event bus is used"
  type        = string
}

variable "target_id" {
  default     = null
  description = "The unique target assignment ID. If missing, will generate a random, unique id"
  type        = string
}

variable "input" {
  default     = null
  description = "Valid JSON text passed to the target. Conflicts with `input_path` and `input_transformer`"
  type        = string
}

variable "input_path" {
  default     = null
  description = "The value of the JSONPath that is used for extracting part of the matched event when passing it to the target. Conflicts with `input` and `input_transformer`"
  type        = string
}

variable "role_arn" {
  default     = null
  description = "he Amazon Resource Name (ARN) of the IAM role to be used for this target when the rule is triggered. Required if `ecs_target` is used or target in `arn` is EC2 instance, Kinesis data stream, Step Functions state machine, or Event Bus in different account or region"
  type        = string
}

variable "run_command_targets" {
  default     = null
  description = " Parameters used when you are using the rule to invoke Amazon EC2 Run Command. Documented below. A maximum of 5 are allowed"
  type = list(object({
    key    = string
    values = optional(list(string))
  }))
}

variable "ecs_target" {
  default     = null
  description = "Parameters used when you are using the rule to invoke Amazon ECS Task. A maximum of 1 are allowed"
  type = object({
    task_definition_arn = string
    group               = optional(string)
    launch_type         = optional(string)
    network_configuration = optional(object({
      subnets          = set(string)
      security_groups  = optional(set(string))
      assign_public_ip = optional(bool)
      }
    ))
    platform_version = optional(string)
    task_count       = optional(number)
    tags             = optional(map(string))
    propagate_tags   = optional(string)
    placement_constraint = optional(object({
      type       = string
      expression = optional(string)
    }))
    enable_execute_command  = optional(bool)
    enable_ecs_managed_tags = optional(bool)
  })
}

variable "batch_target" {
  default     = null
  description = "Parameters used when you are using the rule to invoke an Amazon Batch Job. A maximum of 1 are allowed"
  type = object({
    job_definition = string
    job_name       = string
    array_size     = optional(number)
    job_attempts   = optional(number)
  })
}

variable "kinesis_target" {
  default     = null
  description = "Parameters used when you are using the rule to invoke an Amazon Kinesis Stream. A maximum of 1 are allowed"
  type = object({
    partition_key_path = optional(string)
  })
}

variable "redshift_target" {
  default     = null
  description = "Parameters used when you are using the rule to invoke an Amazon Redshift Statement. A maximum of 1 are allowed"
  type = object({
    database            = string
    db_user             = optional(string)
    secrets_manager_arn = optional(string)
    sql                 = optional(string)
    statement_name      = optional(string)
    with_event          = optional(bool)
  })
}

variable "sqs_target" {
  default     = null
  description = "Parameters used when you are using the rule to invoke an Amazon SQS Queue. A maximum of 1 are allowed"
  type = object({
    message_group_id = optional(string)
  })
}

variable "http_target" {
  default     = null
  description = "Parameters used when you are using the rule to invoke an API Gateway REST endpoint. A maximum of 1 is allowed"
  type = object({
    path_parameter_values   = optional(list(string))
    query_string_parameters = optional(map(string))
    header_parameters       = optional(map(string))
  })
}

variable "input_transformer" {
  default     = null
  description = "Parameters used when you are providing a custom input to a target based on certain event data. Conflicts with `input` and `input_path`"
  type = object({
    input_template = string
    input_paths    = optional(map(string))
  })
}

variable "retry_policy" {
  default     = null
  description = "Parameters used when you are providing retry policies. A maximum of 1 are allowed"
  type = object({
    maximum_event_age_in_seconds = optional(number)
    maximum_retry_attempts       = optional(number)
  })
}

variable "dead_letter_config" {
  default     = null
  description = "Parameters used when you are providing a dead letter config. A maximum of 1 are allowed"
  type = object({
    arn = optional(string)
  })
}
