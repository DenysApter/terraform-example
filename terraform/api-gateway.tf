resource "aws_api_gateway_rest_api" "api" {
  name = "myapi"
  description = "Java Lambda on Terrraform"
}

resource "aws_api_gateway_resource" "resource" {
  depends_on  = ["aws_api_gateway_rest_api.api"]
  path_part   = "resource"
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  rest_api_id = aws_api_gateway_rest_api.api.id
}

resource "aws_api_gateway_method" "method" {
  rest_api_id   = aws_api_gateway_rest_api.api.id
  resource_id   = aws_api_gateway_resource.resource.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "integration" {
  rest_api_id             = aws_api_gateway_rest_api.api.id
  resource_id             = aws_api_gateway_resource.resource.id
  http_method             = aws_api_gateway_method.method.http_method
  integration_http_method = "GET"
  type                    = "AWS_PROXY"
  uri                     = "${aws_lambda_function.lambda.invoke_arn}"
}

resource "aws_api_gateway_deployment" "java_lambda_deploy" {
  depends_on  = ["aws_api_gateway_integration.integration"]
  rest_api_id = aws_api_gateway_rest_api.api.id
  stage_name  = var.api_env_stage_name
}