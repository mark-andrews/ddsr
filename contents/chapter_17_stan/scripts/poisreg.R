source("scripts/common.R")


biochem_df <- read_csv('data/biochemist.csv') 

X <- model_matrix(~ gender + married + I(children > 0) + prestige + mentor, 
                  data = biochem_df) %>% 
  as.matrix()

y <- biochem_df %>% pull(publications)

biochem_data_count <- list(y = y,
                           X = X,
                           N = nrow(X),
                           K = ncol(X) - 1,
                           tau = 100)

M_biochem_pois <- stan('poisreg.stan', data = biochem_data_count)

saveRDS(file = 'M_biochem_pois.Rds', object = M_biochem_pois)
