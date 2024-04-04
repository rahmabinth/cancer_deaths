#### Preamble ####
# Purpose: Simulates the dataset in sketches.
# Author: Rahma Binth Mohammad
# Date: 4 April 2024
# Contact: rahma.binthmohammad@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
set.seed(853)

simulated_trend_data <-
  tibble(
    "Year" = 2004:2023,
    "Hospital_1" = sample(100:300, 20, replace = TRUE), # Largest 5 hospitals, but all have different capacities, and different number of beds
    "Hospital_2" = sample(80:250, 20, replace = TRUE), #produced integer values
    "Hospital_3" = sample(120:320, 20, replace = TRUE),
    "Hospital_4" = sample(90:270, 20, replace = TRUE),
    "Hospital_5" = sample(110:350, 20, replace = TRUE)
  )

# Get summary statistics
summary(simulated_trend_data)

#### Test simulated data ####
# Check number of observations 
nrow(simulated_trend_data) == 20

# Check for missing or NA values
any(is.na(simulated_trend_data))

# Check if all observations are numeric (excluding the year column)
all(sapply(simulated_trend_data[, -1], is.numeric))

# Check if all values (observations are within the range we specified)
all(sapply(simulated_trend_data[, -1], function(x) all(x >= 80)))

all(sapply(simulated_trend_data[, -1], function(x) all(x <= 350)))

# Check if the year coloum has integers
all(sapply(simulated_trend_data$Year, function(x) is.integer(x)))

# Check the year range
all(simulated_trend_data$Year >= 2004)

all(simulated_trend_data$Year <= 2023)
