resource "openstack_compute_instance_v2" "instance" {
  name = var.name
  flavor_name = "s1-2"
  key_pair = var.key
  image_name = "Ubuntu 18.04"
  security_groups = var.sg
  network {
    port = openstack_networking_port_v2.internet.id
  }
  network {
    port = openstack_networking_port_v2.internal.id
  }
}

resource "openstack_networking_port_v2" "internal" {
  name           = "${var.name}-backend"
  network_id     = var.netid
  admin_state_up = "true"

  fixed_ip {
    subnet_id  = var.subid
    ip_address = var.ip
  }
}

resource "openstack_networking_port_v2" "internet" {
  name           = "${var.name}-ext-net"
  network_id     = "6011fbc9-4cbf-46a4-8452-6890a340b60b"
  admin_state_up = "true"
}