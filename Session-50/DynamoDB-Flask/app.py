from flask import Flask, render_template, request
import boto3

app = Flask(__name__)

# Connect to DynamoDB
dynamodb = boto3.resource(
    'dynamodb',
    region_name='us-east-1'
)

# Connect to existing table
table = dynamodb.Table('Users')


@app.route('/')
def home():
    return render_template('index.html')


@app.route('/add-user', methods=['POST'])
def add_user():

    name = request.form['name']
    email = request.form['email']
    designation = request.form['designation']

    # Insert data into DynamoDB
    table.put_item(
        Item={
            'Email': email,
            'Name': name,
            'Designation': designation
        }
    )

    return "User added successfully!"


if __name__ == '__main__':
    app.run(debug=True)