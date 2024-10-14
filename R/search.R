#' Search the R universe
#'
#' Free text search through package titles, authors, description, topics, etc.
#'
#' The parameters and output fields are subject to change.
#'
#' @export
#' @param q string to search for. Wrap in double quotes to get exact matches.
#' @param universe which universe to target. Default is all universes.
#' @param ... extra parameters subject to change.
#' @returns dataframe with description data
ru_search <- function(q, universe = NULL, ...) {
  params <- c(q = q, all = TRUE, ...)
  perform_request(universe, "search", params)
}

perform_request <- function(universe, endpoint, params, verbose = FALSE) {
  url <- if (length(universe)) {
    sprintf("https://%s.r-universe.dev/api/%s", universe, endpoint)
  } else {
    sprintf("https://r-universe.dev/api/%s", endpoint)
  }
  if (length(params)) {
    query <- paste(names(params), curl::curl_escape(params), sep = "=", collapse = "&")
    url <- paste0(url, "?", query)
  }
  df <- jsonlite::stream_in(con = curl::curl(url), verbose = verbose)
  tibble::as_tibble(df)
}
