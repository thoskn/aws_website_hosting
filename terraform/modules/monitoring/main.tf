resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "${var.environment}-website"
  dashboard_body = data.template_file.dashboard_template.rendered
}

data "template_file" "dashboard_template" {
  template = file("${path.module}/dashboard.json.tpl")
  vars = {
    cloudfront_distribution_id = var.cloudfront_distribution_id
  }
}
