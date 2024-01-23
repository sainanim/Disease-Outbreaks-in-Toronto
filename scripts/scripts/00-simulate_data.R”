#### Preamble ####
# Purpose: Simulate the Disease Outbreak Cases in Toronto
# Author: Monica Sainani
# Date: 23 January 2024
# Contact: monica.sainani@mail.utoronto.ca
# License: MIT
# Pre-requisites: none

#### Workplace setup ####
#install.packages("tidyverse")
library(tidyverse)


#### Simulation ####
set.seed(1007846823)
num_records <- 1000
institution_names <- paste("Institution", 1:num_records)
institution_addresses <- paste("Address", 1:num_records)
outbreak_settings <- sample(c("LTCH", "Hospital", "Retirement Home"), size = num_records, replace = TRUE)
types_of_outbreak <- sample(c("Respiratory", "Gastroenteric", "Other"), size = num_records, replace = TRUE)
causative_agents_1 <- sample(c("COVID-19", "Influenza", "Norovirus", "Other"), size = num_records, replace = TRUE)
causative_agents_2 <- sample(c("", "Bacteria", "Other"), size = num_records, replace = TRUE)
date_outbreak_began <- sample(seq(as.Date('2023-01-01'), as.Date('2023-12-31'), by="day"), size = num_records, replace = TRUE)
date_declared_over <- ifelse(runif(num_records) < 0.8, date_outbreak_began + sample(7:30, size = num_records, replace = TRUE), NA)
active <- ifelse(is.na(date_declared_over), "Y", "N")

# Create a data frame
simulated_data <- data.frame(
  _id = 1:num_records,
  Institution_Name = institution_names,
  Institution_Address = institution_addresses,
  Outbreak_Setting = outbreak_settings,
  Type_of_Outbreak = types_of_outbreak,
  Causative_Agent_1 = causative_agents_1,
  Causative_Agent_2 = causative_agents_2,
  Date_Outbreak_Began = date_outbreak_began,
  Date_Declared_Over = date_declared_over,
  Active = active
)

# Save the simulated data
write.csv(simulated_data, file = "simulated_data.csv", row.names = FALSE)

# Perform some basic tests
# Test 1: Summary statistics
summary_stats <- summary(simulated_data)

# Test 2: Number of active outbreaks
num_active_outbreaks <- sum(simulated_data$Active == "Y")

# Test 3: Proportion of Respiratory Outbreaks
prop_respiratory_outbreaks <- mean(simulated_data$Type_of_Outbreak == "Respiratory")

# Print the results
cat("Test 1: Summary Statistics\n", summary_stats, "\n\n")
cat("Test 2: Number of Active Outbreaks\n", num_active_outbreaks, "\n\n")
cat("Test 3: Proportion of Respiratory Outbreaks\n", prop_respiratory_outbreaks, "\n")

