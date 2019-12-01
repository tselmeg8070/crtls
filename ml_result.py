import pandas as pd
income = pd.read_csv("actual_pred_income.csv")
outcome = pd.read_csv("actual_pred.csv")

from matplotlib import pyplot as plt
plt.plot(outcome["actual"].values, label='ACTUAL')
plt.plot(outcome["prediction"].values, label='PREDICTED')
plt.legend()
plt.show()