# --- compute/main.tf  --- #


resource "random_id" "maniak_node_id" {
  byte_length = 2
  count       = var.instance_count
  keepers = {
    key_name = var.key_name
  }
}

resource "aws_key_pair" "maniak_auth" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

resource "aws_instance" "maniak_node" {
  count                  = var.instance_count
  instance_type          = var.instance_type
  ami                    = var.ami
  vpc_security_group_ids = [var.linux_sg]
  subnet_id              = var.public_subnets[count.index]
  key_name               = aws_key_pair.maniak_auth.id
  user_data              = var.datafile
  root_block_device {
    volume_size = var.vol_size
  }
  tags = {
    Name = "linux-${random_id.maniak_node_id[count.index].dec}"
  }


}


