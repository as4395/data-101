This is a continuation of HW1. You can use the same data set as you selected for HW1. You may also choose to  
use a different data set.

You are allowed only to use R functions from R101 set (see section 2.6)  

---

**Part A - Hypothesis testing**

You are asked to create 3 sets of hypotheses (null + alternative) for your data set. Follow the snippets in section  
11 — using `tapply()` and possibly subsets to find good candidates for:  

a) Strong alternative hypothesis (small p-value which will reject null with the appropriate significance level)  

b) Close call (p-value which will barely reject null with the appropriate significance level)  

c) Failed to reject null hypothesis (p-value which exceeds appropriate significance level)  

Run appropriate tests (permutation test or z test to return p-values).  

Add 200 words to your HW1 report describing your three hypotheses and the results of hypothesis testing.  
Propose 3 new titles for your article based on each of these new hypotheses.  

(For examples, see [tinyurl.com/RouletteData101](https://tinyurl.com/RouletteData101))  

---

**Part B - Narrow queries**

Following Chapter 7 — find a narrow query that would lead to extreme results. The query should have a form:  

```
M = mean(subset(df, CONDITION)$NumA)
```

Where `df` is your data frame, `CONDITION` describes a subset of `df` defined as a conjunction of at most two  
(`attribute == value`) conjuncts where attributes are **categorical** (it could be one or two, but **NOT** three or more conjuncts).  
`NumA` is one of the numerical attributes of `df`.  

Let:  

```
M0 = mean(df$NumA)
```

M should have one of the following properties:  

```
M > 2 * M0   (...eq1)
```

or  

```
M < 1/2 * M0  (...eq2)
```

Thus, we find a narrow query that significantly differs when run on a subset than when it runs on the entire dataset.  

For example, say:  

```
M0 = mean(Party$Attendance) = 45  
M = mean(Party[Party$Music == 'Techno' & DJ == 'Rohit', ]$Attendance) = 100
```

So M satisfies (eq1).  

---

**Submit**

1. 3 hypotheses with appropriate tests, p-values, and significance levels.  
2. 200-word description and 3 new titles based on the hypotheses.  
3. The narrow query M and the query M0 showing that one of (eq1) or (eq2) is satisfied.  

---

**RUBRIC (assuming R101 set is used)**

- Each hypothesis with p-value computed, code, significance level, and title = **20%** of the grade (total **60%**)  
- 200-word write-up = **10%**  
- The narrow query (M, M0, and results showing the inequalities from either (eq1) or (eq2)) = **30%**
