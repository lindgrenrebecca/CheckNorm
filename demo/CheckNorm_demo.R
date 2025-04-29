#load package
library(CheckNorm)

#load simulated normal data from CheckNorm package
data("normaldata")
head(normaldata)

#load "real" data from built in R datasets
data("airquality")
head(airquality)

#Let's statistically evaluate the normality of the normaldata dataset
stat_test(normaldata)

#Same thing with the "real" data
stat_test(airquality$Solar.R)

#Now, let's visualize those results
vis_check(normaldata)
vis_check(airquality$Solar.R)

#But instead of having to take two different steps to evaluate normality, let's do it all in one!
check_all(normaldata)
check_all(airquality$Solar.R)