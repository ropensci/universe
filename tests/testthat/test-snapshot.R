test_that("repo_snapshot() works", {
  destdir <- withr::local_tempdir()
  repo_snapshot("https://maelle.r-universe.dev", destdir = destdir, bin_versions = NULL)
  expect_true(fs::dir_exists(fs::path(
    destdir,
    "bin",
    "macosx",
    "big-sur-arm64",
    "contrib"
  )))
  expect_true(fs::dir_exists(fs::path(destdir, "bin", "windows", "contrib")))
  expect_true(fs::dir_exists(fs::path(destdir, "bin", "linux")))
  expect_true(fs::dir_exists(fs::path(destdir, "src", "contrib")))
})
