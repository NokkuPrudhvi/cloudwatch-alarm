# data "aws_elastic_beanstalk_application" "example" {
#   name = "GalaxyBadge_Prod"
# }

# EnvironmentHealth
#     0 – OK
#     1 – Info
#     5 – Unknown
#     10 – No data
#     15 – Warning
#     20 – Degraded
#     25 – Severe

# ApplicationRequestsTotal
# ApplicationRequests5xx
# ApplicationRequests4xx
# ApplicationRequests3xx
# ApplicationRequests2xx


# resource "aws_cloudwatch_metric_alarm" "EBalarm" {
#     alarm_name                = "tf-EB-Alarm"
#     alarm_description         = "This metric monitors EB utilization"

#     comparison_operator       = "GreaterThanOrEqualToThreshold"
#     threshold                 = var.envHealth

#     datapoints_to_alarm       = var.datapoints_to_alarm
#     evaluation_periods        = var.evaluation_periods     
#     insufficient_data_actions = []
#     treat_missing_data        = "missing"

#     actions_enabled           = "true"
#     alarm_actions             = [module.sns_topic.this_sns_topic_arn]
#     ok_actions                = [module.sns_topic.this_sns_topic_arn]

#     metric_query {
#         id = "e1"
#         return_data = "true"
#         metric {
#             metric_name     = "EnvironmentHealth"
#             namespace       = "AWS/ElasticBeanstalk"
#             period          = var.period
#             stat            = "Average"
#             unit            = "Count"
#             dimensions = {
#                 EnvironmentName = var.beanstalk_Envt_Name
#             }
#         }
#     }
# }