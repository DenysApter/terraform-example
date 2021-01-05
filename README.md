https://github.com/DenysApter/terraform-example

docker-compose -f docker-compose.yml up -d localstack

aws lambda get-function --function-name mylambda --endpoint-url=http://localhost:4566 
aws dynamodb list-tables --endpoint-url=http://localhost:4566 
aws dynamodb put-item --table-name test_table --item '{"id": {"S": "12"}, "name": {"S": "Joe" }}' --return-consumed-capacity TOTAL --endpoint-url=http://localhost:4566 
aws dynamodb get-item --table-name test_table --key '{"id": {"S": "12"}}' --return-consumed-capacity TOTAL --endpoint-url=http://localhost:4566

http://localhost:4566/restapis//local/user_request/ 
curl http://localhost:4566/restapis/uhr8ubh4c5/local/user_request/resource 
curl http://localhost:4566/restapis///user_request/

http://localhost:4566/restapis/v68nz25tz1/local/user_request/mydemoresource

terraform init - download dependencies for aws and etc... 
terraform plan - check what will be changed after run of terraform scripts 
terraform apply - apply terraform scripts