resource "aws_cloudwatch_event_target" "this" {
  rule = var.rule
  arn  = var.arn

  event_bus_name = var.event_bus_name
  target_id      = var.target_id
  input          = var.input
  input_path     = var.input_path
  role_arn       = var.role_arn

  dynamic "run_command_targets" {
    for_each = var.run_command_targets == null ? [] : var.run_command_targets

    content {
      key    = run_command_targets.value["key"]
      values = run_command_targets.value["values"]
    }
  }

  dynamic "ecs_target" {
    for_each = var.ecs_target == null ? [] : [var.ecs_target]

    content {
      task_definition_arn     = ecs_target.value["task_definition_arn"]
      group                   = ecs_target.value["group"]
      launch_type             = ecs_target.value["launch_type"]
      platform_version        = ecs_target.value["platform_version"]
      task_count              = ecs_target.value["task_count"]
      tags                    = ecs_target.value["tags"]
      propagate_tags          = ecs_target.value["propagate_tags"]
      enable_execute_command  = ecs_target.value["enable_execute_command"]
      enable_ecs_managed_tags = ecs_target.value["enable_ecs_managed_tags"]

      dynamic "network_configuration" {
        for_each = ecs_target.value["network_configuration"] == null ? [] : [ecs_target.value["network_configuration"]]

        content {
          subnets          = network_configuration.value["subnets"]
          security_groups  = network_configuration.value["security_groups"]
          assign_public_ip = network_configuration.value["assign_public_ip"]
        }
      }

      dynamic "placement_constraint" {
        for_each = ecs_target.value["placement_constraint"] == null ? [] : [ecs_target.value["placement_constraint"]]

        content {
          type       = placement_constraint.value["type"]
          expression = placement_constraint.value["expression"]
        }
      }
    }
  }

  dynamic "batch_target" {
    for_each = var.batch_target == null ? [] : [var.batch_target]

    content {
      job_definition = batch_target.value["job_definition"]
      job_name       = batch_target.value["job_name"]
      array_size     = batch_target.value["array_size"]
      job_attempts   = batch_target.value["job_attempts"]
    }
  }

  dynamic "kinesis_target" {
    for_each = var.kinesis_target == null ? [] : [var.kinesis_target]

    content {
      partition_key_path = kinesis_target.value["partition_key_path"]
    }
  }

  dynamic "redshift_target" {
    for_each = var.redshift_target == null ? [] : [var.redshift_target]

    content {
      database            = redshift_target.value["database"]
      db_user             = redshift_target.value["db_user"]
      secrets_manager_arn = redshift_target.value["secrets_manager_arn"]
      sql                 = redshift_target.value["sql"]
      statement_name      = redshift_target.value["statement_name"]
      with_event          = redshift_target.value["with_event"]
    }
  }

  dynamic "sqs_target" {
    for_each = var.sqs_target == null ? [] : [var.sqs_target]

    content {
      message_group_id = sqs_target.value["message_group_id"]
    }
  }

  dynamic "http_target" {
    for_each = var.http_target == null ? [] : [var.http_target]

    content {
      path_parameter_values   = http_target.value["path_parameter_values"]
      query_string_parameters = http_target.value["query_string_parameters"]
      header_parameters       = http_target.value["header_parameters"]
    }
  }

  dynamic "input_transformer" {
    for_each = var.input_transformer == null ? [] : [var.input_transformer]

    content {
      input_template = input_transformer.value["input_template"]
      input_paths    = input_transformer.value["input_paths"]
    }
  }

  dynamic "retry_policy" {
    for_each = var.retry_policy == null ? [] : [var.retry_policy]

    content {
      maximum_event_age_in_seconds = retry_policy.value["maximum_event_age_in_seconds"]
      maximum_retry_attempts       = retry_policy.value["maximum_retry_attempts"]
    }
  }

  dynamic "dead_letter_config" {
    for_each = var.dead_letter_config == null ? [] : [var.dead_letter_config]

    content {
      arn = dead_letter_config.value["arn"]
    }
  }
}
