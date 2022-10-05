output "vpc_id" {
  description = "ID of created VPC"
  value       = aws_vpc.example_vpc.id
}

output "security_group_id" {
  description = "ID of created security group"
  value       = aws_security_group.example_security_group.id
}

output "subnet_id" {
  description = "ID of created subnet"
  value       = aws_subnet.example_subnet.id
}
