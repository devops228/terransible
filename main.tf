terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region = var.region
}

module "vpcModule" {
  source                   = "./modules/vpc"
  region                   = var.region
  availability_zone        = var.availability_zone
  cidr_block_range         = "10.0.0.0/16"
  subnet1_cidr_block_range = "10.0.1.0/24"
  subnet2_cidr_block_range = "10.0.2.0/24"
  public_key_path          = "~/.ssh/id_rsa.pub"
  environment_tag          = var.environment_tag
}

module "securityGroupModule" {
  source          = "./modules/sg"
  vpc_id          = module.vpcModule.vpc_id
  environment_tag = var.environment_tag
}

module "ec2Module" {
  source            = "./modules/ec2"
  region            = var.region
  instance_ami      = "ami-075caa3491def750b"
  vpc_id            = module.vpcModule.vpc_id
  subnet_public_id  = module.vpcModule.public_subnets[0]
  key_pair_name     = module.vpcModule.ec2keyName
  security_group_id = module.securityGroupModule.ta_sg
  environment_tag   = var.environment_tag
}
