resource "aws_vpc" "roboshop" {
  cidr_block       = var.cidr_block
  enable_dns_hostnames = "true"

  tags = merge(
    var.common_tags,
    var.vpc_tags,
    {
        Name = local.name
    }
  )
}

resource "aws_internet_gateway" "roboshop" {
  vpc_id = aws_vpc.roboshop.id

  tags = merge(
    var.common_tags,
    var.igw_tags,
    {
        Name = local.name
    }
  )
}

resource "aws_subnet" "public" {
  count = length(var.public_subnets_cidr)
  vpc_id     = aws_vpc.roboshop.id
  cidr_block = var.public_subnets_cidr[count.index]
  availability_zones = local.az_names[count.index]

  tags = merge(
    common_tags,
    aws_subnet_tags,
    {
        Name = local.name
    }
  )
  }
