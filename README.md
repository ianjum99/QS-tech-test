# QS-tech-test

## Prerequisites

### AWS/Terraform on local

Make sure that you have both an up to date version of the AWS CLI and Terraform CLI downloaded on your local machine

In the Terraform configuration files provided above, you will need to replace placeholder values with actual values that correspond to your specific AWS environment and setup. Here are the values that you would need to replace:

### VPC ID:

In main.tf at the root level and in `modules/security_group/variables.tf`, replace `"vpc-12345678"` with your actual AWS VPC ID where you want to deploy the resources.

### AWS Region:

The AWS region is set to `"us-east-1"` in `main.tf` at the root level. If your infrastructure needs to be in a different region, update this to the desired AWS region.

### Bucket Name:

In `main.tf` at the root level under the module `"s3_bucket"` block, `"my-flask-app-source"` is a placeholder for the S3 bucket name. S3 bucket names need to be globally unique, so you’ll have to provide a unique name here.

### Elastic Beanstalk Solution Stack Name:

Ensure that the solution stack name `("64bit Amazon Linux 2 v3.3.6 running Python 3.8")` in `modules/eb_application/main.tf` is the correct and latest one supported by Elastic Beanstalk for the Python environment.

### Instance Type:

In `modules/eb_application/main.tf`, `"t2.micro"` is set as the instance type. Depending on your application's requirements you may want to select a different instance type that is more suitable.

### Min and Max Size:

In `modules/eb_application/main.tf`, the min_size and max_size are set to `2` and `4`, respectively. You should adjust these numbers based on the expected traffic and scaling needs of your application.

### AWS Account: 

You need an active AWS account. If you don't have one, you'll need to sign up for AWS.

### S3 Bucket: 

The Terraform script includes creating an S3 bucket. You need to ensure that the name you choose for your S3 bucket is globally unique. If the name is already taken, the script will fail.

### Elastic Beanstalk Application and Environment: 

The script is designed to deploy an application to AWS Elastic Beanstalk. You'll need to have the correct permissions to create and manage Elastic Beanstalk environments.

### IAM Permissions: 

The AWS user or role running the Terraform scripts needs to have sufficient permissions to create the resources defined in the Terraform script. This typically includes permissions for EC2, Elastic Beanstalk, S3, IAM, and VPC.

### Python Environment: 

The Elastic Beanstalk configuration should match the requirements of your Python Flask application, including the correct platform version and any dependencies.

### VPC Configuration: 

The script assumes the existence of a VPC. Make sure you have a VPC ID to input into your Terraform module if you're not using the default VPC.

### SSH Key Pair:

If you need SSH access to the instances created by Elastic Beanstalk, you'll need an SSH key pair created in the AWS region where you’re deploying the infrastructure.

### Application Source Bundle:
Prepare a source bundle of the application code, which is a ZIP file containing all the files needed to run your application. The Terraform script expects this to be available to upload to the S3 bucket or to already be in S3 (A sample one is provided in the GitHub Repo)

# Executing the Terraform Script

In order to execute the terraform script- after ensuring all prerequisites have been met:

1. Make sure you have downloaded the source code to your local and <span style="color:red;">make sure you have followed the prerequisites</span>
2. Check to make sure that the `.zip` file exists in the repo, if it does not, then run:
    ```
    zip -r my-flask-app.zip my-flask-app-directory/
    
    ```
3. 




