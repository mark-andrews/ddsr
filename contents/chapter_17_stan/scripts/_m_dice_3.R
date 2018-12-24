dice_data_3 <- list(y = y, N = N, sigma = 1)
M_dice_3 <- stan('loaded_dice_logit.stan',
                 data = dice_data_3)