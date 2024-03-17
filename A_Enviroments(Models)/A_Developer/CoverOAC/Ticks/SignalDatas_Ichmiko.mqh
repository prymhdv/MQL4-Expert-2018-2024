//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class SignalDatas_Ichmiko
{
public:
          SignalDatas_Ichmiko(void) {};
          ~SignalDatas_Ichmiko(void) {};
          //
          bool       IsIchmiko_Bulish;//

          void       Update(ENUM_TIMEFRAMES f)
          {         //=============================================================
                    IsIchmiko_Bulish = iIchimoku(_Symbol, f, 9, 26, 52, MODE_SENKOUSPANB, 0) < iIchimoku(_Symbol, f, 9, 26, 52, MODE_SENKOUSPANA, 0);
                    //
          };//
}; 
