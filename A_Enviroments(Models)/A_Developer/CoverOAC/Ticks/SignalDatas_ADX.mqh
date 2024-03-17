class SignalDatas_ADX
{
public:
          SignalDatas_ADX(void) {};
          ~SignalDatas_ADX(void) {};
          //-----------------
          bool       IsADX_Bulish_M1;
          bool       IsADX_Bearish_M1;
          bool       IsADX_Bulish_M5;
          bool       IsADX_Bearish_M5;
          bool       IsADX_Bulish_H1;
          bool       IsADX_Bearish_H1;
          bool       isADX_RangeMarket_m1;
          bool       isADX_RangeMarket_m5;
          void       Update()
          {         IsADX_Bulish_M1   = iADX(_Symbol, PERIOD_M1, 14, PRICE_CLOSE, MODE_PLUSDI, 0) > iADX(_Symbol, PERIOD_M1, 14, PRICE_CLOSE, MODE_MINUSDI, 0);
                    IsADX_Bearish_M1  = iADX(_Symbol, PERIOD_M1, 14, PRICE_CLOSE, MODE_PLUSDI, 0) < iADX(_Symbol, PERIOD_M1, 14, PRICE_CLOSE, MODE_MINUSDI, 0);
                    IsADX_Bulish_M5   = iADX(_Symbol, PERIOD_M5, 14, PRICE_CLOSE, MODE_PLUSDI, 0) > iADX(_Symbol, PERIOD_M5, 14, PRICE_CLOSE, MODE_MINUSDI, 0);
                    IsADX_Bearish_M5  = iADX(_Symbol, PERIOD_M5, 14, PRICE_CLOSE, MODE_PLUSDI, 0) < iADX(_Symbol, PERIOD_M5, 14, PRICE_CLOSE, MODE_MINUSDI, 0);
                    IsADX_Bulish_H1   = iADX(_Symbol, PERIOD_H1, 14, PRICE_CLOSE, MODE_PLUSDI, 0) > iADX(_Symbol, PERIOD_H1, 14, PRICE_CLOSE, MODE_MINUSDI, 0);
                    IsADX_Bearish_H1  = iADX(_Symbol, PERIOD_H1, 14, PRICE_CLOSE, MODE_PLUSDI, 0) < iADX(_Symbol, PERIOD_H1, 14, PRICE_CLOSE, MODE_MINUSDI, 0);
                    isADX_RangeMarket_m1 = iADX(_Symbol, PERIOD_M1, 14, PRICE_CLOSE, MODE_MAIN, 0) < iADX(_Symbol, PERIOD_M1, 14, PRICE_CLOSE, MODE_PLUSDI, 0) ;
                    isADX_RangeMarket_m5 = iADX(_Symbol, PERIOD_M5, 14, PRICE_CLOSE, MODE_MAIN, 0) < iADX(_Symbol, PERIOD_M5, 14, PRICE_CLOSE, MODE_PLUSDI, 0) ;//
          };//
};