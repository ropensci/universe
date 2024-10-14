test_that("universe_search() works", {
  httptest2::with_mock_dir("global-search", {
    packages <- global_search(query = "needs:gert", limit = 1L)
  })
  expect_type(packages, "list")
  expect_gt(length(packages), 0L)
})
