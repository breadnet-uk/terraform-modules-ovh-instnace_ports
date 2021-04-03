output "ext-ip" {
  value = openstack_compute_instance_v2.instance.access_ip_v4
}
 output "int-ip" {
   value = openstack_networking_port_v2.internal.fixed_ip[0].ip_address
 }