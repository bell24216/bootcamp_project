library('dplyr')
library('tidyverse')
library('rvest')

url = "https://www.imdb.com/search/title/?groups=top_100&sort=user_rating,desc"

imdb=read_html(url)


titles=imdb %>%
  html_nodes("h3.lister-item-header") %>%
  html_text2()

titles[1:10]

ratings=imdb %>%
  html_nodes("div.ratings-imdb-rating") %>%
  html_text2() %>%
  as.numeric()


vote=imdb %>%
  html_nodes("p.sort-num_votes-visible") %>%
  html_text2()
    
df=data.frame(
  title = titles,
  rating = ratings,
  num_vote = vote
)

View(df)








