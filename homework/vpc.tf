# # VPC
# resource "aws_vpc" "my_vpc" {
#   cidr_block = "10.0.0.0/16"
# }

# # Public Subnets
# resource "aws_subnet" "public_subnets" {
#   count           = 3
#   vpc_id          = aws_vpc.my_vpc.id
#   cidr_block      = "10.0.${1 + count.index}.0/24"
#   availability_zone = "us-east-1a"  # Change this to your desired availability zone
# }

# # Private Subnets
# resource "aws_subnet" "private_subnets" {
#   count           = 3
#   vpc_id          = aws_vpc.my_vpc.id
#   cidr_block      = "10.0.${11 + count.index}.0/24"
#   availability_zone = "us-east-1a"  # Change this to your desired availability zone
# }

# # Internet Gateway
# resource "aws_internet_gateway" "my_igw" {
#   vpc_id = aws_vpc.my_vpc.id
# }

# # Route Table for Public Subnets
# resource "aws_route_table" "public_route_table" {
#   vpc_id = aws_vpc.my_vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.my_igw.id
#   }
# }

# # Associate Public Subnets with the Public Route Table
# resource "aws_route_table_association" "public_subnet_associations" {
#   count          = 3
#   subnet_id      = aws_subnet.public_subnets[count.index].id
#   route_table_id = aws_route_table.public_route_table.id
# }

# # NAT Gateway
# resource "aws_nat_gateway" "my_nat_gateway" {
#   allocation_id = aws_eip.my_eip.id
#   subnet_id     = aws_subnet.public_subnets[0].id  # Use one of the public subnets
# }

# # Elastic IP for NAT Gateway
# resource "aws_eip" "my_eip" {}

# # Route Table for Private Subnets
# resource "aws_route_table" "private_route_table" {
#   vpc_id = aws_vpc.my_vpc.id

#   route {
#     cidr_block     = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.my_nat_gateway.id
#   }
# }

# # Associate Private Subnets with the Private Route Table
# resource "aws_route_table_association" "private_subnet_associations" {
#   count          = 3
#   subnet_id      = aws_subnet.private_subnets[count.index].id
#   route_table_id = aws_route_table.private_route_table.id
# }
