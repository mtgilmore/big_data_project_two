print("hello")

path = "C:/Users/mtgil/OneDrive/Documents/GitHub/big_data_project_two"

names = c("age", "workclass", "fnlwgt", "education", "education-num", "marital-status", "occupation", "relationship", "race", "sex", "capital-gain", "capital-loss", "hours-per-week", "native-country", "class")

data = read.csv(paste(path, "/adult.data", sep=""), header=FALSE, col.names = names)
