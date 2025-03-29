

acidentes_parana <- acidentes_dados_abertos %>% 
  filter(uf_acidente == "PR")

por_dia <- acidentes_dados_abertos %>% 
  group_by(dia_semana) %>% 
  summarise(contagem = n_distinct(num_acidente))


por_estado <- dados %>% 
  group_by(uf_acidente) %>% 
  summarise(contagem = n_distinct(num_acidente))

nrow(processed_data)
max(processed_data$num_acidente)
