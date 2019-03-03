# Give tests in this file a name
context("Basic checks")

# Test data
test_that("Correct business lines are included", {
  expect_equal(ncol(cashflows_to_use), 6)
})

# Test discount() helper function
test_that("discount() works correctly", {
  # Discount 3 payments of 1,000 at 5% p.a.
  expect_equal(discount(c(1000, 1000, 1000), 0.05, 1), 
               1000*(1.05^-0.5 + 1.05^-1.5 + 1.05^-2.5))
  # Discount 3 payments of 1,000 (paid monthly) at 3% p.a.
  expect_equal(discount(c(1000, 1000, 1000), 0.03, 12), 
               1000*(1.03^-(1/24) + 1.03^-(1/12 + 1/24) + 1.03^-(2/12 + 1/24)))
  # Discount 10 payments of 1,000 at 0%
  expect_equal(discount(rep(1000, 10), 0, 1), 
               10000)
})