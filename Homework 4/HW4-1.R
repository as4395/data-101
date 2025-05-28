# Import the dataset
sleep <- read.csv("/Users/abhiramsingireddy/Documents/Data101_Fall2024/ss.csv")

# Link: https://www.kaggle.com/datasets/henryshan/sleep-health-and-lifestyle

# Part 1 (pair observation-belief for the dataset)

# Bayesian Analysis for a Nurse with Sleep Apnea
# Observation: The person has sleep apnea.
# Belief: The person is a nurse.

cat("The belief is that the person is a nurse. The observation is that they have sleep apnea.")

# 1. Calculate the Prior Odds (of being a Nurse)
Prior <- nrow(sleep[sleep$Occupation == 'Nurse',]) / nrow(sleep)
PriorOdds <- round(Prior / (1 - Prior), 2) 
cat("The prior odds are equal to:", PriorOdds)

# 2. Calculate True Positive Rate: Probability of being a Nurse given they have Sleep Apnea
TruePositive <- round(nrow(sleep[sleep$Occupation == 'Nurse' & sleep$Sleep.Disorder == 'Sleep Apnea',]) / nrow(sleep[sleep$Sleep.Disorder == 'Sleep Apnea',]), 2)
cat("The True Positive is equal to:", TruePositive)

# 3. Calculate False Positive Rate: Probability of being a Nurse given they do not have Sleep Apnea
FalsePositive <- round(nrow(sleep[sleep$Occupation == 'Nurse' & sleep$Sleep.Disorder != 'Sleep Apnea',]) / nrow(sleep[sleep$Sleep.Disorder != 'Sleep Apnea',]), 2)
cat("The False Positive is equal to:", FalsePositive)

# 4. Calculate the Likelihood Ratio
LikelihoodRatio <- round(TruePositive / FalsePositive, 2)
cat("The Likelihood Ratio is equal to:", LikelihoodRatio)

# 5. Calculate the Posterior Odds
PosteriorOdds <- LikelihoodRatio * PriorOdds
cat("The Posterior Odds are equal to:", PosteriorOdds)

# 6. Calculate the Posterior Probabolity
Posterior <- PosteriorOdds / (1 + PosteriorOdds)
cat("The Posterior Probability is equal to: ", Posterior)

cat("The odds of being a nurse with sleep apnea are 19.5 times higher compared to the general population.\n")

# Part 2 (Contingency Table Analysis for an Accountant with Insomnia)

# Import the dataset
sleep <- read.csv("/Users/abhiramsingireddy/Documents/Data101_Fall2024/ss.csv")

# Creates the contingency table for the two categorical variables (Occupation and Sleep Disorder)
# The rows represent different occupations
# The columns represent different sleep disorders

# Belief: The Person is an Accountant
# Observation: The person has insomnia

contingency_table <- table(sleep$Occupation, sleep$Sleep.Disorder)
contingency_table

# 1. Prior Odds Calculation
# P = sum(t[i, ]) / sum(t[, ])
PriorProb <- sum(contingency_table[1, ]) / sum(contingency_table[ , ]) 
PriorOdds <- PriorProb / (1 - PriorProb)
cat("Prior Odds of having insomnia:", PriorOdds, "\n")

# 2. True Positive (TP) Calculation
# TP = t[i, j] / sum(t[i, ])
TruePositive <- contingency_table[1, 1] / sum(contingency_table[1, ])
cat("True Positive (TP):", TruePositive, "\n")

# 3. False Positive (FP) Calculation
# FP = sum(t[~i, j]) / sum(t[~i, ])
FalsePositive <- sum(contingency_table[2:11, 1]) / sum(contingency_table[2:11, ])
cat("False Positive (FP):", FalsePositive, "\n")

# 4. Likelihood Ratio
# Likelihood Ratio = TP / FP
LikelihoodRatio <- TruePositive / FalsePositive
cat("Likelihood Ratio:", LikelihoodRatio, "\n")

# 5. Posterior Odds
# Posterior Odds = Likelihood Ratio * Prior Odds
PosteriorOdds <- LikelihoodRatio * PriorOdds
cat("Posterior Odds:", PosteriorOdds, "\n")
Posterior <- PosteriorOdds / (1 + PosteriorOdds)
cat("Posterior Probability:", Posterior)

cat("Thus, the odds of experiencing insomnia are about 0.91 times as likely for accountants compared to the general population.")

