#' Download snapshot
#'
#' Downloads a full copy (snapshot) of an R package repository.
#'
#' @export
#' @rdname snapshot
#' @param repo url of the cran-like repository to snapshot
#' @param bin_versions vector with versions of R to download the win/mac binary
#' packages. The default is to download binaries only for your local version.
#' Set to NULL to not download any binaries.
#' @examples
#' repo_snapshot(
#'   "https://jeroen.r-universe.dev",
#'    bin_versions = c("4.1", "4.2", "4.3")
#' )
repo_snapshot <- function(repo, destdir = "snapshot", bin_versions = r_version()) { # nolint: line_length_linter
  unlink(destdir, recursive = TRUE)
  dir.create(destdir, showWarnings = FALSE, recursive = TRUE)
  download_single_repo(contrib_path(repo, "src"), contrib_path(destdir, "src"), "src") # nolint: line_length_linter
  for (rver in unique(major_version(as.character(bin_versions)))) {
    download_single_repo(contrib_path(repo, "win", rver), contrib_path(destdir, "win", rver), "win") # nolint: line_length_linter
    download_single_repo(contrib_path(repo, "mac", rver), contrib_path(destdir, "mac", rver), "mac") # nolint: line_length_linter
  }
  list.files(destdir, recursive = TRUE)
}

download_single_repo <- function(url, destdir, type = "src") {
  unlink(destdir, recursive = TRUE)
  dir.create(destdir, showWarnings = FALSE, recursive = TRUE)
  withr::local_dir(destdir)
  message("Mirroring repo: ", url)
  con <- curl::curl(file.path(url, "PACKAGES"))
  on.exit(close(con), add = TRUE)
  df <- as.data.frame(read.dcf(con), stringsAsFactors = FALSE)
  if (nrow(df) == 0L) {
    warning("Repository is empty: ", url)
    return(df)
  }
  writeLines(sprintf("Mirror from %s at %s", url, as.character(Sys.time())), "timestamp.txt") # nolint: line_length_linter
  df[["fileurl"]] <- paste0(url, "/", pkg_file(df[["Package"]], df[["Version"]], type)) # nolint: paste_linter
  pkgfiles <- paste0(url, "/", c("PACKAGES", "PACKAGES.gz", "PACKAGES.rds")) # nolint: paste_linter
  results <- curl::multi_download(c(pkgfiles, df$fileurl))
  unlink(results$destfile[results$status_code != 200])
  outfiles <- basename(df$fileurl)
  failed <- outfiles[!file.exists(outfiles)]
  if (any(failed)) {
    stop("Downloading failed for some files: ", paste(failed, collapse = ", "))
  }
  if (length(df$MD5sum)) {
    checksum <- unname(tools::md5sum(outfiles))
    stopifnot(all.equal(checksum, df$MD5sum))
  } else {
    message("Skipping MD5sum checks for this repo")
  }
  df
}

pkg_file <- function(package, version, type) {
  ext <- switch(type,
    src = "tar.gz",
    win = "zip",
    mac = "tgz",
    stop("Invalid pkg type")
  )
  sprintf("%s_%s.%s", package, version, ext)
}

contrib_path <- function(repo, type = "src", rver = getRversion()) {
  ver <- sub("(\\d+\\.\\d+).*", "\\1", rver)
  stopifnot("Invalid R version" = grepl("^\\d+\\.\\d+$", ver))
  switch(type,
    src = sprintf("%s/src/contrib", repo),
    win = sprintf("%s/bin/windows/contrib/%s", repo, ver),
    mac = sprintf("%s/bin/macosx/contrib/%s", repo, ver),
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
