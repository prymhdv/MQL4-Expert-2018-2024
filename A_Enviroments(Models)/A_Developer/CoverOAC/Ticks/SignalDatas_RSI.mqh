//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class SignalDatas_RSI
{
public:
          SignalDatas_RSI(void) {};
          ~SignalDatas_RSI(void) {};
          //-----------------------
          bool       IsRSI_Bulishff(string sy, ENUM_TIMEFRAMES f1, ENUM_TIMEFRAMES f2, int p, int s)
          {         return iRSI(sy, f1, p, PRICE_CLOSE, s) > iRSI(sy, f2, p, PRICE_CLOSE, s); }

          //
          bool       IsRSI_Cross_Bulish(string sy, ENUM_TIMEFRAMES f, int p1, int p2, int s)
          {         return iRSI(sy, f, p1, PRICE_CLOSE, s) > iRSI(sy, f, p2, PRICE_CLOSE, s) && iRSI(sy, f, p1, PRICE_CLOSE, s + 1) < iRSI(sy, f, p2, PRICE_CLOSE, s + 1);};
          bool       IsRSI_Cross_Bearish(string sy, ENUM_TIMEFRAMES f, int p1, int p2, int s)
          {         return iRSI(sy, f, p1, PRICE_CLOSE, s) < iRSI(sy, f, p2, PRICE_CLOSE, s) && iRSI(sy, f, p1, PRICE_CLOSE, s + 1) > iRSI(sy, f, p2, PRICE_CLOSE, s + 1);};
          //
          bool       Is_RSI_BulishP3(string sy, ENUM_TIMEFRAMES f, int p1, int p2, int p3, int r)
          {         return iRSI(sy, f, p1, PRICE_CLOSE, 0) > iRSI(sy, f, p2, PRICE_CLOSE, 0)
                           && iRSI(sy, f, p2, PRICE_CLOSE, 0) > iRSI(sy, f, p3, PRICE_CLOSE, 0) && iRSI(sy, f, p3, PRICE_CLOSE, 0) < r; };
          bool       Is_RSI_BearishP3(string sy, ENUM_TIMEFRAMES f, int p1, int p2, int p3, int r)
          {         return iRSI(sy, f, p1, PRICE_CLOSE, 0) < iRSI(sy, f, p2, PRICE_CLOSE, 0)
                           && iRSI(sy, f, p2, PRICE_CLOSE, 0) < iRSI(sy, f, p3, PRICE_CLOSE, 0) && iRSI(sy, f, p3, PRICE_CLOSE, 0) > r; };
          //
          bool       Is_RSI_BulishDelta(string sy, ENUM_TIMEFRAMES f, int p1, int delta, int s = 0 ) {return iRSI(sy, f, p1, PRICE_CLOSE, s) > delta;}
          bool       Is_RSI_INDelta(string sy, ENUM_TIMEFRAMES f, int p1, int deltaMin = 0, int deltaMax = 100, int s = 0 )
          {         return iRSI(sy, f, p1, PRICE_CLOSE, s) > deltaMin && iRSI(sy, f, p1, PRICE_CLOSE, s) < deltaMax ;}
          bool       Is_RSI_BulishShift(string sy, ENUM_TIMEFRAMES f, int p1, int s1 = 0, int s2 = 1 )
          {         return iRSI(sy, f, p1, PRICE_CLOSE, s1) > iRSI(sy, f, p1, PRICE_CLOSE, s2);}
          bool       Is_RSI_BulishPeriodsShift(string sy, ENUM_TIMEFRAMES f, int p1, int p2, ENUM_APPLIED_PRICE ap = PRICE_CLOSE, int s1 = 0, int s2 = 0 )
          {         return iRSI(sy, f, p1, ap, s1) > iRSI(sy, f, p2, ap, s2);}
          //
          void       Update()
          {         //
                    //
                    //-------------------------------------------------------------
          }//
};
//+------------------------------------------------------------------+
