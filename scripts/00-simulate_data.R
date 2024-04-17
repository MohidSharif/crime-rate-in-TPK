#### Preamble ####
# Purpose: Simulates... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
# Set the seed for reproducibility
set.seed(93)

# Simulate data
crimes <- runif(n = 100, min = 0, max = 200)

# Create the simulated data frame
simulated_data <- data.frame(
  Crimes = crimes
)

### Save simulated data ###
write_csv(simulated_data, "~/crime-rate-in-TPK/data/simulated_data.csv")
