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

# Load necessary libraries
library(dplyr)
library(lubridate)  # For working with dates
library(ggplot2)

# Set a seed for reproducibility
set.seed(123)


# Simulate data
simulated_data <- tibble(id = seq(1, 100),Institution.Name = sample(c("Hospital A", "Long-Term Care Home B", "Retirement Home C"), 100, replace = TRUE),Institution.Address = sample(c("123 Main St", "456 Elm St", "789 Oak St"), 100, replace = TRUE),
                         Outbreak.Setting = sample(c("Hospital", "Long-Term Care Home", "Retirement Home"), 100, replace = TRUE),
                         Type.of.Outbreak = sample(c("Respiratory", "Gastroenteric"), 100, replace = TRUE),
                         Causative.Agent.1 = sample(c("COVID-19", "Influenza", "Norovirus", "Other"), 100, replace = TRUE),
                         Causative.Agent.2 = sample(c("COVID-19", "Influenza", "Norovirus", "Other", NA), 100, replace = TRUE),
                         Active = sample(c("Y", "N"), 100, replace = TRUE)
)

# Display the first few rows of the simulated dataset
head(simulated_data)

# Summary statistics
summary(simulated_data)

