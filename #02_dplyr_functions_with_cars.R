library(workshop)

data(nyc311)

library(dplyr)

### All dplyr functions have a common format:
## first argument/input is a data frame, followed by a variable number of other inputs

data("cars2018")

## make a scatterplot of MPG vs cylinders

plot(cars2018$Cylinders, cars2018$MPG)

plot(MPG~Cylinders, data = cars2018)

### distribution of MPG can be seen with a histogram

hist(cars2018$MPG, xlab = "Miles per gallon",
     main = "MPG of 2018 Model Cars")

## Comparing MPGs of different transmission types

boxplot(MPG~Transmission, data = cars2018)

## How to keep all cars with 6 or more cylinders

cars_6plus <- filter(cars2018, Cylinders >= 6)

cars_6plusauto <- filter(cars2018, Cylinders >= 6, 
                         Transmission == "Automatic")

table(cars_6plusauto$Cylinders, cars_6plusauto$Transmission)


### Use filter to find all the cars with MPG greater than 30 

### could also achieve this using base R 
alt_df <- cars2018[cars2018$MPG > 30, ]


### select function allows you to keep only certain columns
### e.g. keep only the Model, Cylinders, Transmission and MPG columns

cars_narrow <- select(cars2018, Model, Cylinders, Transmission, MPG)

### select can also be used to drop colums 
### e.g. drop ID and MaxEthanol

cars_13 <- select(cars2018, -ID, -MaxEthanol)


## create a new column named Size: Large if > 6 cylinders,
### Small if <= 6 

cars2018 <- mutate(cars2018, Size = ifelse(Cylinders > 6, "Large", "Small"))


grouped_cars <- group_by(cars2018, Transmission)
report <- summarise(grouped_cars, Avg = mean(MPG), Median = median(MPG),
                    num = n())

grouped2 <- group_by(cars2018, Transmission, Drive)
report2 <- summarise(grouped2, Avg = mean(MPG), Median = median(MPG),
                     num = n())


data("chi_emps")


## Question: for each department 




