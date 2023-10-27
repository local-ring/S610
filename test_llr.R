context("Check local linear regression function")
source("llr_functions.R")



n = 15
## a very simple regression model
x = rnorm(n)
y = rnorm(x + rnorm(n))
z = seq(-1, 1, length.out = 100)
test_that("llr output has correct length", {
  expect_equal(length(llr(x, y, z, omega = 1)), length(z))
})


test_that("make_weight_matrix works on simple cases", {
  ## check that the output is a diagonal matrix, that all the elements are positive, 
  ## that the weights are correct in simple cases where you know what the output should be
  W = make_weight_matrix(c(1,2,3), c(9,12,15), 2)
  expect_equal(ncol(W), 3)
  expect_equal(nrow(W), 3)
  expect_true(all(diag(W) >= 0))
  expect_equal(diag(W), c(4,5,6))
  expect_true(all(W[lower.tri(W)] == 0))
  expect_true(all(W[upper.tri(W)] == 0))
  
})

test_that("make_predictor_matrix works on simple cases", {
  ## write tests to check that the dimensions are correct, the first column is all 1's, etc.
  X = make_predictor_matrix(c(2,3,4))
  expect_equal(ncol(X), 2)
  expect_equal(nrow(X), 3)
  expect_true(all(X[,1] == 1))
  expect_true(all(X[,2] == c(2,3,4)))
  
  
})