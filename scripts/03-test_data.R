#### Preamble ####
# Purpose: Tests the cleaned dataset 
# Author: Monica Sainani
# Date: 24 January 2024
# Contact: monica.sainani@mail.utoronto.ca
# License: MIT
# Pre-requisites: run scripts/01-download_data.R followed by scripts/02-data_cleaning.R

#### Workspace setup ####
library(tidyverse)

#### Test data ####
Disease_data <- read_csv("outputs/data/Disease_data.csv") # loads the data

# Display the structure of the cleaned data
str(cleaned_data)

# Summary statistics
summary(cleaned_data)

# Check for any remaining missing values
print("Missing Values:")
print(colSums(is.na(cleaned_data)))

# Visualizations
# Example: Time Series Plot of Outbreaks Over Time
ggplot(cleaned_data, aes(x = Date_Outbreak_Began)) +
  geom_bar(stat = "count", fill = "skyblue") +
  labs(title = "Outbreaks Over Time", x = "Date", y = "Number of Outbreaks")

# Hypothesis Testing
# Example: Test if the outbreak duration differs by Outbreak Setting
outbreak_duration_by_setting <- cleaned_data %>%
  group_by(Outbreak_Setting) %>%
  summarise(mean_duration = mean(Outbreak_Duration, na.rm = TRUE))

print("Outbreak Duration by Setting:")
print(outbreak_duration_by_setting)

# Example t-test (assuming normally distributed data)
t_test_result <- t.test(Outbreak_Duration ~ Outbreak_Setting, data = cleaned_data)
print("T-Test Result:")
print(t_test_result)
