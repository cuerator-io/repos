module "repo_cuerator" {
  source      = "./modules/repo"
  name        = "cuerator"
  description = "Continuous delivery, configuration and policy enforcement for Kubernetes using CUE."
  languages   = ["go"]
  workflow    = "go"
}

module "repo_examples" {
  source      = "./modules/repo"
  name        = "examples"
  description = "Example Cuerator collections."
  languages   = []
}
