install.packages("psych")
library(psych)

# My file path to data
path = "C:/Users/mtgil/OneDrive/Documents/GitHub/big_data_project_two"

# Importing data
names = c("age", "workclass", "fnlwgt", "education", "education-num", "marital-status", "occupation", "relationship", "race", "sex", "capital-gain", "capital-loss", "hours-per-week", "native-country", "class")
data = read.csv(paste(path, "/adult.data", sep=""), header=FALSE, col.names = names)

# Stats for our report
summary(data)
describe(data)

# Convert factor columns to int
numeric_data = data.matrix(data)
