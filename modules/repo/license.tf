resource "github_repository_file" "license" {
  repository          = data.github_repository.this.name
  branch              = data.github_repository.this.default_branch
  file                = "LICENSE"
  overwrite_on_create = true
  commit_author       = local.committer_name
  commit_email        = local.committer_email
  commit_message      = "Regenerate license from template."

  content = templatefile(
    "${path.module}/templates/license-${var.license}.tftpl",
    {
      start_year = time_static.copyright_start.year
      end_year   = formatdate("YYYY", timestamp())
      holders    = ["James Harris"]
    }
  )
}

resource "time_static" "copyright_start" {}
