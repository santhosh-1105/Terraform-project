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
  access_key = "AKIARUEMFSU6NBFOVDCK"
  secret_key = "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"
}

