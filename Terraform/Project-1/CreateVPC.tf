resource "aws_vpc" "New-VPC" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true

    tags = {
        Name = "POC"
    }
}

resource "aws_subnet" "New-public-subnet-1" {
    vpc_id = aws_vpc.New-VPC.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true
    availability_zone = "ap-south-1a"  //add one more subnet

    tags =  {
        Name = "POC"
    }
}

resource "aws_internet_gateway" "New-IGW" {
    vpc_id = aws_vpc.New-VPC.id

    tags = {
        Name = "POC"
    }
}

resource "aws_route_table" "New-route-table" {

    vpc_id = aws_vpc.New-VPC.id

    tags = {
        Name = "POC"
    }
}

resource "aws_route" "New-route" {
    route_table_id = aws_route_table.New-route-table.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.New-IGW.id
}

resource "aws_route_table_association" "New-RT-associate" {
    subnet_id = aws_subnet.New-public-subnet-1.id
    route_table_id = aws_route_table.New-route-table.id //add one more route
}

resource "aws_security_group" "New-SG" {
    name = "POC-SG"
    description = "POC Security group"
    vpc_id = aws_vpc.New-VPC.id

    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "POC"
    }
}

resource "aws_instance" "New-EC2-Instance" {

    instance_type = "t2.micro"
    ami = "ami-012b9156f755804f5"
    vpc_security_group_ids = [aws_security_group.New-SG.id]
    subnet_id = aws_subnet.New-public-subnet-1.id
    //user_data = file(userdata.tpl)

    root_block_device {
        volume_size = 10
    }

    tags = {
        Name = "POC"
    }
}


