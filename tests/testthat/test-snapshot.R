test_that("repo_snapshot() works", {
  destdir <- withr::local_tempdir()
  suppressMessages(
    repo_snapshot("https://maelle.r-universe.dev", destdir = destdir)
  )
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
