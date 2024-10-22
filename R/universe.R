#' All packages in an universe
#'
#' @inheritParams universe_search
#'
#' @return A character vector of all packages in the universe.
#' @export
#'
#' @examplesIf interactive()
#' universe_ls("jeroen")
#' universe_ls("ropensci")
#' @family universe
universe_ls <- function(universe) {
  assert_character(universe, "universe")
  # TODO assert that universe is an universe

  universe_query(
    universe_url = sprintf("https://%s.r-universe.dev", universe),
    path = "ls"
  ) |>
    unlist()
}


#' Info on all packages in an universe
#'
#' @inheritParams universe_search
#'
#' @return A list with information on all packages in the universe.
#' @export
#'
#' @examplesIf interactive()
#' universe_all_packages("jeroen")
#' universe_all_packages("ropensci")
#' @family universe
universe_all_packages <- function(universe, limit = 100L) {
  assert_character(universe, "universe")
  # TODO assert that universe is an universe

  universe_query(
    universe_url = sprintf("https://%s.r-universe.dev", universe),
    path = "packages",
    query_params = list(limit = limit)
  )
}


#' Info on a single packages in an universe
#'
#' @inheritParams universe_search
#' @param package Name of the package (character of length 1)
#'
#' @return A list with information on the package.
#' @export
#'
#' @examplesIf interactive()
#' universe_one_package("jeroen", package = "curl")
#' @family universe
universe_one_package <- function(universe, package) {
  assert_character(universe, "universe")
  assert_character(package, "package")
  # TODO assert that universe is an universe

  if (!package %in% universe_ls(universe)) {
    cli::cli_abort("Can't find package {package} in universe {universe}.")
  }

  universe_query(
    universe_url = sprintf("https://%s.r-universe.dev", universe),
    path = sprintf("packages/%s", package), # nolint: nonportable_path_linter
  ) # nolint: missing_argument_linter
}

#' Search within a single universe
#'
#' @param universe Name of the universe (character of length 1)
#' @param query Query string.
#' See [R-universe docs](https://docs.r-universe.dev/browse/search.html).
#' @param limit Number of results to return (integer of length 1)
#'
#' @return A list with query results. The `total` field indicates the
#' total number of results and can be used as `limit` value in a second call.
#' @export
#'
#' @examplesIf interactive()
#' universe_search("ropensci", query = '"weather data"')
#' universe_search("ropensci", query = 'needs:httr2')
#' @family universe
universe_search <- function(universe, query, limit = 100L) {
  assert_character(universe, "universe")
  assert_character(query, "query")
  # TODO assert that universe is an universe

  universe_query(
    universe_url = sprintf("https://%s.r-universe.dev", universe),
    path = "search",
    query_params = list(q = query, limit = limit)
  )
}
