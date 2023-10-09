# S3 File Upload Notification

This AWS Lambda project provides a simple mechanism to send email notifications when a new file is uploaded to an Amazon S3 bucket. It leverages AWS Lambda to trigger custom logic in response to S3 events and uses Amazon SNS (Simple Notification Service) to deliver email notifications.

## Prerequisites

Before you get started, make sure you have the following prerequisites in place:

1. An AWS account: You will need an AWS account to create and deploy the Lambda function, S3 bucket, and SNS topic.

2. An S3 Bucket: Create an Amazon S3 bucket where you want to monitor for file uploads.

3. Amazon SNS Topic: Create an SNS topic and subscribe an email address to it to receive email notifications.

## Deployment

1. Clone this repository to your local machine.

2. Set up and configure the AWS CLI with your AWS credentials.

3. Update the Lambda function code:
   - Replace `'YOUR_SNS_TOPIC_ARN'` in the Lambda function code (`lambda_function.py`) with the ARN of your SNS topic.

4. Deploy the Lambda function to AWS Lambda using the AWS CLI or the AWS Management Console.

5. Configure the S3 bucket to trigger the Lambda function when new files are uploaded.

6. Test the setup by uploading a file to the S3 bucket. You should receive an email notification when the Lambda function is triggered.

## Usage

Whenever a new file is uploaded to the specified S3 bucket, the Lambda function will be triggered. It will publish a message to the specified SNS topic, and the email subscription associated with the SNS topic will receive an email notification.

## Customization

You can customize the email notification message or format by modifying the Lambda function code (`lambda_function.py`). You can also add additional logic to the Lambda function to perform other actions when new files are uploaded.

## Cleanup

To clean up the resources created by this project, follow these steps:

1. Delete the Lambda function.

2. Delete the S3 bucket (if it's no longer needed).

3. Delete the SNS topic (if it's no longer needed).

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
