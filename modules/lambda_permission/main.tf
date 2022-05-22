resource "aws_lambda_permission" "this" {
  action        = var.action
  function_name = var.function_name
  principal     = var.principal

  event_source_token     = var.event_source_token
  function_url_auth_type = var.function_url_auth_type
  qualifier              = var.qualifier
  source_account         = var.source_account
  source_arn             = var.source_arn
  statement_id           = var.statement_id
  statement_id_prefix    = var.statement_id_prefix
  principal_org_id       = var.principal_org_id
}
