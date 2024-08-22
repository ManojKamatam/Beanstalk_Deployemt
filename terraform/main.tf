provider "aws" {
  region = "us-east-1"
}

variable "s3_bucket" {
  type = string
  description = "The S3 bucket to store the application version"
}

variable "s3_key" {
  type = string
  description = "The S3 key for the application version"
}

variable "environment_name" {
  type = string
  description = "The name of the existing Elastic Beanstalk environment"
}

resource "aws_elastic_beanstalk_application" "my_app" {
  name        = "Sample-beanstalk-env"
  description = "My Elastic Beanstalk Application"
}

resource "aws_elastic_beanstalk_application_version" "my_app_version" {
  application = aws_elastic_beanstalk_application.my_app.name
  name        = "my-app-version"
  description = "My Elastic Beanstalk Application Version"
  bucket      = var.s3_bucket
  key         = var.s3_key
}

resource "aws_elastic_beanstalk_environment" "my_env" {
  name                = var.environment_name
  application         = aws_elastic_beanstalk_application.my_app.name
  version_label       = aws_elastic_beanstalk_application_version.my_app_version.name
}
