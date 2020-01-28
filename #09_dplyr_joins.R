library(workshop)
library(dplyr)

df_inner_join <- inner_join(populations, areas) 

df_full_join <- full_join(populations, areas)

df_left_join <- left_join(populations, areas)

df_anti_join <- anti_join(areas, populations)
