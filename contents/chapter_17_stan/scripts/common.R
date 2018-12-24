library(tidyverse)
library(magrittr)
library(modelr)

stan <- function(file, ...){
  rstan::stan(file = fs::path('stan', file), refresh = 0, ...)
}

