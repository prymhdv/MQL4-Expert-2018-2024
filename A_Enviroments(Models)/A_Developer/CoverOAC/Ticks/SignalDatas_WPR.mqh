//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class SignalDatas_WPR
{
public:
          SignalDatas_WPR(void) {};
          ~SignalDatas_WPR(void) {};
          //------------------
          bool       wprBuy_Cross;
          bool       wprSell_Cross;

          bool       wprBulishBuy;
          bool       wprBearishSell;
          bool       IsWPR_200_Bulish_m1;
          double     WPR_Array[];

          bool       IsWPR_200_MA14_Bulish_m1;
          //----------
          bool       IsWPR_200_Upper_n20_Bulish_m1;
          bool       IsWPR_200_Under_n80_Bearish_m1;
          bool       IsWPR_14_Bulish_Under_n80_m1;
          bool       IsWPR_14_Bearish_Upper_n20_m1;
          bool       IsWPR_Bulish_200__m1;

          //------------------
          bool       Is_WPR_BulishPeriods(ENUM_TIMEFRAMES f1, int p1, int p2, int s = 0)       { return iWPR(_Symbol, f1, p1, s) > iWPR(_Symbol, f1, p2, s);}
          bool       Is_WPR_BulishDelta(ENUM_TIMEFRAMES f1, int p1, int delta )         { return iWPR(_Symbol, f1, p1, 0) > delta;}
          //------------------
          char IsWPR100EMa_200SMa_200_Buyp1Selln1(ENUM_TIMEFRAMES f1, int p) //----&& IsMacd_CrossBulish(f1, 0,0.0, 12, 26, 0)//--&& IsMacd_CrossBearish(f1, 0,0.0, 12, 26, 0)
          {         double WPR_200SMa = 0;
                    double WPR_100EMa = 0;
                    double WPRVal[]; ArrayResize(WPRVal, p);
                    for(int i = 0; i < p; i++)
                    {         WPRVal[i] = iWPR(_Symbol, f1, p, i); //
                    }
                    WPR_200SMa = iMAOnArray(WPRVal, p, p, 0, MODE_SMA, 0);
                    WPR_100EMa = iMAOnArray(WPRVal, p, p / 2, 0, MODE_EMA, 0);
                    if( WPR_100EMa > WPR_200SMa && WPRVal[0] > WPR_100EMa) return +1;
                    if( WPR_100EMa < WPR_200SMa && WPRVal[0] < WPR_100EMa) return -1;
                    return 0;
                    //
          }
          //------------------
          void       Update()
          {         wprBuy_Cross               = iWPR(_Symbol, PERIOD_M1, 14, 0) > iWPR(_Symbol, PERIOD_M1, 200, 0) && iWPR(_Symbol, PERIOD_M1, 14, 0) < iWPR(_Symbol, PERIOD_M1, 200, 1);
                    wprSell_Cross              = iWPR(_Symbol, PERIOD_M1, 14, 0) < iWPR(_Symbol, PERIOD_M1, 200, 0) && iWPR(_Symbol, PERIOD_M1, 14, 0) > iWPR(_Symbol, PERIOD_M1, 200, 1); //&& (iWPR(_Symbol, PERIOD_M1, 14, 0) > -20);
                    wprBulishBuy           = (iWPR(_Symbol, PERIOD_M1, 200, 1)) > (iWPR(_Symbol, PERIOD_M1, 200, 3));
                    wprBearishSell         = (iWPR(_Symbol, PERIOD_M1, 200, 1)) < (iWPR(_Symbol, PERIOD_M1, 200, 3));
                    IsWPR_200_Bulish_m1    = iWPR(_Symbol, PERIOD_M1, 200, 0) > iWPR(_Symbol, PERIOD_M1, 200, 1);
                    ArrayResize(WPR_Array, 200);
                    for(int i = 0; i < ArraySize(WPR_Array); i++) { WPR_Array[i] = iWPR(_Symbol, PERIOD_M1, 200, 0); }
                    ArraySetAsSeries(WPR_Array, true);
                    IsWPR_200_MA14_Bulish_m1 = iMAOnArray(WPR_Array, ArraySize(WPR_Array), 14, 0, MODE_SMA, 0) > iMAOnArray(WPR_Array, ArraySize(WPR_Array), 14, 0, MODE_SMA, 1);
                    //----------
                    IsWPR_200_Upper_n20_Bulish_m1       = (iWPR(_Symbol, PERIOD_M1, 200, 0) > -20) ;
                    IsWPR_200_Under_n80_Bearish_m1      = (iWPR(_Symbol, PERIOD_M1, 200, 0) < -80) ;
                    IsWPR_14_Bulish_Under_n80_m1        = (iWPR(_Symbol, PERIOD_M1, 14, 0) < -80);
                    IsWPR_14_Bearish_Upper_n20_m1       = (iWPR(_Symbol, PERIOD_M1, 14, 0) > -20);
                    IsWPR_Bulish_200__m1                = (iWPR(_Symbol, PERIOD_M1, 200, 1)) > (iWPR(_Symbol, PERIOD_M1, 200, 3));
                    //------------------
                    //
          }; //
};
//+------------------------------------------------------------------+
