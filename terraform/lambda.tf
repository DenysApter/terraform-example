resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn = "${aws_api_gateway_deployment.java_lambda_deploy.execution_arn}/*/*"
}

resource "aws_lambda_function" "lambda" {
  filename      = "../my-lambda/target/my-lambda-1.0-SNAPSHOT.jar"
  function_name = "mylambda"
  role          = aws_iam_role.role.arn
  handler       = "handler.HelloLambdaHandler"
  runtime       = var.lambda_runtime
  source_code_hash = filebase64sha256("../my-lambda/target/my-lambda-1.0-SNAPSHOT.jar")
}