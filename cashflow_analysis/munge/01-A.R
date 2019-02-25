# Extract cashflows for analysis
cashflows_to_use = rawcashflows[-1]

# Sum the rows of the cashflows_to_use table and store them in cashflows
cashflows = apply(cashflows_to_use, 1, sum)

# Convert cashflows to a time series object (monthly frequency starting 01/2019)
cashflows = ts(cashflows, start=c(2019,1), frequency=12)
