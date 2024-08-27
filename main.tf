provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "docker-server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.aws_key.key_name
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  # Provisioners

  # Copy docker-compose.yml to the instance
  provisioner "file" {
    source      = "docker-compose.yml"
    destination = "/tmp/docker-compose.yml"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("${path.module}/id_rsa")
      host        = self.public_ip
    }
  }

  # Copy docker-setup.sh to the instance
  provisioner "file" {
    source      = "docker-setup.sh"
    destination = "/tmp/docker-setup.sh"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("${path.module}/id_rsa")
      host        = self.public_ip
    }
  }

  # Run the setup script on the instance
  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/docker-setup.sh",
      "sudo /tmp/docker-setup.sh",
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("${path.module}/id_rsa")
      host        = self.public_ip
    }
  }

  # Save the private IP to a file locally
  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ip.txt"
  }
}

