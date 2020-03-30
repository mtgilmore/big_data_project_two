import pandas as pd
from pandas.plotting import scatter_matrix
from matplotlib import pyplot
from sklearn.preprocessing import LabelEncoder

from sklearn.model_selection import train_test_split
from sklearn.model_selection import cross_val_score

from sklearn.linear_model import LinearRegression as LR

from sklearn.metrics import classification_report
from sklearn.metrics import confusion_matrix
from sklearn.metrics import accuracy_score

#fields
names = ['age', 'workclass', 'fnlwgt', 'education', 'education-num', 'marital-status', 'occupation', 'relationship', 'race', 'sex', 'capital-gain', 'capital-loss', 'hours-per-week', 'native-country', 'class']

#read data
data = pd.read_csv('adult.data',names=names)


print(data.describe())

le = LabelEncoder()

for name in names:
    data[name] = le.fit_transform(data[name])


# scatter_matrix(data)
# pyplot.show()

array = data.values
X = array[:,0:14]
y = array[:,14]

X_train, X_validation, Y_train, Y_validation = train_test_split(X, y, test_size=0.20, random_state=1)

model = LR()
model.fit(X_train, Y_train)

predictions = model.predict(X_validation)

i = 0
for p in predictions:
    if p < 0.5:
        predictions[i] = 0
    else:
        predictions[i] = 1
    i += 1
    

print(accuracy_score(Y_validation, predictions))
print(confusion_matrix(Y_validation, predictions))
print(classification_report(Y_validation, predictions))
