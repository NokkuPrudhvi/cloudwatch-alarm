module "sns_topic" {
  source  = "terraform-aws-modules/sns/aws"
  version = "~> 2.0"
  
  name  = format("tf-%s-%s-%s-sns", var.service, var.env_name, var.region_name)
  delivery_policy = <<EOF
  {
    "http": {
      "defaultHealthyRetryPolicy": {
        "minDelayTarget": 1,
        "maxDelayTarget": 20,
        "numRetries": 50,
        "numNoDelayRetries": 3,
        "numMinDelayRetries": 2,
        "numMaxDelayRetries": 3,
        "backoffFunction": "linear"
      },
      "disableSubscriptionOverrides": false,
      "defaultThrottlePolicy": {
        "maxReceivesPerSecond": 10
      }
    }
  }
  EOF
}

resource "aws_sns_topic_subscription" "pagerduty_target" {
  # Added to make sure this automation does not run without this URL
  count = var.pagerduty_alerts_endpoint != "" ? 1 : 0

  topic_arn = module.sns_topic.this_sns_topic_arn
  protocol  = "https"
  endpoint_auto_confirms = true
  endpoint  = var.pagerduty_alerts_endpoint
}
