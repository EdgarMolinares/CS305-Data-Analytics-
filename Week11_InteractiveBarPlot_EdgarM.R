#Data Source: https://www.kaggle.com/datasets/stefanzivanov/olympic-games-2021-medals?select=Tokyo+2021+dataset+v4.csv

#installing google API package 'googleVis'
install.packages("googleVis")
library(googleVis)
suppressPackageStartupMessages (library (googleVis))

#reading CSV file
GMedalsChart = read.csv("/Users/edgarmolinares/Desktop/Edgewood School Work/Spring 2022/Data Analytics/data/Tokyo 2021 dataset v4.csv", header = TRUE)
head(GMedalsChart)

#defining gvisBarChart function
barplt = gvisBarChart(GMedalsChart, xvar = "NOCCode", yvar = c("Gold.Medal"),
  options = list(orientation = "horizontal", width = 1400,
  height = 500,title = "Gold Medals by Team (Tokyo 2020)",
    legend = "none",
hAxis = "{title :'Team',titleTextStyle :{color:'red'}}",
vAxis = "{title : 'Gold Medals', ticks : [0,10, 20, 30, 40],titleTextStyle :{color: 'red'}}",
bar = "{groupWidth: '100%'}"))

plot(barplt)
