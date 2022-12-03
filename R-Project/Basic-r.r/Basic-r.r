# comment
# R is a calculator
1+1
2*2
5/2
6-4
8**2

# variables
income <- 48000
saving <- .25 * income
print(saving)

preferred_bank <- "KBANK"

# remove variables
rm(preferred_bank)

# data types
# 1. numeric
# 2. character
# 3. logical TRUE/FALSE
# 4. factor == categorical
# 5. date


# a customer
cust_name <- "Lisa"
cust_age <- 25
cust_city <- "Seoul"
cust_movie_lover <- TRUE
cust_dob <- as.Date("1997-03-27")


gender <- c("Male", "Female", "Female")

factor(temp, levels=c(1,2,3),
       labels = c("low", "med", "high"),
       ordered = TRUE)

cust_gender <- "Female"

# data structures
# 1. vector OK
# 2. matrix
# 3. list
# 4. dataframe OK

1:10
5:15
rep("hello", 5)
x <- seq(1, 100, by=5)

# vector can store a single
# data type

friends <- c("Lisa", 
             "Jisoo",
             "Jenny",
             "Rose",
             "Bibi")

ages <- c(24, 22, 25, 26, 28)

movie_lover <- c(TRUE, FALSE, T, T, F)

# create a dataframe from vectors
blackpink <- data.frame(friends, ages, movie_lover)

View(blackpink)

# matrix
m1 <- 1:10
matrix(m1, ncol=2, 
       byrow=TRUE)

m2 <- 1:15

dim(m2) <- c(3,5)
m2

# list
# multiple data types

customer <- list(
  name = "Lisa",
  band = "BlackPink",
  age  = 24,
  movieLover = TRUE,
  albums = c("Kill This Love",
             "Money",
             "Pink Venom"),
  favMovies = list(
    uk = "Dark Knight",
    th = "Pee Mak"
  )
)

# print customer keys
names(customer)

# functions + control flow


f_double <- function(x) x*2 
f_cube <- function(x) x**3

# function has input {name}

greeting <- function(name="Lisa") {
  text <- paste("Hello", name)
  print(text)
}

greeting_v2 <- function() {
  user_name <- readline("What's your name? ")
  text <- paste("Hello!", user_name)
  print(text)
}

# function check username, password
# login to our web application
# authentication (check username + password)

f_auth <- function() {
  # welcome message
  print("Welcome to our application.")
  
  attemps <- 0
  
  while (attemps < 3) {
    # get username password from user
    un <- readline("Username: ")
    pw <- readline("Password: ")
    attemps <- attemps + 1
    
    # check authentication
    if (un == "toyeiei" & pw == "1234") {
      print("Successfully login.")
      break
    } else {
      if (attemps == 3) {
        print("Your account is locked.")
      } else {
        print("Please try again...")
      }
    }
  }
}

# while example
count <- 0

while (count < 10) {
  if (count %% 2 == 1) {
    print(paste(count, "Odd"))
  } else {
    print(paste(count, "Even"))
  }
  count <- count + 1
}

# for loop
# vectorization

nums <- 1:10

for (num in nums) {
  print(num * 2)
}

nums * 2

# say Hi to each of our friends
friends <- c("Jenny", "Lisa", "Jisoo", "Rose")

for (friend in friends) {
  print( paste("Hi", friend)  )
}

# apply family
