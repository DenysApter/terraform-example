https://github.com/DenysApter/terraform-example

docker-compose -f docker-compose.yml up -d localstack

aws lambda get-function --function-name mylambda --endpoint-url=http://localhost:4566 
aws dynamodb list-tables --endpoint-url=http://localhost:4566 
aws dynamodb put-item --table-name test_table --item '{"id": {"S": "12"}, "name": {"S": "Joe" }}' --return-consumed-capacity TOTAL --endpoint-url=http://localhost:4566 
aws dynamodb get-item --table-name test_table --key '{"id": {"S": "12"}}' --return-consumed-capacity TOTAL --endpoint-url=http://localhost:4566

curl http://localhost:4566/restapis/2n20t995ai/local/_user_request_/resource



terraform init - download dependencies for aws and etc... 
terraform plan - check what will be changed after run of terraform scripts 
terraform apply - apply terraform scripts