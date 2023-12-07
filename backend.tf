terraform {
  cloud {
    organization = "cuerator"

    workspaces {
      name = "repos"
    }
  }
}
