test_that("add() works", {
  add("ropenscilabs")
  expect_true("ropenscilabs" %in% names(getOption("repos")))
  remove("ropenscilabs")
  expect_false("ropenscilabs" %in% names(getOption("repos")))
})
