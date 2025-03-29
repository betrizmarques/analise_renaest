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


qntd_por_dia <- acidentes_dados_abertos %>% 
  group_by(dia_semana) %>% 
  summarise(contagem = n_distinct(num_acidente))

qntd_por_bairro <- acidentes_parana %>% 
  group_by(bairro_acidente) %>% 
  summarise(contegem = n_distinct(num_acidente))

qntd_por_ano <- acidentes_dados_abertos%>% 
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


vitimas_alcool <- vitimas_dados_abertos %>% 
  filter(susp_alcool == "SIM" & qtde_obitos >=1) %>% 
  group_by(faixa_idade) %>% 
  summarise(contagem = n_distinct(num_acidente))

acidentes_sp <- acidentes_dados_abertos %>% 
  filter(uf_acidente == "SP")

condicao <- acidentes_dados_abertos %>% 
  filter()
  group_by(cond_pista) %>% 
  summarise(contagem = n_distinct(num_acidente))
  
tipo_acidente <- acidentes_dados_abertos %>% 
    group_by(tp_acidente) %>% 
  summarise(contagem = n_distinct(num_acidente))


lim_velocidade <- acidentes_dados_abertos %>% 
  filter(qtde_obitos >= 1) %>% 
  group_by(lim_velocidade) %>% 
  summarise(contagem = n_distinct(num_acidente))

escolas <- acidentes_dados_abertos %>% 
  filter(tp_acidente == "ATROPELAMENTO COM PEDESTRE" & lim_velocidade == "30 KMH") %>% 
  summarise(contagem = n_distinct(num_acidente))

acidentes_itaperucu <- dados %>% 
  filter(municipio == "ITAPERUCU")

acidentes_curitiba <- dados %>% 
  filter(municipio == "CURITIBA")


acidentes_curitiba_bairros <- acidentes_curitiba %>% 
  group_by(bairro_acidente) %>% 
  summarise(contagem = n_distinct(num_acidente))


acidentes_ruas <- acidentes_curitiba %>% 
  group_by(end_acidente) %>% 
  summarise(contagem = n_distinct(num_acidente)) 

ordenado <- acidentes_ruas[order(acidentes_ruas$contagem), ]


  