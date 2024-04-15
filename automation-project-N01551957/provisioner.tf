resource "null_resource" "ansible_provisioner" {
   depends_on = [
    module.rgroup-N01551957,
    module.datadisk-N01551957,
    module.vmlinux-N01551957
  ]

  provisioner "local-exec" {
    command = "ansible-playbook /home/j/automation/ansible/ansible-project/N01551957-playbook.yml"
  }
}
