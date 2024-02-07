# Output - For Loop with List
output "for_output_list" {
    description = "For Loop with List"
    value = [for instance in aws_instance.ec2vm: instance.public_dns]
  
}
# Output - For Loop with map1
output "for_output_map1" {
    description = "For Loop with Map"
    value = {for instance in aws_instance.ec2vm: instance.id => instance.public_dns}
  
}
# Output - For Loop with map advanced
output "for_output_map2" {
    description = "For Loop with Map -advanced"
    value = {for c, instance in aws_instance.ec2vm: c => instance.public_dns}
  
}
# Output Legacy Splat Operator (latest) - Returns the List
output "legacy_splat_instance_publicdns" {
  description = "Legacy Splat Expression"
  value = aws_instance.ec2vm.*.public_dns
}
# Output Latest Generalized Splat Operator - Returns the List
output "latest_splat_instance_publicdns" {
  description = "Generalized Splat Expression"
  value = aws_instance.ec2vm[*].public_dns
}
