Here our challenge is to predict a successful marriage when we know the Briggs-Myers personality types of
the Groom and Bride as well as their incomes. 


To read about the Myers-Briggs test - look here


[https://www.myersbriggs.org/my-mbti-personality-type/the-16-mbti-personality-types/](https://www.myersbriggs.org/my-mbti-personality-type/the-16-mbti-personality-types/)





The validity of this test is widely acknowledged in the corporate world, and don't be surprised if you are asked to
take one in the future.


We have been given a training dataset **couplesTrain** comprising 10,000 tuples of couples. It contains 5 columns:
Groom's MB test result, Bride's MB test result, Groom's income, Bride's income, and the final outcome of the
marriage (we won't delve into how this is determined; let's assume there is such a label), categorized as Success
or Failure.


Additionally, we are provided with a **CouplesTestStudents** dataset comprising 50,000 tuples, which has only 4
columns. The missing one is the Outcome. This is what you have to predict.


You are allowed to use any of the R libraries including rpart, lm etc. Again, advanced warning, that straightforward
application of rpart to this data set won't be enough!


Data sets can be found in FILES/prediction-challenges

submission file

```r
sub <- read.csv('https://raw.githubusercontent.com/paramshah4/data101_tutorial/main/files/dataset/submissionC.csv')
```

Submission =  submisson file + R code.
