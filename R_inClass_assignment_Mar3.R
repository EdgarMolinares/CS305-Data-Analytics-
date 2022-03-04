library(tidyverse)
library(tidyr)
library(readr)
library(datasets)
library(dplyr)


#read in csv data. The read_csv method creates a dataframe/tibble byyes
default
df <- read_csv("/Users/edgarmolinares/Desktop/Edgewood School Work/Spring 2022/Data Analytics/data/starbucks_drinkMenu_expanded.csv")
head(df)

#update column names to remove unwanted characters
colnames(df) <- c("Category", "Drink", "Prep", "Cals", "Total Fat","TransFat", "Saturated Fat", "Salt", "TotalCarbs", "Cholesterol", "DietFiber", "Sugars", "Protein", "VitaminA", "VitaminC", "Calcium", "Iron %", "Caffeine" )
view(df)

#removed Fiber column, didn't see the use for fiber
df2 <- select(df, -DietFiber)
head(df2)

#Remove unwanted characters by changing the encoding
df2$Category <- iconv(df2$Category, 'utf-8', 'ascii', sub='')
df2$Drink<- iconv(df2$Drink, 'utf-8', 'ascii', sub='')

#removing NAs
df2 <- na.omit(df2)
print(df2)

#Add a new column based on values in other columns
#2 percent hurts my stomach :(
df2 <- df2 %>% 
  mutate(IsHealthy = if_else(Prep == '2% Milk'
, "No", "Yes"))
view(df2)
