
terraform {
 backend "s3" {
   bucket = "bucket-for-app-18"
   key    = "jmsth_jenkins.tfstate"
   region = "eu-west-1"
   encrypt = true
   dynamodb_table = "terraform-state-lock-dynamo"
   }
 }

