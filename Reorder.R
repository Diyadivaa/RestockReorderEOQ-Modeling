
library(tidyverse)


data <- read_csv("data.csv")

demand <- sum(data$quantity)


S <- 50
H <- 1


EOQ <- sqrt((2*demand*S)/H)


lead_time_demand <- 7
safety_stock <- 500

reorder_point <- lead_time_demand + safety_stock

set.seed(123)
split <- createDataPartition(data$quantity, p = 0.8, list = FALSE)
train <- data[split, ]
test <- data[-split, ]


#This is too basic of a model we'd probably use something like a RF model here and deploy through python, but this is a proof of concept. 
model <- train(quantity ~ time, data = train, method = "glmnet",
               trControl = trainControl(method = "cv", number = 5),
               tuneLength = 10)


prediction <- predict(model, newdata = data.frame(time = max(data$time) + 1))

quantity_to_reorder <- ifelse(prediction > reorder_point, EOQ, 0)
