variable "domain_name" {}
variable "aws_lb_dns_name" {}
variable "aws_lb_zone_id" {}
variable "hosted_zone_id" {
  description = "The ID of the Route 53 hosted zone"
  type        = string
}
data "aws_route53_zone" "dev_proj_1_jhooq_org" {
  
  zone_id = var.hosted_zone_id
  private_zone = false
}

resource "aws_route53_record" "lb_record" {
  zone_id = data.aws_route53_zone.dev_proj_1_jhooq_org.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = var.aws_lb_dns_name
    zone_id                = var.aws_lb_zone_id
    evaluate_target_health = true
  }
}

output "hosted_zone_id" {
  value = data.aws_route53_zone.dev_proj_1_jhooq_org.zone_id
}
