#### Preamble ####
# Purpose: Cleans the raw crime rate data for neighborhoods in Toronto
# Author: Mohid Sharif
# Date: 16 April 2024
# Contact: mohid.sharif@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)

#### Clean data ####

# Import data
raw_data <- read_csv("~/crime-rate-in-TPK/data/raw_data/raw_data.csv")

# Filtere for only Thorncliffe Park
cleaned_data <-
  raw_data |>
  filter(AREA_NAME == "Thorncliffe Park")

# Gather data of Assaults of each year
cleaned_data1 <- 
  cleaned_data |>
  select(POPULATION_2023, ASSAULT_2014:ASSAULT_2023) |>
  gather("Year", "Assaults", ASSAULT_2014:ASSAULT_2023)

# Gather data of Auto Thefts of each year
cleaned_data2 <- 
  cleaned_data |>
  select(AUTOTHEFT_2014:AUTOTHEFT_2023) |>
  gather("Year1", "Auto_Thefts", AUTOTHEFT_2014:AUTOTHEFT_2023)

# Gather data of Bike Thefts of each year
cleaned_data3 <- 
  cleaned_data |>
  select(BIKETHEFT_2014:BIKETHEFT_2023) |>
  gather("Year2", "Bike_Thefts", BIKETHEFT_2014:BIKETHEFT_2023)

# Gather data of Assault Rate of each year
cleaned_data4 <- 
  cleaned_data |>
  select(ASSAULT_RATE_2014:ASSAULT_RATE_2023) |>
  gather("Year3", "Assault_Rate", ASSAULT_RATE_2014:ASSAULT_RATE_2023)

# Gather data of Auto Theft rate of each year
cleaned_data5 <- 
  cleaned_data |>
  select(AUTOTHEFT_RATE_2014:AUTOTHEFT_RATE_2023) |>
  gather("Year4", "Auto_Theft_Rate", AUTOTHEFT_RATE_2014:AUTOTHEFT_RATE_2023)

# Gather data of Bike Theft rate of each year
cleaned_data6 <- 
  cleaned_data |>
  select(BIKETHEFT_RATE_2014:BIKETHEFT_RATE_2023) |>
  gather("Year5", "Bike_Theft_Rate", BIKETHEFT_RATE_2014:BIKETHEFT_RATE_2023)

# Combine all data sets from above
cleaned_data1 <- cbind(cleaned_data1, cleaned_data2)
cleaned_data1 <- cbind(cleaned_data1, cleaned_data3)
cleaned_data1 <- cbind(cleaned_data1, cleaned_data4)
cleaned_data1 <- cbind(cleaned_data1, cleaned_data5)
cleaned_data1 <- cbind(cleaned_data1, cleaned_data6)

# Remove duplicate Year columns
cleaned_data1 <- 
  cleaned_data1 |>
  select(-c(Year1, Year2, Year3, Year4, Year5))

# Replace values in the Year column
cleaned_data1['Year'] <- c("2014","2015","2016","2017", "2018", "2019", "2020", "2021", "2022", "2023")

# Calculate Total Crime each Year
cleaned_data1['Total_Crime'] <- 
  c(sum(cleaned_data1$Assaults[1], cleaned_data1$Auto_Thefts[1], cleaned_data1$Bike_Thefts[1]),
    sum(cleaned_data1$Assaults[2], cleaned_data1$Auto_Thefts[2], cleaned_data1$Bike_Thefts[2]),
    sum(cleaned_data1$Assaults[3], cleaned_data1$Auto_Thefts[3], cleaned_data1$Bike_Thefts[3]),
    sum(cleaned_data1$Assaults[4], cleaned_data1$Auto_Thefts[4], cleaned_data1$Bike_Thefts[4]),
    sum(cleaned_data1$Assaults[5], cleaned_data1$Auto_Thefts[5], cleaned_data1$Bike_Thefts[5]),
    sum(cleaned_data1$Assaults[6], cleaned_data1$Auto_Thefts[6], cleaned_data1$Bike_Thefts[6]),
    sum(cleaned_data1$Assaults[7], cleaned_data1$Auto_Thefts[7], cleaned_data1$Bike_Thefts[7]),
    sum(cleaned_data1$Assaults[8], cleaned_data1$Auto_Thefts[8], cleaned_data1$Bike_Thefts[8]),
    sum(cleaned_data1$Assaults[9], cleaned_data1$Auto_Thefts[9], cleaned_data1$Bike_Thefts[9]),
    sum(cleaned_data1$Assaults[10], cleaned_data1$Auto_Thefts[10], cleaned_data1$Bike_Thefts[10]))


# Calculate Total Crime each Year
cleaned_data1['Total_Crime_Rate'] <- 
  c(sum(cleaned_data1$Assault_Rate[1], cleaned_data1$Auto_Theft_Rate[1], cleaned_data1$Bike_Theft_Rate[1]),
    sum(cleaned_data1$Assault_Rate[2], cleaned_data1$Auto_Theft_Rate[2], cleaned_data1$Bike_Theft_Rate[2]),
    sum(cleaned_data1$Assault_Rate[3], cleaned_data1$Auto_Theft_Rate[3], cleaned_data1$Bike_Theft_Rate[3]),
    sum(cleaned_data1$Assault_Rate[4], cleaned_data1$Auto_Theft_Rate[4], cleaned_data1$Bike_Theft_Rate[4]),
    sum(cleaned_data1$Assault_Rate[5], cleaned_data1$Auto_Theft_Rate[5], cleaned_data1$Bike_Theft_Rate[5]),
    sum(cleaned_data1$Assault_Rate[6], cleaned_data1$Auto_Theft_Rate[6], cleaned_data1$Bike_Theft_Rate[6]),
    sum(cleaned_data1$Assault_Rate[7], cleaned_data1$Auto_Theft_Rate[7], cleaned_data1$Bike_Theft_Rate[7]),
    sum(cleaned_data1$Assault_Rate[8], cleaned_data1$Auto_Theft_Rate[8], cleaned_data1$Bike_Theft_Rate[8]),
    sum(cleaned_data1$Assault_Rate[9], cleaned_data1$Auto_Theft_Rate[9], cleaned_data1$Bike_Theft_Rate[9]),
    sum(cleaned_data1$Assault_Rate[10], cleaned_data1$Auto_Theft_Rate[10], cleaned_data1$Bike_Theft_Rate[10]))
    
#### Save data ####
write_csv(cleaned_data1, "~/crime-rate-in-TPK/data/analysis_data/cleaned_data.csv")
