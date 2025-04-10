#' Download snapshot
#'
#' Downloads a full copy (snapshot) of an R package repository.
#'
#' @export
#' @return None, used for its side-effects.
#' @rdname snapshot
#' @param repo url of the cran-like repository to snapshot
#' @param type type of snapshot. Either `NULL` or one of "src", "win", "mac", "linux", "wasm", "docs".
#' By default, if `NULL`, "win", "mac", "linux" snapshots will be downloaded.
#' @param bin_versions vector with versions of R to download binary
#' packages. The default is to download binaries for all available versions.
#' Set to NULL to not download any binaries.
#' @param destdir where to save the snapshots (path).
#' @examplesIf interactive()
#' repo_snapshot(
#'   "https://jeroen.r-universe.dev",
#'    bin_versions = c("4.1", "4.2", "4.3")
#' )
repo_snapshot <- function(
  repo,
  types = NULL,
  destdir = "snapshot",
  bin_versions = r_version()
) {
  if (!is.null(types)) {
    types <- rlang::arg_match(
      types,
      c("src", "win", "mac", "linux", "wasm", "docs"),
      multiple = TRUE
    )
  }

  not_empty <- length(fs::dir_ls(destdir)) > 0
  if (not_empty) {
    cli::cli_abort("{.arg destdir} must be empty.")
  }
  dir.create(destdir, showWarnings = FALSE, recursive = TRUE)

  url <- contrib_path(repo, types, rver = bin_versions)

  local_dir <- withr::local_tempdir()
  local_zip <- file.path(local_dir, "snapshot.zip")
  curl::curl_download(url, local_zip)
  utils::unzip(local_zip, exdir = destdir)

  if (rlang::is_interactive()) fs::dir_tree(destdir)
}

download_single_repo <- function(url, destdir) {
  local_dir <- withr::local_tempdir()
  local_zip <- file.path(local_dir, "snapshot.zip")
  curl::curl_download(url, local_zip)
  utils::unzip(local_zip, exdir = destdir)
}

contrib_path <- function(repo, types = "src", rver) {
  url <- sprintf("%s/api/snapshot/zip", repo)

  if (is.null(types) && !is.null(rver)) {
    return(url)
  }

  url <- paste0(url, "?")

  if (!is.null(types)) {
    types <- paste(types, sep = ",")
    url <- paste0(url, sprintf("types=%s", types))
  }

  if (!is.null(rver)) {
    ver <- sub("(\\d+\\.\\d+).*", "\\1", rver)
    stopifnot("Invalid R version" = grepl("^\\d+\\.\\d+$", ver)) # nolint: nonportable_path_linter
    rver <- paste(rver, sep = ",")
    url <- paste0(url, sprintf("binaries=%s", rver))
  }

  url
}

download_file_verbose <- function(url) {
  cat("Downloading:", url, "\n", file = stderr())
  curl::curl_download(url, basename(url), quiet = TRUE)
}

#' @export
#' @rdname snapshot
r_version <- function() {
  major_version(getRversion())
}

major_version <- function(str) {
  sub("^(\\d+\\.\\d+).*", "\\1", str)
}
