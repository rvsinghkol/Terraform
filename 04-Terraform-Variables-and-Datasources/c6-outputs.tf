# Terraform Output Values
output "intance_publicip" {
    description = "EC2 Instance Public IP"
    value = "aws_instance.ec2vm.public_ip"
}
#public dns
output "intance_publicdns" {
    description = "EC2 Instance Public dns"
    value = "aws_instance.ec2vm.public_dns"
}