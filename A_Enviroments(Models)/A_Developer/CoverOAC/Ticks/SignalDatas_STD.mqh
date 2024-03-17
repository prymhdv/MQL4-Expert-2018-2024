

class SignalDatas_STD
{
public:
          SignalDatas_STD(void) {};
          ~SignalDatas_STD(void) {};
          //
          bool       IsSTD_14_20_Bulish_M1;
          bool       IsSTD_14_20_Bulish_M5;
          bool       IsSTD_14_20_Bulish_M15;
          bool       IsSTD_14_20_Bulish_M30;
          bool       IsSTD_14_20_Bulish_H1;
          void       Update()
          {         IsSTD_14_20_Bulish_M1       = iStdDev(_Symbol, PERIOD_M1, 14, 0, MODE_EMA, PRICE_CLOSE, 0) > iStdDev(_Symbol, PERIOD_M1, 20, 0, MODE_EMA, PRICE_CLOSE, 0);
                    IsSTD_14_20_Bulish_M5       = iStdDev(_Symbol, PERIOD_M5, 14, 0, MODE_EMA, PRICE_CLOSE, 0) > iStdDev(_Symbol, PERIOD_M5, 20, 0, MODE_EMA, PRICE_CLOSE, 0);
                    IsSTD_14_20_Bulish_M15      = iStdDev(_Symbol, PERIOD_M15, 14, 0, MODE_EMA, PRICE_CLOSE, 0) > iStdDev(_Symbol, PERIOD_M15, 20, 0, MODE_EMA, PRICE_CLOSE, 0);
                    IsSTD_14_20_Bulish_M30      = iStdDev(_Symbol, PERIOD_M30, 14, 0, MODE_EMA, PRICE_CLOSE, 0) > iStdDev(_Symbol, PERIOD_M30, 20, 0, MODE_EMA, PRICE_CLOSE, 0);
                    IsSTD_14_20_Bulish_H1       = iStdDev(_Symbol, PERIOD_H1, 14, 0, MODE_EMA, PRICE_CLOSE, 0) > iStdDev(_Symbol, PERIOD_H1, 20, 0, MODE_EMA, PRICE_CLOSE, 0);
                    //=============================================================
                    //bool ISBWMFI_Bulish = iBWMFI(_Symbol, PERIOD_M1,0);
          };//
};