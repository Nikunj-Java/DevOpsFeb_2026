import boto3
import json

sqs = boto3.client("sqs", region_name="us-east-1")

QUEUE_URL = "https://sqs.us-east-1.amazonaws.com/748810634002/SQLDEMO"

order = {
    "order_id": 101,
    "customer": "Nikunj",
    "product": "Pizza",
    "quantity": 2
}

response = sqs.send_message(
    QueueUrl=QUEUE_URL,
    MessageBody=json.dumps(order)
)

print("Order sent successfully!")
print(response["MessageId"])