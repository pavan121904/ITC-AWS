import json
import boto3

def lambda_handler(event, context):
    try:
        # Check if the 'body' key exists in the event
        if 'body' in event:
            # If it exists, parse the JSON body
            github_event = json.loads(event['body'])
            # Continue processing the event...
        else:
            return {
                'statusCode': 400,
                'body': 'Bad request: Missing "body" in the event.'
            }
    except Exception as e:
        return {
            'statusCode': 500,
            'body': f'Error: {str(e)}'
        }
