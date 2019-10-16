
terraform {
  required_version = "= 0.12.10"

  backend "remote" {}
}

data "terraform_remote_state" "vpc" {
  backend = "remote"
  config = {
    organization = "acmeAfonso"
    workspaces = {
      name = "robert-northard-layer-0-networking-prod"
    }
  }
}

resource "aws_subnet" "main" {
  vpc_id     = terraform_remote_state.vpc.id
  cidr_block = "10.0.1.0/24"
}