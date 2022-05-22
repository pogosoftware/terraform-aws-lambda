##########################################################################
### lambda_function
##########################################################################
output "lambda_function_arn" {
  description = "Amazon Resource Name (ARN) identifying your Lambda Function"
  value       = try(module.lambda_function[0].arn, "")
}

output "lambda_function_invoke_arn" {
  description = "ARN to be used for invoking Lambda Function from API Gateway - to be used in aws_api_gateway_integration's uri"
  value       = try(module.lambda_function[0].invoke_arn, "")
}

output "lambda_function_qualified_arn" {
  description = "ARN identifying your Lambda Function Version"
  value       = try(module.lambda_function[0].qualified_arn, "")
}

output "lambda_function_signing_job_arn" {
  description = "ARN of the signing job"
  value       = try(module.lambda_function[0].signing_job_arn, "")
}

output "lambda_function_signing_profile_version_arn" {
  description = "ARN of the signing profile version"
  value       = try(module.lambda_function[0].signing_profile_version_arn, "")
}

output "lambda_function_source_code_size" {
  description = "Size in bytes of the function .zip file"
  value       = try(module.lambda_function[0].source_code_size, "")
}

output "lambda_function_version" {
  description = "Latest published version of your Lambda Function"
  value       = try(module.lambda_function[0].version, "")
}

##########################################################################
### lambda_alias
##########################################################################
output "lambda_alias_arn" {
  description = "The Amazon Resource Name (ARN) identifying your Lambda function alias"
  value       = try(module.lambda_alias[0].arn, "")
}

output "lambda_alias_name" {
  description = "The name of alias"
  value       = try(module.lambda_alias[0].name, "")
}

output "lambda_alias_invoke_arn" {
  description = "The ARN to be used for invoking Lambda Function from API Gateway - to be used in `aws_api_gateway_integration`'s uri"
  value       = try(module.lambda_alias[0].invoke_arn, "")
}
