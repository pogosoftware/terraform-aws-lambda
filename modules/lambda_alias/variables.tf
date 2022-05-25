##########################################################################
### REQUIRED
##########################################################################
variable "name" {
  description = "Name for the alias you are creating"
  type        = string
}

variable "function_name" {
  description = "Lambda Function name or ARN"
  type        = string
}

variable "function_version" {
  description = "Lambda function version for which you are creating the alias"
  type        = string
}

##########################################################################
### OPTIONAL
##########################################################################
variable "description" {
  default     = null
  description = "Description of the alias"
  type        = string
}

variable "routing_config" {
  default     = null
  description = " The Lambda alias' route configuration settings"
  type = object({
    additional_version_weights = map(string)
  })
}
