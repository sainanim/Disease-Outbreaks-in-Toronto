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
