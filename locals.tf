locals {
  lambda_function_name = var.create_lambda_function ? module.lambda_function[0].function_name : var.lambda_function_name

  cloudwatch_event_rule_name        = var.use_cloudwatch_event_rule_name_prefix ? null : var.cloudwatch_event_rule_name
  cloudwatch_event_rule_name_prefix = var.use_cloudwatch_event_rule_name_prefix ? format("%s-", var.cloudwatch_event_rule_name) : null

  cloudwatch_event_target_rule = var.create_cloudwatch_event_rule ? module.cloudwatch_event_rule[0].name : var.cloudwatch_event_target_rule
  cloudwatch_event_target_arn  = var.create_lambda_function ? module.lambda_function[0].arn : var.cloudwatch_event_target_arn

  lambda_permission_statement_id        = var.lambda_permission_use_statement_id_prefix ? null : var.lambda_permission_statement_id
  lambda_permission_statement_id_prefix = var.lambda_permission_use_statement_id_prefix ? format("%s-", var.lambda_permission_statement_id) : null
  lambda_permission_source_arn          = var.create_cloudwatch_event_rule ? module.cloudwatch_event_rule[0].arn : var.lambda_permission_source_arn
}
