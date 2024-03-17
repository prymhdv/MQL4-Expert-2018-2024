class SignalDatas_AD
{
public:
          SignalDatas_AD(void) {};
          ~SignalDatas_AD(void) {};
          //
          bool          IsAD_Bulish;
          double        AD_Array[];
          bool          IsAD_MA7_MA14_Bulish_m1;
          void       Update()
          {         IsAD_Bulish = iAD(_Symbol, PERIOD_M1, 1);
                    ArrayResize(AD_Array, 200);
                    for(int i = 0; i < ArraySize(AD_Array); i++) { AD_Array[i] = iAD(_Symbol, PERIOD_M1, i);}
                    ArraySetAsSeries(AD_Array, true);
                    IsAD_MA7_MA14_Bulish_m1 = iMAOnArray(AD_Array, ArraySize(AD_Array), 7, 0, MODE_SMA, 1) > iMAOnArray(AD_Array, ArraySize(AD_Array), 14, 0, MODE_SMA, 1);
                    //=============================================================
          };//
};