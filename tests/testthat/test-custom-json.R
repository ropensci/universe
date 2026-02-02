test_that("use_custom_manifest() works", {
  json_file <- withr::local_tempfile()
  httptest2::with_mock_dir("custom-manifest", {
    json_file <- use_custom_manifest("maelle", json_file)
  })

  expect_snapshot_file(json_file, name = "packages.json")
})
