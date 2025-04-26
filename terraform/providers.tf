# providers.tf

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.31.0"
    }
  }
}

provider "aws" {
  region  = "us-east-2" # Ohio Region
  profile = "raj"       # Using your CLI profile 'raj'
}
