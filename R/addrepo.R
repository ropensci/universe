#' Enable a universe
#'
#' Add r-universe package repositories to your `options("repos")` such
#' that they are enabled by default in `install.packages()`. This is not
#' permanent, so you need to save this in your `~/.Rprofile` in order to
#' automatically enable this for every R session.
#'
#' @export
#' @param universe vector with name(s) of the universe(s), i.e. the subdomain
#' part of `https://ropensci.r-universe.dev`.
#' @returns the updated list of repositories
add <- function(universe = 'ropensci') {
  repos <- getOption("repos")
  # R-universe depends on CRAN
  if(is.na(repos['CRAN'])){
    repos <- c(repos, CRAN = 'https://cloud.r-project.org')
  }
  for (x in universe){
    name <- gsub("\\W", "", universe)
    url <- structure(sprintf("https://%s.r-universe.dev/", universe), names = name)
    if(is.na(repos[name])){
      repos <- c(url, repos) # prepend
    } else {
      repos[name] <- url
    }
  }
  options(repos = repos)
  as.data.frame(repos)
}
