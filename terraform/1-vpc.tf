module "vpc" {

  source = "terraform-aws-modules/vpc/aws"
  name   = "sb-main"
  cidr   = "10.0.0.0/16"


  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.0.0/19", "10.0.32.0/19"]
  public_subnets  = ["10.0.64.0/19", "10.0.96.0/19"]

  create_igw             = true
  enable_nat_gateway     = true
  single_nat_gateway     = true # false para replicar por zona en PRD
  one_nat_gateway_per_az = false

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Environment = "pre-prd"
    Terraform   = "true"
  }

}