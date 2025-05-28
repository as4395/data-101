install.packages("rpart")
install.packages("rpart.plot")
install.packages("caret")
devtools::install_github("devanshagr/CrossValidation")
library(caret)
library(rpart)
library(rpart.plot)
library(ModelMetrics) # for calculating MSE

train <- read.csv("/Users/abhiramsingireddy/Documents/Data101_Fall2024/couplesTrain.csv", stringsAsFactors = TRUE)
test <- read.csv("/Users/abhiramsingireddy/Documents/Data101_Fall2024/CouplesTestStudents.csv", stringsAsFactors = TRUE)
head(train)

# Explore the data
str(train)
str(test)
summary(train)

# Use of the rpart() function
tree <- rpart(Outcome ~ GroomMB+BrideMB+GroomInc+BrideInc, data=train, method="class", control=rpart.control(minsplit = 20))
tree
rpart.plot(tree)

# Predict the outcome of the CouplesTest dataset
pred <- predict(tree, test, type="class")
head(pred)

# Cross Validation
CrossValidation::cross_validate(train, tree,10,0.7)

# Combining rpart prediction model
income_threshold <- median(train$GroomInc)

train_data_low <- subset(train, GroomInc <= income_threshold)
train_data_high <- subset(train, GroomInc > income_threshold)

model_low <- rpart(Outcome ~ GroomMB+BrideMB+GroomInc+BrideInc, data=train_data_low, method = "class")
model_high <- rpart(Outcome ~ GroomMB+BrideMB+GroomInc+BrideInc, data=train_data_high, method = "class")

pred1 <- predict(model_low, newdata=test[test$GroomInc<=income_threshold,], type="class") 
pred2 <- predict(model_high, newdata=test[test$GroomInc>income_threshold,], type="class") 
myprediction<-test

decision <- rep('Failure', nrow(myprediction))

decision[myprediction$GroomInc>income_threshold] <- as.character(pred1) 

decision[myprediction$GroomInc<=income_threshold] <-as.character(pred2) 

myprediction$Outcome<-decision 

# Create Submission File
submission <- data.frame(ID = 1:nrow(test), Grade = decision)
write.csv(submission, "/Users/abhiramsingireddy/Documents/Data101_Fall2024/submission.csv", row.names = FALSE)