##########################################################################
### OPTIONAL
##########################################################################
variable "name" {
  default     = null
  description = "The name of the rule. If omitted, Terraform will assign a random, unique name. Conflicts with `name_prefix`"
  type        = string
}

variable "name_prefix" {
  default     = null
  description = "Creates a unique name beginning with the specified prefix. Conflicts with `name`"
  type        = string
}

variable "schedule_expression" {
  default     = null
  description = "The scheduling expression"
  type        = string
}

variable "event_bus_name" {
  default     = null
  description = "The event bus to associate with this rule. If you omit this, the `default` event bus is used"
  type        = string
}

variable "event_pattern" {
  default     = null
  description = "The event pattern described a JSON object. At least one of `schedule_expression` or `event_pattern` is required"
  type        = string
}

variable "description" {
  default     = null
  description = "The description of the rule"
  type        = string
}

variable "role_arn" {
  default     = null
  description = "The Amazon Resource Name (ARN) associated with the role that is used for target invocation"
  type        = string
}

variable "is_enabled" {
  default     = true
  description = "Whether the rule should be enabled. Defaults to `true`"
  type        = bool
}

variable "tags" {
  default     = null
  description = "A map of tags to assign to the resource"
  type        = map(string)
}
