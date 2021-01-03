package handler;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.LambdaLogger;
import com.amazonaws.services.lambda.runtime.RequestHandler;

public class HelloLambdaHandler implements RequestHandler<String, String> {

    @Override
    public String handleRequest(String inputParam, Context context) {
        LambdaLogger logger = context.getLogger();
        logger.log(inputParam);
        return "Hello from lambda !!!";
    }
}
