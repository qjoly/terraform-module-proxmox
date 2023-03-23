terraform {
  required_version = ">=1.0.11"

  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "=2.9.14"
    }
  }
}

#-----------------------------------------------

resource "proxmox_vm_qemu" "vm-qemu" {
  tags        = var.node_tags
  name        = var.node_name
  target_node = var.node_target
  clone       = var.node_template
  full_clone  = true
  onboot      = var.node_bootauto
  vmid        = var.node_vmid
  cores       = var.node_cpu
  sockets     = var.node_cpu_socket
  cpu         = var.node_cpu_type
  memory      = var.node_memory
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "${var.node_driver_disk}0"
  agent       = var.node_qemuga

  pool = var.node_pool
  desc = var.node_notes

  disk {
    size    = var.node_size_disk
    type    = var.node_driver_disk
    storage = var.node_storage_disk
  }
  network {
    model  = var.node_driver_network
    bridge = var.node_network_host
  }



  # This is to avoid terraform plan detecting changes that are not handled correctly by the plugin
  lifecycle {
    ignore_changes = [

      network[0],
      disk[0],
      balloon,
      ciuser,
      disk_gb,
      id,
      ipconfig0,
      memory,
      name,
      nameserver,
      qemu_os,
      searchdomain,
      ssh_host,
      ssh_port,
      sshkeys
    ]
  }


  provisioner "local-exec" {
    when    = create
    command = "echo \"The IP of vm '${self.name}' is '${self.default_ipv4_address}'\""
  }

}

