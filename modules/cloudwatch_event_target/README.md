# Module: aws_cloudwatch_event_target

Provides an EventBridge Target resource.

> **NOTE:** <br>
EventBridge was formerly known as CloudWatch Events. The functionality is identical.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.10 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.17.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_event_target.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_arn"></a> [arn](#input\_arn) | The Amazon Resource Name (ARN) of the target | `string` | n/a | yes |
| <a name="input_batch_target"></a> [batch\_target](#input\_batch\_target) | Parameters used when you are using the rule to invoke an Amazon Batch Job. A maximum of 1 are allowed | <pre>object({<br>    job_definition = string<br>    job_name       = string<br>    array_size     = optional(number)<br>    job_attempts   = optional(number)<br>  })</pre> | `null` | no |
| <a name="input_dead_letter_config"></a> [dead\_letter\_config](#input\_dead\_letter\_config) | Parameters used when you are providing a dead letter config. A maximum of 1 are allowed | <pre>object({<br>    arn = optional(string)<br>  })</pre> | `null` | no |
| <a name="input_ecs_target"></a> [ecs\_target](#input\_ecs\_target) | Parameters used when you are using the rule to invoke Amazon ECS Task. A maximum of 1 are allowed | <pre>object({<br>    task_definition_arn = string<br>    group               = optional(string)<br>    launch_type         = optional(string)<br>    network_configuration = optional(object({<br>      subnets          = set(string)<br>      security_groups  = optional(set(string))<br>      assign_public_ip = optional(bool)<br>      }<br>    ))<br>    platform_version = optional(string)<br>    task_count       = optional(number)<br>    tags             = optional(map(string))<br>    propagate_tags   = optional(string)<br>    placement_constraint = optional(object({<br>      type       = string<br>      expression = optional(string)<br>    }))<br>    enable_execute_command  = optional(bool)<br>    enable_ecs_managed_tags = optional(bool)<br>  })</pre> | `null` | no |
| <a name="input_event_bus_name"></a> [event\_bus\_name](#input\_event\_bus\_name) | The event bus to associate with the rule. If you omit this, the `default` event bus is used | `string` | `null` | no |
| <a name="input_http_target"></a> [http\_target](#input\_http\_target) | Parameters used when you are using the rule to invoke an API Gateway REST endpoint. A maximum of 1 is allowed | <pre>object({<br>    path_parameter_values   = optional(list(string))<br>    query_string_parameters = optional(map(string))<br>    header_parameters       = optional(map(string))<br>  })</pre> | `null` | no |
| <a name="input_input"></a> [input](#input\_input) | Valid JSON text passed to the target. Conflicts with `input_path` and `input_transformer` | `string` | `null` | no |
| <a name="input_input_path"></a> [input\_path](#input\_input\_path) | The value of the JSONPath that is used for extracting part of the matched event when passing it to the target. Conflicts with `input` and `input_transformer` | `string` | `null` | no |
| <a name="input_input_transformer"></a> [input\_transformer](#input\_input\_transformer) | Parameters used when you are providing a custom input to a target based on certain event data. Conflicts with `input` and `input_path` | <pre>object({<br>    input_template = string<br>    input_paths    = optional(map(string))<br>  })</pre> | `null` | no |
| <a name="input_kinesis_target"></a> [kinesis\_target](#input\_kinesis\_target) | Parameters used when you are using the rule to invoke an Amazon Kinesis Stream. A maximum of 1 are allowed | <pre>object({<br>    partition_key_path = optional(string)<br>  })</pre> | `null` | no |
| <a name="input_redshift_target"></a> [redshift\_target](#input\_redshift\_target) | Parameters used when you are using the rule to invoke an Amazon Redshift Statement. A maximum of 1 are allowed | <pre>object({<br>    database            = string<br>    db_user             = optional(string)<br>    secrets_manager_arn = optional(string)<br>    sql                 = optional(string)<br>    statement_name      = optional(string)<br>    with_event          = optional(bool)<br>  })</pre> | `null` | no |
| <a name="input_retry_policy"></a> [retry\_policy](#input\_retry\_policy) | Parameters used when you are providing retry policies. A maximum of 1 are allowed | <pre>object({<br>    maximum_event_age_in_seconds = optional(number)<br>    maximum_retry_attempts       = optional(number)<br>  })</pre> | `null` | no |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | he Amazon Resource Name (ARN) of the IAM role to be used for this target when the rule is triggered. Required if `ecs_target` is used or target in `arn` is EC2 instance, Kinesis data stream, Step Functions state machine, or Event Bus in different account or region | `string` | `null` | no |
| <a name="input_rule"></a> [rule](#input\_rule) | The name of the rule you want to add targets to | `string` | n/a | yes |
| <a name="input_run_command_targets"></a> [run\_command\_targets](#input\_run\_command\_targets) | Parameters used when you are using the rule to invoke Amazon EC2 Run Command. Documented below. A maximum of 5 are allowed | <pre>list(object({<br>    key    = string<br>    values = optional(list(string))<br>  }))</pre> | `null` | no |
| <a name="input_sqs_target"></a> [sqs\_target](#input\_sqs\_target) | Parameters used when you are using the rule to invoke an Amazon SQS Queue. A maximum of 1 are allowed | <pre>object({<br>    message_group_id = optional(string)<br>  })</pre> | `null` | no |
| <a name="input_target_id"></a> [target\_id](#input\_target\_id) | The unique target assignment ID. If missing, will generate a random, unique id | `string` | `null` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->