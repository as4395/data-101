There will be several prediction challenges in Data 101 to continue the seven year tradition of awarding Quinlan
awards and Data 101 Hall of Fame invitations.  Participation is optional but in order to **get A in class you have to
participate and score in top 50% of participants in the overall leaderboard**.  Also, in case you are close to a grade
(C or B) you may argue for that higher grade if you partipated in the challenges and got score in top 50% of
particpants.  And of course you may win the Quinlan trophy or get a medal position! This is the key  - see
[https://data101.cs.rutgers.edu/?q=quinlans-2017](https://data101.cs.rutgers.edu/?q=quinlans-2017) 


NOTICE: No late submissions are accepted for prediction challenges. There will be 4 prediction challenges - one
per week, with the last due Tuesday Dec 10


**TASK:**  You are provided with two data sets about Professor Moody's class.  One is the training data set and
another is the truncated testing data set. (this one misses the target attribute GRADE). Your job is to predict the
grade using "Free style" prediction - which means your own code based on eyeballing the data or visualization.
Use of R libraries is **not allowed for this challenge.** Later challenges will allow this, but not this one. 


**_Use the decision vector code which was presented in class and also is attached further down in the description of this
challenge. Only R101 functions are allowed. And no R libraries like rpart etc._**


**HINTS:** First make a boxplot just like one in the section 4 (boxplot subsection). If there are overlaps between
grades, use subset operator and table() to see how grades are distributed over "grey areas" - i.e. overlap areas
based on score.  Eyeball the data in overlap areas (first use subset) and then try to find pattern which would
indicate how grade is decided in these areas.


Is there a "second cutpoint" based on other attributes than score?


What are these other attributes which matter? 


Use table() to detect attributes which matter as "tie brakers" for decison about the grade. Pairing subset-table
will be very useful here. Once you come up with rules for overlap areas, built decision vector and see what is the
accuracy?


Is it better than simplistic prediction model based on score cutpoints?


If you think you can do better in terms of accuracy, see where your model was inaccurate in its prediction - use
subset to define these subset of inaccuracy. Again eyeball the data and try to find more patterns. Incorporate
them into decision vector. Evaluate new accuracy. Is it better? Keep iterating until you are happy with your
model. Then apply your model to test data and **produce submission file. DO NOT FORGET IT. This is the only
way we can evaluate your result**


**Submit the submission file. Along with the code.**




Now more explanation:

These data sets are posted in Files/Prediction Challenges - folder. There is training data set, testing data set and
submission data set. Let us explain each of these data sets below:


There is training data set of 1000 tuples with columns - Grade, Score, Attendance, Questions, Row and Major.
Questions shows the number of questions a student asked during semester, Row - is the row number the student
was sitting (we assume students do not change rows). Other attributes are self explanatory.


The testing data set has been generated following the same "rules" as training data set but it is missing one
attribute - the one you need to predict (called Target attribute), that is GRADE. It has 5000 tuples.


Your job is to create your prediction model (that is the decision vector below) using the training data set -
evaluate its accuracy on the training data set, when you are done with your model building (of course you want to
achieve highest accuracy on the training data set) then apply your prediction model to the testing data and
produce your grade predictions. You can no longer evaluate accuracy of your predictions on testing data since the
testing data set misses the GRADE, and we will be calculating your accuracy on testing data (since we know the
full testing data set).


All you need to do is to produce the submission data frame called "submission" which has been prepopulated for
you (submission "data set"). It has the IDs (1:5000), the same as in testing data set, and it has Grade attribute with
UNKNOWN value which you have to replace with your prediction. 


The first 5 tuples of your submission data set may look something like this (this is just a sample):

| ID  | Grade |
|-----|-------|
| 1   | A     |
| 2   | B     |
| 3   | D     |
| 4   | C     |
| 5   | B     |

You will submit **this submission file** and we will evaluate the accuracy of your prediction - it will be anywhere
between 0 and 1. 

**In addition, please submit your code as well** - clearly commented so we know what you did. 






The decision code will look like this (also see snippets in section 18 of textbook) for very simple score only based,
cutpoint model.

```r
decision <- rep('F', nrow(MoodyTrain2024))

decision[MoodyTrain2024$Score>50] <- 'D'

decision[MoodyTrain2024$Score>60] <- 'C'

decision[MoodyTrain2024$Score>75] <- 'B'

decision[MoodyTrain2024$Score>90] <- 'A'
```

If you decide to use this model (better NOT, since you need to look at other attributes for sure to get decent
accuracy) then you apply it to testing data

```r
decision <- rep('F', nrow(MoodyTest2024ST)

decision[MoodyTest2024ST$Score>50] <- 'D'

decision[MoodyTest2024ST$Score>60] <- 'C'

decision[MoodyTest2024ST$Score>75] <- 'B'

decision[MoodyTest2024ST$Score>90] <- 'A'
```

and then populate submission file

```r
submission$Grade <- decision
```
and then use (as we said above)

```r
write.csv(submission, 'submission.csv', row.names=FALSE)
```
