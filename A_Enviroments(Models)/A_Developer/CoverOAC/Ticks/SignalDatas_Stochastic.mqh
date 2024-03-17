//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class SignalDatas_Stochastic
{
public:
          SignalDatas_Stochastic(void) {};
          ~SignalDatas_Stochastic(void) {};
          //-----------------------
          bool       Stoch_Bulish(string sy,ENUM_TIMEFRAMES f, int s, int p = 5)
          {         return iStochastic( sy, f, p, 3, 3, MODE_SMA, 0, MODE_MAIN, s) > iStochastic( sy, f, p, 3, 3, MODE_SMA, 0, MODE_SIGNAL, s) ;}
          bool       Stoch_BulishDelta(string sy,ENUM_TIMEFRAMES f, int delta, int p = 5, int s = 0)
          {         return iStochastic( sy, f, p, 3, 3, MODE_SMA, 0, MODE_MAIN, s) > delta ;}
          bool       Stoch_INDelta(string sy,ENUM_TIMEFRAMES f, int deltaMin, int deltaMax, int s, int p = 5)
          {         return iStochastic( sy, f, p, 3, 3, MODE_SMA, 0, MODE_MAIN, s) > deltaMin && iStochastic( sy, f, p, 3, 3, MODE_SMA, 0, MODE_MAIN, s) < deltaMax ;}

          bool       Stoch_Bulishff(string sy,ENUM_TIMEFRAMES f1, ENUM_TIMEFRAMES f2) {return iStochastic( sy, f1, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, 0) > iStochastic( sy, f2, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, 0) ;}
          //over 50 in bulish bearish

          //
          bool       IsStoch_CrossBulish(string sy,ENUM_TIMEFRAMES f, int s, int p = 5)
          {         return iStochastic( sy, f, p, 3, 3, MODE_SMA, 0, MODE_MAIN, s) > iStochastic( sy, f, p, 3, 3, MODE_SMA, 0, MODE_SIGNAL, s) && iStochastic( sy, f, p, 3, 3, MODE_SMA, 0, MODE_MAIN, s + 1) < iStochastic( sy, f, p, 3, 3, MODE_SMA, 0, MODE_SIGNAL, s + 1);};
          bool       IsStoch_CrossBearish(string sy,ENUM_TIMEFRAMES f, int s, int p = 5)
          {         return iStochastic( sy, f, p, 3, 3, MODE_SMA, 0, MODE_MAIN, s) < iStochastic( sy, f, p, 3, 3, MODE_SMA, 0, MODE_SIGNAL, s) && iStochastic( sy, f, p, 3, 3, MODE_SMA, 0, MODE_MAIN, s + 1) > iStochastic( sy, f, p, 3, 3, MODE_SMA, 0, MODE_SIGNAL, s + 1);};


          //

          //

          //-----------------------
          void       Update()
          {         //
                    //
                    //
                    //=============================================================
          }//
};
//+------------------------------------------------------------------+
