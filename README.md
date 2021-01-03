# terraform-example
https://github.com/DenysApter/terraform-example

Some ports from AWS Service with Localstack:
S3: 4572
DynamoDB: 4570
CloudFormation: 4581
Elasticsearch: 4571
ES: 4578
SNS: 4575
SQS: 4576
Lambda: 4574
Kinesis: 4568

docker-compose -f docker-compose.yml up -d localstack

aws dynamodb list-tables --endpoint-url=http://localhost:4566
aws lambda get-function --function-name mylambda --endpoint-url=http://localhost:4566


http://localhost:4566/restapis/<rest_api_id>/local/_user_request_/<method_path>
curl http://localhost:4566/restapis/iir7kpocoz/local/_user_request_/resource
curl http://localhost:4566/restapis/<rest_api_id>/<stage_name>/_user_request_/<path_part>


http://localhost:4566/restapis/v68nz25tz1/local/_user_request_/mydemoresource

terraform init       - download dependencies for aws and etc...
terraform plan       - check what will be changed after run of terraform scripts
terraform apply      - apply terraform scripts

