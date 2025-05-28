# Loads the dataset
moody <- read.csv("/Users/abhiramsingireddy/Documents/Data101_Fall2024/insurance.csv") 

# Calculate min and mean scores by grade
min_scores <- tapply(moody$score, moody$grade, min)
mean_scores <- tapply(moody$score, moody$grade, mean)

# Initialize the LOW_SCORE attribute
moody$LOW_SCORE <- FALSE

# View the first few rows of the updated data frame
head(moody)
