# Project Description  
The purpose of my final project is to create an R package that allows user to quickly and comprehensively evaluate the normality of their data, a *critical* first step in many statistical analyses. I have included the functions for the following "checks" in my package:  

- `stat_test()`, which includes a:
  + Shapiro-Wilk Test `sw()`
  + Komogorov-Smirnov Test `ks()`
  + Anderson-Darling Test `ad()`
- `vis_check()`, which includes a:
  + QQ Plot `qqplot()`
  + Density Plot `densplot()`
  + Histogram with normal curve overlay `normhist()`
- `check_all()`, which runs all above statistical tests *and* visual checks

## Statistical Tests  
The purpose of the statistical tests function(s) will be to provide users with a statistical evaluation of their data's normality. One issue with visual checks of data normality is that the evaluation is subjective. Users will have to ask themselves: "Is this normal *enough*?" With statistical tests, you can make a decision based on the p-value, an objective cut-off.   

The `stat_test()` function defaults to running all statistical tests (`test = "all"`). However, users can specify if they want just one test run: ex. `test = "sw"` or `test = "ad"`.

The input for the `stat_test()` function needs to be a numeric vector. Missing values in the data are allowed and will be automatically removed (although a warning will be displayed that there are missing values).  

The output will be the result(s) of the statistical test(s) including the test statistic, p-value, and an interpretation based on the p-value. 

Although users can obtain the results for all three statistical tests using the `stat_test()` function, if they only wanted to run one of the tests, they can do so as well with each tests' function:

- Shapiro-Wilk Test `sw()`
- Komogorov-Smirnov Test `ks()`
- Anderson-Darling Test `ad()`

For example:
```{r echo = T, eval = F}
sw(x)
```

Another way users can run only one or two tests is to specify which test(s) they would like in the `stat_test()` function. For example:
```{r echo = T, eval = F}
stat_test(x, test = "ks") #to run only the Komogorov-Smirnov Test
```
or
```{r echo = T, eval = F}
stat_test(x, test = c("ks", "ad") #to run the Komogorov-Smirnov Test and the Anderson-Darling test
```



## Visual Checks  
The purpose of providing visual checks of data normality is to allow users to gain a better understanding of the distribution of their data. Although statistical tests tell you, objectively, whether or not the data follows a normal distribution, if it doesn't, it is still valuable for the researcher to know *how* the data deviates from normality. Perhaps it is bi-model or extremely right-skewed. Having that extra knowledge about the data's distribution allows for a better understanding leading to better interpretations.  

The `vis_check()` function defaults to generating the following three plots (`plot = "all"`):

- QQ-Plot `qqplot()`
- Density Plot `densplot()`
- Histogram with normal curve overlay `normhist()`

However, users can specify if they only want one or two plots, similar to the `stat_test()` function. For example:
```{r echo=T, eval = F}
vis_check(x, plot = "normhist") #to only generate the histogram
```
or 
```{r echo=T, eval = F}
vis_check(x, plot = c("normhist", "qqplot")) #to generate the histogram and QQ-Plot
```

For ease, users could also run the function for the specific plot they are interested:
```{r echo = T, eval = F}
densplot(x)
```

The input for the visual checks also needs to be a numerical vector. The output will be the requested plot(s) and an interpretation aid that will describe what a normally-distributed output would look like. For example:
```{r echo = F, eval = T}
message("Within the QQ-Plot, if the data are normally distributed, the points should fall roughly along the red line.")
```

## Check All
The `check_all()` function is the main function of the CheckNorm package. It provides users with the results of the three previously mentioned statistical tests and generates the three previously mentioned visualizations. This function is designed to streamline the evaluation of data normality by providing users with various "checks" all at once, allowing them to combine the results of statistical tests with the visualization output to have a clearer understanding of their data and its normality and distribution.

## Summary
To summarize, the CheckNorm packages contains the following functions:

- `stat_test()` which defaults to running three statistical evaluations of data normality
- `vis_check()` which defaults to generating three visualizations aimed at evaluating data normality
- `check_all()` which provides the results of three statistical tests of data normality and generates three visualizations of data normality
- `ad()` which runs an Anderson-Darling test of normality
- `sw()` which runs a Shapiro-Wilk test of normality
- `ks()` which runs a Komogorov-Smirnov test of normality
- `qqplot()` which generates a QQ-Plot of the data
- `densplot()` which generates a density plot of the data
- `normhist()` which generates a histogram of the data with a normal curve overlay

## Installation
To install the CheckNorm package, use this code:

```r
#install.packages("devtools")  # if not already installed
library("devtools") # as I'm sure most you have devtools installed!
devtools::install_github("lindgrenrebecca/CheckNorm")
library(CheckNorm)
```
