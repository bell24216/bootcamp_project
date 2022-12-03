library('tidyverse')
library('rvest')

url = read_html("https://specphone.com/Honor-80-Pro.html")

topic=url %>%
  html_nodes("div.topic") %>%
  html_text()

detali=url %>%
  html_nodes("div.detail") %>%
  html_text2()

full=data.frame(
  topic = topic,
  detali=detali
)

View(full)


#All sumsung
sumsung_url =read_html("https://specphone.com/brand/Samsung")


#link all sumsung 
links =sumsung_url %>%
  html_nodes("li.mobile-brand-item a") %>%
  html_attr("href")

full_links=paste0("https://specphone.com",links)


result = data.frame()

for (link in full_links[1:10]) {
  ss_topic = link %>%
    read_html() %>%
    html_nodes("div.topic") %>%
    html_text2()
  
  ss_detail = link %>%
    read_html() %>%
    html_nodes("div.detail") %>%
    html_text2()
  
  tmp = data.frame(attr = ss_topic,
                   value = ss_detail)
  
  result =bind_rows(result,tmp)
  
}
  
View(tmp)

View(result)


write.csv(result,"result_ss_phone.csv")









