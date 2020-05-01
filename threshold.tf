# ################################################################################
# ELB Threasholds
# ################################################################################
variable "elb5XXPercentage" {
  type    = number
  description = "Give alarm when greater than 10% error rate is there"
  default = "10"           # 0 =  
}

variable "elbAverageLatency" {
  type    = number
  description = "Latency of connection"
  default = "10"
}

variable "elbRequestCount" {
  type    = number
  description = "RequestCount ALB"
  default = "2000"
}

# ################################################################################
# # Request count is not important as we have autoscalling
# ################################################################################
# variable "elbRequestCount" {
#   type    = number
#   description = "Give alarm when request count is greater than 5000"
#   default = "5000"           # 0 =  
# }

#########################################
# Threashold for DB Alarms
#########################################
variable "CPUUtilization" {
  type    = number
  description = "CPU usage of greater than 75% is alarm condition"
  default = "75"
}

variable "FreeStorageSpace" {
  type    = number
  description = "Keeping Free Storage alarm Limit at 50GB (25% of DB Size)"
  default = "50000000000" #50GB
}

variable "FreeableMemory" {
  type    = number
  description = "Generate when we have less than 1GB RAM available"
  default = "1000000000" #1GB
}

variable "WriteIOPS" {
  type    = number
  description = "Our DB can support uptio 600 IOPS(Disk size: 200 * 3 IOPS) so keeping alarm limit at 500"
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
