# A Bayesian Approach to Estimate Annual Bilateral Migration Flows for South America Using Census Data

[![DOI](https://zenodo.org/badge/280670652.svg)](https://zenodo.org/record/4054958)

Andrea Aparicio-Castro<sup>1*</sup>, [Arkadiusz Wiśniowski](https://www.research.manchester.ac.uk/portal/a.wisniowski.html)<sup>1</sup>, [Francisco Rowe](http://www.franciscorowe.com)[[`@fcorowe`](http://twitter.com/fcorowe)]<sup>2</sup>

<sup>1</sup> *University of Manchester, Manchester, United Kingdom*

<sup>2</sup> *Geographic Data Science Lab, University of Liverpool, Liverpool, United Kingdom*

<sup>*</sup> *Corresponding author: andrea.apariciocastro@manchester.ac.uk*

This repository contains data and code implementing the methodology proposed in our paper, in addition to selected outputs. It contains three folders and the following files:

## **data**

> `synthetic_data.csv`:
Synthetic dataset to be used as input data for the model. Data use copyrights prevents from sharing the original data used for the modelling. However the original data can be obtained from different sources (see `Data sources.pdf`). Here we provide a synthetic dataset which is similar in structure to the original dataset. 

> `Data sources.pdf`:
Document which list the sources of input data for estimating true migration flows. 



## **code**

> `Rcode_creating_synthetic_data.R`:
R code to create the synthetic dataset in `synthetic_data.csv`.

> `JAGS_code_model.txt`:
Text file containing [JAGS](http://mcmc-jags.sourceforge.net) code to estimate sub-models in Equations 3, 4 and 5 of the main body.

> `Rcode_model.R`:
R code to run the JAGS code and obtain chains, summary statistics, Potential scale reduction factors (prfs) and Effective Sample Sizes (ESS) of parameters.



## **output**

> `true_flows_estimates.csv`:
Our estimated true migration flows comprise a dataset of 5610 observations and six variables (Origin, Destination, year, mean_trueflows, q2.5_trueflows, q97.5_trueflows).

To estimate true migration flows, execute the `Rcode_model.R` which calls the input data `synthetic_data.csv` and code from JAGS `JAGS_code_model.txt`. Bear in mind that the resulted MCMC file for the measurement error sub-model is around 57KB, while the file which contains the true flow chains is approximately 5000KB. The model takes nearly 1.2 hours to run with default settings.


