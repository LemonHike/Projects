xtset id year

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
       sales |     15,844    3378.936    13564.88     -1.632     276644



*/


summarize sales, detail

/*

                       Revenue - Total
-------------------------------------------------------------
      Percentiles      Smallest
 1%         .906         -1.632
 5%        5.177              0
10%       11.791              0       Obs              15,844
25%       40.551              0       Sum of wgt.      15,844

50%     202.5665                      Mean           3378.936
                        Largest       Std. dev.      13564.88
75%     1295.086         252652
90%       6407.3         262394       Variance       1.84e+08
95%        14538         272776       Skewness       9.620521
99%     60281.64         276644       Kurtosis       128.8934




*/


* Plotting the averga indutry sales
by year, sort: egen sales_mean = mean(sales)
plot sales_mean year
line sales_mean year
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
          SE |     15,844   -.0462886    .1806212  -15.84358   3.365369

*/

summarize SE, detail

/*

                     Strategic emphasis
-------------------------------------------------------------
      Percentiles      Smallest
 1%    -.4296904      -15.84358
 5%    -.2234127      -3.844961
10%    -.1589095      -2.199446       Obs              15,844
25%    -.0874119       -1.92389       Sum of wgt.      15,844

50%    -.0275807                      Mean          -.0462886
                        Largest       Std. dev.      .1806212
75%     .0015768       1.169534
90%     .0461399       1.250959       Variance        .032624
95%     .0995923       2.427612       Skewness       -42.7983
99%     .2734002       3.365369       Kurtosis       3722.418




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
        asov |     15,844    .0018935    .0087516          0   .1472284



*/

summarize asov, detail

/*


                 Advertising Share of Voice
-------------------------------------------------------------
      Percentiles      Smallest
 1%     1.13e-08              0
 5%     5.66e-07              0
10%     1.58e-06              0       Obs              15,844
25%     6.58e-06              0       Sum of wgt.      15,844

50%     .0000379                      Mean           .0018935
                        Largest       Std. dev.      .0087516
75%      .000305       .1312899
90%      .002745       .1419942       Variance       .0000766
95%     .0084663       .1472284       Skewness       9.069422
99%     .0387805       .1472284       Kurtosis       104.5944



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
    Leverage |     15,844    .1442736    .2081029          0   5.752913




*/

summarize Leverage, detail

/*
                     Financial Leverage
-------------------------------------------------------------
      Percentiles      Smallest
 1%            0              0
 5%            0              0
10%            0              0       Obs              15,844
25%            0              0       Sum of wgt.      15,844

50%     .0706594                      Mean           .1442736
                        Largest       Std. dev.      .2081029
75%     .2272771       3.387352
90%     .3790095        3.80313       Variance       .0433068
95%      .490995       4.394085       Skewness       5.020545
99%     .8084852       5.752913       Kurtosis       73.87025


*/


*plotting the average Leverage of the firms
by id, sort : egen avg_Leverage = mean(Leverage) 
plot avg_Leverage id
scatter avg_Leverage id
drop avg_Leverage



*plotting the average Leverage of the firms over the years
by year, sort: egen avg_Leverage = mean(Leverage) 
plot avg_Leverage year
line avg_Leverage year
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
      assets |     15,844    4337.548     19396.7       .179     473712


*/


summarize assets, detail

/*



                      firm total assets
-------------------------------------------------------------
      Percentiles      Smallest
 1%        2.334           .179
 5%        6.983           .247
10%       13.208           .295       Obs              15,844
25%       42.803           .299       Sum of wgt.      15,844

50%     206.9345                      Mean           4337.548
                        Largest       Std. dev.       19396.7
75%     1408.995         421879
90%         7167         437575       Variance       3.76e+08
95%        17678         468714       Skewness       11.03964
99%        87095         473712       Kurtosis       174.6938


*/



*plotting the average Leverage of the firms
by id, sort : egen avg_assets = mean(assets) 
plot avg_assets id
scatter avg_assets id
drop avg_assets



*plotting the average Leverage of the firms over the years
by year, sort: egen avg_assets = mean(assets) 
plot avg_assets year
line avg_assets year
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
         hhi |     15,844     .026418    .0034631   .0172435    .032196

*/

summarize hhi, detail

/*



                             hhi
-------------------------------------------------------------
      Percentiles      Smallest
 1%     .0172435       .0172435
 5%     .0213812       .0172435
10%       .02198       .0172435       Obs              15,844
25%     .0242128       .0172435       Sum of wgt.      15,844

50%     .0274328                      Mean            .026418
                        Largest       Std. dev.      .0034631
75%     .0284652        .032196
90%     .0308529        .032196       Variance        .000012
95%      .031445        .032196       Skewness      -.6407303
99%      .032196        .032196       Kurtosis       3.171041




*/


hist(hhi)

plot hhi year
line hhi year






*mgrowth

sum mgrowth

/*


    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
     mgrowth |     13,187    .0403496    .0960824  -.1958209   .2535315



*/

summarize mgrowth, detail

/*

                           mgrowth
-------------------------------------------------------------
      Percentiles      Smallest
 1%    -.1958209      -.1958209
 5%    -.1630416      -.1958209
10%    -.0517279      -.1958209       Obs              13,187
25%    -.0176035      -.1958209       Sum of wgt.      13,187

50%     .0325986                      Mean           .0403496
                        Largest       Std. dev.      .0960824
75%     .0834574       .2535315
90%     .1562535       .2535315       Variance       .0092318
95%      .250423       .2535315       Skewness      -.0850074
99%     .2535315       .2535315       Kurtosis       3.408766





*/


plot mgrowth year
line mgrowth year


gen log_sales = log(sales)

corr log_sales SE asov Leverage log_assets hhi mgrowth


/*
             | log_sa~s       SE     asov Leverage log_as~s      hhi  mgrowth
-------------+---------------------------------------------------------------
   log_sales |   1.0000
          SE |   0.1792   1.0000
        asov |   0.4075   0.1080   1.0000
    Leverage |   0.2297   0.0427   0.0594   1.0000
  log_assets |   0.9678   0.1522   0.4080   0.2411   1.0000
         hhi |   0.0848   0.0148   0.0234   0.0354   0.1007   1.0000
     mgrowth |  -0.0673   0.0130   0.0053  -0.0592  -0.0779   0.3090   1.0000



*/
