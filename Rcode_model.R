
########################################################
# Estimating annual migrant flows based on censuses
# Script for running JAGS model from R
########################################################

########################################################
#Installing packages
########################################################
#install.packages("dclone")
library("dclone")
#install.packages("parallel")
library("parallel")
#install.packages("rjags")
library("rjags")
library("R2jags")
library("runjags")
#install.packages("coda")
library("coda")

########################################################
#Loading data
########################################################
census_data_model <- read.csv(file="./synthetic_data.csv", header=TRUE, sep=",")


########################################################
#Running model
########################################################
rm(cl, tmp, s0, s1)
(s0 <- Sys.time())
cl <- makePSOCKcluster(n = 3)
tmp <- clusterEvalQ(cl, library(dclone))
parLoadModule(cl, "glm")
parLoadModule(cl, "lecuyer")
parLoadModule(cl, "dic")

coda.complMM <- jags.parfit(cl = cl,
                            data = census_data_model, 
                            params = c("sigma_z1", "sigma_mu_z1",
                                       "alpha",
                                       "beta", 
                                       "sigma_int", "sigma_slope1", "sigma_res", 
                                       "deviance"), 
                            #Include path where "JAGS_code_model.txt" file is
                            model = "./JAGS_code_model.txt",   
                            n.chains = 3, 
                            n.adapt = 50000, 
                            n.update = 50000,
                            n.iter = 550000, 
                            thin = 500)

coda.trueflows <- jags.parfit(cl = cl,
                              data = census_data_model, 
                              params = c("y"), 
                              model = "census_model.txt", 
                              n.chains = 3, 
                              n.adapt = 50000, 
                              n.update = 50000,
                              n.iter = 550000, 
                              thin = 500)
s1 <- Sys.time() - s0
s1
stopCluster(cl)


########################################################
#Getting summary, prfs and ESS of parameters
########################################################
summary(coda.complMM)

#prfs
gelman.diag(coda.complMM, confidence = 0.95, transform=FALSE, autoburnin=TRUE, multivariate = TRUE)

#ESS
effectiveSize(coda.complMM)


########################################################
#Obtaining chains of parameters
########################################################
mod_complMM = as.mcmc(do.call(rbind, coda.complMM))
mod_complflows = as.mcmc(do.call(rbind, coda.trueflows))

