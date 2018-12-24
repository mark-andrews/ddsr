source('scripts/common.R')

weight_df <- read_csv('data/weight.csv') %>%
  filter(race %in% c('black', 'white', 'hispanic'))

X <- model_matrix(weight_df, weight ~ height + gender + race) %>% 
  as.matrix()
y <- pull(weight_df, weight)

weight_data <- list(
  X = X,
  y = y,
  N = length(y),
  K = ncol(X)  - 1,
  tau = 100, kappa = 3, omega = mad(y)
)

M_weight <- stan('mlreg.stan', data = weight_data)

saveRDS(M_weight, 'M_weight.Rds')
