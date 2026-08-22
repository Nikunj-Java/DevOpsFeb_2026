# Secure Log Monitoring - Terraform

This Terraform project automates the manual EC2 + IAM + CloudWatch Agent exercise described in the referenced guide.

Reference:
https://github.com/sonam-niit/Devops-Sept-2025/blob/main/Session-45-secure-log-monitor/logs_cloudwatch_ec2_iam.md

## What Terraform creates

1. Default VPC is reused.
2. Latest Amazon Linux 2023 x86_64 AMI is selected.
3. IAM role for EC2 is created.
4. `CloudWatchAgentServerPolicy` is attached to the role.
5. An EC2 instance profile is created and attached to the EC2 instance.
6. A security group allowing SSH only from your configured `ssh_cidr` is created.
7. CloudWatch Log Group `/demo/ec2/myapp` is created.
8. EC2 user-data:
   - installs `amazon-cloudwatch-agent`
   - creates `/var/log/myapp/app.log`
   - creates the CloudWatch Agent configuration
   - validates the JSON
   - starts the agent
   - writes initial test logs

The agent sends `/var/log/myapp/app.log` to `/demo/ec2/myapp`, with the EC2 instance ID as the log stream.

## Prerequisites

- AWS account
- AWS CLI configured
- Terraform installed
- An AWS IAM identity allowed to create EC2, IAM, CloudWatch Logs, VPC/security-group resources
- An SSH key is NOT required by this version because SSH is not needed for the automation itself. You can inspect the instance through AWS Systems Manager only if you separately configure SSM.

Check credentials:

    aws sts get-caller-identity

## Step 1 - Configure the project

Copy the example variables:

    cp terraform.tfvars.example terraform.tfvars

Find your public IP and put it in `terraform.tfvars`:

    ssh_cidr = "YOUR_PUBLIC_IP/32"

If you do not need SSH at all, the security group can be tightened further by removing the SSH ingress rule.

## Step 2 - Initialize Terraform

    terraform init

## Step 3 - Validate

    terraform fmt
    terraform validate

## Step 4 - Review the plan

    terraform plan

## Step 5 - Create everything

    terraform apply

Type:

    yes

Terraform will create the IAM role, policy attachment, instance profile, security group, CloudWatch Log Group and EC2 instance.

## Step 6 - Get the outputs

    terraform output

You should see:

- instance_id
- instance_public_ip
- instance_public_dns
- log_group_name
- iam_role_name

## Step 7 - Check CloudWatch

Open AWS Console:

CloudWatch -> Logs -> Log groups -> `/demo/ec2/myapp`

Open the log stream named with the EC2 instance ID.

You should see messages similar to:

    Terraform deployment successful: ...
    CloudWatch Agent configured successfully: ...

## Step 8 - Generate more logs

If you connect to the instance, run:

    echo "FINAL SUCCESS TEST $(date)" | sudo tee -a /var/log/myapp/app.log

Then refresh the CloudWatch log stream.

## Step 9 - Troubleshooting

Check agent status:

    sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a status

Check the configuration:

    sudo cat /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json

Validate JSON:

    sudo python3 -m json.tool /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json

Check the agent log:

    sudo tail -n 100 /opt/aws/amazon-cloudwatch-agent/logs/amazon-cloudwatch-agent.log

Check application log:

    sudo tail -n 100 /var/log/myapp/app.log

## Important IAM point

The EC2 instance does NOT use an AWS access key stored in the machine.

Instead:

EC2 -> Instance Profile -> IAM Role -> CloudWatchAgentServerPolicy -> CloudWatch Logs

This is safer and is the recommended pattern for AWS workloads.

## How the automation works

Terraform
  |
  +--> IAM Role
  |      |
  |      +--> CloudWatchAgentServerPolicy
  |
  +--> Instance Profile
  |
  +--> CloudWatch Log Group
  |
  +--> EC2
         |
         +--> user_data.sh
                |
                +--> Install CloudWatch Agent
                +--> Create /var/log/myapp/app.log
                +--> Configure agent
                +--> Start agent
                +--> Write test log
                       |
                       v
                  CloudWatch Logs
                  /demo/ec2/myapp
                       |
                       v
                  {instance_id}

## Cleanup

When finished:

    terraform destroy

Type:

    yes

This removes the Terraform-managed EC2 instance, IAM role/profile, security group and CloudWatch Log Group.

## Notes

- The configuration deliberately creates the CloudWatch Log Group in Terraform instead of relying on the agent to create it. This makes the infrastructure lifecycle predictable.
- The IAM role uses the AWS-managed `CloudWatchAgentServerPolicy`, matching the manual exercise.
- The EC2 instance uses Amazon Linux 2023 and `dnf`.
- Do not commit `terraform.tfvars` or Terraform state files to Git.
