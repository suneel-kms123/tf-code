terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 3.0"      
    }
  }
}

provider "aws" {
    region = "ap-south-1"
}

resource "aws_s3_bucket_versioning" "versioning_conf" {
    bucket = aws_s3_bucket.terraform_tfstate.id
    versioning_configuration{
        status = "Enabled"
    }  
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
    bucket = aws_s3_bucket.terraform_tfstate.id
    rule {
        apply_server_side_encryption_by_default {
          sse_algorithm = "AES256"
        }
    }  
}

resource "aws_s3_bucket" "terraform_tfstate" {
    bucket = "devops-terraform-tfstate-aws"
    force_destroy = true
}

resource "aws_dynamodb_table" "terraform_state_locks" {
    name = "terraform_state_locks"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"
    attribute {
      name = "LockID"
      type = "S"
    }
}