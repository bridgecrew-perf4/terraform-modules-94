resource null_resource "ssh_connect_by_private_key" {
  connection {
    host = var.host
    user = var.user
    type = "ssh"
    agent = var.agent
    timeout = var.timeout
    private_key = var.private_key_file
  }

  provisioner "remote-exec" {
    inline = var.commands
  }

}
