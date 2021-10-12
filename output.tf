output "juiceshop_ip" {
  value = "ssh ec2-user@${module.juiceshop.juiceshop_ip}"
}
output "linux_ip" {
  value = "ssh ec2-user@${module.linux.linux_ip}"
}
output "linux_ip2" {
  value = "ssh ec2-user@${module.linux2.linux_ip}"
}

output "win_ip" {
  value = module.win.win_ip
}

output "bastion_ip" {
  value = "ssh ec2-user@${module.bastion.bastion_ip}"
}

