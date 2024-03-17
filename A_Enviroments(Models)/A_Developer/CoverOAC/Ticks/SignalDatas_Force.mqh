class SignalDatas_Force
{
public:
          SignalDatas_Force(void) {};
          ~SignalDatas_Force(void) {};
          //
          bool       IsForce_Bulish(ENUM_TIMEFRAMES f, int p1, int p2, int s1, int s2) 
          {return iForce(_Symbol, f, p1, MODE_SMA, PRICE_CLOSE, s1) > iForce(_Symbol, f, p2, MODE_SMA, PRICE_CLOSE, s2);};
          bool       IsForce_BulishDelta(ENUM_TIMEFRAMES f, int p1, int s1, double delta ) 
          {return iForce(_Symbol, f, p1, MODE_SMA, PRICE_CLOSE, s1) > delta;};
          void       Update()
          {         //-------------------------------------------------------------
          }; //
};