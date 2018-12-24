library(tidyverse)

stan <- function(file, ...){
  rstan::stan(file = fs::path('stan', file), refresh = 0, ...)
}

y <- read_csv('data/loaded_dice.csv') %>% 
  mutate(is_six = ifelse(outcome == 6, 1, 0)) %>% 
  pull(is_six)

N <- length(y)

dice_data_3 <- list(y = y, N = N, sigma = 1)
M_dice_3 <- stan('loaded_dice_logit2.stan',
                 data = dice_data_3)

saveRDS(M_dice_3, file='M_dice_4.Rds')