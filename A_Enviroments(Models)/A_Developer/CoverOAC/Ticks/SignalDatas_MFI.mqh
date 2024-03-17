//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class SignalDatas_MFI
{
public:
          SignalDatas_MFI(void) {};
          ~SignalDatas_MFI(void) {};

          bool       mfi_14_Self_BuyBulish;
          bool       mfi_14_Self_SellBearish;
          //
          bool       IsMFI_Buy_Array_m1Bulish_14_28;
          bool       IsMFI_Sell_Array_m1Bearish_14_28;
          //
          double     mfi14Array[];//
          double     mfi28Array[];//
          //=============================================================
          bool       IsMFI_Buy_Array_m1;
          bool       IsMFI_Sell_Array_m1;
          bool       IsMFI_BulishPS(ENUM_TIMEFRAMES f, int p, int s1, int s2) {return iMFI(_Symbol, f, p, s1) > iMFI(_Symbol, f, p, s2); };


          //______________
          void       Update()
          {         mfi_14_Self_BuyBulish       = iMFI(_Symbol, PERIOD_M1, 14, 0) > iMFI(_Symbol, PERIOD_M1, 14, 1);;  //
                    mfi_14_Self_SellBearish     = iMFI(_Symbol, PERIOD_M1, 14, 0) < iMFI(_Symbol, PERIOD_M1, 14, 1);; //
                    //
                    IsMFI_Buy_Array_m1Bulish_14_28                = iMFI(_Symbol, PERIOD_M1, 14, 1) > iMFI(_Symbol, PERIOD_M1, 28, 1);// && (iMFI(_Symbol, PERIOD_M1, 14, 1) > iMFI(_Symbol, PERIOD_M1, 14, 3));
                    IsMFI_Sell_Array_m1Bearish_14_28              = iMFI(_Symbol, PERIOD_M1, 14, 1) < iMFI(_Symbol, PERIOD_M1, 28, 1);// && (iMFI(_Symbol, PERIOD_M1, 14, 1) < iMFI(_Symbol, PERIOD_M1, 14, 3));
                    //
                    ArrayResize(mfi14Array, 14);
                    ArrayResize(mfi28Array, 14);
                    for(int i = 0; i < ArraySize(mfi14Array); i++)
                    {         mfi14Array[i]         = iMFI(_Symbol, PERIOD_M1, 14, i);
                              mfi28Array[i]         = iMFI(_Symbol, PERIOD_M1, 28, i);
                              //
                    }
                    ArraySetAsSeries(mfi14Array, true); ArraySetAsSeries(mfi28Array, true);
                    //=============================================================
                    IsMFI_Buy_Array_m1           = iMAOnArray(mfi14Array, ArraySize(mfi14Array), 14, 0, MODE_SMA, 0) > iMAOnArray(mfi28Array, ArraySize(mfi28Array), 28, 0, MODE_SMA, 0) && iMAOnArray(mfi14Array, ArraySize(mfi14Array), 14, 0, MODE_SMA, 2) < iMAOnArray(mfi28Array, ArraySize(mfi28Array), 28, 0, MODE_SMA, 2);
                    IsMFI_Sell_Array_m1          = iMAOnArray(mfi14Array, ArraySize(mfi14Array), 14, 0, MODE_SMA, 0) < iMAOnArray(mfi28Array, ArraySize(mfi28Array), 28, 0, MODE_SMA, 0) && iMAOnArray(mfi14Array, ArraySize(mfi14Array), 14, 0, MODE_SMA, 2) > iMAOnArray(mfi28Array, ArraySize(mfi28Array), 28, 0, MODE_SMA, 2);
                    //Print("mfi14Array:", iMAOnArray(mfi14Array, ArraySize(mfi14Array), 14, 0, MODE_SMA, 0)); //
                    //
          }; //
};
//+------------------------------------------------------------------+
