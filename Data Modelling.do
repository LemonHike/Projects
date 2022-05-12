xtset id year


gen log_sales = log(sales)

xtreg log_sales SE asov Leverage log_assets hhi mgrowth c.SE#c.mgrowth i.year, fe 
estimate store fe


xtreg log_sales SE asov Leverage log_assets hhi mgrowth c.SE#c.mgrowth i.year, re
estimate store re

hausman fe re, sigmamore



asdoc  xtreg log_sales SE asov Leverage log_assets hhi mgrowth c.SE#c.mgrowth i.year, fe , drop(noci) replace

*IT


/*

Fixed-effects (within) regression               Number of obs     =      4,432
Group variable: id                              Number of groups  =        801

R-squared:                                      Obs per group:
     Within  = 0.7599                                         min =          1
     Between = 0.4016                                         avg =        5.5
     Overall = 0.7845                                         max =         28

                                                F(33,3598)        =     345.13
corr(u_i, Xb) = 0.1342                          Prob > F          =     0.0000

--------------------------------------------------------------------------------
        lsales | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
---------------+-+---------------------------------------------------------------
            SE |  -.4791358    .068944    -6.95   0.000     -.614309   -.3439626
          asov |   2.094603   .3121643     6.71   0.000     1.482566     2.70664
      Leverage |   .1039817   .0437266     2.38   0.017     .0182503    .1897131
    log_assets |   .7032606   .0092129    76.33   0.000     .6851975    .7213237
           hhi |  -1.710737   .6011848    -2.85   0.004    -2.889434     -.53204
       mgrowth |   1.882234   1.540745     1.22   0.222    -1.138587    4.903056
               |
c.SE#c.mgrowth |  -.2183408   .3308134    -0.66   0.509    -.8669413    .4302598

*/



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

*IT winsor

xtreg wlog_sales wse wasov wLeverage log_wassets hhi mgrowth c.wse#c.mgrowth i.year, fe 

asdoc  xtreg wlog_sales wse wasov wLeverage log_wassets hhi mgrowth c.wse#c.mgrowth i.year, fe , drop(noci) replace

/*

Fixed-effects (within) regression               Number of obs     =      4,432
Group variable: id                              Number of groups  =        801

R-squared:                                      Obs per group:
     Within  = 0.7723                                         min =          1
     Between = 0.8994                                         avg =        5.5
     Overall = 0.9184                                         max =         28

                                                F(33,3598)        =     369.80
corr(u_i, Xb) = 0.5476                          Prob > F          =     0.0000

---------------------------------------------------------------------------------
     wlog_sales | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
----------------+----------------------------------------------------------------
            wse |  -.5814504   .1011926    -5.75   0.000     -.779851   -.3830498
          wasov |   8.275128   .8886805     9.31   0.000      6.53276     10.0175
      wLeverage |   -.012206   .0513299    -0.24   0.812    -.1128447    .0884326
    log_wassets |   .6985653   .0093817    74.46   0.000     .6801713    .7169592
            hhi |  -2.103771   .5789742    -3.63   0.000    -3.238921   -.9686204
        mgrowth |   2.323137   1.485777     1.56   0.118    -.5899119    5.236185
                |
c.wse#c.mgrowth |  -.4247615    .381341    -1.11   0.265    -1.172428    .3229046
                |


*/








*MANUFACTURING


/*
Fixed-effects (within) regression               Number of obs     =     13,177
Group variable: id                              Number of groups  =      1,973

R-squared:                                      Obs per group:
     Within  = 0.7320                                         min =          1
     Between = 0.9085                                         avg =        6.7
     Overall = 0.9318                                         max =         29

                                                F(33,11171)       =     924.56
corr(u_i, Xb) = 0.6507                          Prob > F          =     0.0000

--------------------------------------------------------------------------------
        lsales | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
---------------+----------------------------------------------------------------
            SE |   -.148164   .0185707    -7.98   0.000     -.184566   -.1117621
          asov |    5.75105   1.203962     4.78   0.000     3.391072    8.111027
      Leverage |   .0319587   .0229281     1.39   0.163    -.0129844    .0769018
    log_assets |   .7443418   .0058485   127.27   0.000     .7328778    .7558058
           hhi |   45.21449   4.214372    10.73   0.000     36.95357     53.4754
       mgrowth |  -.6785516   .0971856    -6.98   0.000    -.8690526   -.4880507
               |
c.SE#c.mgrowth |   .4664095   .2439172     1.91   0.056    -.0117113    .9445304


*/ 



*MANUFACTURING winsor


/*


Fixed-effects (within) regression               Number of obs     =     13,187
Group variable: id                              Number of groups  =      1,975

R-squared:                                      Obs per group:
     Within  = 0.7441                                         min =          1
     Between = 0.9145                                         avg =        6.7
     Overall = 0.9342                                         max =         29

                                                F(33,11179)       =     985.02
corr(u_i, Xb) = 0.6349                          Prob > F          =     0.0000

---------------------------------------------------------------------------------
     wlog_sales | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
----------------+----------------------------------------------------------------
            wse |  -.2588389   .0647848    -4.00   0.000    -.3858285   -.1318493
          wasov |   12.52507   1.581823     7.92   0.000     9.424416    15.62572
      wLeverage |   -.066659    .026462    -2.52   0.012    -.1185292   -.0147888
    log_wassets |   .7543355   .0058669   128.58   0.000     .7428355    .7658356
            hhi |   41.66875   4.108993    10.14   0.000      33.6144     49.7231
        mgrowth |  -.6295198    .095188    -6.61   0.000    -.8161051   -.4429344
                |
c.wse#c.mgrowth |   .7072529    .288842     2.45   0.014     .1410717    1.273434
                |

*/


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


margins, dydx(mgrowth) at(SE =( -.087 -0.027 0.015 0.099))
marginsplot


margins, dydx(SE) at(mgrowth=( -.12 -0.019 0.12))
marginsplot


margins, dydx(SE) at(mgrowth = (-.1 .1))
marginsplot
