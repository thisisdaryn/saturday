library(workshop)
library(dplyr)
library(lubridate)
library(tidyr)


### Pipe operator: %>% 

### split the Created column into Day and time and then change the Day to a date
### not text

nyc_df <- separate(nyc311, Created, into = c("Day", "Time"), sep = " ") %>%
  mutate(Day = mdy(Day))


### For Brooklyn, which agencies get the most calls 

bk_report <- filter(nyc_df, Borough == "BROOKLYN") %>%
  group_by(Borough, Agency) %>% summarise(Calls = n()) %>%
  arrange(desc(Calls))

hpd <- filter(nyc_df, Agency == "HPD")

hpd_type_counts <- group_by(hpd, Type) %>% 
  summarise(Complaints = n())

#### 

nyc_df$weekday <- weekdays(nyc_df$Day)



nyc_df$weekday <- factor(nyc_df$weekday, 
                         levels = c("Sunday", "Monday", "Tuesday", 
                                   "Wednesday", "Thursday", "Friday", 
                                   "Saturday"))

barplot(table(nyc_df$weekday))

### create a column for Active vs Inactive: all cases where status is closed 
### are Inactive

nyc_df$Active <- ifelse(nyc_df$Status == "Closed", FALSE, TRUE)





