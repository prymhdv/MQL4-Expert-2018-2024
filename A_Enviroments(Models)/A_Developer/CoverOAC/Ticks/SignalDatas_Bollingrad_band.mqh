//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class SignalDatas_Bollingrad_band
{
public:
          bool       IsBollingrad_name;
          bool       IsBollingrad_BulishPrice(double pr, ENUM_TIMEFRAMES f,  int p, double d = 2, ENUM_APPLIED_PRICE ap = PRICE_LOW, int mode = MODE_MAIN, int s = 0)
          {         return  pr > iBands(_Symbol, f, p, d, 0, ap, mode, s) ;  }

          //-----------------

};
//+------------------------------------------------------------------+
