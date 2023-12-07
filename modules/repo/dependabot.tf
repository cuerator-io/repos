resource "github_repository_file" "dependabot_config" {
  count = local.enable_dependabot ? 1 : 0

  repository          = data.github_repository.this.name
  branch              = data.github_repository.this.default_branch
  file                = ".github/dependabot.yml"
  overwrite_on_create = true
  commit_author       = local.committer_name
  commit_email        = local.committer_email
  commit_message      = "Regenerate Dependabot configuration from template."

  content = templatefile(
    "${path.module}/templates/dependabot.yml.tftpl",
    {
      org = local.organization
      ecosystems = compact([
        "github-actions",
        contains(var.languages, "go") ? "gomod" : "",
        contains(var.languages, "js") ? "npm" : "",
      ])
    }
  )
}

resource "github_repository_file" "dependabot_workflow_config" {
  count = local.enable_dependabot_auto_merge ? 1 : 0

  repository          = data.github_repository.this.name
  branch              = data.github_repository.this.default_branch
  file                = ".github/workflows/dependabot.yml"
  overwrite_on_create = true
  commit_author       = local.committer_name
  commit_email        = local.committer_email
  commit_message      = "Regenerate workflow configuration from template."

  content = templatefile(
    "${path.module}/templates/workflow-dependabot.yml.tftpl",
    {
      org = local.organization
    }
  )
}
