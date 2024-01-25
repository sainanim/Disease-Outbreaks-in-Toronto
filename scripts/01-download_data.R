#### Preamble ####
# Purpose: Downloads and saves the data from opendatatoronto
# Author: Monica Sainani
# Date: 24 January 2024
# Contact: monica.sainani@mail.utoronto.ca 
# License: MIT

#### Workspace setup ####
# install.packages("tidyverse")
# install.packages("opendatatoronto")
# install.packages("arrow")

library(opendatatoronto)
library(tidyverse)
library(arrow)

#### Download data ####
Disease_data <- list_package_resources("80ce0bd7-adb2-4568-b9d7-712f6ba38e4e") |> filter(name == "ob_report_2024.csv") |>
get_resource()

#### Save data as Parquet ####
write_parquet(Disease_data, "inputs/data/unedited_data.parquet")
