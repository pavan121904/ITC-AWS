import json
import urllib.parse

def lambda_handler(event, context):
    # Process the S3 event
    for record in event['Records']:
        # Get the S3 bucket name and object key
        s3_bucket = record['s3']['bucket']['name']
        s3_object_key = urllib.parse.unquote_plus(record['s3']['object']['key'])

        # Perform your custom processing here
        print(f"File uploaded: s3://{s3_bucket}/{s3_object_key}")

        # Add your business logic here
        # For example, you can process the file, move it, or perform any other action.

    return {
        'statusCode': 200,
        'body': json.dumps('Lambda function executed successfully')
    }
