module "repo_cuerator" {
  source      = "./modules/repo"
  name        = "cuerator"
  description = "Continuous delivery, configuration and policy enforcement for Kubernetes using CUE."
  languages   = ["go"]
  workflow    = "go"
}
