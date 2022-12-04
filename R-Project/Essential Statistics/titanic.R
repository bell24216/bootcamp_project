library(titanic)
library(dplyr)
View(titanic_train)

##DROP NA
titanic_train = na.omit(titanic_train)
nrow(train_data)


class(titanic_train$Ticket)

titanic_train$Sex = factor(titanic_train$Sex,
                   levels = c("female","male"),
                   labels = c("Female","Male"))
 
titanic_train$Ticket = factor(titanic_train$Ticket)


##SPLIT DATA
set.seed(42)
n = nrow(titanic_train)
id = sample(1:n,size =n*0.7) ## 70% train 30% test
train_data = titanic_train[id,]
test_data = titanic_train[-id,]

## Train Model
models=glm(Survived ~ Pclass+Age+Sex , data = train_data, family = 
      "binomial")

## Predict and Evaluate Model
train_data$porb_Survived=predict(models,newdata=train_data ,type="response")
train_data$pred = if_else(train_data$porb_Survived >=0.5,1,0)
mean(train_data$Survived==train_data$pred)


test_data$porb_Survived=predict(models,newdata=test_data ,type="response")
test_data$pred = if_else(test_data$porb_Survived >=0.5,1,0)
mean(test_data$Survived==test_data$pred)

View(test_data$porb_Survived)












