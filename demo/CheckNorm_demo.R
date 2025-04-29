#load package
library(CheckNorm)

#load simulated normal data from CheckNorm package
data("normaldata")

#load "real" data from built in R datasets
data("airquality")

#Jump straight into examining data normality!
check_all(normaldata)

#Same thing with the "real" data
check_all(airquality$Solar.R)