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
git add --all && git commit -m 'commit message' && git push

terraform init
terraform refresh
terraform plan
terraform apply

aws dynamodb list-tables --endpoint-url=http://localhost:4569

terraform init       - download dependencies for aws and etc...
terraform plan       - check what will be changed after run of terraform scripts
terraform apply      - apply terraform scripts

