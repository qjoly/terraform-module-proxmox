# Module Terraform 

Ce projet est un module terraform spécifique à Proxmox permettant de déployer des machines virtuelles. 

# Usage

```hcl
module "machinetest" {
  count             = 1
  source            = "QJoly/proxmox/module"
  version           = "1.0.0"
  node_name         = "master-${count.index}-tf"
  node_target       = var.node
  node_qemuga       = 1
  node_pool         = "customer01"
  node_size_disk    = "32G"
  node_bootauto     = true
  node_template     = "debian-11-tf"
  node_storage_disk = "local"
  node_network_host = "vmbr0"
  node_notes        = "Super-VM for the customer No 01"
  node_cpu          = 3
  node_memory       = 3072
}
```
Il est possible de récupérer la/les adresse.s des machines déployées avec ce module via l'output : `node_ip`.

Ex: 
```hcl
resource "null_resource" "playbooks" {
  provisioner "local-exec" {
    when    = create
    command = "ANSIBLE_FORCE_COLOR=true ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook i \"module.machinetest[0].node_ip\" test-playbook.yml"
  }
}
```
