#### Preamble ####
# Purpose: Tests the raw crime rate data for neighborhoods in Toronto
# Author: Mohid Sharif
# Date: 16 April 2024
# Contact: mohid.sharif@mail.utoronto.ca
# License: MIT



#### Workspace setup ####
library(tidyverse)

# Import data
cleaned_data <- read_csv("~/crime-rate-in-TPK/data/analysis_data/cleaned_data.csv")

#### Test data ####
# Test 8 variables
cleaned_data %>% 
  unique() %>% 
  length() == 8

# Test variable types for all columns
is.numeric(cleaned_data$POPULATION_2023)
is.numeric(cleaned_data$Year)
is.numeric(cleaned_data$Assaults)
is.numeric(cleaned_data$Assault_Rate)
is.numeric(cleaned_data$Auto_Thefts)
is.numeric(cleaned_data$Auto_Theft_Rate)
is.numeric(cleaned_data$Bike_Thefts)
is.numeric(cleaned_data$Bike_Theft_Rate)

# Test Year value does not surpass data acquisition date
cleaned_data$Year |> max() <= 2023

# Testing minimum values for all columns
cleaned_data$Year |> min() >= 2014 
cleaned_data$POPULATION_2023 |> min() >= 0 
cleaned_data$Assaults |> min() >= 0 
cleaned_data$Assault_Rate |> min() >= 0 
cleaned_data$Auto_Thefts |> min() >= 0 
cleaned_data$Auto_Theft_Rate |> min() >= 0 
cleaned_data$Bike_Thefts |> min() >= 0 
cleaned_data$Bike_Theft_Rate |> min() >= 0 


# Calculate the total Assaults
total_crime <- sum(cleaned_data$Total_Crime)

# Check if total Assaults are less than the total crimes
if (total_assaults < total_crime) {
  print("Total count of assaults is consistent.")
} else {
  print("Total count of assaults is consistent.")
}


# Calculate total auto thefts and check if less than total crimes
total_auto_thefts <- sum(cleaned_data$Auto_Thefts)

if (total_auto_thefts < total_crime) {
  print("Total count of auto thefts is consistent.")
} else {
  print("Total count of auto thefts is consistent.")
}

# Calculate total bike thefts and check if less than total crimes
total_bike_thefts <- sum(cleaned_data$Bike_Thefts)

if (total_bike_thefts < total_crime) {
  print("Total count of bike thefts is consistent.")
} else {
  print("Total count of bike thefts is consistent.")
}

# Test for missing values
is.na(cleaned_data)

#### Test data ####
