# terraform block
 terraform {
   required_version = "~> v1.6.6"
   required_providers {
     aws = {
      source = "hashicorp/aws"
      version = "~> 5.32.1"
     }
     
   }
 }

 #prpovider block
 provider "aws" {
    region = var.aws_region
   
 }