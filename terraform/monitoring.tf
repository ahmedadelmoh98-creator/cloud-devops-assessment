resource "aws_cloudwatch_log_group" "ecs" {
  name              = "/ecs/${var.project_name}-${var.environment}-backend"
  retention_in_days = 7

  tags = {
    Name = "${var.project_name}-${var.environment}-ecs-logs"
  }
}

resource "aws_cloudwatch_metric_alarm" "ecs_high_cpu" {
  alarm_name          = "${var.project_name}-${var.environment}-ecs-high-cpu"
  alarm_description   = "Alarm when ECS service CPU utilization is higher than 80 percent"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = 60
  statistic           = "Average"
  threshold           = 80

  dimensions = {
    ClusterName = aws_ecs_cluster.main.name
    ServiceName = aws_ecs_service.backend.name
  }

  treat_missing_data = "notBreaching"
}
