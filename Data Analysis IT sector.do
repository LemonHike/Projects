*GRAPHS AND STUFF


winsor sales, gen(wsales) p(0.01)
gen wlog_sales = log(wsales)
winsor SE, gen(wse) p(0.01)
winsor asov, gen(wasov) p(0.01)
winsor assets, gen(w_assets) p(0.01)
gen log_wassets = log(w_assets)
winsor Leverage, gen(wLeverage) p(0.01)
gen log_Leverage = log(wLeverage)
winsor rd, gen(wrd) p(0.01)
gen log_wrd = log(wrd)


*IT

*sales 



hist sales





sum sales
/*

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
       sales |      5,520    2943.686    13857.39          0     181265


*/


summarize sales, detail

/*

                       Revenue - Total
-------------------------------------------------------------
      Percentiles      Smallest
 1%        1.192              0
 5%        6.211              0
10%      13.9795              0       Obs               5,520
25%      39.9045              0       Sum of wgt.       5,520

50%      134.861                      Mean           2943.686
                        Largest       Std. dev.      13857.39
75%     486.2465         161857
90%     2164.025         163763       Variance       1.92e+08
95%     9168.361         170805       Skewness        7.07819
99%        85866         181265       Kurtosis       59.78683



*/


* Plotting the averga indutry sales
by year, sort: egen sales_mean = mean(sales)
plot sales_mean year
line sales_mean year
twoway connected sales_mean year
drop sales_mean


* Plotting the average firm sales
by id, sort : egen avg_sales = mean(sales) 
plot avg_sales id
scatter avg_sales id
graph hbox avg_sales
drop avg_sales


*WINSORIZATION


by id, sort : egen wavg_sales = mean(wsales)
by id, sort : egen avg_sales = mean(sales)
plot avg_sales id
scatter avg_sales id
graph hbox avg_sales wavg_sales
drop avg_sales
drop wavg_sales


hist wlog_sales






*SE 

*FOCAL VARIABLE OF INTEREST: STRATEGIC EFFECT

hist SE


sum SE


/*
    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
          SE |      5,520   -.0978997    1.216599     -89.75   2.088962
*/

summarize SE, detail

/*

                     Strategic emphasis
-------------------------------------------------------------
      Percentiles      Smallest
 1%    -.5173797         -89.75
 5%    -.2847187      -3.673333
10%    -.2143507      -1.963832       Obs               5,520
25%    -.1322619      -1.612785       Sum of wgt.       5,520

50%    -.0657572                      Mean          -.0978997
                        Largest       Std. dev.      1.216599
75%    -.0127844       1.568172
90%     .0178371       1.587381       Variance       1.480113
95%     .0554455        1.70225       Skewness      -72.51694
99%     .2460701       2.088962       Kurtosis       5344.068




*/



by year, sort: egen SE_mean = mean(SE)
plot SE_mean year
line SE_mean year
drop SE_mean




by id, sort: egen SE_mean = mean(SE)
plot SE_mean id
line SE_mean id
graph hbox SE_mean
drop SE_mean


*winsorization



by id, sort : egen wavg_se = mean(wse)
by id, sort : egen avg_se = mean(SE)
graph hbox avg_se wavg_se
drop avg_se
drop wavg_se







*asov 

sum asov

/*

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
        asov |      5,520    .0054348    .0311689          0   .6515379



*/

summarize asov, detail

/*



                 Advertising Share of Voice
-------------------------------------------------------------
      Percentiles      Smallest
 1%            0              0
 5%     2.46e-06              0
10%     7.12e-06              0       Obs               5,520
25%     .0000345              0       Sum of wgt.       5,520

50%      .000192                      Mean           .0054348
                        Largest       Std. dev.      .0311689
75%     .0011849       .5661079
90%     .0056226        .602532       Variance       .0009715
95%     .0145193        .602702       Skewness       12.26006
99%     .1181784       .6515379       Kurtosis       192.3674



*/




by id, sort: egen asov_mean = mean(asov)
plot asov_mean id
line asov_mean id
graph hbox asov_mean
drop asov_mean




by id, sort : egen wavg_asov = mean(wasov)
by id, sort : egen avg_asov = mean(asov)
graph hbox avg_asov wavg_asov
drop avg_asov
drop wavg_asov




*Leverage 


*LEVERAGE

hist Leverage

sum Leverage

/*

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
    Leverage |      5,520    .0887268    .1715189          0   2.851043



*/

summarize Leverage, detail

/*
                     Financial Leverage
-------------------------------------------------------------
      Percentiles      Smallest
 1%            0              0
 5%            0              0
10%            0              0       Obs               5,520
25%            0              0       Sum of wgt.       5,520

50%     .0024857                      Mean           .0887268
                        Largest       Std. dev.      .1715189
75%     .1193047       1.817043
90%     .2993879       2.159348       Variance       .0294187
95%     .4118983       2.501562       Skewness       4.195627
99%     .7262138       2.851043       Kurtosis       37.88211

*/


*plotting the average Leverage of the firms
by id, sort : egen avg_Leverage = mean(Leverage) 
plot avg_Leverage id
scatter avg_Leverage id
drop avg_Leverage



*plotting the average Leverage of the firms over the years
by year, sort: egen avg_Leverage = mean(Leverage) 
plot avg_Leverage year
scatter avg_Leverage year
drop avg_Leverage


*winsorization

by id, sort : egen wavg_lev = mean(wLeverage)
by id, sort : egen avg_lev = mean(Leverage)
graph hbox avg_lev wavg_lev
drop avg_lev
drop wavg_lev






*assets 

hist assets


sum assets

/*


    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
      assets |      5,520    5689.043    28533.27       .004     551669


*/


summarize assets, detail

/*


                      firm total assets
-------------------------------------------------------------
      Percentiles      Smallest
 1%        2.871           .004
 5%       9.7955           .007
10%      18.6745           .207       Obs               5,520
25%      59.2305             .3       Sum of wgt.       5,520

50%      196.542                      Mean           5689.043
                        Largest       Std. dev.      28533.27
75%     849.9665         403821
90%     4212.181         444097       Variance       8.14e+08
95%     18440.84         531864       Skewness       8.835762
99%     143795.8         551669       Kurtosis       105.3724


*/



*plotting the average Leverage of the firms
by id, sort : egen avg_assets = mean(assets) 
plot avg_assets id
scatter avg_assets id
drop avg_assets



*plotting the average Leverage of the firms over the years
by year, sort: egen avg_assets = mean(assets) 
plot avg_assets year
scatter avg_assets year
drop avg_assets


*winsorization

by id, sort : egen wavg_assets = mean(w_assets)
by id, sort : egen avg_assets = mean(assets)
graph hbox avg_assets wavg_assets
drop avg_assets
drop wavg_assets


*hhi 

*HHI

sum hhi

/*
    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
         hhi |      5,520    .1463896    .1184841   .0667961   .4636473



*/

summarize hhi, detail

/*



                             hhi
-------------------------------------------------------------
      Percentiles      Smallest
 1%     .0667961       .0667961
 5%     .0716478       .0667961
10%     .0727419       .0667961       Obs               5,520
25%      .084172       .0667961       Sum of wgt.       5,520

50%     .0937032                      Mean           .1463896
                        Largest       Std. dev.      .1184841
75%     .1152602       .4636473
90%     .4263368       .4636473       Variance       .0140385
95%     .4553897       .4636473       Skewness       1.855259
99%     .4636473       .4636473       Kurtosis       4.929891



*/


hist(hhi)

plot hhi year
line hhi year






*mgrowth

sum mgrowth

/*


    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
     mgrowth |      4,432    .0818174    .1241142  -.1284153   .4591125



*/

summarize mgrowth, detail

/*

                           mgrowth
-------------------------------------------------------------
      Percentiles      Smallest
 1%    -.1284153      -.1284153
 5%    -.1034937      -.1284153
10%    -.0570512      -.1284153       Obs               4,432
25%     .0198601      -.1284153       Sum of wgt.       4,432

50%     .0643929                      Mean           .0818174
                        Largest       Std. dev.      .1241142
75%     .1202214       .4591125
90%     .2576268       .4591125       Variance       .0154043
95%     .3782945       .4591125       Skewness       1.279186
99%     .4591125       .4591125       Kurtosis       5.137647



*/


plot mgrowth year
line mgrowth year




corr log_sales SE asov Leverage log_assets hhi mgrowth

asdoc cor sales SE asov Leverage assets hhi mgrowth, label replace


/*
             | log_sa~s       SE     asov Leverage log_as~s      hhi  mgrowth
-------------+---------------------------------------------------------------
   log_sales |   1.0000
          SE |   0.0619   1.0000
        asov |   0.4151   0.0131   1.0000
    Leverage |   0.1729   0.0195   0.0526   1.0000
  log_assets |   0.9569   0.1062   0.3976   0.1951   1.0000
         hhi |  -0.2385  -0.0045   0.0939  -0.0262  -0.2725   1.0000
     mgrowth |  -0.1317  -0.0275  -0.0069  -0.0241  -0.1275   0.0578   1.0000

*/

