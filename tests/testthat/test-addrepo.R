test_that("add() works", {
  repos <- add("ropenscilabs")
  expect_true("ropenscilabs" %in% rownames(repos))
  remove("ropenscilabs")
  expect_false("ropenscilabs" %in% names(getOption("repos")))
})
