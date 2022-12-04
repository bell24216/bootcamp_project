library(nycflights13)
library(tidyverse)
library(glue)

# load data
data("flights")
flights

# glimpse data
glimpse(flights)

View(flights)

# filter September 9 
flights %>%
  filter(month == 9, day == 9)

flights %>%
  count(month) %>%
  summarise(mean(n))

## which carrier had most flights in May 2013
flights %>%
  filter(month == 5, year == 2013) %>%
  count(carrier) %>%
  arrange(desc(n)) %>%
  left_join(airlines, by = c("carrier" = "carrier") ) %>%
  head(5)

## HOMEWORK 01 - flights
## Five Business Question 

## 1.which carrier = UA had most Fligths in January 2013 top 5
flights %>%
  filter(month == 1,year == 2013,carrier=="UA") %>%
  count(day) %>%
  rename(MostFligths=n) %>%
  arrange(desc(MostFligths)) %>%
  head(5)

## 2.which most distance in June 2013 top 5
flights %>%
  select(day,month,year,distance) %>%
  filter(month == 6,year == 2013 ) %>%
  arrange(desc(distance)) %>%
  head(5)

## 3.which lowermost AVG distance in year 2013 top 5
flights %>%
  filter(year == 2013) %>%
  select(month,distance) %>%
  group_by(month) %>%
  summarise(mean(distance)) %>%
  rename(MeanDis="mean(distance)") %>%
  arrange((MeanDis),.by_group = FALSE)
  
## 4.which most arr_delay in September year 2013 top 5
flights %>%
  select(month,year,arr_delay,carrier) %>%
  arrange(desc(arr_delay)) %>%
  head(5)

## 5. find information in may 2013 name = La Guardia carrier = DL arr_time = 731
flights %>%
  left_join(airports, by = c("origin" = "faa") )  %>%
  filter(month == 5, year == 2013,name=="La Guardia",carrier=="DL",arr_time==731) %>%
  View()







