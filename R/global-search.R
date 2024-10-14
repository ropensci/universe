#' Search among all universes
#'
#' @inheritParams universe_search
#'
#' @return A list with query results. The `total` field indicates the
#' total number of results and can be used as `limit` value in a second call.
#' @export
#'
#' @examplesIf interactive()
#' global_search(query = '"weather data"', limit = 1)
#' global_search(query = 'needs:httr2', limit = 1)
global_search <- function(query, limit = 100L) {
  assert_character(query, "query")

  httr2::request("https://r-universe.dev") |>
    httr2::req_url_path("api") |>
    httr2::req_url_path_append("search") |>
    httr2::req_user_agent("starchart R package") |>
    httr2::req_url_query(limit = limit, q = query) |>
    httr2::req_perform() |>
    httr2::resp_body_json()
}
