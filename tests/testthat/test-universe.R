test_that("universe_ls() works", {
  httptest2::with_mock_dir("univ-ls", {
    packages <- universe_ls("maelle")
  })
  expect_type(packages, "character")
  expect_gt(length(packages), 0L)
})

test_that("universe_all_packages() works", {
  httptest2::with_mock_dir("univ-packages", {
    packages <- universe_all_packages("maelle", limit = 1L)
  })
  expect_type(packages, "list")
  expect_gt(length(packages), 0L)
})

test_that("universe_one_package() works", {
  httptest2::with_mock_dir("univ-package", {
    packages <- universe_one_package("jeroen", package = "curl")
  })
  expect_type(packages, "list")
  expect_gt(length(packages), 0L)
})

test_that("universe_one_package() errors well", {
  expect_snapshot(error = TRUE, {
    universe_one_package("jeroen", package = "shiny")
  })
})

test_that("universe_search() works", {
  httptest2::with_mock_dir("univ-search", {
    packages <- universe_search("ropensci", query = "needs:gert", limit = 1L)
  })
  expect_type(packages, "list")
  expect_gt(length(packages), 0L)
})
