resource "aws_lambda_function" "this" {
  function_name                  = var.function_name
  role                           = var.role
  architectures                  = var.architectures
  code_signing_config_arn        = var.code_signing_config_arn
  description                    = var.description
  filename                       = var.filename
  handler                        = var.handler
  image_uri                      = var.image_uri
  kms_key_arn                    = var.kms_key_arn
  layers                         = var.layers
  memory_size                    = var.memory_size
  package_type                   = var.package_type
  publish                        = var.publish
  reserved_concurrent_executions = var.reserved_concurrent_executions
  runtime                        = var.runtime
  s3_bucket                      = var.s3_bucket
  s3_key                         = var.s3_key
  s3_object_version              = var.s3_object_version
  source_code_hash               = var.source_code_hash
  tags                           = var.tags
  timeout                        = var.timeout

  dynamic "dead_letter_config" {
    for_each = var.dead_letter_config == null ? [] : [var.dead_letter_config]

    content {
      target_arn = dead_letter_config.value["target_arn"]
    }
  }

  dynamic "environment" {
    for_each = var.environment == null ? [] : [var.environment]

    content {
      variables = environment.value["variables"]
    }
  }

  dynamic "ephemeral_storage" {
    for_each = var.ephemeral_storage == null ? [] : [var.ephemeral_storage]

    content {
      size = ephemeral_storage.value["size"]
    }
  }

  dynamic "file_system_config" {
    for_each = var.file_system_config == null ? [] : [var.file_system_config]

    content {
      arn              = file_system_config.value["arn"]
      local_mount_path = file_system_config.value["local_mount_path"]
    }
  }

  dynamic "image_config" {
    for_each = var.image_config == null ? [] : [var.image_config]

    content {
      command           = try(image_config.value["command"], null)
      entry_point       = try(image_config.value["entry_point"], null)
      working_directory = try(image_config.value["working_directory"], null)
    }
  }

  dynamic "tracing_config" {
    for_each = var.tracing_config == null ? [] : [var.tracing_config]

    content {
      mode = tracing_config.value["mode"]
    }
  }

  dynamic "vpc_config" {
    for_each = var.vpc_config == null ? [] : [var.vpc_config]

    content {
      security_group_ids = vpc_config.value["security_group_ids"]
      subnet_ids         = vpc_config.value["subnet_ids"]
    }
  }
}
