
output "node_name" {
  description = "VM Hostname"
  value       = var.node_name
}

output "vm_id" {
  description = "VM id"
  value       = proxmox_vm_qemu.vm-qemu.vmid

  depends_on = [proxmox_vm_qemu.vm-qemu]
}

output "node_ip" {
  description = "VM ip"

  value = proxmox_vm_qemu.vm-qemu.default_ipv4_address

  depends_on = [proxmox_vm_qemu.vm-qemu]
}
