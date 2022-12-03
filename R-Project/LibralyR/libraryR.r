# install.packages(c("tidyverse",
#                    "glue",
#                    "sqldf",
#                    "jsonlite",
#                    "RSQLite",
#                    "rvest"))

library(tidyverse)
library(glue)

my_name <- "Toy"
my_fav_food <- "Hamburger"

text <- glue("Hello my name is {my_name}, my favorite food is {my_fav_food}!")

# data transformation 101
# package dplyr
# select, filter, mutate, arrange, summarise

head(mtcars)
tail(mtcars)
glimpse(mtcars)

## PIPE operator %>%
head(mtcars)

mtcars %>% 
  head()

mtcars %>%
  summary()

## prepare dataframe
df <- mtcars %>% 
  rownames_to_column() %>%
  tibble()

## select/ rename
df %>%
  select(mpg, hp, wt, am)

df %>%
  select(1:3, 5, am)

df %>%
  select(milePerGallon = mpg, 
         horsePower = hp, 
         weight = wt)

df %>%
  select(am, hp, wt) %>%
  rename(horsePower = hp)

df <- df %>%
  rename(model = rowname)

df %>%
  select(starts_with("a"), 1:3)

df %>%
  select(ends_with("p"))

df %>%
  select(contains("a"))

## filter rows
## WHERE clause SQL
result <- df %>%
  select(model, mpg, wt, hp, am) %>%
  filter(mpg > 30)

write_csv(result, "result.csv")

## filter using AND
df %>%
  select(model, mpg, wt, hp, am) %>%
  filter(mpg < 30 & hp > 150)

## filter using OR
df %>%
  select(model, mpg, wt, hp, am) %>%
  filter(mpg < 30 | hp > 150)

## between
df %>%
  select(model, mpg, wt, hp, am) %>%
  filter(between(mpg, 20, 30))

## in operator
## %in%
df %>%
  distinct(gear)

df %>%
  select(model, gear) %>%
  filter(gear %in% c(3,5))

## filter model names
df %>%
  filter(grepl("^M", model)) %>%
  select(model, mpg, hp, wt)

## mutate
df_trasformed <- df %>%
  select(model, mpg, hp) %>%
  mutate(hp_double = hp*2,
         hp_square = hp**2,
         hp_log = log(hp),
         name = "R Language")

## if-else column
df <- df %>%
  mutate(am = factor(if_else(am == 0, "Auto", "Manual")))

df <- df %>%
  mutate(vs = factor(if_else(vs == 0, "V-Shaped", "Straight")))

## case-when dplyr
x <- 1:3
print(x)
case_when(
  x==1 ~ "low", 
  x==2 ~ "medium", 
  x==3 ~ "high"
)

df_mpg <- df %>%
  select(model, mpg) %>%
  mutate(mpg_group = case_when(
    mpg <= 15 ~ "low",
    mpg <= 25 ~ "medium",
    mpg > 25 ~ "high",
    TRUE ~ "other" ## ELSE
  ))

## BREAK 10 minute: 10:40am

## filter NA (missing values)

x <- c(10, 15, 20, NA , 100)

# manual assign NA 
df[5, "disp"] <- NA # 360
df[6, 5] <- NA # 105

# write our own function
check_na <- function(col) {
  sum(is.na(col))
}

apply(df, MARGIN=2, check_na)

## anonymous function in R
apply(df, MARGIN=2, function(col) sum(is.na(col)))

## tidyr::replace_na()
## replace missing values
## mean imputation
avg_disp <- mean(df$disp, na.rm=T)

df %>%
  mutate(disp = replace_na(disp, avg_disp),
         hp = replace_na(hp, median(hp, na.rm=T)))

## built-in dataframe msleep
apply(msleep, MARGIN=2, function(col) sum(is.na(col)))

msleep %>%
  select(name, genus, vore) %>%
  filter(!is.na(vore))

library(sqldf)
sqldf("SELECT name, genus, vore FROM msleep
       WHERE vore IS NOT NULL LIMIT 10")

## check each row in dataframe 
nrow(msleep) - sum(complete.cases(msleep))

## drop every rows with missing value NA
msleep_clean <- drop_na(msleep)

##########################################
## dplyr:: arrange

df %>%
  select(model, mpg, hp, wt, am) %>%
  arrange(am, desc(mpg)) %>%
  print(n=32)

## dplyr:: summarise summarize
## SQL:: aggregate functions
result2 <- df %>%
  group_by(am, vs) %>%
  summarise(avg_mpg = mean(mpg),
            median_mpg = median(mpg),
            sum_mpg = sum(mpg),
            sd_mpg = sd(mpg),
            n = n())

write_csv(result2, "summary_stat.csv")











