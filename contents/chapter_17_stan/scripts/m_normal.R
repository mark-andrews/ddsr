source("scripts/common.R")

y <- read_csv('data/MathPlacement.csv') %>% select(SATM) %>% na.omit() %>% pull(SATM)

N <- length(y)

math_data <- list(y = y, N = N, nu = 50, tau = 25, phi = 0, omega = 10, kappa = 5)
M_math <- stan('normal.stan', data = math_data)

saveRDS(file = 'M_math.Rds', object = M_math)

