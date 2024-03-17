//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class SignalDatas_RVI
{
public:
          SignalDatas_RVI(void){};
          ~SignalDatas_RVI(void){};
          //-----------------------


          bool       IsRVI_Bulishff(ENUM_TIMEFRAMES f1, ENUM_TIMEFRAMES f2, int p, int s) {return iRVI(_Symbol, f1, p, MODE_MAIN, s) > iRVI(_Symbol, f2, p, MODE_SIGNAL, s); }
          bool       IsRVI_BulishCrossff(ENUM_TIMEFRAMES f1, ENUM_TIMEFRAMES f2, int p, int s)
          {         return iRVI(_Symbol, f1, p, MODE_MAIN, s) > iRVI(_Symbol, f2, p, MODE_SIGNAL, s) && iRVI(_Symbol, f1, p, MODE_MAIN, s + 1) < iRVI(_Symbol, f2, p, MODE_SIGNAL, s + 1); }
          bool       IsRVI_BearishCrossff(ENUM_TIMEFRAMES f1, ENUM_TIMEFRAMES f2, int p, int s)
          {         return iRVI(_Symbol, f1, p, MODE_MAIN, s) < iRVI(_Symbol, f2, p, MODE_SIGNAL, s) && iRVI(_Symbol, f1, p, MODE_MAIN, s + 1) > iRVI(_Symbol, f2, p, MODE_SIGNAL, s + 1); }


          //



};
//+------------------------------------------------------------------+
