#Pré-Processamento dos dados.

library(readr)
library(tidyverse)
acidentes_dados_abertos <-read.csv('data/raw/Acidentes_DadosAbertos_20250312.csv', sep = ";", header = TRUE)
localidade_dados_abertos <- read.csv("data/raw/Localidade_DadosAbertos_20250312.csv", sep =";", header = T)
tipo_veiculo_dados_abertos <- read.csv("data/raw/TipoVeiculo_DadosAbertos_20250312.csv", sep = ";", header = T)
vitimas_dados_abertos <- read.csv("data/raw/Vitimas_DadosAbertos_20250312.csv", sep = ";", header = T)

dados <- left_join(acidentes_dados_abertos, localidade_dados_abertos[, c("chv_localidade", "municipio", "qtde_habitantes")], by = "chv_localidade")
write_csv(dados, file = 'data/processed/dados_acidente_local.csv')

processed_data <- read.csv("data/processed/dados_acidente_local.csv")

processed_data <- processed_data %>% 
  select(-mes_ano_acidente, -)