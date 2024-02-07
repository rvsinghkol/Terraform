# create security for ssh access
resource "aws_security_group" "vpc-ssh" {
    name = "vpc-ssh"
    description = "dev vpc ssh"
    ingress {
        description = "Allow 22 port no"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        description = "Allow all ip and ports outbound"  
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
            
        }
        tags = {
          Name = "vpc-ssh"
        }
    }

# Create Security Group - Web Traffic
resource "aws_security_group" "web-app" {
    name = "web-app"
    description = "dev vpc web"
    ingress {
      description = "Allow 80 port for web app"
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "Allow port for 443 port"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        description = "Allow all ip and ports outbound"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
      Name = "web-app"
    }
  
}

  
