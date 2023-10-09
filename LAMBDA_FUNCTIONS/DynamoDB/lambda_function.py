import json
import urllib.parse
import boto3
import time

dynamodb = boto3.client('dynamodb')

def lambda_handler(event, context):
    for record in event['Records']:
        s3_bucket = record['s3']['bucket']['name']
        s3_object_key = urllib.parse.unquote_plus(record['s3']['object']['key'])
        upload_time = int(time.time())  # Get the current timestamp

        # Store the file upload in DynamoDB
        response = dynamodb.put_item(
            TableName='uploadedfiles',  # Replace with your DynamoDB table name
            Item={
                'FileName': {'S': s3_object_key},
                'UploadTime': {'N': str(upload_time)}
            }
        )

        print(f"File uploaded: s3://{s3_bucket}/{s3_object_key}")
        print(f"Upload time: {upload_time}")

    return {
        'statusCode': 200,
        'body': json.dumps('Lambda function executed successfully')
    }
