resource "aws_cloudwatch_event_rule" "this" {
  name                = var.name
  name_prefix         = var.name_prefix
  schedule_expression = var.schedule_expression
  event_bus_name      = var.event_bus_name
  event_pattern       = var.event_pattern
  description         = var.description
  role_arn            = var.role_arn
  is_enabled          = var.is_enabled
  tags                = var.tags
}
