# Create VPC only if create_vpc is true
resource "aws_vpc" "this" {
  count      = var.create_vpc ? 1 : 0
  cidr_block = var.vpc_cidr

  tags = {
    Name        = "vpc-${var.environment}"
    Environment = var.environment
  }
}

# Determine VPC ID from either created or existing
locals {
  vpc_id = var.create_vpc ? aws_vpc.this[0].id : var.vpc_id
}

# Public subnets in the selected VPC
resource "aws_subnet" "public" {
  count             = length(var.public_subnets)
  vpc_id            = local.vpc_id
  cidr_block        = var.public_subnets[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name        = "public-${var.environment}-${count.index}"
    Environment = var.environment
  }
}

# Private subnets in the selected VPC
resource "aws_subnet" "private" {
  count             = length(var.private_subnets)
  vpc_id            = local.vpc_id
  cidr_block        = var.private_subnets[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name        = "private-${var.environment}-${count.index}"
    Environment = var.environment
  }
}
