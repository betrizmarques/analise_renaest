require(tidyverse)
require(lubridate)

acidentes_dados <-read.csv('data/raw/Acidentes_DadosAbertos_20250312.csv', sep = ";", header = TRUE)


acidentes_parana <- acidentes_dados %>% 
  filter(uf_acidente == 'PR')

acidentes_curitiba <- 
  
  acidentes_parana %>% 
  filter(tp_acidente == "COLISAO TRANSVERSAL") %>% 
  summarise(n = n_distinct(num_acidente))


qntd_por_bairro <- acidentes_parana %>% 
  group_by(bairro_acidente) %>% 
  summarise(contegem = n_distinct(num_acidente))


vitimas_morreram <- acidentes_parana %>% 
  filter(qtde_obitos >= 1)


qntd_por_dia <- acidentes_parana %>% 
  group_by(dia_semana) %>% 
  summarise(contagem = n_distinct(num_acidente))


qntd_por_ano <- acidentes_dados%>% 
  group_by(ano_acidente) %>% 
  summarise(contagem = n_distinct(num_acidente))

qntd_por_mes <- acidentes_dados %>% 
  group_by(mes_acidente) %>% 
  summarise(contagem = n_distinct(num_acidente))

qntd_obitos_por_mes <- acidentes_dados %>% 
  filter(qtde_acid_com_obitos >= 1) %>% 
  group_by(mes_acidente) %>% 
  summarise(contagem = n_distinct(num_acidente))

acidentes_parana <- acidentes_parana %>% 
  mutate(data_acidente = ymd(data_acidente))

acidentes_dados %>% 
  count(tp_acidente, sort = T)


acidentes_parana <- acidentes_parana %>% 
  mutate(hora_acidente = str_pad(hora_acidente, width = 6, pad = '0'))