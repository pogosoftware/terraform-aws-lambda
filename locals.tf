locals {
  lambda_permission_function_name       = var.create_lambda_function ? module.lambda_function[0].function_name : var.lambda_permission_function_name
  lambda_permission_statement_id        = var.lambda_permission_use_statement_id_prefix ? null : var.lambda_permission_statement_id
  lambda_permission_statement_id_prefix = var.lambda_permission_use_statement_id_prefix ? format("%s-", var.lambda_permission_statement_id) : null
}
