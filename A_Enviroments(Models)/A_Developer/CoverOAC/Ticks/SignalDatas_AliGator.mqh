class SignalDatas_AliGator
{
public:
          SignalDatas_AliGator(void) {};
          ~SignalDatas_AliGator(void) {};
          //
          bool       IsAliGator_Bulish_m1;
          bool       IsAliGator_Bulish_m5;
          bool       IsAliGator_Bulish_m15;
          void       Update()
          {         //=============================================================
                    IsAliGator_Bulish_m1 = iAlligator(_Symbol, PERIOD_M1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, 1) > iAlligator(_Symbol, PERIOD_M1, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, 1);
                    IsAliGator_Bulish_m5 = iAlligator(_Symbol, PERIOD_M5, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, 1) > iAlligator(_Symbol, PERIOD_M5, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, 1);
                    IsAliGator_Bulish_m5 = iAlligator(_Symbol, PERIOD_M15, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, 1) > iAlligator(_Symbol, PERIOD_M15, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, 1);
                    //
          };//
};