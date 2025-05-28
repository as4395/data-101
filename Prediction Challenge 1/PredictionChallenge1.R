# Load the training data
train <- read.csv("/Users/abhiramsingireddy/Documents/Data101_Fall2024/MoodyTrain2024.csv")

# Initialize predictions
myprediction <- train
myprediction$PredictedGrade <- "F"  # Default to F

# Grade A: Top Scores Only
myprediction$PredictedGrade[myprediction$Score > 90] <- "A"

# Grade B: Scores > 75 but ≤ 90
myprediction$PredictedGrade[myprediction$Score > 75 & myprediction$Score <= 90] <- "B"

# Grade C: Scores > 60 but ≤ 75
myprediction$PredictedGrade[myprediction$Score > 60 & myprediction$Score <= 75] <- "C"

# Grade D: Scores > 50 but ≤ 60
myprediction$PredictedGrade[myprediction$Score > 50 & myprediction$Score <= 60] <- "D"

# Grade F: Scores ≤ 50 (Default)

# Handle missing values in predictions
myprediction$PredictedGrade[is.na(myprediction$PredictedGrade)] <- "F"

# Calculate Training Accuracy
correct_predictions <- sum(myprediction$PredictedGrade == myprediction$Grade)
accuracy <- (correct_predictions / nrow(myprediction)) * 100
print(paste("Training Accuracy: ", round(accuracy, 2), "%"))

# Misclassification Table
misclassification <- table(myprediction$Grade, myprediction$PredictedGrade)
print("Misclassification Table:")
print(misclassification)

# Attendance Impact Analysis
attendance_impact <- table(myprediction$Attendance < 0.4, myprediction$PredictedGrade)
print("Attendance Impact Analysis:")
print(attendance_impact)

# Analyze Misclassified Cases
misclassified <- subset(myprediction, PredictedGrade != Grade)
print("Summary of Misclassified Cases:")
summary(misclassified)

# Load Testing Data
test <- read.csv("/Users/abhiramsingireddy/Documents/Data101_Fall2024/MoodyTestStudents24.csv")
decision <- rep('F', nrow(test))

# Apply Prediction Logic to Test Data
decision[test$Score > 90] <- "A"
decision[test$Score > 75 & test$Score <= 90] <- "B"
decision[test$Score > 60 & test$Score <= 75] <- "C"
decision[test$Score > 50 & test$Score <= 60] <- "D"
decision[test$Score <= 50] <- "F"

# Create Submission File
submission <- data.frame(ID = 1:nrow(test), Grade = decision)
write.csv(submission, "/Users/abhiramsingireddy/Documents/Data101_Fall2024/submission.csv", row.names = FALSE)