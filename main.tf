variable "ssh_fingerprint" {}
variable "Digitalocean_token" {}

provider "digitalocean" {
    token = var.Digitalocean_token
}

resource "digitalocean_droplet" "small" {
    image = "ubuntu-18-04-x64"
    name = "small"
    region = "ams1"
    size = "s-1vcpu-1gb"
    ssh_keys = [
        "${var.ssh_fingerprint}"
    ]
    ipv6 = true
}

output "ipv4" {
    value = digitalocean_droplet.small.ipv4_address
}

output "ipv6" {
    value = digitalocean_droplet.small.ipv6_address
}