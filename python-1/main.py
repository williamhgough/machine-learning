# Data Processing

# Library imports
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd


# Dataset
dataset = pd.read_csv('Data.csv')
X = dataset.iloc[:, :-1].values
y = dataset.iloc[:, 3].values

# Handle missing data
from sklearn.preprocessing import Imputer
imputer = Imputer(missing_values = 'NaN', strategy = 'mean', axis = 0)

# Fill missing values in column 1 & 2 (upper bound excluded)
imputer.fit(X[:, 1:3])

# Replace data
X[:, 1:3] = imputer.transform(X[:, 1:3])

# Encoding Categorical data

from sklearn.preprocessing import LabelEncoder, OneHotEncoder

# Countries (X) to numbers
labelEncoder_X = LabelEncoder()
X[:, 0] = labelEncoder_X.fit_transform(X[:, 0])
# Categorise country numbers to dummy variables
oneHotEncoder = OneHotEncoder(categorical_features = [0])
X = oneHotEncoder.fit_transform(X).toarray()

# Purchased (y) to numbers
labelEncoder_Y = LabelEncoder()
y= labelEncoder_Y.fit_transform(y)

# Split data into training and test sets
from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)


# Feature Scaling
from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)