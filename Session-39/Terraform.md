# Folder structure of Terraform

__main.tf__:
- starting point of terraform configuration
-  we can define resources and module calls

__variable.tf__:
-  create varibale declaration
-  each variable can have type, name, default, description

__output.tf__:
-  contains Output definations
-  (public ip,resourceId, DNS, PrivateIP)

__providers.tf__:
-  configuration of cloud provider

__backend.tf__:
-  store confuguration of state
-  if you want to use remote backends for that we can configure this file
-  for use of s3 bucket(AWS Storage for files, video, audio) or Azure blobs etc...

__terraform.tfvars__:
- contains deafult values for local testing
- add values for variable declared inside variable.tf file