class SignalDatas_TL_500_HL
{
public:
          SignalDatas_TL_500_HL(void) {};
          ~SignalDatas_TL_500_HL(void) {};
          bool        isBulishHighTrend;//
          bool        isBulishLowTrend;//
          void       Update()
          {         double      LowerTrendPrice_0;
                    double      HigherTrendPrice_0;
                    {         int         ilow            = iLowest(_Symbol, PERIOD_M5, MODE_LOW, 500, 0);
                              int         ihigh           = iHighest(_Symbol, PERIOD_M5, MODE_HIGH, 500, 0);
                              double      Lowest          = iLow(_Symbol, PERIOD_M5, ilow );
                              double      Highest         = iHigh(_Symbol, PERIOD_M5, ihigh);
                              //
                              int         ilown            = iLowest(_Symbol, PERIOD_M5, MODE_LOW, 500 / 2, 0);
                              int         ihighn           = iHighest(_Symbol, PERIOD_M5, MODE_HIGH, 500 / 2, 0);
                              double      Lowestn          = iLow(_Symbol, PERIOD_M5, ilown );
                              double      Highestn         = iHigh(_Symbol, PERIOD_M5, ihighn);
                              isBulishHighTrend         = Highestn > Highest;//
                              isBulishLowTrend          = Lowest  < Lowestn;//
                              //--------------
                              ResetLastError();
                              ObjectDelete(0, "TL.Trend2Ho" ); //
                              if(!ObjectCreate(0, "TL.Trend2Ho", OBJ_TREND, 0, iTime(_Symbol, PERIOD_M5, ihigh), iHigh(_Symbol, PERIOD_M5, ihigh), iTime(_Symbol, PERIOD_M5, ihighn), iHigh(_Symbol, PERIOD_M5, ihighn))) { Print("TL.Trend2Ho: not created ", ErrorDescription(_LastError));} //
                              ObjectSetInteger(0, "TL.Trend2Ho", OBJPROP_RAY_RIGHT, true); //
                              ObjectSetInteger(0, "TL.Trend2Ho", OBJPROP_WIDTH, 3); //
                              //---------------
                              ResetLastError();
                              ObjectDelete(0, "TL.Trend2Lo" ); //
                              if(!ObjectCreate(0, "TL.Trend2Lo", OBJ_TREND, 0, iTime(_Symbol, PERIOD_M5, ilow), iLow(_Symbol, PERIOD_M5, ilow), iTime(_Symbol, PERIOD_M5, ilown), iLow(_Symbol, PERIOD_M5, ilown)))     { Print("TL.Trend2Lo: not created ", ErrorDescription(_LastError));} //
                              ObjectSetInteger(0, "TL.Trend2Lo", OBJPROP_RAY_RIGHT, true); //
                              ObjectSetInteger(0, "TL.Trend2Lo", OBJPROP_WIDTH, 3); //
                              //---------------
                    }
                    {         //Print("TL.Trend2Ho: ", ObjectGetValueByShift("TL.Trend2Ho", 0), "  -  TL.Trend2Lo: ", ObjectGetValueByShift("TL.Trend2Lo", 0));//
                    }
                    LowerTrendPrice_0  = ObjectGetValueByShift("TL.Trend2Lo", 0);
                    HigherTrendPrice_0 = ObjectGetValueByShift("TL.Trend2Ho", 0);//
          };//
};