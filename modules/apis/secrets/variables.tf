variable "dockerconfigjson" {
  type = object({
    auths = map(object({
      username = string
      password = string
      email    = string
      auth     = string
    }))
  })
  description = "Docker config JSON"
  sensitive   = true
  default = {
    auths = {
      "dummy" = {
        username = ""
        password = ""
        email    = ""
        auth     = ""
      }
    }
  }
}
