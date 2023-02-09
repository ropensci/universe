#' Download snapshot
#'
#' Downloads a full copy (snapshot) of an R package repository.
#'
#' @export
#' @rdname snapshot
#' @param repo url of the cran-like repository to snapshot
#' @param bin_versions vector with versions of R to download the win/mac binary
#' packages. The default is to download binaries only for the current version.
#' Set to NULL to not download any binaries.
#' @examples repo_snapshot('https://jeroen.r-universe.dev', bin_versions = c("4.1", "4.2", "4.3"))
repo_snapshot <- function(repo, destdir = 'snapshot', bin_versions = r_version()){
  unlink(destdir, recursive = TRUE)
  dir.create(destdir, showWarnings = FALSE, recursive = TRUE)
  download_single_repo(contrib_path(repo, 'src'), contrib_path(destdir, 'src'), 'src')
  for(rver in unique(major_version(as.character(bin_versions)))){
    download_single_repo(contrib_path(repo, 'win', rver), contrib_path(destdir, 'win', rver), 'win')
    download_single_repo(contrib_path(repo, 'mac', rver), contrib_path(destdir, 'mac', rver), 'mac')
  }
  list.files(destdir, recursive = TRUE)
}

download_single_repo <- function(url, destdir, type = 'src'){
  unlink(destdir, recursive = TRUE)
  dir.create(destdir, showWarnings = FALSE, recursive = TRUE)
  withr::local_dir(destdir)
  out <- curl::multi_download(file.path(url, c("PACKAGES", "PACKAGES.gz")), progress = FALSE)
  if(out$status_code[1] != 200)
    stop("Failed to download PACKAGES file")
  df <- as.data.frame(read.dcf('PACKAGES'), stringsAsFactors = FALSE)
  if(nrow(df) == 0){
    warning("Repository is empty: ", url)
    return(df)
  }
  df$fileurl <- paste0(url, '/', pkg_file(df$Package, df$Version, type))
  out2 <- curl::multi_download(df$fileurl)
  df$checksum <- tools::md5sum(basename(df$fileurl))
  stopifnot(all.equal(df$checksum, df$MD5sum))
  df
}

pkg_file <- function(package, version, type){
  ext <- switch(type, src = 'tar.gz', win = 'zip', mac = 'tgz', stop("Invalid pkg type"))
  sprintf('%s_%s.%s', package, version, ext)
}

contrib_path <- function(repo, type = 'src', rver = getRversion()){
  ver <- sub("(\\d+\\.\\d+).*", "\\1", rver)
  stopifnot("Invalid R version" = grepl('^\\d+\\.\\d+$', ver))
  switch(type,
         src = sprintf("%s/src/contrib", repo),
         win = sprintf("%s/bin/windows/contrib/%s", repo, ver),
         mac = sprintf("%s/bin/macosx/contrib/%s", repo, ver),
         stop("Invalid type: ", type))
}

download_file_verbose <- function(url){
  cat("Downloading:", url, "\n", file = stderr())
  curl::curl_download(url, basename(url), quiet = TRUE)
}

#' @export
#' @rdname snapshot
r_version <- function(){
  major_version(getRversion())
}

major_version <- function(str){
  sub("^(\\d+\\.\\d+).*", "\\1", str)
}
