
chi_emps <- read.csv("data/ChicagoEmployees.csv", stringsAsFactors = FALSE)

## Alternatively, we can use read_csv from the readr library
library(readr)

chi_emps <- read_csv("data/ChicagoEmployees.csv")

## summary to give summary statistics
summary(chi_emps)

## info about the data types
str(chi_emps)

### get counts of values using the table command
table(chi_emps$Dept)

### get the counts in order using sort
sort(table(chi_emps$Dept))

sort(table(chi_emps$Dept), decreasing = TRUE)

police <- chi_emps[chi_emps$Dept == "POLICE", ]

hist(police$AnnualSalary, xlab = "Annual Salary",
     ylab = "Count", main = "Salaries of Chicago Police Officers",
     col = "royalblue", breaks = 50)

big2 <- c("POLICE", "FIRE")
chi_emps$Dept2 <- ifelse(chi_emps$Dept %in% big2, chi_emps$Dept, "OTHER")

table(chi_emps$Dept2, chi_emps$SalHour)



boxplot(AnnualSalary~Dept2, data = chi_emps)



#### Get a dataframe of all individuals who make more than $150k

highly_paid <- chi_emps[chi_emps$AnnualSalary > 150000 & 
                          !is.na(chi_emps$AnnualSalary), ]


