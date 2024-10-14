#' Enable a package repository from r-universe
#'
#' Adds r-universe package repositories to your `options("repos")` such
#' that they are used by default in `install.packages()`. If the universe
#' was already enabled, it will not be added again, hence it is harmless
#' to call this function multiple times.
#'
#' Note that changes to your options are not permanent. To automatically
#' enable a repository for every R session, you can call this function in
#' your [`~/.Rprofile`][Startup] script.
#'
#' @export
#' @rdname add
#' @param universe vector with name(s) of the universe(s), i.e. the subdomain
#' part of `https://ropensci.r-universe.dev`.
#' @returns the updated list of repositories
add <- function(universe = "ropensci") {
  repos <- getOption("repos")
  # r-universe packages depend on CRAN
  cran <- repos[["CRAN"]]
  if (is.na(cran)) {
    repos <- c(repos, CRAN = "https://cloud.r-project.org")
  } else if (cran == "@CRAN@") {
    repos[["CRAN"]] <- "https://cloud.r-project.org"
  }
  for (x in universe) {
    name <- gsub("\\W", "", universe)
    url <- structure(sprintf("https://%s.r-universe.dev/", universe), names = name)
    if (is.na(repos[name])) {
      repos <- c(url, repos) # prepend
    } else {
      repos[name] <- url
    }
  }
  options(repos = repos)
  as.data.frame(repos)
}

#' @export
#' @rdname add
remove <- function(universe) {
  repos <- getOption("repos")
  repos <- repos[names(repos) != universe]
  options(repos = repos)
  as.data.frame(repos)
}
