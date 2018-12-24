source('scripts/common.R')

sleepstudy <- lme4::sleepstudy

y <- sleepstudy$Reaction
x <- sleepstudy$Days
z <- sleepstudy$Subject %>% as.numeric()

sleep_data <- list(N = length(y),
                   J = length(unique(z)),
                   y = y,
                   x = x,
                   z = z)

M_lmm <- stan('lmm.stan', data = sleep_data)

saveRDS(M_lmm, file='M_lmm.Rds')
