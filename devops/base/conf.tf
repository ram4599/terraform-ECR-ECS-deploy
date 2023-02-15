provider "aws" {
  version = "~> 3.0"
  region  = "eu-west-1"
}

terraform {
  backend "s3" {
    bucket = "bucket-for-app-18"
    key    = "jmsth_base.tfstate"
    region = "eu-west-1"
  }
}
resource "aws_ecr_repository" "myrepo" {
  name                 = "testrepo"

  image_scanning_configuration {
    scan_on_push = true
  }
}
# create a dynamodb table for locking the state file
resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = "terraform-state-lock-dynamo"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
 
  tags = {
    Name = "DynamoDB Terraform State Lock Table"
  }
}

