# S3 File Upload Notification and DynamoDB Logging

This AWS Lambda project provides a mechanism to send email notifications when a new file is uploaded to an Amazon S3 bucket and also logs the file name and upload time to an Amazon DynamoDB table.

## Prerequisites

Before you get started, make sure you have the following prerequisites in place:

1. An AWS account: You will need an AWS account to create and deploy the Lambda function, S3 bucket, and DynamoDB table.

2. An S3 Bucket: Create an Amazon S3 bucket named "dynamo-db1219" where you want to monitor for file uploads.

3. Amazon DynamoDB Table: Create a DynamoDB table named "uploadedfiles" with at least two columns: `FileName` (String) and `UploadTime` (Number or String, storing a timestamp).

## Deployment

1. Clone this repository to your local machine.

2. Set up and configure the AWS CLI with your AWS credentials.

3. Update the Lambda function code:
   - Replace `'YourDynamoDBTableName'` in the Lambda function code (`lambda_function.py`) with the DynamoDB table name, which is "uploadedfiles" in this case.

4. Deploy the Lambda function to AWS Lambda using the AWS CLI or the AWS Management Console.

5. Configure the S3 bucket ("dynamo-db1219") to trigger the Lambda function when new files are uploaded.

## Usage

- Whenever a new file is uploaded to the "dynamo-db1219" S3 bucket, the Lambda function will be triggered. It will record the file name and the upload time in the "uploadedfiles" DynamoDB table.

- To access the logged file names and upload times from DynamoDB, you can use the AWS SDK for your programming language of choice, or you can use the AWS Management Console to query the table.

## Customization

You can customize the DynamoDB table schema or the Lambda function code to include additional information or perform other actions when new files are uploaded.

## Cleanup

To clean up the resources created by this project, follow these steps:

1. Delete the Lambda function.

2. Delete the S3 bucket ("dynamo-db1219") if it's no longer needed.

3. Delete the DynamoDB table ("uploadedfiles") if it's no longer needed.


