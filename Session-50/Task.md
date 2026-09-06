# Requirement

Using the DynamoDB table created in ```Session-50/DynamoDB-2:```

- Create a Python Flask application.
- Create an index.html page containing a form.
- The form should accept:
        1. Name
        2. Email
        3. Designation
- When the user submits the form:
    - Flask should receive the data.
    - Flask should use Boto3 to connect to DynamoDB.
    - Insert the data into the Users table.
- Display:
```
User added successfully!
```
after successful insertion.

Expected DynamoDB item

For example, if the user enters:
```
Name: Rahul Sharma
Email: rahul@gmail.com
Designation: DevOps Engineer
```
DynamoDB should contain:
```
Email            : rahul@gmail.com
Name             : Rahul Sharma
Designation      : DevOps Engineer
```

# Task:2
```
Generate Terraform Script to Create an AWS EC2 Instance-> Deploy Python App-> Deploy Index.html->Create DynamoDB as a fully working Model
```