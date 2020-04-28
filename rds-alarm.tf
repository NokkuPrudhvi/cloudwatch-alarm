resource "aws_cloudwatch_metric_alarm" "cpualarm" {
    alarm_name                = "tf-DB-CPUAlarm"
    alarm_description         = "This metric monitors RDS cpu utilization"

    comparison_operator       = "GreaterThanOrEqualToThreshold"
    threshold                 = var.CPUUtilization

    datapoints_to_alarm       = var.datapoints_to_alarm
    evaluation_periods        = var.evaluation_periods     
    insufficient_data_actions = []
    treat_missing_data        = "missing"

    actions_enabled           = "true"
    alarm_actions             = [module.sns_topic.this_sns_topic_arn]
    ok_actions                = [module.sns_topic.this_sns_topic_arn]

    metric_query {
        id = "e1"
        return_data = "true"
        metric {
            metric_name     = "CPUUtilization"
            namespace       = "AWS/RDS"
            period          = var.period
            stat            = "Average"
            unit            = "Percent"
            dimensions = {
                DBInstanceIdentifier = var.db_instance_identifier
            }
        }
    }
}

resource "aws_cloudwatch_metric_alarm" "diskalarm" {
    alarm_name                = "tf-DB-DiskAlarm"
    alarm_description         = "This metric monitors RDS Disk utilization"

    comparison_operator       = "GreaterThanOrEqualToThreshold"
    threshold                 = var.FreeStorageSpace

    datapoints_to_alarm       = var.datapoints_to_alarm
    evaluation_periods        = var.evaluation_periods    
    insufficient_data_actions = []
    treat_missing_data        = "missing"

    actions_enabled           = "true"
    alarm_actions             = [module.sns_topic.this_sns_topic_arn]
    ok_actions                = [module.sns_topic.this_sns_topic_arn]

    metric_query {
        id = "f1"
        return_data = "true"
        metric {
            metric_name     = "FreeStorageSpace"
            namespace       = "AWS/RDS"
            period          = var.period
            stat            = "Average"
            unit            = "Bytes"
            dimensions = {
                DBInstanceIdentifier = var.db_instance_identifier
            }
        }
    }
}


resource "aws_cloudwatch_metric_alarm" "FreeableMemory" {
    alarm_name                = "tf-DB-FreeableMemory"
    alarm_description         = "This metric monitors FreeableMemory utilization"

    comparison_operator       = "GreaterThanOrEqualToThreshold"
    threshold                 = var.FreeableMemory

    datapoints_to_alarm       = var.datapoints_to_alarm
    evaluation_periods        = var.evaluation_periods     
    insufficient_data_actions = []
    treat_missing_data        = "missing"

    actions_enabled           = "true"
    alarm_actions             = [module.sns_topic.this_sns_topic_arn]
    ok_actions                = [module.sns_topic.this_sns_topic_arn]

    metric_query {
        id = "f1"
        return_data = "true"
        metric {
            metric_name     = "FreeableMemory"
            namespace       = "AWS/RDS"
            period          = var.period
            stat            = "Average"
            unit            = "Bytes"
            dimensions = {
                DBInstanceIdentifier = var.db_instance_identifier
            }
        }
    }
}

resource "aws_cloudwatch_metric_alarm" "WriteIOPS" {
    alarm_name                = "tf-DB-WriteIOPS"
    alarm_description         = "This metric monitors WriteIOPS utilization"

    comparison_operator       = "GreaterThanOrEqualToThreshold"
    threshold                 = var.WriteIOPS

    datapoints_to_alarm       = var.datapoints_to_alarm
    evaluation_periods        = var.evaluation_periods     
    insufficient_data_actions = []
    treat_missing_data        = "missing"

    actions_enabled           = "true"
    alarm_actions             = [module.sns_topic.this_sns_topic_arn]
    ok_actions                = [module.sns_topic.this_sns_topic_arn]

    metric_query {
        id = "f1"
        return_data = "true"
        metric {
            metric_name     = "WriteIOPS"
            namespace       = "AWS/RDS"
            period          = var.period
            stat            = "Average"
            unit            = "Count/Second"
            dimensions = {
                DBInstanceIdentifier = var.db_instance_identifier
            }
        }
    }
}


resource "aws_cloudwatch_metric_alarm" "WriteLatency" {
    alarm_name                = "tf-DB-WriteLatency"
    alarm_description         = "This metric monitors WriteLatency utilization"

    comparison_operator       = "GreaterThanOrEqualToThreshold"
    threshold                 = var.WriteLatency

    datapoints_to_alarm       = var.datapoints_to_alarm
    evaluation_periods        = var.evaluation_periods      
    insufficient_data_actions = []
    treat_missing_data        = "missing"

    actions_enabled           = "true"
    alarm_actions             = [module.sns_topic.this_sns_topic_arn]
    ok_actions                = [module.sns_topic.this_sns_topic_arn]

    metric_query {
        id = "f1"
        return_data = "true"
        metric {
            metric_name     = "WriteLatency"
            namespace       = "AWS/RDS"
            period          = var.period
            stat            = "Average"
            unit            = "Seconds"
            dimensions = {
                DBInstanceIdentifier = var.db_instance_identifier
            }
        }
    }
}

resource "aws_cloudwatch_metric_alarm" "SwapUsage" {
    alarm_name                = "tf-DB-SwapUsage"
    alarm_description         = "This metric monitors SwapUsage utilization"

    comparison_operator       = "GreaterThanOrEqualToThreshold"
    threshold                 = var.SwapUsage

    datapoints_to_alarm       = var.datapoints_to_alarm
    evaluation_periods        = var.evaluation_periods   
    insufficient_data_actions = []
    treat_missing_data        = "missing"

    actions_enabled           = "true"
    alarm_actions             = [module.sns_topic.this_sns_topic_arn]
    ok_actions                = [module.sns_topic.this_sns_topic_arn]

    metric_query {
        id = "f1"
        return_data = "true"
        metric {
            metric_name     = "SwapUsage"
            namespace       = "AWS/RDS"
            period          = var.period
            stat            = "Average"
            unit            = "Bytes"
            dimensions = {
                DBInstanceIdentifier = var.db_instance_identifier
            }
        }
    }
}