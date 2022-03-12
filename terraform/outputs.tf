output "certificate_arn" {
  value = aws_acm_certificate.certificate.arn
}

output "certificate_domain_name" {
  value = aws_acm_certificate.certificate.domain_name
}