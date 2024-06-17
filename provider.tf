terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}


# Configure the S3 backend
terraform {
  backend "s3" {
    bucket         = "terraform-bucket-bcs-demo" # Replace with your S3 bucket name
    key            = "terraform/state"           # Path to the state file inside the bucket
    region         = "us-east-1"                 # AWS region where the bucket is located
    encrypt        = true                        # Encrypt the state file
    dynamodb_table = "terraform-locks"           # Optional: DynamoDB table for state locking
  }
}
