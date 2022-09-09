variable "node_name" {
  description = "Name for VM"
  type        = string
}

variable "node_target" {
  description = "Deployment Node Cluster Target"
  type        = string
}

variable "node_template" {
  description = "Template VM"
  type        = string
}

variable "node_storage_disk" {
  description = "VM storage disk"
  type        = string
}

variable "node_network_host" {
  description = "VM Network on Host"
  type        = string
}


variable "node_vmid" {
  description = "VM Id"
  type        = number
  default     = 0
}

variable "node_bootauto" {
  description = "VM Start auto"
  type        = bool
  default     = false
}

variable "node_size_swap" {
  description = "VM Size Swap disk"
  type        = number
  default     = 1024
}

variable "node_size_disk" {
  description = "VM Size disk"
  type        = string
  default     = "16G"
}

variable "node_driver_disk" {
  description = "VM Driver disk"
  type        = string
  default     = "virtio"
}

variable "node_driver_network" {
  description = "VM Driver network"
  type        = string
  default     = "virtio"
}

variable "node_qemuga" {
  description = "VM Qemu Guest Agent"
  type        = number
  default     = 1
}

variable "node_tags" {
  description = "VM tags"
  type        = string
  default     = "vm"
}

variable "node_notes" {
  description = "VM notes"
  type        = string
  default     = "unknown notes (Not precised)"
}

variable "node_cpu" {
  description = "VM cpu"
  type        = number
  default     = 1
}

variable "node_cpu_socket" {
  description = "VM cpu socket"
  type        = number
  default     = 1
}

variable "node_cpu_type" {
  description = "VM cpu socket"
  type        = string
  default     = "kvm64"
}

variable "node_memory" {
  description = "VM memory"
  type        = number
  default     = 1024
}

variable "node_pool" {
  description = "Pool for VM"
  type        = string
}

