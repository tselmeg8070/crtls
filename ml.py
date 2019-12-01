import pandas as pd
df = pd.read_csv("tselmeg_cleaned_data.csv")
df1 = []
for row in df.values:
    if str(row[0]) == "nan":
        try:
            date = str(row[0].split(" ")[0].split(".")[1]).replace("0", "")
        except:
            continue
        df1.append([date, row[1], int(row[5].replace("-", "")), row[3], row[3]])
    else:
        try:
            date = str(row[0].split(" ")[0].split("-")[1]).replace("0", "")
        except:
            continue
        df1.append([date, row[1], row[2], int(row[3]), row[4], row[5], row[6]])
df1 = pd.DataFrame(df1, columns=["date", "income", "outcome", "name", "left", "desc"])

import numpy as np
import random as rnd

# visualization
# import seaborn as sns
import matplotlib.pyplot as plt

# machine learning
from sklearn.linear_model import LogisticRegression
from sklearn.svm import SVC, LinearSVC
from sklearn.ensemble import RandomForestClassifier
from sklearn.neighbors import KNeighborsClassifier
from sklearn.naive_bayes import GaussianNB
from sklearn.linear_model import Perceptron
from sklearn.linear_model import SGDClassifier
from sklearn.tree import DecisionTreeClassifier

from sklearn.model_selection import train_test_split

X = []
y = []
for row in df1.values:
    # X.append([row[0], row[1], row[3], row[4], row[5], row[6]])
    X.append([row[0],row[1]])
    y.append(str(row[2]))

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.1, random_state=42)
print(y_train)
svc = SVC()
svc.fit(X_train, y_train)
Y_pred = svc.predict(X_test)
acc_svc = round(svc.score(X_train, y_train) * 100, 2)
print(acc_svc)
clf = LogisticRegression(random_state=0, solver='lbfgs',multi_class='multinomial').fit(X, y)
print(clf.score(X, y))