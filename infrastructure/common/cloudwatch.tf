resource "aws_cloudwatch_metric_alarm" "asg_scale_out" {
  alarm_name          = "asg-scale-out"
  alarm_description   = "Triggered when ASG scales out (increases instances)"
  namespace           = "AWS/AutoScaling"
  metric_name         = "GroupInServiceInstances"
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.web_asg.name
  }
  statistic           = "Average"
  period              = 60
  evaluation_periods  = 1
  threshold           = 2
  comparison_operator = "GreaterThanThreshold"
  alarm_actions       = [aws_sns_topic.asg_notifications.arn]
  treat_missing_data  = "notBreaching"
}

resource "aws_cloudwatch_metric_alarm" "asg_scale_in" {
  alarm_name          = "asg-scale-in"
  alarm_description   = "Triggered when ASG scales in (decreases instances)"
  namespace           = "AWS/AutoScaling"
  metric_name         = "GroupInServiceInstances"
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.web_asg.name
  }
  statistic           = "Average"
  period              = 60
  evaluation_periods  = 1
  threshold           = 1
  comparison_operator = "LessThanThreshold"
  alarm_actions       = [aws_sns_topic.asg_notifications.arn]
  treat_missing_data  = "notBreaching"
}