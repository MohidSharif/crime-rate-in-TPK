#### Preamble ####
# Purpose: Downloads and saves the data from https://open.toronto.ca/dataset/neighbourhood-crime-rates/
# Author: Mohid Sharif
# Date: 16 April 2024
# Contact: mohid.sharif@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
# [...UPDATE THIS...]

#### Download data ####


# get package
package <- show_package("neighbourhood-crime-rates")
package

# get all resources for this package
resources <- list_package_resources("neighbourhood-crime-rates")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()

#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(data, "~/crime-rate-in-TPK/data/raw_data/raw_data.csv") 



