library(knitr)
library(kableExtra)

nice_table <- function(data_df){
  kable(data_df, format = "latex", 
        booktabs = TRUE, 
        digits = 2, 
        align = 'c') %>%
    kable_styling(position = "center")
}

get_nice_coefficients_table <- function(model){
  summary(model)$coefficients %>% 
    as.data.frame() %>% 
    rownames_to_column() %>% 
    rename(Estimate = Estimate,
           SE = `Std. Error`,
           `t-statistic` = `t value`,
           `p-value` = `Pr(>|t|)`) %>% 
    mutate(`p-value` = format.pval(`p-value`, eps = 0.01)) %>% 
    column_to_rownames('rowname') 
}
