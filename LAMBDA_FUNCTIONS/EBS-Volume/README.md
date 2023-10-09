# EBS Volume Type Conversion Lambda

## Overview

This AWS Lambda function is designed to automatically convert newly created 'gp2' EBS (Elastic Block Store) volumes to 'gp3' volumes. It does so by responding to AWS CloudWatch Events triggered when a new EBS volume is created with type 'gp2'.

## Prerequisites

Before you can deploy and use this Lambda function, make sure you have the following prerequisites in place:

1. **AWS Account:** You should have an active AWS account.

2. **IAM Role:** Ensure you have an IAM role with the necessary permissions to create and modify EBS volumes. The Lambda function will need this role to perform the necessary actions. You can create a role with the following permissions:
   - `ec2:CreateVolume`
   - `ec2:ModifyVolume`
   - `ec2:DescribeVolumes`
   - You can attach this role to the Lambda function during deployment.

3. **Python:** You should be familiar with Python, as the Lambda function is written in Python 3.

4. **AWS Lambda Console Access:** Access to the AWS Lambda Console or familiarity with AWS CLI for deployment.

## Deployment Steps

Follow these steps to deploy the Lambda function:

1. **Create the Lambda Function:**

   - Go to the AWS Lambda Console.
   - Click on "Create function."
   - Choose "Author from scratch."
   - Configure the basic settings:
     - **Function name:** Choose a name for your Lambda function.
     - **Runtime:** Python 3.7 or later.
     - **Execution role:** Choose an existing role with the necessary permissions or create a new one as mentioned in the prerequisites.
   - Click "Create function" to create the Lambda function.

2. **Upload the Lambda Function Code:**

   - In the Lambda function configuration, scroll down to the "Function code" section.
   - You can either:
     - Upload a `.zip` file containing the Lambda function code.
     - Or, edit the code inline. You can paste the code provided in your question directly into the inline code editor.

3. **Configure the Trigger:**

   - Add a trigger for the Lambda function.
   - Choose "CloudWatch Events" as the trigger source.
   - Configure the CloudWatch Event rule to trigger on the "CreateVolume" event.

4. **Save and Test:**

   - Save the Lambda function configuration.
   - Test the Lambda function by manually creating an EBS volume with type 'gp2' in your AWS account. You should see the Lambda function execute and change the volume type to 'gp3'.

5. **Monitoring and Logging:**

   - Configure CloudWatch Logs and CloudWatch Alarms to monitor the execution of the Lambda function and any potential errors.

6. **Deployment Complete:**

   - Your Lambda function is now set up to automatically convert 'gp2' EBS volumes to 'gp3' when they are created.

## Troubleshooting

If the Lambda function is not triggering as expected, make sure to:

- Check the CloudWatch Event rule configuration to ensure it is set up correctly.
- Verify that the IAM role associated with the Lambda function has the necessary permissions.
- Review the CloudWatch Logs for any error messages or issues with the Lambda function execution.

## Conclusion

This Lambda function simplifies the process of converting EBS volume types from 'gp2' to 'gp3' automatically. By following the deployment steps and prerequisites outlined in this README, you can ensure that your Lambda function operates as intended.
