import boto3
import json
import time

sqs = boto3.client("sqs", region_name="us-east-1")

QUEUE_URL = "https://sqs.us-east-1.amazonaws.com/748810634002/SQLDEMO"

print("Worker started...")

while True:

    response = sqs.receive_message(
        QueueUrl=QUEUE_URL,
        MaxNumberOfMessages=1,
        WaitTimeSeconds=10
    )

    messages = response.get("Messages", [])

    if not messages:
        print("No messages...")
        continue

    for message in messages:

        order = json.loads(message["Body"])

        print("Order received!")
        print("Order ID:", order["order_id"])
        print("Customer:", order["customer"])
        print("Product:", order["product"])
        print("Quantity:", order["quantity"])

        print("Processing order...")

        time.sleep(3)

        print("Order processed successfully!")

        sqs.delete_message(
            QueueUrl=QUEUE_URL,
            ReceiptHandle=message["ReceiptHandle"]
        )

        print("Message deleted from SQS")