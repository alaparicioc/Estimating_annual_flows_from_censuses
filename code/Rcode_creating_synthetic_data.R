

########################################################
# Estimating annual migrant flows based on censuses
# Script for creating synthetic data
# The parameters (e.g. mean, sd) to generate the variables were taken from the logarithm transformation of original data
########################################################


########################################################
#Installing packages
########################################################
install.packages("tidyverse",repos="https://cran.rstudio.com/")
library("tidyverse")


########################################################
#Creating dataset
########################################################
data <- data.frame(Origin = rep(c("Argentina", "Bolivia", "Brazil", "Chile", "Colombia",
                   "Ecuador", "Paraguay", "Peru", "Uruguay", "Venezuela",
                   "USA", "Spain", "Canada", 
                   "America", "Africa", "Asia", "Europe", "Oceania"), times = 10*33), 
    
                    Destination = rep(c("Argentina", "Bolivia", "Brazil", "Chile", "Colombia",
                                        "Ecuador", "Paraguay", "Peru", "Uruguay", "Venezuela"), each = 18*33),
    
                    year = rep(seq(0.0, 3.2, 0.1),each = 180)) %>%
        mutate(equal = case_when(Origin=="Argentina" & Destination=="Argentina" ~ 1,
                                 Origin=="Bolivia" & Destination=="Bolivia" ~ 1,
                                 Origin=="Brazil" & Destination=="Brazil" ~ 1,
                                 Origin=="Chile" & Destination=="Chile" ~ 1,
                                 Origin=="Colombia" & Destination=="Colombia" ~ 1,
                                 Origin=="Ecuador" & Destination=="Ecuador" ~ 1,
                                 Origin=="Paraguay" & Destination=="Paraguay" ~ 1,
                                 Origin=="Peru" & Destination=="Peru" ~ 1,
                                 Origin=="Uruguay" & Destination=="Uruguay" ~ 1,
                                 Origin=="Venezuela" & Destination=="Venezuela" ~ 1)) %>%
        filter(is.na(equal)) %>%
        select(-equal) %>%
        mutate( N = 1:5610,
                corridor = rep(1:170, 33),
                z1 = rnorm(5610, 6.077116, 1.847595),
                dejure_dummy = rbinom(5610, 1, 0.1545455),
                infants = rnorm(5610, 1.447062, 2.074823),
                deaths = rnorm(5610, 0.6463813, 1.110767),
                birthplace_dummy = rbinom(5610, 1, 0.03030303),
                quality = round(runif(5610, min=1, max=3),0),
                cont_dummy = rbinom(5610, 1, 0.4588235),
                popS = rnorm(5610, 17.89646, 1.842942),
                popR = rnorm(5610, 16.7426, 1.087684),
                mstS = rnorm(5610, 7.943175, 2.83784),
                mstR = rnorm(5610, 8.572157, 2.802852),
                imports = rnorm(5610, 18.11505, 2.455275),
                exports = rnorm(5610, 17.97785, 2.57191),
                GDPS = rnorm(5610, 8.93778, 1.160697),
                GDPR = rnorm(5610, 8.231183, 0.8102602),
                unempS = rnorm(5610, 1.999577, 0.4944329),
                unempR = rnorm(5610, 1.964058, 0.5059999),
                pvS = rnorm(5610, -0.8263517, 1.069382),
                pvR = rnorm(5610, -1.28454, 1.472675),
                schoolyS = rnorm(5610, 2.049354, 0.3018728),
                schoolyR = rnorm(5610, 1.992985, 0.2235001),
                lifeexpectancyS = rnorm(5610, 4.274663, 0.09143093),
                lifeexpectancyR = rnorm(5610, 4.274941, 0.06467103),
                language_dummy = rbinom(5610, 1, 0.5294118))

########################################################
#Saving dataset
########################################################
write.csv(data, "./synthetic_data.csv")




