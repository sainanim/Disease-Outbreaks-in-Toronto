#### Preamble ####
# Purpose: Cleans the raw data saved in inputs/data/unedited_data.csv to contain data we need for our analysis
# Author: Monica Sainani
# Date: 24 January 2024
# Contact: monica.sainani@mail.utoronto.ca
# License: MIT
# Pre-requisites: run scripts/01-download_data.R

#### Workspace setup ####
library(tidyverse)
library(arrow)

#### Clean data ####
raw_data <- read_parquet("inputs/data/unedited_data.parquet") # loads in the raw data
cleaned_data <-raw_data |> mutate(across(everything(), ~ifelse(is.na(.), NA, .))) |>
  
  # Convert date columns to Date format
  mutate(Date_Outbreak_Began = as.Date(Date.Outbreak.Began, format = "%Y-%m-%d"),
         Date_Declared_Over = as.Date(Date.Declared.Over, format = "%Y-%m-%d")) |>
  
  # If needed, impute missing values (for example, using median)
  mutate(across(starts_with("Date"), ~ifelse(is.na(.), median(., na.rm = TRUE), .))) |>
  
  # Convert categorical variables to factors
  mutate(across(c(Outbreak.Setting, Type.of.Outbreak, Causative.Agent.1), as.factor))

# Display the first few rows of the cleaned dataset
head(cleaned_data)

# Save the cleaned data to a new CSV file (optional)
write.csv(cleaned_data, "cleaned_dataset.csv", row.names = FALSE)
