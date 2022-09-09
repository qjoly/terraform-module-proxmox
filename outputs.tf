
output "vm_hostname" {
  description = "VM Hostname"
  value       = var.node_name
}

output "vm_id" {
  description = "VM id"
  value       = proxmox_vm_qemu.vm-qemu.vmid

  depends_on = [proxmox_vm_qemu.vm-qemu]
}

output "vm_ipaddress" {
  description = "VM ip"

  value = proxmox_vm_qemu.vm-qemu.default_ipv4_address

  depends_on = [proxmox_vm_qemu.vm-qemu]
}
