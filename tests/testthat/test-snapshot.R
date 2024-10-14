test_that("repo_snapshot() works", {
  expect_true("ropenscilabs" %in% names(getOption("repos")))
  destdir <- withr::local_tempdir()
  suppressMessages(
    repo_snapshot("https://maelle.r-universe.dev", destdir = destdir)
  )
  expect_true(fs::dir_exists(fs::path(destdir, "bin", "macosx", "contrib")))
  expect_true(fs::dir_exists(fs::path(destdir, "bin", "windows", "contrib")))
  expect_true(fs::dir_exists(fs::path(destdir, "src", "contrib")))

})
