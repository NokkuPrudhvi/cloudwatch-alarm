resource "aws_cloudwatch_metric_alarm" "elb5XXPercentage" {
    alarm_name                = format("tf-%s-%s-%s-ELB-5XXPercent", var.service, var.env_name ,var.region_name)
    alarm_description         = "Request error rate has exceeded 10%"

    comparison_operator       = "GreaterThanOrEqualToThreshold"
    threshold                 = var.elb5XXPercentage
   
    datapoints_to_alarm       = var.datapoints_to_alarm
    evaluation_periods        = var.evaluation_periods     
    insufficient_data_actions = []
    treat_missing_data        = "missing"

    actions_enabled           = "true"
    alarm_actions             = [module.sns_topic.this_sns_topic_arn]
    ok_actions                = [module.sns_topic.this_sns_topic_arn]


    metric_query {
        id          = "e1"
        expression  = "m2/m1*100"
        label       = "Error Rate"
        return_data = "true"
    }

    metric_query {
        id = "m1"

        metric {
            metric_name = "RequestCount"
            namespace   = "AWS/ELB"
            period      = var.period
            stat        = "Sum"
            unit        = "Count"

            dimensions = {
                LoadBalancerName = var.lb_name
            }
        }
    }

    metric_query {
        id = "m2"

        metric {
            metric_name = "HTTPCode_ELB_5XX"
            namespace   = "AWS/ELB"
            period      = var.period
            stat        = "Sum"
            unit        = "Count"

            dimensions = {
                LoadBalancerName = var.lb_name
            }
        }
    }
}

##############################################################################
# Average Latency of requests
##############################################################################
resource "aws_cloudwatch_metric_alarm" "elbLatency" {
    alarm_name                = format("tf-%s-%s-%s-ELB-Latency", var.service, var.env_name ,var.region_name)
    alarm_description         = "Request error rate has exceeded 10%"

    comparison_operator       = "GreaterThanOrEqualToThreshold"
    threshold                 = var.elbAverageLatency
   
    datapoints_to_alarm       = var.datapoints_to_alarm
    evaluation_periods        = var.evaluation_periods     
    insufficient_data_actions = []
    treat_missing_data        = "missing"

    actions_enabled           = "true"
    alarm_actions             = [module.sns_topic.this_sns_topic_arn]
    ok_actions                = [module.sns_topic.this_sns_topic_arn]

    metric_query {
        id = "m2"
        return_data = "true"

        metric {
            metric_name = "Latency"
            namespace   = "AWS/ELB"
            period      = var.period
            stat        = "Sum"
            unit        = "Seconds"

            dimensions = {
                LoadBalancerName = var.lb_name
            }
        }
    }
}


################################################################################
# Request count is not important as in future we willhave better scalling policy
################################################################################
resource "aws_cloudwatch_metric_alarm" "elbRequestCount" {
    alarm_name                = format("tf-%s-%s-%s-ELB-RequestCount", var.service, var.env_name ,var.region_name)
    alarm_description         = "RequestCount > 1"

    comparison_operator       = "GreaterThanOrEqualToThreshold"
    threshold                 = var.elbRequestCount
   
    datapoints_to_alarm       = var.datapoints_to_alarm
    evaluation_periods        = var.evaluation_periods     
    insufficient_data_actions = []
    treat_missing_data        = "missing"

    actions_enabled           = "true"
    alarm_actions             = [module.sns_topic.this_sns_topic_arn]
    ok_actions                = [module.sns_topic.this_sns_topic_arn]

    metric_query {
        id = "m2"
        return_data = "true"

        metric {
            metric_name = "RequestCount"
            namespace   = "AWS/ELB"
            period      = var.period
            stat        = "Sum"
            unit        = "Count"

            dimensions = {
                LoadBalancerName = var.lb_name
            }
        }
    }
}