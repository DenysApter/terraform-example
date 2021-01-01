# defining our lambda and referencing to our java handler function
resource "aws_lambda_function" "java_lambda_function" {
  runtime = "${var.lambda_runtime}"
  filename = "${var.lambda_payload_filename}"
  source_code_hash = filebase64sha256(var.lambda_payload_filename)
  function_name = "java_lambda_function"
  # lambda handler function name, it will be full class path name with package name
  handler = "handler.main"
  timeout = 60
  memory_size = 256
  role = "${aws_iam_role.iam_role_for_lambda.arn}"
//  depends_on = ["aws_cloudwatch_log_group.log_group"]
}

# defining permission for our lambda, we have allowed API gateway to
# to invoke our lambda handler function
resource "aws_lambda_permission" "java_lambda_function" {
  statement_id = "AllowAPIGatewayInvoke"
  action = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.java_lambda_function.function_name}"
  principal = "apigateway.amazonaws.com"
  # The /*/* portion grants access from any method on any resource
  # within the API Gateway "REST API".
  source_arn = "${aws_api_gateway_deployment.java_lambda_deploy.execution_arn}/*/*"
}