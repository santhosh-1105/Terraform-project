terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.27"
    }
  }
}



provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIARUEMFSU6NZ3T57KL"
  secret_key = "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"
}

