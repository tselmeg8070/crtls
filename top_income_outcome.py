import pandas as pd 
import operator
df = pd.read_csv("cleaned_final.csv")
df1 = []
for row in df.values:
    if str(row[3]) == "nan":
        try:
            date = str(row[0].split(" ")[0].split("-")[1]).replace("0", "")
        except:
            continue
        df1.append([date, row[1], row[2], 0, row[4], row[5], row[6]])
    else:
        try:
            date = str(row[0].split(" ")[0].split("-")[1]).replace("0", "")
        except:
            continue
        df1.append([date, row[1], row[2], int(row[3]), row[4], row[5], row[6]])
df1 = pd.DataFrame(df1, columns=["date", "income", "outcome", "account", "name", "left", "desc"])


all_names = df1["name"].values
# print(all_names)
def unique(list1): 
    # intilize a null list 
    unique_list = [] 
    # traverse for all elements 
    for x in list1: 
        # check if exists in unique_list or not 
        if x not in unique_list: 
            unique_list.append(x) 
    return unique_list
unique_names = unique(all_names)
items = {}
for i in unique_names:
    items[i] = []
for row1 in df1.values:
    for name in items:
        if row1[4] == name:
            items[name].append(row1[1])

for item in items:
    items[item] = sum(items[item])
# print(items)
sorted_items = sorted(items.items(), key=operator.itemgetter(1))
top5 = len(sorted_items)-5
print(sorted_items[top5:len(sorted_items)])
print("---------------------------")
items_o = {}
for i in unique_names:
    items_o[i] = []
for row1 in df1.values:
    for name in items_o:
        if row1[4] == name:
            items_o[name].append(row1[2])
for item1 in items_o:
    items_o[item1] = sum(items_o[item1])
# print(items)
sorted_items1 = sorted(items_o.items(), key=operator.itemgetter(1))
top51 = len(sorted_items1)-5
print(sorted_items1[top51:len(sorted_items1)])
print("---------------------------")


import matplotlib.pyplot as plt
import numpy as np

incomes = sorted_items[top5:len(sorted_items)]
outcomes = sorted_items1[top51:len(sorted_items1)]

objects = []
performance = []
for income in incomes:
    objects.append(income[0])
    performance.append(income[1])    

# objects = []
# performance = []
# for outcome in outcomes:
#     objects.append(outcome[0])
#     performance.append(outcome[1])   

y_pos = np.arange(len(objects))

plt.bar(y_pos, performance, align='center', alpha=0.5, color="green")
plt.xticks(y_pos, objects)
plt.ylabel('Мөнгөн дүн')
# plt.title('Хамгийн их зарлагын үүсвэр')
plt.title('Хамгийн их орлогын үүсвэр')

plt.show()