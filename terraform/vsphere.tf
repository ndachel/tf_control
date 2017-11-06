# Configure the VMware vSphere Provider
provider "vsphere" {
  user           = "${var.vsphere_user}"
  password       = "${var.vsphere_password}"
  vsphere_server = "${var.vsphere_server}"
  allow_unverified_ssl = true
}

# Create a virtual machine within the folder
resource "vsphere_virtual_machine" "web" {
  name = "bs-control"
  hostname = "bs-control"
  #folder = "${var.vsphere_frontend_path}"
  vcpu   = 1
  memory = 2048
  datacenter = "Value Plastics Datacenter"
  cluster = "Value Plastics Cluster"
  network_interface = "VP Servers"
  disk {
    datastore = "MD3200 shared storage"
    template = "centos-7"
  }
}

