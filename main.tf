provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"
}

module "s3" {
  source = "./modules/s3"
}

module "iam" {
  source = "./modules/iam"
}

module "ec2" {
  source = "./modules/ec2"
  vpc_id = module.vpc.vpc_id
}

module "alb" {
  source = "./modules/alb"
  vpc_id = module.vpc.vpc_id
}

module "autoscaling" {
  source = "./modules/autoscaling"
  alb_target_group_arn = module.alb.target_group_arn
}

module "rds" {
  source = "./modules/rds"
  vpc_id = module.vpc.vpc_id
}

module "cloudwatch" {
  source = "./modules/cloudwatch"
}
