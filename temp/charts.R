library(ggplot2)
library(dplyr)


dados %>% 
  ggplot(aes(x = tp_acidente)) +
  geom_density(fill = "#69b3a2", color = "#e9ecef", alpha = 0.8)


tipo_acidente %>% 
  ggplot(aes(x = tp_acidente, y = contagem )) +
  geom_bar(stat = "identity")+
  coord_flip()
  

por_estado %>% 
  ggplot(aes(x = uf_acidente, y = contagem))+
  geom_bar(stat = "identity")+
  coord_flip()


teste <- dados %>% 
  group_by(num_acidente) %>% 
  summarise(contagem = n_distinct(num_acidente))
