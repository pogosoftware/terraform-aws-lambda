output "arn" {
  description = "The Amazon Resource Name (ARN) identifying your Lambda function alias"
  value       = aws_lambda_alias.this.arn
}

output "name" {
  description = "The name of alias"
  value       = aws_lambda_alias.this.name
}

output "invoke_arn" {
  description = "The ARN to be used for invoking Lambda Function from API Gateway - to be used in `aws_api_gateway_integration`'s uri"
  value       = aws_lambda_alias.this.invoke_arn
}
