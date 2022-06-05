module "lambda_function" {
  source = "./modules/lambda_function"

  count = var.create_lambda_function ? 1 : 0

  function_name                  = var.lambda_function_name
  role                           = var.lambda_function_role
  architectures                  = var.lambda_function_architectures
  code_signing_config_arn        = var.lambda_function_code_signing_config_arn
  description                    = var.lambda_function_description
  dead_letter_config             = var.lambda_function_dead_letter_config
  environment                    = var.lambda_function_environment
  ephemeral_storage              = var.lambda_function_ephemeral_storage
  file_system_config             = var.lambda_function_file_system_config
  filename                       = var.lambda_function_filename
  handler                        = var.lambda_function_handler
  image_config                   = var.lambda_function_image_config
  image_uri                      = var.lambda_function_image_uri
  kms_key_arn                    = var.lambda_function_kms_key_arn
  layers                         = var.lambda_function_layers
  memory_size                    = var.lambda_function_memory_size
  package_type                   = var.lambda_function_package_type
  publish                        = var.lambda_function_publish
  reserved_concurrent_executions = var.lambda_function_reserved_concurrent_executions
  runtime                        = var.lambda_function_runtime
  s3_bucket                      = var.lambda_function_s3_bucket
  s3_key                         = var.lambda_function_s3_key
  s3_object_version              = var.lambda_function_s3_object_version
  source_code_hash               = var.lambda_function_source_code_hash
  tags                           = var.lambda_function_tags
  timeout                        = var.lambda_function_timeout
  tracing_config                 = var.lambda_function_tracing_config
  vpc_config                     = var.lambda_function_vpc_config
}

module "cloudwatch_event_rule" {
  source = "./modules/cloudwatch_event_rule"

  count = var.create_cloudwatch_event_rule ? 1 : 0

  name                = local.cloudwatch_event_rule_name
  name_prefix         = local.cloudwatch_event_rule_name_prefix
  schedule_expression = var.cloudwatch_event_rule_schedule_expression
  event_bus_name      = var.cloudwatch_event_rule_event_bus_name
  event_pattern       = var.cloudwatch_event_rule_event_pattern
  description         = var.cloudwatch_event_rule_description
  role_arn            = var.cloudwatch_event_rule_role_arn
  is_enabled          = var.cloudwatch_event_rule_is_enabled
  tags                = var.cloudwatch_event_rule_tags
}

module "cloudwatch_event_target" {
  source = "./modules/cloudwatch_event_target"

  count = var.create_cloudwatch_event_target ? 1 : 0

  rule = local.cloudwatch_event_target_rule
  arn  = local.cloudwatch_event_target_arn

  event_bus_name      = var.cloudwatch_event_target_event_bus_name
  target_id           = var.cloudwatch_event_target_id
  input               = var.cloudwatch_event_target_input
  input_path          = var.cloudwatch_event_target_input_path
  role_arn            = var.cloudwatch_event_target_role_arn
  run_command_targets = var.cloudwatch_event_target_run_command_targets
  ecs_target          = var.cloudwatch_event_target_ecs_target
  batch_target        = var.cloudwatch_event_target_batch_target
  kinesis_target      = var.cloudwatch_event_target_kinesis_target
  redshift_target     = var.cloudwatch_event_target_redshift_target
  sqs_target          = var.cloudwatch_event_target_sqs_target
  http_target         = var.cloudwatch_event_target_http_target
  input_transformer   = var.cloudwatch_event_target_input_transformer
  retry_policy        = var.cloudwatch_event_target_retry_policy
  dead_letter_config  = var.cloudwatch_event_target_dead_letter_config
}

module "lambda_permission" {
  source = "./modules/lambda_permission"

  count = var.create_lambda_permission ? 1 : 0

  action        = var.lambda_permission_action
  function_name = local.lambda_function_name
  principal     = var.lambda_permission_principal

  event_source_token     = var.lambda_permission_event_source_token
  function_url_auth_type = var.lambda_permission_function_url_auth_type
  qualifier              = var.lambda_permission_qualifier
  source_account         = var.lambda_permission_source_account
  source_arn             = local.lambda_permission_source_arn
  statement_id           = local.lambda_permission_statement_id
  statement_id_prefix    = local.lambda_permission_statement_id_prefix
  principal_org_id       = var.lambda_permission_principal_org_id
}

module "lambda_alias" {
  source = "./modules/lambda_alias"

  count = var.create_lambda_alias ? 1 : 0

  name             = var.lambda_alias_name
  function_name    = local.lambda_function_name
  function_version = var.lambda_alias_function_version

  description    = var.lambda_alias_description
  routing_config = var.lambda_alias_routing_config
}
