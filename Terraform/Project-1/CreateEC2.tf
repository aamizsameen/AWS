resource "aws_instance" "New-EC2-Instance" {

    instance_type = "${var.instance_type}"
    ami = "ami-012b9156f755804f5"
    vpc_security_group_ids = [aws_security_group.New-SG.id]
    subnet_id = aws_subnet.New-public-subnet-1[0].id
    user_data = <<-EOF
                    #!/bin/bash
                    sudo yum update -y
                    sudo yum install httpd -y
                    sudo systemctl start httpd
                    sudo systemctl enable httpd
                    sudo bash -c 'Welcome from Amazon' > /var/www/html/index.html
                    EOF

    root_block_device {
        volume_size = "${var.volume_size}"
    }

    tags = {
        Name = "POC"
    }
}