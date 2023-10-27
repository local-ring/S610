# getwd()
# setwd(dirname(rstudioapi::getSourceEditorContext()$path))
# # cope from https://stackoverflow.com/questions/35074911/how-to-set-the-current-file-location-as-the-default-working-directory-in-r-progr
## the above cannot allow me to run script outside the Rstudio, need to do it 
## in the shell

setwd("/Users/aolongli/Desktop/2023-Fall/S610/S610")
source("llr_functions.R")
library(bench)


n = 15
x = rnorm(n)
y = rnorm(x + rnorm(n))
z = seq(-1, 1, length.out = 100)

benchmark_result <- mark(llr(x, y, z, omega = 1))

cat("Time taken by llr function using bench::mark:\n")
print(benchmark_result)

