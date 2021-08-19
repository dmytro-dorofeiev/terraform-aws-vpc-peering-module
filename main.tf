provider "aws" {
  profile = var.owner_profile
  region  = var.owner_region
}

provider "aws" {
  alias   = "accepter"
  profile = var.accepter_profile
  region  = var.accepter_region
}

resource "aws_vpc_peering_connection" "owner" {
  vpc_id        = var.owner_vpc_id
  peer_vpc_id   = data.aws_vpc.accepter.id
  peer_owner_id = data.aws_caller_identity.accepter.account_id
  peer_region   = var.accepter_region
  auto_accept   = false

  tags = {
    Name = "peer_${var.owner_profile}_to_${var.accepter_profile}"
  }
}

resource "aws_vpc_peering_connection_accepter" "accepter" {
  provider                  = aws.accepter
  vpc_peering_connection_id = aws_vpc_peering_connection.owner.id
  auto_accept               = true

  tags = {
    Name = "peer_${var.accepter_profile}_to_${var.owner_profile}"
  }
}

resource "aws_route" "owner" {
  for_each                  = toset(flatten([for k, v in data.aws_route_tables.owner : v.ids]))
  route_table_id            = each.key
  destination_cidr_block    = data.aws_vpc.accepter.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.owner.id
}

resource "aws_route" "accepter" {
  provider                  = aws.accepter
  for_each                  = toset(flatten([for k, v in data.aws_route_tables.accepter : v.ids]))
  route_table_id            = each.key
  destination_cidr_block    = data.aws_vpc.owner.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.owner.id
}
