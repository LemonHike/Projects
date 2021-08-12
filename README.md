
This branch of the repository containt two different projects:
1) Classification Comparison
2) Finantial Time Series Forecast

# CLASSIFICATION COMPARISON


**About project 1: Classification Comparison**

There is one file on the repository regarding this project
- Classification_Comparison.ipynb --> Contains the Notebook with the code and the Conclusions

The dataset was composed of 1000 samples with 21 features each both numerical
and categorical.
The task was the following: compare the performance of Logistic Regression  with that of
a Random Forest. Try to optimize both algorithms' parameters and determine which 
one is best for this dataset. 

# FINANCIAL TIME SERIES FORECASTING


**About project 2: Financial Time-Series Forecasting**

There are 2 files in the repository regarding this project:
- Financial Time Series Final Report.pdf --> contains a final report of the project
- Financial_Time_Series_Forecasting --> contains the notebook with the code

The goal of the project was to use time series data of stock returns to build a model that
accurately predicts future returns.

- The data consist of time series, splitted in a training and a test set;
- The training set contains both inputs and outputs. The inputs are the returns for the first 50 time steps and the outputs that are the returns of the time series for the 51-st time step.
- The test set contains only the inputs.
- Each time series has its first 50 values indexed by columns
The task is to predict the value in the column indexed by ‘50’ (the 51st time step) from the values in the columns indexed by ‘0’ to ‘49’ (the first 50 time steps).
