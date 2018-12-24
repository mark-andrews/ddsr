library(tidyverse)

stan <- function(file, ...){
  rstan::stan(file = fs::path('stan', file), refresh = 0, ...)
}

y <- read_csv('data/loaded_dice.csv') %>% 
  mutate(is_six = ifelse(outcome == 6, 1, 0)) %>% 
  pull(is_six)

N <- length(y)

dice_data <- list(y = y, 
                  N = N, 
                  alpha = 1,
                  beta = 1)
M_dice <- stan('loaded_dice.stan',
               data = dice_data)

saveRDS(M_dice_3, file='M_dice.Rds')