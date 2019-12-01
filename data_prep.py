import pandas as pd
import operator
import string
from nltk.tokenize import RegexpTokenizer
import re

def predict_amount():
    df = pd.read_csv("cleaned_final.csv")
    incomes = []
    outcomes = []
    print(df.head)
    for row in df.values:
        odor = int(row[0].split(" ")[0].split("-")[2])
        sar = int(row[0].split(" ")[0].split("-")[1])
        try:
            hariltsagch_ner = row[4].lower()
        except:
            hariltsagch_ner = "0"
        try:
            hariltsagch_dans = int(row[3])
        except:
            hariltsagch_dans = 0
        utga = row[6].lower()
        tokenizer = RegexpTokenizer(r'\w+')
        utga = tokenizer.tokenize(utga)
        sep = " "
        utga = ' '.join([i for i in utga if not i.isdigit()])
        
        uldegdel = row[5]
        if row[1] != 0:
            incomes.append([odor, sar, hariltsagch_dans, hariltsagch_ner, utga, uldegdel, row[1]])
        else:
            outcomes.append([odor, sar, hariltsagch_dans, hariltsagch_ner, utga, uldegdel, row[2]])

    incomes = pd.DataFrame(incomes, columns=["odor", "sar", "hariltsagch_dans", "hariltsagch_ner", "utga", "uldegdel", "orlogo"])
    outcomes = pd.DataFrame(outcomes, columns=["odor", "sar", "hariltsagch_dans", "hariltsagch_ner", "utga", "uldegdel", "zarlaga"])
    incomes.to_csv("incomes_data_normalized.csv", index=False)
    outcomes.to_csv("outcomes_data_normalized.csv", index=False)
    import pandas as pd
    import numpy as np
    import matplotlib.pyplot as plt
    import seaborn as sns
    color = sns.color_palette()
    sns.set_style('darkgrid')
    import warnings
    def ignore_warn(*args, **kwargs):
        pass
    warnings.warn = ignore_warn #ignore annoying warning (from sklearn and seaborn)


    from scipy import stats
    from scipy.stats import norm, skew #for some statistics


    pd.set_option('display.float_format', lambda x: '{:.3f}'.format(x)) #Limiting floats output to 3 decimal points


    from subprocess import check_output
    import io

    data = pd.read_csv(io.StringIO(uploaded['incomes_data_normalized.csv'].decode('utf-8')))
    data1 = pd.read_csv(io.StringIO('outcomes_data_normalized.csv'.decode('utf-8')))
