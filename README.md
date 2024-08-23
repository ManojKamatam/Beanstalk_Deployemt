# Beanstalk_Deployemt

In terraform, only aws_elastic_beanstalk_application_version" "my_app_version resource is enough for deployement into manually existing beanstalk

This resource should have these, 
  name        = ""
  application = ""
  description = "My Elastic Beanstalk Application Version"
  bucket      = ""
  key         = ""
