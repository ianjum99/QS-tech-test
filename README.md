# QS-tech-test

## Prerequisites

In the Terraform configuration files provided above, you will need to replace placeholder values with actual values that correspond to your specific AWS environment and setup. Here are the values that you would need to replace:

### VPC ID:

In main.tf at the root level and in modules/security_group/variables.tf, replace "vpc-12345678" with your actual AWS VPC ID where you want to deploy the resources.

### AWS Region:

The AWS region is set to "us-east-1" in main.tf at the root level. If your infrastructure needs to be in a different region, update this to the desired AWS region.

### Bucket Name:

In main.tf at the root level under the module "s3_bucket" block, "my-flask-app-source" is a placeholder for the S3 bucket name. S3 bucket names need to be globally unique, so you’ll have to provide a unique name here.

### Elastic Beanstalk Solution Stack Name:

Ensure that the solution stack name ("64bit Amazon Linux 2 v3.3.6 running Python 3.8") in modules/eb_application/main.tf is the correct and latest one supported by Elastic Beanstalk for the Python environment.

### Instance Type:

In modules/eb_application/main.tf, "t2.micro" is set as the instance type. Depending on your application's requirements and AWS's current offerings, you may want to select a different instance type that is more suitable for production environments.

### Min and Max Size:

In modules/eb_application/main.tf, the min_size and max_size are set to 2 and 4, respectively. You should adjust these numbers based on the expected traffic and scaling needs of your application.


