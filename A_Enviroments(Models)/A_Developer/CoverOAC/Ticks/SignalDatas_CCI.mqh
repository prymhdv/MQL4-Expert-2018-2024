//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class SignalDatas_CCI
{
public:
          SignalDatas_CCI(void) {};
          ~SignalDatas_CCI(void) {};
          //-----------------------
          bool       IsCCI_Bulishff(string sy, ENUM_TIMEFRAMES f1, ENUM_TIMEFRAMES f2, int p, int s)
          {         return iCCI(sy, f1, p, PRICE_CLOSE, s) > iCCI(sy, f2, p, PRICE_CLOSE, s); }

          //
          bool       IsCCI_Cross_Bulish(string sy, ENUM_TIMEFRAMES f, int p1, int p2, int s)
          {         return iCCI(sy, f, p1, PRICE_CLOSE, s) > iCCI(sy, f, p2, PRICE_CLOSE, s) && iCCI(sy, f, p1, PRICE_CLOSE, s + 1) < iCCI(sy, f, p2, PRICE_CLOSE, s + 1);};
          bool       IsCCI_Cross_Bearish(string sy, ENUM_TIMEFRAMES f, int p1, int p2, int s)
          {         return iCCI(sy, f, p1, PRICE_CLOSE, s) < iCCI(sy, f, p2, PRICE_CLOSE, s) && iCCI(sy, f, p1, PRICE_CLOSE, s + 1) > iCCI(sy, f, p2, PRICE_CLOSE, s + 1);};
          //
          bool       Is_CCI_BulishP3(string sy, ENUM_TIMEFRAMES f, int p1, int p2, int p3, int r)
          {         return iCCI(sy, f, p1, PRICE_CLOSE, 0) > iCCI(sy, f, p2, PRICE_CLOSE, 0)
                           && iCCI(sy, f, p2, PRICE_CLOSE, 0) > iCCI(sy, f, p3, PRICE_CLOSE, 0) && iCCI(sy, f, p3, PRICE_CLOSE, 0) < r; };
          bool       Is_CCI_BearishP3(string sy, ENUM_TIMEFRAMES f, int p1, int p2, int p3, int r)
          {         return iCCI(sy, f, p1, PRICE_CLOSE, 0) < iCCI(sy, f, p2, PRICE_CLOSE, 0)
                           && iCCI(sy, f, p2, PRICE_CLOSE, 0) < iCCI(sy, f, p3, PRICE_CLOSE, 0) && iCCI(sy, f, p3, PRICE_CLOSE, 0) > r; };
          //
          bool       Is_CCI_BulishDelta(string sy, ENUM_TIMEFRAMES f, int p1, int s , double delta ) {return iCCI(sy, f, p1, PRICE_CLOSE, s) > delta;}
          bool       Is_CCI_INDelta(string sy, ENUM_TIMEFRAMES f, int p1, int s = 0, double deltaMin = -100, double deltaMax = 100 )
          {         return iCCI(sy, f, p1, PRICE_CLOSE, s) > deltaMin && iCCI(sy, f, p1, PRICE_CLOSE, s) < deltaMax ;}
          bool       Is_CCI_BulishShift(string sy, ENUM_TIMEFRAMES f, int p1, int s1 = 0, int s2 = 1 )
          {         return iCCI(sy, f, p1, PRICE_CLOSE, s1) > iCCI(sy, f, p1, PRICE_CLOSE, s2);}
          bool       Is_CCI_BulishPeriodsShift(string sy, ENUM_TIMEFRAMES f, int p1, int p2, ENUM_APPLIED_PRICE ap = PRICE_CLOSE, int s1 = 0, int s2 = 0 )
          {         return iCCI(sy, f, p1, ap, s1) > iCCI(sy, f, p2, ap, s2);}
          //
          void       Update()
          {         //
                    //
                    //-------------------------------------------------------------
          }//
}; 
