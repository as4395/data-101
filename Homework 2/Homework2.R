# Importing Libraries and Installing Necessary Packages
install.packages("BSDA")
library(BSDA)


## Reading Data and Printing Summary
matches_df <- read.csv("/Users/abhiramsingireddy/Documents/Data101_Fall2024/matches.csv")


# Define the two groups: Home and Away goals
# Hypothesis: There is a significant difference in the number of goals scored (GF) when the team plays at home versus away.
home_goals <- matches_df[matches_df$Venue == "Home", "GF"]
away_goals <- matches_df[matches_df$Venue == "Away", "GF"]

# Perform the Z-Test
z_test_result <- z.test(x = home_goals, 
                         y = away_goals, 
                         sigma.x = sd(home_goals),
                         sigma.y = sd(away_goals),
                         alternative = "two.sided")
print(z_test_result)

# z = 3.3464, p-value = 0.0008187 for the strong hypothesis


# 2. Could Not Find close hypothesis case for the given dataset.



# 3. Failed Hypothesis: There is significant difference between fouls committed in home games vs away games

home_fouls <- matches_df[matches_df$Venue == "Home", "FK"]
away_fouls <- matches_df[matches_df$Venue == "Away", "FK"]

# Perform the Z-Test
z_test_result_fouls <- z.test(x = home_fouls, 
                         y = away_fouls, 
                         sigma.x = sd(home_fouls),
                         sigma.y = sd(away_fouls),
                         alternative = "two.sided")
print(z_test_result_fouls)


# 4. Extreme Queries

# M0: Mean Of Goals Scored
M0 <- mean(matches_df$GF)
cat("Mean of Goals Scored:", M0, "\n")

# M : Mean of Goals Scored 
M <- mean(subset(matches_df,Team == "SheffieldUnited" & Result == "L")$GF)
cat("mean of goals scored by team Sheffield United when its lost", M, "\n")

# Check if M satisfies the conditions
if (M > 2 * M0) {
  cat("M is more than twice M0: Condition (eq1) satisfied.\n")
} else if (M < 0.5 * M0) {
  cat("M is less than half M0: Condition (eq2) satisfied.\n")
}

