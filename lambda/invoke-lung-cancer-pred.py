import os
import io
import boto3
import json
import csv

# grab environment variables
ENDPOINT_NAME = os.environ['ENDPOINT_NAME']
runtime= boto3.client('runtime.sagemaker')

def lambda_handler(event, context):
    if 'queryStringParameters' in event:
        print("Received query string")
        payload=event['queryStringParameters']['data']
    else:
        print("Received posted data")
        data = json.loads(json.dumps(event))
        payload = data['data']
    print(payload)
    response = runtime.invoke_endpoint(EndpointName=ENDPOINT_NAME,
                                       ContentType='text/csv',
                                       Body=payload)
    print(response)
    result = json.loads(response['Body'].read().decode())
    print(result)
    pred = "High"
    val=result[0]
    if result[1]>val:
        pred="Low"
        val=result[1]
    if result[2]>val:
        pred="Medium"
        val=result[2]
    return {
        "statusCode": 200,
        "headers": {
            "Content-Type": "application/json"
        },
        "body": json.dumps({
            "outcome": pred
        })
    }
