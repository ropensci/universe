#' Use R-universe GitHub Actions workflow
#'
#' Test the R-universe build workflow from your own GitHub repository
#'
#' @param universe Universe to set the context to, by default the owner of the
#' repository.
#' This affects where R package dependencies are downloaded from
#' (besides the default repositories).
#' @param path Path to the local repository for which you want to use the workflow.
#'
#' @returns The path to the workflow
#'
#' @export
#' @examplesIf rlang::is_interactive()
#' temp_dir <- withr::local_tempdir()
#' workflow_path <- use_universe_action("maelle", temp_dir)
#' file.edit(workflow_path)
use_universe_action <- function(universe = NULL, path = ".") {
  gha_path <- file.path(path, ".github", "workflows")

  if (!dir.exists(gha_path)) {
    dir.create(gha_path, recursive = TRUE)
  }

  readme <- "https://raw.githubusercontent.com/r-universe-org/workflows/refs/heads/v3/README.md"
  readme_lines <- readLines(readme)

  code_start <- grep("```yaml", readme_lines) + 1
  code_end <- grep("```$", readme_lines) - 1

  code <- readme_lines[code_start:code_end]

  if (!is.null(universe)) {
    code <- sub("universe: .*", sprintf("universe: %s", universe), code)
  }

  workflow_path <- file.path(gha_path, "r-universe-test.yml")
  writeLines(code, workflow_path)

  # if you use this function you probably are a usethis user?
  rlang::check_installed("usethis")
  usethis::use_build_ignore(workflow_path)
  cli::cli_alert_success("Created {.path {workflow_path}}!")
  invisible(workflow_path)
}
