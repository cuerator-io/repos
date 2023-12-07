resource "github_repository" "_this" {
  archive_on_destroy = true

  name        = var.name
  description = var.description
  visibility  = var.private ? "private" : "public"

  auto_init = true

  has_issues   = true
  has_projects = false
  has_wiki     = false

  delete_branch_on_merge = true
  allow_merge_commit     = true
  allow_squash_merge     = false
  allow_rebase_merge     = false
  allow_auto_merge       = !var.private # not supported by private repos on free-tier

  vulnerability_alerts = true
}

# Lookup the repo we just created so that we can read the default_branch value
# without a slew of deprecation warnings.
data "github_repository" "this" {
  name = github_repository._this.name
}
