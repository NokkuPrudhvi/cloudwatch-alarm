# Pager Duty HTTPS endpoint
variable "pagerduty_alerts_endpoint" {
  type    = string
  description = "Pagerduty HHTPS URL for pushing alarms"
  default = "xxx"
}

# Name of ELB to monitor
variable "lb_name" {
  type    = string
  description = "Load Balancer name for which we need to configure alarms"
  default = "awseb-e-y-AWSEBLoa-TZOVV38CX307"
}

# Name of DB to monitor
variable "db_instance_identifier" {
  type    = string
  description = "Database name for which we need to configure alarms"
  default = "d-use1-gb"
}

# Enviornment Name
variable "env_name" {
  type    = string
  description = "Enviornment for whcih we are configuring alarms"
  default = "dev"
}

# Region in which Infra is running
variable "region_name" {
  type    = string
  description = "RegionName"
  default = "virginia"
}

# Service name
variable "service" {
  type    = string
  description = "Service name"
  default = "gb"
}

# Number of failed data points after which alarm will be reported
variable "datapoints_to_alarm" {
  type    = number
  description = "3 evaluation fail out of 5 reporting alarm"
  default = "3"          
}

# Total Number data points to be collected
variable "evaluation_periods" {
  type    = number
  description = "Have 5 evaluation before reporting alarm"
  default = "5"           
}

# Time difference between each Reading
variable "period" {
  type    = number
  description = "Each evaluation happens every 60 seconds"
  default = "60"           # Each 
}

# variable "envHealth" {
#   type    = number
#   description = "Check Env Health > 2"
#   default = "2"           # 0 =  
# }

# # Name of DB to monitor
# variable "beanstalk_Envt_Name" {
#   type    = string
#   description = "Database name for which we need to configure alarms"
#   default = "Testbeanstom-env-2-test"
# }