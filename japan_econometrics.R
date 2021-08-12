## ECONOMETRICS GROUP ASSIGNMENT ##
## Japan (1960-2019)


## Group Members: 
## - William Poma, 
## - Georgi Angelchev,
## - Ludovico Gelsomino
## - Alexia Hansen-Holm


###------------ PART 1 ---------------###

## Summary of PART 1:
## In this part we set our working directory, import the packages we will make 
## use of, load the data from the OECD website regarding unemployment rate, 
## inflation rate, and expected inflation rate in Japan during the (1960-2019)
## period. 

## Then, we generate a matrix "df_both" that includes the values of inflation 
## and unemployment for each year respectively.

## Subsequently, we generate the linear model (relating it to the Phillips Curve 
## as suggested). From it, with the generic function "summary" from which we get
## the results of:the Residuals, Coefficients, Residual standard error, 
## Multiple R-squared, Adjusted, R-squared, F-statistic and the p-value. 

## We also use the generic function "confint" to compute the (0.95 and 0.99) 
## confidence intervals of the mentioned linear model. 
## Finally, we compute the Generalized Least Squares

## End of Summary of PART 1 ##


## We clear the working environment##
rm(list=ls())

## We check our working directory
getwd()
setwd("~/Desktop/japanassignment")

## We import the necessary packages##
library(ggplot2)
library(hrbrthemes)
library(lmtest)
library(plot3D)
library(normtest)
library(nlme)
library(readxl)

## We load the data of inflation and unemployment for the period 1960-2019 
## (yearly rate)  csv files which were extracted from the OECD website ##
df_unemp <- read.csv("unemployment2.csv", header = TRUE, sep=";")
df_infl <- read.csv("cpi2.csv", header = TRUE, sep=';')
df_infl_prior <- read.csv("prior.csv", header = TRUE, sep=';')

## We create a new matrix, extracting the data we are interested in ##
## (In our case, the Inflation and Unemployment rates) ##
df_both <- df_infl[c('Value')]
df_both['Unemployment'] <- df_unemp$Value
df_both['Year'] <- df_unemp$TIME
colnames(df_both) <- c('Inflation','Unemployment','Year')

## We construct the Linear Model ##
## dependent variable: inflation rate
## explanatory variable: unemployment rate
phillips <- lm(Inflation~Unemployment,data=df_both)

## We plot its Phillips Curve
plot(Inflation ~ Unemployment, data = df_both)
abline(phillips, col="red", lwd=2, xlab="Unemployment", ylab="Inflation")
title("Phillips Curve, Japan 1960 - 2019")

## Some Inference ##
summary(phillips)
confint(phillips)
confint(phillips,level = 0.99)

## We introduce tools for visualization visualization ##
p_both <- ggplot(data=df_both) + geom_point(data=df_both,mapping = aes(x = Unemployment, y = Inflation)) + geom_smooth(method = lm,mapping = aes(x=Unemployment,y=Inflation),formula = y ~ x, se = FALSE)
p_infl <- ggplot(data=df_both) + geom_point(mapping = aes(x = Year, y = Inflation))
p_unem <- ggplot(data=df_both) + geom_point(mapping = aes(x = Year, y = Unemployment))


###------------ PART 2 ---------------###

## Summary of PART 2:
## In this part we incorporate the expected inflation rate to our calculations
## to a new dataframe which we will use to calculate a modified version of the 
## Phillips model we had before, we call it now "phillips_modified".

## From it we will test:
## - Homoscedasticity: with the Breush-Pagan Test, "bptest".
## - Higher-oreder serial correlation: with the Breusch-Godfrey Test, "bgtest"
## - Normality: with the Jarque-Bera test for normality, "jb.norm.test"
## Then, we use the generic function "summary" from which we get the results of:
## the Residuals, Coefficients, Residual standard error, Multiple R-squared, 
## Adjusted, R-squared, F-statistic and the p-value of "phillips_modified".

## We also use the generic function "confint" to compute the (0.95) confidence 
## interval of the mentioned linear model. 
## Finally, we provide tools for visualization.
## End of Summary of Part 2 ##


## We create a dataframe with the rates for Inflation(time t),
## Unemployment(time t) and Inflation(time t-1) ##
df_new <- df_infl[c('Value')]
df_new['Inflation(t-1)'] <- df_infl_prior$Value
df_new['Unemployment'] <- df_unemp$Value
colnames(df_new) <- c('Inflation','Inflation_prior','Unemployment')

## We introduce an alternative linear model
## dependent variable: inflation rate
## explanatory variables: prior inflation, unemployment rate
phillips_modified = lm(Inflation~Inflation_prior+Unemployment,data=df_new)

## We plot its Phillips Curve
plot(Inflation ~ Inflation_prior+Unemployment, data = df_new)
abline(phillips_modified, col="red", lwd=2, xlab="Unemployment", ylab="Inflation")
title("Alterantive Phillips Curve, Japan 1960 - 2019")

## We test homoscedasticity of the model ##
bptest(phillips_modified) #heteroscedastic, therefore we need coeftest
plot(df_both$Year,phillips_modified$residuals,xlab='Year',ylab='Residual value')


## We test higher-order serial correlation ##
bgtest(phillips_modified,order=2) #not correlated

## We test Normality##
jb.norm.test(phillips_modified$residuals)#normal
jb.norm.test(phillips_modified$coefficients)#not normal
hist(phillips_modified$residuals,xlab = 'Residual Values')


##Inference##
summary(phillips_modified)
coeftest(phillips_modified,vcoc = hccm) #because of the heteroscedasticity
confint(phillips_modified)
confint(phillips_modified,level=0.99)

###------------ PART 3 ---------------###

## Summary of PART 3:
## In this part we are going to run a linear regression on the new kaynesian phillips curve.
## We will try to asses the reliability of this alternative model.

## From it we will test:
## - Homoscedasticity: with the Breush-Pagan Test, "bptest".
## - Higher-oreder serial correlation: with the Breusch-Godfrey Test, "bgtest"
## - Normality: with the Jarque-Bera test for normality, "jb.norm.test"
## Then, we use the generic function "summary" from which we get the results of:
## the Residuals, Coefficients, Residual standard error, Multiple R-squared, 
## Adjusted, R-squared, F-statistic and the p-value of "phillips_modified".

## We also use the generic function "confint" to compute the (0.95) confidence 
## interval of the mentioned linear model. 
## Finally, we provide tools for visualization.

# We load the data of inflation and output gap for the period 1983-2019 
# N.B: we couldn't find data for output gap from 1960-1982
## (quarterly)  csv and xlsx files which are extracted from the OECD website (inflation) and 
## from bank of japan (output gap)##
gap <- read_excel("gap.xlsx")
Inflation <- read.csv("Inflation.csv")

#we extract the data we data we are interested in (inflation and output gap)
x = Inflation$Value[1:147]#1) assuming expected inflation is equal to last's year inflation:
y = as.numeric(gap$需給ギャップ[5:151])
z = Inflation$Value[2:148]

## We construct the Linear Model ##
## dependent variable: inflation rate
## explanatory variables: unemployment rate, output gap
NKPC <- lm(z ~ x + y)
summary(NKPC)

# We plot the linear model and the data

grid.lines = 50
x.pred <- seq(min(x), max(x), length.out = grid.lines)
y.pred <- seq(min(y), max(y), length.out = grid.lines)
xy <- expand.grid( x = x.pred, y = y.pred)[1:150,]
z.pred <- matrix(predict(NKPC, newdata = xy), 
                 nrow = grid.lines, ncol = grid.lines)

fitpoints <- predict(NKPC)


scatter3D(x, y, z, pch = 20, cex = 1, colvar=FALSE, col="red", theta = 20 , phi = 15 , bty="bl2",
          col.panel ="azure4", expand =0.5, col.grid = "snow",
          xlab = "expected inflation", ylab = "output gap", zlab = "inflation",  
          surf = list(x = x.pred, y = y.pred, z = z.pred,  
                      facets = TRUE, col=ramp.col (col = c("green","green"), n = 150, alpha=0.7), fit = fitpoints, border="black"))

## We test homoscedasticity of the model ##
bptest(NKPC) #we do not reject homoscedasticity

## We test higher-order serial correlation ##
bgtest(NKPC,order=2) #not correlated

## We test Normality##
jb.norm.test(NKPC$residuals)#not normal
jb.norm.test(NKPC$coefficients)#not normal
hist(NKPC$residuals,xlab = 'Residual Values')


##Inference##
summary(NKPC)
confint(NKPC)
confint(NKPC,level=0.99)


## Conclusions: ##











