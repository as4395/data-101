# Import the dataset
df <- read.csv("/Users/abhiramsingireddy/Documents/Data101_Fall2024/matches.csv")

# Link: https://www.kaggle.com/datasets/mertbayraktar/english-premier-league-matches-20232024-season

# Return the first few rows of the dataset 
head(df)

# 1. Subset: Home matches
home_matches <- subset(df, Venue == "Home")

# 2. Table: Frequency of match results at home
home_results <- table(home_matches$Result)
print(home_results)

# 3. Bar plot: Frequency of match results at home
barplot(home_results, main="Match Results at Home", ylab="Frequency", col="lightblue")

# 4. Tapply: Average goals for Home Matches based on the result
avg_goals_home <- tapply(home_matches$GF, home_matches$Result, mean)
print(avg_goals_home)

# 5. Bar plot: Average goals scored at home based on the result
barplot(avg_goals_home, main="Average Goals Scored at Home", ylab="Goals Scored", col="lightgreen")

# Summary statistics for Home goals
home_goals_summary <- summary(home_matches$GF)
print(home_goals_summary)

# Summary statistics for Away goals
away_goals_summary <- summary(away_matches$GF)
print(away_goals_summary)

# 6. Subset: Away matches
away_matches <- subset(df, Venue == "Away")

# 7. Box plot: Compare goals for home and away matches
boxplot(home_matches$GF, away_matches$GF, names = c("Home", "Away"), main = "Goals For: Home vs Away", ylab = "Goals For", col = c("lightblue", "lightgreen"))

# 8. Scatter plot: Goals For vs Goals Against
plot(df$GF, df$GA, main="Goals For vs Goals Against", xlab="Goals For", ylab="Goals Against", pch=19, col=ifelse(df$Venue == "Home", "blue", "green"))
legend("topright", legend=c("Home", "Away"), col=c("blue", "green"), pch=19)

# 9. Tapply: Average shots on target by venue
avg_sot_venue <- tapply(df$SoT, df$Venue, mean)
print(avg_sot_venue)

# 10. Bar plot: Average shots on target by venue
barplot(avg_sot_venue, main="Average Shots on Target by Venue", ylab="Shots on Target", col="purple")

# 11. Tapply: Average Possession by Venue (as a percentage)
avg_poss_venue <- tapply(df$Poss, df$Venue, mean)
print(avg_poss_venue)

# 12. Tapply: Maximum number of shots at home based on result
max_shots_home <- tapply(home_matches$Sh, home_matches$Result, max)
print(max_shots_home)

# 13. Tapply: Minimum number of shots at home based on result
min_shots_home <- tapply(home_matches$Sh, home_matches$Result, min)
print(min_shots_home)

# 14. Tapply: Average distance from which shots were taken based on result
avg_distance_result <- tapply(df$Dist, df$Result, mean)
print(avg_distance_result)

# 15. Mosaic plot: Match Results by Competition

# Create a contingency table of match results by venue
results_venue_table <- table(df$Result, df$Venue)

# Assign colors for the mosaic plot
colors <- c('red', 'green', 'blue')  

# Create the mosaic plot
mosaicplot(results_venue_table, main="Match Outcomes by Venue",
           xlab="Match Result", ylab="Venue", col=colors, border="black")