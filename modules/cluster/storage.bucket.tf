resource "linode_object_storage_key" "object_storage_key" {
  label = "image-access-key"
}

resource "linode_object_storage_bucket" "staging_storage_bucket" {
  region = var.bucket_region
  label  = "kubeconfig-access"

  secret_key = linode_object_storage_key.object_storage_key.secret_key
  access_key = linode_object_storage_key.object_storage_key.access_key

  acl = "public-read"
}

resource "linode_object_storage_object" "staging_kubeconfig" {
  bucket  = linode_object_storage_bucket.staging_storage_bucket.label
  cluster = var.bucket_region
  key     = "staging-kubeconfig"

  secret_key = linode_object_storage_key.object_storage_key.secret_key
  access_key = linode_object_storage_key.object_storage_key.access_key

  source = pathexpand(local_file.kubeconfig.filename)

  acl = "public-read"
}

resource "local_file" "kubeconfig" {
  filename = "configs/kubeconfig.yaml"
  content = base64decode(linode_lke_cluster.eganow_partners_staging.kubeconfig)
}

data "linode_object_storage_bucket" "kubeconfig" {
  label  = linode_object_storage_bucket.staging_storage_bucket.label
  region = var.bucket_region

  #   access_key = linode_object_storage_key.object_storage_key.access_key
  #   secret_key = linode_object_storage_key.object_storage_key.secret_key

  depends_on = [linode_object_storage_object.staging_kubeconfig]
}