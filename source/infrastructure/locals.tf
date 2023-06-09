locals {
  aws_account_id  = data.aws_caller_identity.current.account_id
  aws_region      = data.aws_region.current.name
  environment     = terraform.workspace == "default" ? "dev" : terraform.workspace
  build_directory = abspath("${path.root}/../")

  app_prefix = "Telegram-Bot-${local.environment}"

  inbound_queue_name            = "${local.app_prefix}-InboundQueue.fifo"
  inbound_queue_deadletter_name = "${local.app_prefix}-InboundQueue-DeadLetter.fifo"
  inbound_api_name              = "${local.app_prefix}-InboundApi"
  inbound_api_resource_path     = "phase1"
  inbound_api_execution_role    = "${local.app_prefix}-InboundApiGatewayRole"
  inbound_api_stage_name        = local.environment

  authorizer_lambda_execution_role_name = "${local.app_prefix}-AuthorizerLambdaExecutionRole"
  authorizer_lambda_function_name       = "${local.app_prefix}-Authorizer"

  inbound_lambda_execution_role_name = "${local.app_prefix}-InboundLambdaExecutionRole"
  inbound_lambda_function_name       = "${local.app_prefix}-Inbound"

  outbound_queue_name                 = "${local.app_prefix}-OutboundQueue.fifo"
  outbound_queue_deadletter_name      = "${local.app_prefix}-OutboundQueue-DeadLetter.fifo"
  outbound_lambda_function_name       = "${local.app_prefix}-Outbound"
  outbound_lambda_execution_role_name = "${local.app_prefix}-OutboundLambdaExecutionRole"

  download_queue_name                 = "${local.app_prefix}-DownloadQueue.fifo"
  download_queue_deadletter_name      = "${local.app_prefix}-DownloadQueue-DeadLetter.fifo"
  download_lambda_function_name       = "${local.app_prefix}-Download"
  download_lambda_execution_role_name = "${local.app_prefix}-DownloadLambdaExecutionRole"
}