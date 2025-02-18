resource "aws_security_group" "example_security_group" {
  name        = "test-security-group"
  description = "test security group"

  // Inbound rules
  ingress {
    from_port   = 22 // Allow SSH
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] // Allow from anywhere
  }

  ingress {
    from_port   = 80 // Allow HTTP
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] // Allow from anywhere
  }

  ingress {
    from_port   = 443 // Allow HTTPS
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] // Allow from anywhere
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["2.16.0.0/13"] // test default IP
  }
}