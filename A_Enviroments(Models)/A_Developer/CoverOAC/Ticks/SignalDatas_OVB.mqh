class SignalDatas_OVB
{
public:
          SignalDatas_OVB(void) {};
          ~SignalDatas_OVB(void) {};
          //---------------- -
          bool       IsOVB_Bulish(ENUM_TIMEFRAMES f, int s1, int s2) {return iOBV(_Symbol, f, PRICE_CLOSE, s1) > iOBV(_Symbol, f, PRICE_CLOSE, s2);};

          //------
          double        OBV_Array[];
          double        OBV_Array2[];
          double        OBVSecound_Array;
          bool          IsOBVBulish_Array;
          //------
          void       Update()
          {         //------
                    ArrayResize(OBV_Array, 80); ArrayResize(OBV_Array2, 80);
                    for(int i = 0; i < ArraySize(OBV_Array); i++)
                    {         OBV_Array[i] = iOBV(_Symbol, PERIOD_M1, PRICE_CLOSE, i); }
                    ArraySetAsSeries(OBV_Array, true);
                    for(int i = 0; i < ArraySize(OBV_Array2); i++)
                    {         OBV_Array2[i] = iMAOnArray(OBV_Array, ArraySize(OBV_Array), 14, 0, MODE_SMA, i); }
                    ArraySetAsSeries(OBV_Array2, true);
                    OBVSecound_Array = iMAOnArray(OBV_Array2, ArraySize(OBV_Array2), 80, 0, MODE_SMA, 0);
                    IsOBVBulish_Array = OBVSecound_Array < OBV_Array2[0];//
          }; //
};