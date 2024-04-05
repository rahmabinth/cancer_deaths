#### Preamble ####
# Purpose: Models the simulated data
# Author: Rahma Binth Mohammad
# Date: 4 April 2024
# Contact: rahma.binthmohammad@mail.utoronto.ca
# License: MIT
# Pre-requisites: Run 00-simulate_data.R script.


#### Workspace setup ####
library(tidyverse)
library(rstanarm)

# Graph the simulated data with ggplot2
ggplot(simulated_trend_data, aes(x = Year)) +
  geom_line(aes(y = Hospital_1, color = "Hospital 1")) +
  geom_line(aes(y = Hospital_2, color = "Hospital 2")) +
  geom_line(aes(y = Hospital_3, color = "Hospital 3")) +
  geom_line(aes(y = Hospital_4, color = "Hospital 4")) +
  geom_line(aes(y = Hospital_5, color = "Hospital 5")) +
  labs(title = "Cancer Deaths Trend in Sydney Hospitals",
       x = "Year", y = "Number of Deaths",
       color = "Hospital") +
  scale_color_manual(values = c("Hospital 1" = "blue", 
                                "Hospital 2" = "red", 
                                "Hospital 3" = "green",
                                "Hospital 4" = "orange",
                                "Hospital 5" = "purple")) +
  theme_minimal()

### Model data ####
first_model <-
  stan_glm(
    formula = Hospital_1 ~ Year + Hospital_2 + Hospital_3 + Hospital_4 + Hospital_5,
    data = simulated_trend_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 853
  )

#### Save model ####
saveRDS(
  first_model,
  file = "models/first_model.rds"
)