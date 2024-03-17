//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class SignalDatas_SAR
{
public:
          SignalDatas_SAR(void) {};
          ~SignalDatas_SAR(void) {};
          //
          bool       IsSar_Bearish(ENUM_TIMEFRAMES f, double s = 0.02, double s2 = 0.2, int shift = 0) {return iSAR(_Symbol, f, s, s2, shift) > Ask;}; //good effecct
          bool       IsSar_Bulish(ENUM_TIMEFRAMES f, double s = 0.02, double s2 = 0.2, int shift = 0)  {return iSAR(_Symbol, f, s, s2, shift) < Bid;}; //
          //
          bool       IsSar_BulishDiff(ENUM_TIMEFRAMES f, double s = 0.02, double s2 = 0.2, int shift = 0, double diff = 0.0)  {return MathAbs(iSAR(_Symbol, f, s, s2, shift) - iClose(_Symbol, f, shift)) > diff ;}; //

          //--------------
          char      Sar_Direction(ENUM_TIMEFRAMES f, double s = 0.02, double s2 = 0.2, int shift = 0)
          {         return iSAR(_Symbol, f, s, s2, shift) > Ask ? -1 : +1; }
          //--------------
          char      Sar_Direction_MA_(ENUM_TIMEFRAMES f, double s = 0.02, double s2 = 0.2, int shift = 0,int pma=14)
          {         char res = 0;
                    if(iSAR(_Symbol, f, s, s2, shift) > Ask)
                    {         if(iSAR(_Symbol, f, s, s2, shift) > iMA(_Symbol, f, pma, 0, MODE_EMA, PRICE_CLOSE, shift))
                              {         res = -1; }
                              else
                              {         res = 0; }  //
                    }
                    else
                    {         if(iSAR(_Symbol, f, s, s2, shift) < iMA(_Symbol, f, pma, 0, MODE_EMA, PRICE_CLOSE, shift))
                              {         res = +1; }
                              else
                              {         res = 0; } //
                    }//
                    return res;//
          }
          //--------------
          bool       IsSar_Cross_Bulish(ENUM_TIMEFRAMES f, double s = 0.02, double s2 = 0.2, int shift1 = 0, int shift2 = 0)  {return iSAR(_Symbol, f, s, s2, shift1) > Ask && iSAR(_Symbol, f, s, 0.2, shift2) < Bid;};
          bool       IsSar_Cross_Bearish(ENUM_TIMEFRAMES f, double s = 0.02, double s2 = 0.2, int shift1 = 0, int shift2 = 0) {return iSAR(_Symbol, f, s, s2, shift1) < Bid && iSAR(_Symbol, f, s, 0.2, shift2) > Ask;};
          void       Update()
          {         //
          };//
};
//+------------------------------------------------------------------+
