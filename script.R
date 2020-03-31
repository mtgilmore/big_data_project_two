install.packages("psych")
library(psych)

install.packages("ggplot2")
library(ggplot2)

install.packages("lattice")
library(lattice)

install.packages("BBmisc")
library(BBmisc)

library(datasets)
library(class)

# My file path to data
path = "C:/Users/mtgil/OneDrive/Documents/GitHub/big_data_project_two"

# Importing data
names = c("age", "workclass", "fnlwgt", "education", "education-num", "marital-status", "occupation", "relationship", "race", "sex", "capital-gain", "capital-loss", "hours-per-week", "native-country", "class")
data = read.csv(paste(path, "/adult.data", sep=""), header=FALSE, col.names = names)

# Stats for our report
summary(data)
psych::describe(data, check=TRUE)

# Convert factor columns to int
numeric_data = data.matrix(data)

pairs(numeric_data)
splom(~numeric_data[1:4])

for (i in 1:15){
  for (j in i:15){
    print(paste("For column", i))
    print(paste("and column", j))
    print(paste("correlation is", cor(numeric_data[,i],numeric_data[,j])))
  }
}

trimmed_data = numeric_data[,1:14]
trimmed_data = na.omit(trimmed_data)
trimmed_data = scale(trimmed_data)
