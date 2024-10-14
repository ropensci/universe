#' Query the API of a single universe
#'
#' @param universe_url URL to the universe like ""https://jeroen.r-universe.dev"
#' @param path Path to append after api like "ls"
#' @param query_params Named list of query parameters
#'
#' @return The JSON from the API as a list
#' @dev
#'
universe_query <- function(universe_url, path, query_params = NULL) {
  request <- httr2::request(universe_url) |>
    httr2::req_url_path("api") |>
    httr2::req_url_path_append(path) |>
    httr2::req_user_agent("starchart R package")

  if (!is.null(query_params)) {
    request <- httr2::req_url_query(request, !!!query_params)
  }

  httr2::req_perform(request) |>
    httr2::resp_body_json()
}

assert_character <- function(x, name, call = rlang::caller_env()) {
  if (!is.character(x) || length(x) != 1L) {
    cli::cli_abort("{.arg name} must be a character of length 1.", call = call)
  }
}
