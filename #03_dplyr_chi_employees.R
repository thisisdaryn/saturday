### For each chicago department, find: 
### number of employees
#### average salary paid 
### average hourly rate

library(workshop)
library(dplyr)

group_chi <- group_by(chi_emps, Dept)
report <- summarise(group_chi, num = n(),
                    AvgSal = mean(AnnualSalary, na.rm = TRUE), 
                    AvgHrRate = mean(HourlyRate, na.rm = TRUE))

### sort using the arrange function

sorted_report <- arrange(report, desc(num))

sorted_report2 <- arrange(report, desc(AvgSal))
