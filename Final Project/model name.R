mod_names = names(coef(add_back_bic_mod))

df_name = tibble(coef = mod_names,
                 beta = round(coef(add_back_bic_mod), digits = 4))

df_name2 = df_name %>%
  #bind_rows(df_name) %>% 
  mutate(coef = str_replace_all(coef, "[(|)]", "")) %>% 
  mutate(display = 
           case_when(
             coef == '(Intercept)' ~ 'Intercept',
             TRUE ~ coef
  )) %>% 
  mutate(display2 = str_c(beta, "(", display, ")"))


mod_display = str_c(df_name2$display2, collapse = " + ")
mod_display2 = str_c("Life Expectancy = ", mod_display)
