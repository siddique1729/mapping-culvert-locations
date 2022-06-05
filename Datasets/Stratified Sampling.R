# The code is written by Jawwad Shadman Siddique | R11684947
# Date of Submission: 11 / 02 / 2020
# This Step performs Stratified Random Sampling with a seed value of 10
# It extracts 10% of the culverts from each state
# The sampling uses 'splitstackshape' package

# Specifying the location

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

# writing the stratified data to the csv file
# write.csv(a.strt,'strat_data.csv')

# Getting the values for states for the entire dataset + stratified dataset

state.all = table(a$NAME)
state.strt = table(a.strt$NAME)


# Making the Bar Plot

# For all the data

values = names(state.all)
barplot(state.all, names.arg = values , las = 2 , cex.names = 0.5)
box()
grid()
title('Total Number of values per state')
abline( h = 10, col = 'red', lty = 5 )

# For the stratified data
values = names(state.strt)
barplot(state.strt, names.arg = values , las = 2 , cex.names = 0.5)
box()
grid()
title('Values per state for stratified data')
abline( h = 20, col = 'red', lty = 10 )