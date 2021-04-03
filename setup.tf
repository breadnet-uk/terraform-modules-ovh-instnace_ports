terraform {
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
    }
    ovh = {
      source = "ovh/ovh"
    }
  }
}

provider "openstack" {
  auth_url = "https://auth.cloud.ovh.net/v3"
  alias = "ovh"
}

provider "ovh" {
  endpoint = "ovh-eu"
}