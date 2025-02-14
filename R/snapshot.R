#' Download snapshot
#'
#' Downloads a full copy (snapshot) of an R package repository.
#'
#' @export
#' @return None, used for its side-effects.
#' @rdname snapshot
#' @param repo url of the cran-like repository to snapshot
#' @param bin_versions vector with versions of R to download the win/mac binary
#' packages. The default is to download binaries only for your local version.
#' Set to NULL to not download any binaries.
#' @param destdir where to save the snapshots (path).
#' @examplesIf interactive()
#' repo_snapshot(
#'   "https://jeroen.r-universe.dev",
#'    bin_versions = c("4.1", "4.2", "4.3")
#' )
repo_snapshot <- function(repo, destdir = "snapshot", bin_versions = r_version()) { # nolint: line_length_linter
  not_empty <- length(fs::dir_ls(destdir)) > 0
  if (not_empty) {
    cli::cli_abort("{.arg destdir} must be empty.")
  }
  dir.create(destdir, showWarnings = FALSE, recursive = TRUE)
  download_single_repo(contrib_path(repo, "src"), destdir)
  for (rver in unique(major_version(as.character(bin_versions)))) {
    download_single_repo(contrib_path(repo, "win", rver), destdir)
    download_single_repo(contrib_path(repo, "mac", rver), destdir)
    download_single_repo(contrib_path(repo, "linux", rver), destdir)
  }
  if (rlang::is_interactive()) fs::dir_tree(destdir)
}

download_single_repo <- function(url, destdir) {
  local_dir <- withr::local_tempdir()
  local_zip <- file.path(local_dir, "snapshot.zip")
  curl::curl_download(url, local_zip)
  utils::unzip(local_zip, exdir = destdir)
}

contrib_path <- function(repo, type = "src", rver = getRversion()) {
  ver <- sub("(\\d+\\.\\d+).*", "\\1", rver)
  stopifnot("Invalid R version" = grepl("^\\d+\\.\\d+$", ver)) # nolint: nonportable_path_linter
  switch(type,
    src = sprintf("%s/api/snapshot/zip?types=src", repo), # nolint: nonportable_path_linter
    win = sprintf("%s/api/snapshot/zip?types=win&binaries=%s", repo, ver),
    mac = sprintf("%s/api/snapshot/zip?types=mac&binaries=%s", repo, ver),
    linux = sprintf("%s/api/snapshot/zip?types=linux&binaries=%s", repo, ver),
    stop("Invalid type: ", type)
  )
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
