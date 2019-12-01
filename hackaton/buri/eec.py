#-*- coding: utf-8 -*-

import pandas as pd
import csv, requests
from pprint import pprint
from bs4 import BeautifulSoup
source = requests.get('http://list.eec.mn/23/7.html?') 
source.encoding = 'utf-8'  
soup = BeautifulSoup(source.text, 'html.parser') 

table = soup.find("table")
tr = table.findAll('tr')
table_content = []

for item in tr:
    table_content.append(item)

output_rows = []
for table_row in table_content:
    columns = table_row.findAll('td')
    output_row = []
    for column in columns:
        output_row.append(column.text)
    output_rows.append(output_row)
with open('outputMath.csv', 'w') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerows(output_rows)

