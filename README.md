# Estimating_flows_from_censuses
This repository contains data and code related to the paper "Estimating annual bilateral migrant flows in South America through correcting for measurement errors in census data". The files are:

"synthetic_data.csv"
Due to data policies, this repository does not contain the original data. Instead of this information, synthetic data is provided, for which the R code is also given.

"Rcode_creating_synthetic_data.R"
Code for creating "synthetic_data.csv"

"Rcode_model.R"
R code to run JAGS code and obtain chains, summary statistics, prfs and ESS of parameters.

"JAGS_code_model.txt"
This file contains the code of model in JAGS.

"true_flows_estimates.csv"
Dataset of 5610 observations and six variables (Origin, Destination, year, mean_trueflows, q2.5_trueflows, q97.5_trueflows).


