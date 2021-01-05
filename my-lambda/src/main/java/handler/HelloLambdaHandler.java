package handler;

import com.amazonaws.SDKGlobalConfiguration;
import com.amazonaws.auth.AWSCredentialsProviderChain;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.client.builder.AwsClientBuilder;
import com.amazonaws.services.dynamodbv2.AmazonDynamoDB;
import com.amazonaws.services.dynamodbv2.AmazonDynamoDBClient;
import com.amazonaws.services.dynamodbv2.AmazonDynamoDBClientBuilder;
import com.amazonaws.services.dynamodbv2.document.DynamoDB;
import com.amazonaws.services.dynamodbv2.document.Item;
import com.amazonaws.services.dynamodbv2.document.Table;
import com.amazonaws.services.dynamodbv2.document.spec.GetItemSpec;
import com.amazonaws.services.dynamodbv2.model.AttributeValue;
import com.amazonaws.services.dynamodbv2.model.ScanRequest;
import com.amazonaws.services.dynamodbv2.model.ScanResult;
import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.LambdaLogger;
import com.amazonaws.services.lambda.runtime.RequestHandler;

import java.util.Map;

public class HelloLambdaHandler implements RequestHandler<Map<String, Object>, String> {

    @Override
    public String handleRequest(Map<String, Object> inputParam, Context context) {
        System.setProperty(SDKGlobalConfiguration.DISABLE_CERT_CHECKING_SYSTEM_PROPERTY, "true");

        LambdaLogger logger = context.getLogger();
        logger.log(inputParam.toString());

        AmazonDynamoDB client = AmazonDynamoDBClient.builder()
                .withEndpointConfiguration(new AwsClientBuilder.EndpointConfiguration("http://localhost:4566", "us-west-2"))
                .withCredentials(new AWSStaticCredentialsProvider(new BasicAWSCredentials("key", "secret")))
                .build();

        ScanRequest scanRequest = new ScanRequest()
                .withTableName("test_table");

        ScanResult result = client.scan(scanRequest);
        for (Map<String, AttributeValue> item : result.getItems()) {
            System.out.println(item);
        }
        return result.getItems().toString();

//        DynamoDB dynamoDB = new DynamoDB(client);
//        Table table = dynamoDB.getTable("test_table");
//
//        GetItemSpec spec = new GetItemSpec().withPrimaryKey("id", "12");
//        Item outcome = null;
//        try {
//            System.out.println("Attempting to read the item...");
//            outcome = table.getItem(spec);
//            System.out.println("GetItem succeeded: " + outcome);
//        } catch (Exception e) {
//            System.err.println("Unable to read item");
//            System.err.println(e.getMessage());
//        }
//
//        return outcome == null ? "No item" : outcome.toJSON();
    }
}