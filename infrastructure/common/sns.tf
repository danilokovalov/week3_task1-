resource "aws_sns_topic" "asg_notifications" {
  name = "asg-scaling-notifications"
}

resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.asg_notifications.arn
  protocol  = "email"
  endpoint  = var.mail_my
}