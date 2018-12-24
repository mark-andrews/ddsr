source("scripts/common.R")


biochem_df <- read_csv('data/biochemist.csv') 

biochem_df %<>% mutate(published = publications > 0)

X <- model_matrix(~ gender + married + I(children > 0) + prestige + mentor, 
                  data = biochem_df) %>% 
  as.matrix()

y <- biochem_df %>% pull(published)

biochem_data <- list(y = y,
                     X = X,
                     N = nrow(X),
                     K = ncol(X) - 1,
                     tau = 100)

M_biochem <- stan('logitreg.stan', data = biochem_data)

saveRDS(file = 'M_biochem.Rds', object = M_biochem)
