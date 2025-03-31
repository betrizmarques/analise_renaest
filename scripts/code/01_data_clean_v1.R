###----------------------------------------------------
###--------- Análise Exploratória do RENAEST ----------
###----------------------------------------------------
### O objetivo principal deste projeto de pesquisa é investigar os fatores de
### risco e cenários críticos relacionados aos sinistros de trânsito no Brasil,
### bem como reconhecer os estados/regiões que necessitam de maior foco para
### reduzir os índices de vítimas no trânsito.

###-------------------------------------------------------------
### Script para pré-processamento e limpeza dos dados.

#Pré-Processamento dos dados.

acidentes_dados_abertos <-read.csv('data/raw/Acidentes_DadosAbertos_20250312.csv', sep = ";", header = TRUE)
localidade_dados_abertos <- read.csv("data/raw/Localidade_DadosAbertos_20250312.csv", sep =";", header = T)
tipo_veiculo_dados_abertos <- read.csv("data/raw/TipoVeiculo_DadosAbertos_20250312.csv", sep = ";", header = T)
vitimas_dados_abertos <- read.csv("data/raw/Vitimas_DadosAbertos_20250312.csv", sep = ";", header = T)

dados <- left_join(acidentes_dados_abertos, localidade_dados_abertos[, c("chv_localidade", "municipio", "qtde_habitantes", "regiao")], by = "chv_localidade")
write_csv(dados, file = 'data/processed/dados_acidente_local.csv')

processed_data <- read.csv("data/processed/dados_acidente_local.csv")

#Verificação de NA's
library(skimr)

skim(processed_data)

#Criando uma nova base para localização.
chv_lat_long <- processed_data %>% 
  select(num_acidente, chv_localidade, latitude_acidente, longitude_acidente, end_acidente, 
         bairro_acidente, municipio, uf_acidente, cep_acidente, num_end_acidente, km_via_acidente)


processed_data_clean <- processed_data %>% 
  select(-latitude_acidente, -longitude_acidente, -cep_acidente, -num_end_acidente, -km_via_acidente, -mes_ano_acidente,-codigo_ibge)

write.csv(processed_data_clean, file = "data/processed/processed_data_clean.csv")

