# -- root/main.tf --

module "network" {
  source           = "./network"
  vpc_cidr         = local.vpc_cidr
  access_ip        = var.access_ip
  public_sn_count  = 1
  private_sn_count = 1
  max_subnets      = 10
  security_groups  = local.security_groups
  public_cidrs     = [for i in range(2, 255, 2) : cidrsubnet(local.vpc_cidr, 8, i)]
  private_cidrs    = [for i in range(1, 255, 2) : cidrsubnet(local.vpc_cidr, 8, i)]
}


module "juiceshop" {
  source          = "./juiceshop"
  instance_count  = "1"
  juiceshop_sg    = module.network.juiceshop_sg
  public_subnets  = module.network.public_subnets
  instance_type   = "t2.micro"
  vol_size        = "10"
  key_name        = "juiceshop"
  public_key_path = "/home/ec2-user/.ssh/id_ed25519.pub"
  datafile        = file("juice.sh")
  # user_data_path  = "${path.root}/userdata.tpl"
}


module "bastion" {
  source          = "./bastion"
  instance_count  = "1"
  bastion_sg      = module.network.bastion_sg
  public_subnets  = module.network.public_subnets
  instance_type   = "t2.micro"
  vol_size        = "10"
  key_name        = "bastion"
  public_key_path = "/home/ec2-user/.ssh/id_ed25519.pub"
  datafile        = file("bastion.sh")
  # user_data_path  = "${path.root}/userdata.tpl
}

module "linux" {
  source          = "./linux"
  instance_count  = "1"
  linux_sg        = module.network.linux_sg
  public_subnets  = module.network.public_subnets
  instance_type   = "t2.micro"
  vol_size        = "10"
  key_name        = "linux"
  public_key_path = "/home/ec2-user/.ssh/id_ed25519.pub"
  datafile        = file("linux.sh")
  # user_data_path  = "${path.root}/userdata.tpl
}

module "win" {
  source          = "./win"
  instance_count  = "1"
  win_sg          = module.network.win_sg
  public_subnets  = module.network.public_subnets
  instance_type   = "t2.micro"
  vol_size        = "30"
  key_name        = "win"
  public_key_path = "/home/ec2-user/.ssh/id_rsa.pub"
  # datafile        = file("linux.sh")
  # user_data_path  = "${path.root}/userdata.tpl
}

module "win2" {
  source          = "./win2"
  instance_count  = "1"
  win_sg          = module.network.win_sg
  public_subnets  = module.network.public_subnets
  ami             = "ami-0ba6d33ccf9c1d893"
  instance_type   = "t2.micro"
  vol_size        = "30"
  key_name        = "win2"
  public_key_path = "/home/ec2-user/.ssh/id_rsa.pub"
  # datafile        = file("linux.sh")
  # user_data_path  = "${path.root}/userdata.tpl
}

module "win3" {
  source          = "./win3"
  instance_count  = "1"
  win_sg          = module.network.win_sg
  public_subnets  = module.network.public_subnets
  ami             = "ami-0ba6d33ccf9c1d893"
  instance_type   = "t2.micro"
  vol_size        = "30"
  key_name        = "win3"
  public_key_path = "/home/ec2-user/.ssh/id_rsa.pub"
  # datafile        = file("linux.sh")
  # user_data_path  = "${path.root}/userdata.tpl
}

module "linux2" {
  source          = "./linux2"
  instance_count  = "1"
  linux_sg        = module.network.linux_sg
  public_subnets  = module.network.public_subnets
  ami             = "ami-04d064705dc850ddd"
  instance_type   = "t2.micro"
  vol_size        = "10"
  key_name        = "linux2"
  public_key_path = "/home/ec2-user/.ssh/id_ed25519.pub"
  datafile        = file("linux2.sh")
  # user_data_path  = "${path.root}/userdata.tpl
}
