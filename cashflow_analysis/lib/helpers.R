# discount(cashflows, disc, freq)
# Helper function to calculate the present value of a vector of cashflows.
# cashflows = input vector of cashflows
# disc = discount rate
# freq = payment frequency p.a. of cashflows e.g. 1 is annual, 12 is monthly
discount = function(cashflows, disc, freq) {
  t = 1:length(cashflows) - 0.5
  D = (1 + disc)^-(t/freq)
  pv = as.numeric(cashflows %*% D)
}