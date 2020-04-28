variable "pagerduty_alerts_endpoint" {
  type    = string
  description = "Pagerduty HHTPS URL for pushing alarms"
  default = "https://events.pagerduty.com/integration/xxx/enqueue"
}

variable "env_name" {
  type    = string
  description = "Enviornment for whcih we are configuring alarms"
  default = "dev"
}

variable "project_name" {
  type    = string
  description = "Service name"
  default = "iam"
}

variable "db_instance_identifier" {
  type    = string
  description = "Database name for which we need to configure alarms"
  default = "my-test-database"
}

variable "beanstalk_Envt_Name" {
  type    = string
  description = "Database name for which we need to configure alarms"
  default = "Testbeanstom-env-2-test"
}

variable "CPUUtilization" {
  type    = number
  description = "CPU usage of greater than 75% is alarm condition"
  default = "75"
}

variable "FreeStorageSpace" {
  type    = number
  description = "Keeping Free Storage alarm Limit at 50GB (25% of DB Size)"
  default = "50000000000" #5GB
}

variable "FreeableMemory" {
  type    = number
  description = "Keeping alarm limit at 1GB"
  default = "1000000000" #1GB
}

variable "WriteIOPS" {
  type    = number
  description = "Our DB can support uptio 600 IOPS so keeping alarm limit at 500"
  default = "500"   #500 Alarmon greater than 500 IOPS
}

variable "WriteLatency" {
  type    = number
  description = "Latency for write should be sub second"
  default = "5"    #5 Seconds
}

variable "ReadIOPS" {
  type    = number
  description = "Read IOPS should be less than 100"
  default = "100"
}

variable "SwapUsage" {
  type    = number
  description = "SWAPusage shouldbe zero in case its above 1MB raise alarm"
  default = "1000000"           # 1 MB
}

variable "datapoints_to_alarm" {
  type    = number
  description = "3 evaluation fail out of 5 reporting alarm"
  default = "1"          
}

variable "evaluation_periods" {
  type    = number
  description = "Have 5 evaluation before reporting alarm"
  default = "1"           
}

variable "period" {
  type    = number
  description = "Each evaluation happens every 60 seconds"
  default = "60"           # Each 
}

variable "envHealth" {
  type    = number
  description = "Check Env Health > 2"
  default = "2"           # Each 
}
# WriteIOPS (Count/Second)
# WriteLatency  (Seconds)
# ReadIOPS  (Count/Second)
# FreeStorageSpace (Bytes)
# FreeableMemory (Bytes)
# CPUUtilization (Percent)
# SwapUsage (Bytes)