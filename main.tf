resource "hcp_hvn" "hcp_vault_hvn" {
  hvn_id         = var.hvn_id
  cloud_provider = var.cloud_provider
  region         = var.region
  cidr_block     = var.cidr_block
}

resource "hcp_vault_cluster" "hcp_managed_vault_cluster" {
  cluster_id      = var.cluster_id
  hvn_id          = hcp_hvn.hcp_vault_hvn.hvn_id
  tier            = var.tier
  public_endpoint = true
}