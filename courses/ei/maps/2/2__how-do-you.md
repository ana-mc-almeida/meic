# How do you? Specify the most relevant steps to perform the following task:

## What are the requirements that need to be met to expose an AWS Lambda function to the internet?

1. **Create or Use an Existing Lambda Function**

   - Go to the AWS Lambda Console.
   - Create a new function or choose an existing one. Ensure it's properly implemented and tested.

2. **Create an API Gateway**

   - Open the Amazon API Gateway Console.
   - Choose **HTTP API** (simpler) or **REST API** (more customizable) depending on your use case.
   - Create a new API and define a route (e.g., `GET /my-function`).

3. **Integrate Lambda with API Gateway**

   - In the route integration settings, choose **Lambda Function** as the integration type.
   - Select the region and your Lambda function from the dropdown.

4. **Grant API Gateway Permission to Invoke Lambda**

   - API Gateway must have permission to invoke the Lambda function.
   - This is usually set up automatically when you integrate via the console, but can also be added manually using:

     ```bash
     aws lambda add-permission \
       --function-name my-function \
       --statement-id apigateway-access \
       --action lambda:InvokeFunction \
       --principal apigateway.amazonaws.com \
       --source-arn arn:aws:execute-api:<region>:<account-id>:<api-id>/*/*/*
     ```

5. **Deploy the API**

   - For HTTP APIs: Click "Deploy".
   - For REST APIs: Create a stage (e.g., `prod`) and deploy the API to it.

6. **Get the Public Endpoint URL**

   - Once deployed, you’ll receive a public URL (e.g., `https://<api-id>.execute-api.<region>.amazonaws.com/prod/my-function`)
   - This URL can now be accessed over the internet to trigger your Lambda.

7. **(Optional) Configure CORS**

   - If the Lambda is accessed from browsers, ensure **CORS settings** are enabled on the API Gateway route.

8. **(Optional) Secure Access**
   - Use **API keys**, **IAM authorization**, **JWT authorizers**, or **OAuth2** if you want to restrict or authenticate access.
