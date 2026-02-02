test_that("use_universe_action() works", {
  skip_if_offline()
  dir <- withr::local_tempdir()
  workflow_path <- use_universe_action("maelle", dir)
  expect_snapshot_file(workflow_path)
})
