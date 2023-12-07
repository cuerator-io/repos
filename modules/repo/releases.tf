resource "github_repository_file" "publish_release_workflow_config" {
  count = local.publish_releases ? 1 : 0

  repository          = data.github_repository.this.name
  branch              = data.github_repository.this.default_branch
  file                = ".github/workflows/publish-release.yml"
  overwrite_on_create = true
  commit_author       = local.committer_name
  commit_email        = local.committer_email
  commit_message      = "Regenerate workflow configuration from template."

  content = templatefile(
    "${path.module}/templates/workflow-publish-release.yml.tftpl",
    {
      org = local.organization
    }
  )
}
