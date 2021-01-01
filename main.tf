provider "aws" {
  region = "us-west-2"
  access_key = "mock_access_key"
  secret_key = "mock_secret_key"
  skip_credentials_validation = true
  skip_requesting_account_id = true
  skip_metadata_api_check = true
  s3_force_path_style = true
  endpoints {
    apigateway     = "http://localhost:4567"
    cloudformation = "http://localhost:4581"
    cloudwatch     = "http://localhost:4582"
    cloudwatchlogs = "http://localhost:4566"
    dynamodb       = "http://localhost:4569"
    es             = "http://localhost:4578"
    firehose       = "http://localhost:4573"
    iam            = "http://localhost:4593"
    kinesis        = "http://localhost:4568"
    lambda         = "http://localhost:4574"
    route53        = "http://localhost:4580"
    redshift       = "http://localhost:4577"
    s3             = "http://localhost:4572"
    secretsmanager = "http://localhost:4584"
    ses            = "http://localhost:4579"
    sns            = "http://localhost:4575"
    sqs            = "http://localhost:4576"
    ssm            = "http://localhost:4583"
    stepfunctions  = "http://localhost:4585"
    sts            = "http://localhost:4592"
  }
}

module "modules" {
  source = "./terraform/"
}

//module "dynamodb" {
//  source = "git::ssh://<YOUR_REPO>//modules/dynamodb"
//  env    = "test"
//}
//module "lambda" {
//  source = "git::ssh://<YOUR_REPO>//modules/lambda"
//  env    = "test"
//}

