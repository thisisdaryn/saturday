library(dplyr)
library(tidyr)
library(workshop)

goldenray <- filter(groceries, No. == 15)


### What is the mean price of each item in each region? 


comp_rpt <- group_by(groceries, Region, No., ITEMS) %>%
  summarise(Avg = mean(Price, na.rm = TRUE)) %>% 
  spread(key = Region, value = Avg)


### Rank the buildings by total number of violations in the entire dataset
### so, for a building you would aggregate all inspections 

violation_rpt1 <- mutate(highrises, violation = ifelse(is.na(Code), 0, 1)) %>% 
  group_by(Address) %>% summarise(violations = sum(violation)) %>% 
  arrange(desc(violations))

highrises$violation <- ifelse(is.na(highrises$Code), "No Violation", "Violation")
building_violation <- group_by(highrises, Address, violation) %>% summarise(num = n()) %>%
  arrange(desc(num))


### Which inspections yielded the most violations?

library(readr)
library(workshop)

write_csv(lara, "LaraTests.csv")







