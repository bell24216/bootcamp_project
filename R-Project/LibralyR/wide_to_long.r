# library(tidyr)
library(tidyverse)

url <- "https://gist.githubusercontent.com/toyeiei/d9e267754d0b7a7045e182b3d0011636/raw/04cf2d5b211dc3df279b36d968fde11ed1c9bb67/worldphone.csv"

# read data
wp <- read_csv(url)

# transform from wide to long format
wp %>%
  gather(N.Amer:Mid.Amer, 
         key = "region", 
         value = "sales")

long_wp <- wp %>%
  pivot_longer(-Year, 
               names_to = "region",
               values_to = "sales")

long_wp %>%
  pivot_wider(names_from = "region",
              values_from = "sales")

## Read JSON
url <- "https://gist.githubusercontent.com/toyeiei/df5e729c0bbe111318530f254d90546e/raw/22fd0ea0780215b8fe08a5c1daa52998f2fe9afb/employees_for_R.json"

library(jsonlite)

employee_list <- url %>% fromJSON()
emp_df <- data.frame(employee_list)




