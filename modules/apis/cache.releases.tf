resource "helm_release" "mtn_redis" {
  chart = "redis"
  name  = "mtn"
  repository = "https://dandydeveloper.github.io/charts/"
  version = var.redis_ha_version
  namespace = var.project_namespace

  cleanup_on_fail = true
}
