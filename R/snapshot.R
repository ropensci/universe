#' Download snapshot
#'
#' Downloads a full copy (snapshot) of an R package repository.
#'
#' @export
#' @return None, used for its side-effects.
#' @rdname snapshot
#' @param repo url of the cran-like repository to snapshot
#' @param destdir path to directory where to save the snapshots
#' @param types which files to include. Must be subset of "src", "win", "mac", "linux", "wasm", "docs".
#' @param bin_versions vector with versions of R to download binary packages.
#' Set to NULL to download all binaries available.
#' @param verbose print some progress
#' @examplesIf interactive()
#' repo_snapshot("https://jeroen.r-universe.dev")
repo_snapshot <- function(
  repo,
  destdir = NULL,
  types = c("src", "win", "mac", "linux", "wasm", "docs"),
  bin_versions = r_version(),
  verbose = interactive()
) {
  types <- rlang::arg_match(types, multiple = TRUE)

  destdir <- destdir %||% sub(".*//", "", repo)

  dir.create(destdir, showWarnings = FALSE, recursive = TRUE)
  not_empty <- length(fs::dir_ls(destdir)) > 0
  if (not_empty) {
    cli::cli_abort("Directory {destdir} is not empty.")
  }
  req <- httr2::request(repo) |>
    httr2::req_url_path('/api/snapshot') |>
    httr2::req_url_query(
      types = types,
      binaries = bin_versions,
      .multi = 'comma'
    )

  if (verbose) {
    # req_progress() does not work if server has no content-length??
    req <- httr2::req_options(req, noprogress = FALSE)
  }

  local_tempdir <- withr::local_tempdir()
  local_zip <- file.path(local_tempdir, "snapshot.zip")

  httr2::req_perform(req, path = local_zip)
  if (verbose) {
    cli::cli_alert_info("Extracing zip file...")
  }
  utils::unzip(local_zip, exdir = destdir)
  fs::dir_tree(destdir)
}

#' @export
#' @rdname snapshot
r_version <- function() {
  major_version(getRversion())
}

major_version <- function(str) {
  sub("^(\\d+\\.\\d+).*", "\\1", str)
}
