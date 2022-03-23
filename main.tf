terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_s3_bucket" "tf_plan_demo" {
  bucket = "tf_plan_demo"

  tags = {
    Name        = "tf_plan_demo"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_acl" "demo" {
  bucket = aws_s3_bucket.tf_plan_demo.id
  acl    = "private"
}