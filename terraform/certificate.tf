resource "aws_acm_certificate" "certificate" {
  domain_name       = "web-era-tahiri.appstellar.training"
  validation_method = "DNS"
  subject_alternative_names = [
    "*.web-era-tahiri.appstellar.training"
  ]
}

output "test" {
  value = aws_acm_certificate.certificate.domain_validation_options
}


resource "aws_route53_record" "dns_validation_record" {
  for_each ={
      for dvo in aws_acm_certificate.certificate.domain_validation_options : dvo.domain_name => dvo
  }
  name     = each.value.domain_name
  records = [
    each.value.resource_record_value
  ]
  ttl             = 60
  type            = each.value.resource_record_type
  zone_id         = "Z08236011XTT4SGTHOP2L"
  allow_overwrite = true
}


