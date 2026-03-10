terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure AWS Provider
provider "aws" {
  region = var.aws_region
}

# Create DynamoDB Table
resource "aws_dynamodb_table" "book_inventory" {
  name         = var.table_name
  billing_mode = "PAY_PER_REQUEST"  # On-demand capacity
  hash_key     = "ISBN"
  range_key    = "Genre"

  attribute {
    name = "ISBN"
    type = "S"  # String
  }

  attribute {
    name = "Genre"
    type = "S"  # String
  }

  tags = {
    Name        = var.table_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}