//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class SignalDatas_ATR
{
public:
          SignalDatas_ATR(void) {};
          ~SignalDatas_ATR(void) {};
          //

          bool       IsATR_BulishFactor(string sy ,ENUM_TIMEFRAMES f, int p1, int p2, int s, double delta) { return (iATR(sy, f, p1, s) / iATR(sy, f, p2, s)) > delta;};
          bool       IsATR_BulishDelta(string sy ,ENUM_TIMEFRAMES f, int p1, int s, double delta)          { return iATR(sy, f, p1, s) > delta;};
          double IsATR_DeltaFactor(string sy ,ENUM_TIMEFRAMES f, int p1, int p2, int s)
          {         return (iATR(sy, f, p1, s) / iATR(sy, f, p2, s));};

          void       Update()
          {         //=============================================================
          };//
};
//+------------------------------------------------------------------+
