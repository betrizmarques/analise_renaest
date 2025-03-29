acidentes_dados_abertos <-read.csv('data/raw/Acidentes_DadosAbertos_20250312.csv', sep = ";", header = TRUE)
localidade_dados_abertos <- read.csv("data/raw/Localidade_DadosAbertos_20250312.csv", sep =";", header = T)
tipo_veiculo_dados_abertos <- read.csv("data/raw/TipoVeiculo_DadosAbertos_20250312.csv", sep = ";", header = T)
vitimas_dados_abertos <- read.csv("data/raw/Vitimas_DadosAbertos_20250312.csv", sep = ";", header = T)

acidentes_parana <- acidentes_dados_abertos %>% 
  filter(uf_acidente == "PR")

acidentes_itaperucu <- localidade_dados_abertos %>% 
  filter(municipio == "ITAPERUCU")

acidentes_dados_abertos %>% 
  group_by(fase_dia) %>% 
  summarise(contagem = n_distinct(num_acidente))

acidentes_dados_abertos %>% 
  group_by(hora_acidente) %>% 
  summarise(contagem = n_distinct(num_acidente))

dados <- left_join(acidentes_dados_abertos, localidade_dados_abertos[, c("chv_localidade", "municipio", "qtde_habitantes")], by = "chv_localidade")



