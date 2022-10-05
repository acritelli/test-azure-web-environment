# Specify the provider and access details
provider "aws" {
  region     = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key
}

data "aws_ami" "centos" {
  most_recent = true
  owners      = ["125523088429"]

  filter {
    name   = "name"
    values = ["CentOS 7.9.2009 x86_64"]
  }
}

data "template_file" "template" {
  template = <<EOF
#cloud-config
users:
  - name: $${admin_user}
    shell: /bin/bash
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    ssh-authorized-keys:
      - $${admin_key_public}
EOF
  vars = {
    admin_user       = var.admin_user
    admin_key_public = var.admin_key_public
  }
}

resource "aws_instance" "example_vm" {
  # The connection block tells our provisioner how to
  # communicate with the resource (instance)
  connection {
    # The default username for our AMI
    user = var.admin_user
  }

  instance_type = var.instance_type


  tags = {
    Name        = "demo-vm"
    deployed_by = "Cloudify"
  }

  ami = data.aws_ami.centos.id

  # Our Security group to allow HTTP and SSH access
  vpc_security_group_ids = [var.security_group_id]

  # Connect to subnet
  subnet_id = var.subnet_id

  user_data = data.template_file.template.rendered
}

resource "aws_eip" "eip" {
  instance = aws_instance.example_vm.id
  vpc      = true
}
