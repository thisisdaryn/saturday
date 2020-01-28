library(workshop)
library(dplyr)
library(tidyr)
library(lubridate)

nyc2 <- separate(nyc311, Created, into = c("Day", "Time"), sep = " ")

nyc2 <- mutate(nyc2, Day = mdy(Day))

table(nyc2$Agency)


### For calls assigned to the NYPD, aggregate the number of calls per day in each 
### borough

nypd <- filter(nyc2, Agency == "NYPD")
nypd_group <- group_by(nypd, Borough, Day)
nypd_report <- summarise(nypd_group, Incidents = n())






library(ggplot2)

ggplot(data = nypd_report, aes(x = Day, y = Incidents)) + geom_line() +
  facet_wrap(~Borough)
