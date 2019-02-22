# Remove first column of rawcashflows.csv
cashflows_to_use = rawcashflows[-1]

# Sum the rows of the rawcashflow table and store them in the variable cashflows
cashflows = apply(cashflows_to_use, 1, sum)

# Convert cashflows to a time series object (monthly frequency starting 01/2019)
cashflows = ts(cashflows, start=c(2019,1), frequency=12)
