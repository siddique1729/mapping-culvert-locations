# The code is written by Jawwad Shadman Siddique
# This Step performs Data Cleaning & Binary Variable Transformation
# It cleans the outlier and non-standard data
# It cleans the non-standard missing values by converting it into NA's

# Checking the directory
# getwd()
# setwd("D:/R Practice Programs")
# getwd()

# reading the culvert data
a = read.csv('culvertdata.csv')

# checking the initial data points
head(a)
summary(a)

# Removing the outlier data

anew = subset(a, TMAXC != -9999 & TMINC != -9999 & PPTIN != -9999)
summary(anew) # checking the dataset

# Removing the outlier data
anew = subset(anew, YEAR_OF_FUTURE_ADT_115 != 7200)
anew = subset(anew, YEAR_OF_FUTURE_ADT_115 != 4400)
anew = subset(anew, YEAR_OF_FUTURE_ADT_115 != 3032)
anew = subset(anew, YEAR_OF_FUTURE_ADT_115 != 3000)
summary(anew$YEAR_OF_FUTURE_ADT_115) # checking the dataset

# Removing the outlier data
anew = subset(anew, FUTURE_ADT_114 != 883210)
summary(anew$FUTURE_ADT_114) # checking the dataset

# Removing the outlier data
anew = subset(anew, DECK_WIDTH_MT_052 != 1000)
summary(anew$DECK_WIDTH_MT_052) # checking the dataset

# Converting the non-standard character/string values to NA's
# Using as.integer() function to check the columns
# The operation is done for all the 4 columns containing non-standard values

scour_critical = anew$SCOUR_CRITICAL_113
scour_critical = as.integer(scour_critical)
summary(scour_critical)
anew = data.frame(anew, scour_critical)
anew = na.omit(anew)
summary(anew$scour_critical)
summary(anew$SCOUR_CRITICAL_113)

waterway_eval = anew$WATERWAY_EVAL_071
waterway_eval = as.integer(waterway_eval)
summary(waterway_eval)
anew = data.frame(anew, waterway_eval)
anew = na.omit(anew)
summary(anew$waterway_eval)
summary(anew$WATERWAY_EVAL_071)

struc_eval = anew$STRUCTURAL_EVAL_067
struc_eval = as.integer(struc_eval)
summary(struc_eval)
anew = data.frame(anew, struc_eval)
anew = na.omit(anew)
summary(anew$struc_eval)
summary(anew$STRUCTURAL_EVAL_067)

channel_cond = anew$CHANNEL_COND_061
channel_cond = as.integer(channel_cond)
summary(channel_cond)
anew = data.frame(anew, channel_cond)
anew = na.omit(anew)
summary(anew$channel_cond)
summary(anew$CHANNEL_COND_061)

# Checking the dataset

summary(anew)
colnames(anew)

# Omitting the 4 non-standard columns

anew = anew[, -13]
anew = anew[, -16]
anew = anew[, -16]
anew = anew[, -21]

# Checking the dataset

colnames(anew)
summary(anew)

# Binary Transformation
# 0~5 - Unsatisfactory is represented by 0
# >=6 - Satisfactory is represented by 1


culvert_cond = ifelse(anew$CULVERT_COND_062 <=5, 0, 1)
anew = data.frame(anew, culvert_cond)
colnames(anew)
anew[,13]
anew = anew[,-13] #Omit the column of culvert condition for avoiding duplication
colnames(anew)
anew[,36]

# Omitting character/string columns that will not be considered for correlation

summary(anew)

clean_data = anew[,-1]
colnames(clean_data)
clean_data = clean_data[,-21]
colnames(clean_data)
clean_data = clean_data[,-25]
colnames(clean_data)

# Printing the cleaned data with binary transformation

print(clean_data)

# writing the cleaned data to the csv file

# d = clean_data
# write.csv(d, 'clean.csv')

# writing the cleaned data with name to the csv file
# write.csv(anew, 'clean_name.csv')
