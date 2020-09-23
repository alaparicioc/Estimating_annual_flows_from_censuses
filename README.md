# A Bayesian Approach to Estimate Annual Bilateral Migration Flows for South America Using Census Data

Andrea Aparicio-Castro<sup>1*</sup>, Arkadiusz Wi\'{s}niowski<sup>1</sup>, [Francisco Rowe](http://www.franciscorowe.com)[[`@fcorowe`](http://twitter.com/fcorowe)]<sup>2</sup>

<sup>1</sup> *University of Manchester, Manchester, United Kingdom*

<sup>2</sup> *Geographic Data Science Lab, University of Liverpool, Liverpool, United Kingdom*

This repository contains data and code implement the methodology proposed in our paper. It contains the following files:

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


