import boto3

def lambda_handler(event, context):
    # Check if the event is triggered by EBS volume creation
    if event['detail']['eventName'] == 'CreateVolume':
        ec2_client = boto3.client('ec2')
        volume_id = event['detail']['responseElements']['volumeId']
        
        # Describe the volume to get its attributes
        volume_info = ec2_client.describe_volumes(VolumeIds=[volume_id])['Volumes'][0]
        
        # Check if the volume type is gp2
        if volume_info['VolumeType'] == 'gp2':
            # Modify the volume type to gp3
            ec2_client.modify_volume(VolumeId=volume_id, VolumeType='gp3')
            return {
                'statusCode': 200,
                'body': f'EBS volume {volume_id} type changed to gp3.'
            }
    
    # If the event is not related to EBS volume creation or it's already gp3, return success
    return {
        'statusCode': 200,
        'body': 'No action taken.'
    }
