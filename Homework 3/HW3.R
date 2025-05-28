# Load the data set
imdb_top_1000 <- read.csv("https://raw.githubusercontent.com/paramshah4/data101_tutorial/main/files/dataset/Movies2022F-4-new.csv") 

colnames(imdb_top_1000)

# Imdb score is the numerical variable and genre is the categorical variable
imdb_score <- "imdb_score"
genre <- "genre"
specific_genre <- "Sci-Fi"
country <- "country"
specific_country <- "USA"

# Define sample sizes as percentages of the dataset

imdb_130_rows <- imdb_top_1000[sample(nrow(imdb_top_1000), 130), ]
imdb_640_rows <- imdb_top_1000[sample(nrow(imdb_top_1000), 130), ]

imdb_6417_rows <- imdb_top_1000[sample(nrow(imdb_top_1000), 130), ]

mean_confindence_interval <- function(data, confidence_level = 0.95) {
  n <- nrow(data)
  mean_val <- mean(data[[imdb_score]], na.rm = TRUE)
  sd_val <- sd(data[[imdb_score]], na.rm = TRUE)
  z <- qnorm((1 + confidence_level) / 2)
  margin_error <- z * sd_val / sqrt(n)
  lower_bound <- mean_val - margin_error
  upper_bound <- mean_val + margin_error
  cat("Margin of Error:", margin_error, "\n")
  cat("95% Confidence Interval: [", lower_bound, ",", upper_bound, "]\n")
}

prop_confidence_interval <- function(data, confidence_level = 0.95) {
  n <- nrow(data)
  count <- sum(data[[genre]] == specific_genre, na.rm = TRUE)
  prop <- count / n
  z <- qnorm((1 + confidence_level) / 2)
  margin_error <- z * sqrt(prop * (1 - prop) / n)
  cat("Margin of Error:", margin_error, "\n")
  lower_bound <- prop - margin_error
  upper_bound <- prop + margin_error
  cat("95% Confidence Interval: [", lower_bound, ",", upper_bound, "]\n")
}

# TASK 1
# 1% sample data
cat("1% sample data mean confidence interval and margin of error\n")
# Calculate and print confidence interval for mean
ci_mean <- mean_confindence_interval(imdb_130_rows)

cat("1% sample data proportionate confidence interval and margin of error\n")
# Calculate and print confidence interval for proportion
ci_prop <- prop_confidence_interval(imdb_130_rows)

# 5% sample data
cat("5% sample data mean confidence interval and margin of error\n")
# Calculate and print confidence interval for mean
ci_mean <- mean_confindence_interval(imdb_640_rows)

# Calculate and print confidence interval for proportion
cat("5% sample data proportionate confidence interval and margin of error\n")
ci_prop <- prop_confidence_interval(imdb_640_rows)

# 50% sample data
# Calculate and print confidence interval for mean
cat("50% sample data mean confidence interval and margin of error\n")
ci_mean <- mean_confindence_interval(imdb_6417_rows)

# Calculate and print confidence interval for proportion
cat("50% sample data proportionate confidence interval and margin of error\n")
ci_prop <- prop_confidence_interval(imdb_6417_rows)


# TASK 2 : Determine Confidence Levels for Target Margin of Error (MER)

target_mer_mean <- 0.15
target_mer_prop <- 0.02

# Function to find confidence level for a target MER (for mean)
find_conf_level_mean <- function(data, target_mer) {
  sd_val <- sd(data[[imdb_score]], na.rm = TRUE)
  n <- nrow(data)
  z <- target_mer / (sd_val / sqrt(n))
  conf_level <- 2 * pnorm(z) - 1
  cat("confidence level for 5% sample data :", conf_level,"\n")
}

# Function to find confidence level for a target MER (for proportion)
find_conf_level_prop <- function(data, target_mer) {
  n <- nrow(data)
  count <- sum(data[[genre]] == specific_genre, na.rm = TRUE)
  prop <- count / n
  z <- target_mer / sqrt(prop * (1 - prop) / n)
  conf_level <- 2 * pnorm(z) - 1
  cat("confidence level for 5% sample data :", conf_level,"\n")
}


# Apply functions to find confidence levels
conf_level_mean <- find_conf_level_mean(imdb_640_rows, target_mer_mean)
conf_level_prop <- find_conf_level_prop(imdb_640_rows, target_mer_prop)


# TASK 3: Confidence Interval for Joint Proportion of Two Categorical Variables

subset_S <- subset(imdb_top_1000, imdb_top_1000$country == specific_country & imdb_top_1000$genre == specific_genre)
print(nrow(subset_S))

calcjointprop <- function(n_total, n_subset)
{
  joint_prop <- n_subset / n_total
  z <- qnorm(0.95)  # For 90% confidence
  margin_error_joint <- z * sqrt(joint_prop * (1 - joint_prop) / n_total)
  lower_bound_joint <- joint_prop - margin_error_joint
  upper_bound_joint <- joint_prop + margin_error_joint
  cat("90% Confidence Interval for joint proportion: [", lower_bound_joint, ",", upper_bound_joint, "]\n")
}

# Calculate joint proportion and confidence interval
n_total <- nrow(imdb_top_1000)
n_subset <- nrow(subset_S)
calcjointprop(n_total, n_subset)

# TASK 4: Narrowest CI for the Mean in a Subset

diff_confidence_interval <- function(data, confidence_level = 0.95) {
  n <- nrow(data)
  mean_val <- mean(data[[imdb_score]], na.rm = TRUE)
  sd_val <- sd(data[[imdb_score]], na.rm = TRUE)
  z <- qnorm((1 + confidence_level) / 2)
  margin_error <- z * sd_val / sqrt(n)
  lower_bound <- mean_val - margin_error
  upper_bound <- mean_val + margin_error
  return (upper_bound - lower_bound)
}

narrowest_ci <- Inf
best_subset <- NULL

# Creating 100 subsets
for (i in 1:100) { 
  subset_data <- imdb_top_1000[sample(1:nrow(imdb_top_1000), 0.05 * nrow(imdb_top_1000)), ]
  width <- diff_confidence_interval(subset_data)
  if(isTRUE(width < narrowest_ci)) {
    narrowest_ci <- width
    best_subset <- subset_data
  }
}

cat("Narrowest Width", narrowest_ci)

