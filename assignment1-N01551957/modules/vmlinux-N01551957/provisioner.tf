resource "null_resource" "linux_provisioner" {
  for_each = var.vm-count
  depends_on = [azurerm_linux_virtual_machine.vmlinux-CentOS]

  provisioner "remote-exec" {
    inline = ["/usr/bin/hostname"]

    connection {
      type        = "ssh"
      user        = var.Admin_username
      private_key = file(var.Private_key)
      host        = azurerm_public_ip.pub-ip-CentOS[each.key].fqdn
    }
  }
}
