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
  name                = "Sample-beanstalk-env-env"  
  application         = aws_elastic_beanstalk_application.my_app.name
  solution_stack_name = "Python 3.11 running on 64bit Amazon Linux 2023/4.1.3"  
  version_label       = aws_elastic_beanstalk_application_version.my_app_version.name
}
