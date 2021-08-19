data "aws_caller_identity" "accepter" {
  provider = aws.accepter
}

data "aws_vpc" "owner" {
  id = var.owner_vpc_id
}

data "aws_vpc" "accepter" {
  provider = aws.accepter
  id       = var.accepter_vpc_id
}

data "aws_route_tables" "accepter" {
  provider = aws.accepter
  vpc_id   = data.aws_vpc.accepter.id
  for_each = var.accepter_route_names

  filter {
    name   = "tag:Name"
    values = ["*-${each.key}-*"]
  }
}

data "aws_route_tables" "owner" {
  vpc_id   = var.owner_vpc_id
  for_each = var.owner_route_names

  filter {
    name   = "tag:Name"
    values = ["*-${each.key}-*"]
  }
}
