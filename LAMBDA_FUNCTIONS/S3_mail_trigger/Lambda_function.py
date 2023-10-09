import json
import urllib.parse
import boto3

def lambda_handler(event, context):
    # Initialize the SNS client
    sns_client = boto3.client('sns')
    
    # Process the S3 event
    for record in event['Records']:
        # Get the S3 bucket name and object key
        s3_bucket = record['s3']['bucket']['name']
        s3_object_key = urllib.parse.unquote_plus(record['s3']['object']['key'])
        
        # Compose the message for the email notification
        message = f"New file uploaded to S3 bucket: {s3_bucket}\nObject key: {s3_object_key}"
        
        # Publish the message to the specified SNS topic
        sns_client.publish(
            TopicArn='arn:aws:sns:eu-north-1:866934333672:Default_CloudWatch_Alarms_Topic',
            Subject='New File Uploaded to S3',
            Message=message
        )

    return {
        'statusCode': 200,
        'body': json.dumps('Lambda function executed successfully')
    }
