# A Bayesian Approach to Estimate Annual Bilateral Migration Flows for South America Using Census Data

Andrea Aparicio-Castro<sup>1*</sup>, Arkadiusz Wi\'{s}niowski<sup>1</sup>, [Francisco Rowe](http://www.franciscorowe.com)[[`@fcorowe`](http://twitter.com/fcorowe)]<sup>2</sup>

<sup>1</sup> *University of Manchester, Manchester, United Kingdom*

<sup>2</sup> *Geographic Data Science Lab, University of Liverpool, Liverpool, United Kingdom*

This repository contains data and code implement the methodology proposed in our paper. It contains three folders and the following files:

* `data':

  > `synthetic_data.csv`
synthetic dataset to be used as input data for the model. Data use copyrights prevents from sharing the original data used for the modelling. However the original data can be obtained from: [list source and website]. Here we provide a synthetic dataset which is similar in structure to the original dataset. 

* `code':

> `Rcode_creating_synthetic_data.R'
R code to create the synthetic dataset in `synthetic_data.csv'

> `JAGS_code_model.txt'
Text file containing [JAGS](http://mcmc-jags.sourceforge.net) code to estimate models [identify the place of the model(s) in the paper i.e. equation number or/and page].

> `Rcode_model.R'
R code to run the JAGS code and obtain chains, summary statistics, prfs and ESS[write in full] of parameters.

* `output'

> `true_flows_estimates.csv'[I am assuming this is the set of estimates you produced. If so, make this clearer]
dataset of 5610 observations and six variables (Origin, Destination, year, mean_trueflows, q2.5_trueflows, q97.5_trueflows).

[Here would be good to add how the files should be used. Indicate the order in which they should be used first. Could also indicate this with a number at the end of the file name.]


