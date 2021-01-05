variable "aws_access_key" {
  default = "mock_access_key"
}

variable "aws_secret_key" {
  default = "mock_secret_key"
}

variable "region" {
  default = "us-west-2"
}

variable "api_path" {
  default = "{proxy+}"
}

variable "api_env_stage_name" {
  default = "local"
}

variable "lambda_payload_filename" {
  default = "my-lambda/target/my-lambda-1.0-SNAPSHOT.jar"
}

variable "lambda_function_handler" {
  default = "handler.HelloLambdaHandler"
}

variable "lambda_runtime" {
  default = "java11"
}