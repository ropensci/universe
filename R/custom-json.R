#' Create `packages.json` for existing universe
#'
#' @param universe
#'
#' @returns The path to the JSON file it created.
#'
#' @export
#' @examplesIf rlang::is_interactive()
#' json_file <- withr::local_tempfile()
#' use_custom_manifest("jeroen", json_file)
#' file.edit(json_file)
use_custom_manifest <- function(universe, path = "packages.json") {
  universe::universe_all_packages(universe) |>
    lapply(`[`, c("Package", "RemoteUrl")) |>
    lapply(setNames, c("package", "url")) |>
    jsonlite::write_json(path, pretty = 2, auto_unbox = TRUE)

  path
}
