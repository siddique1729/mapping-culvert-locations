# The code is written by Jawwad Shadman Siddique | R11684947
# Date of Submission: 11 / 04 / 2020
# This Step performs mapping of the culvert location
# Specifying the destination folder

# getwd()
# setwd("D:/R Practice Programs")
# getwd()

# installing required packages & library

install.packages('splitstackshape')
install.packages('tidverse')
library('splitstackshape')
library('tidyverse')

# reading the culvert data
a = read.csv('clean_name.csv')

# checking the initial data points
head(a)

state = "NAME" # column of the dataframe that carries the name of the states
sample = 0.1 # percent of the sample - 10%

# stratified random sampling function
a.strt = stratified(a, group = state, size = sample, replace = TRUE)


# Taking the values of longitude and latitude

x.full <- a$Longitude
y.full <- a$Latitude
x.strt <- a.strt$Longitude
y.strt <- a.strt$Latitude

# Making a plot

plot(x.full,y.full, pch=1,col='red',ylab='Latitude',xlab='Longitude')
points(x.strt,y.strt,pch=20,col='blue')
grid()
title('Location of Culverts and Stratified Samples')
legend('topright',pch=c(1,20),col=c('red','blue'),legend=c('All
culverts','Sampled'))