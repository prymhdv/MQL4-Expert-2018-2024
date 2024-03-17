class SignalDatas_TL_0_50_50_100_HL
{
public:
          SignalDatas_TL_0_50_50_100_HL(void) {};
          ~SignalDatas_TL_0_50_50_100_HL(void) {};
          bool       IsPriceUnderLowTrend;
          bool       IsPriceAboveHigherTrend;//
          void       Update()
          {         // trendLines 0-50 50-100
                    {         ENUM_TIMEFRAMES Periods =  PERIOD_H1;
                              int lengh = 50;
                              int         ilow_0_50            = iLowest(_Symbol, Periods, MODE_LOW, lengh / 2, lengh / 2);
                              int         ihigh_0_50           = iHighest(_Symbol, Periods, MODE_HIGH, lengh / 2, lengh / 2);
                              double      Lowest_0_50          = iLow(_Symbol, Periods, ilow_0_50 );
                              double      Highest_0_50         = iHigh(_Symbol, Periods, ihigh_0_50);
                              //
                              lengh = 50;
                              int         ilow_50_100            = iLowest(_Symbol, Periods, MODE_LOW, lengh, lengh);
                              int         ihigh_50_100           = iHighest(_Symbol, Periods, MODE_HIGH, lengh, lengh);
                              double      Lowest_50_100          = iLow(_Symbol, Periods, ilow_50_100 );
                              double      Highest_50_100         = iHigh(_Symbol, Periods, ihigh_50_100);
                              //
                              ObjectDelete(0, "TL.0_50_50_100_Low" ); //
                              ObjectCreate(0, "TL.0_50_50_100_Low", OBJ_TREND, 0, iTime(_Symbol, Periods, ilow_50_100), iLow(_Symbol, Periods, ilow_50_100), iTime(_Symbol, Periods, ilow_0_50), iLow(_Symbol, Periods, ilow_0_50)); //
                              ObjectSetInteger(0, "TL.0_50_50_100_Low", OBJPROP_RAY_RIGHT, true); //
                              ObjectSetInteger(0, "TL.0_50_50_100_Low", OBJPROP_WIDTH, 2); //
                              ObjectSetInteger(0, "TL.0_50_50_100_Low", OBJPROP_COLOR, clrRed); //
                              //
                              //
                              ObjectDelete(0, "TL.0_50_50_100_high" ); //
                              ObjectCreate(0, "TL.0_50_50_100_high", OBJ_TREND, 0,  iTime(_Symbol, Periods, ihigh_50_100), iHigh(_Symbol, Periods, ihigh_50_100), iTime(_Symbol, Periods, ihigh_0_50), iHigh(_Symbol, Periods, ihigh_0_50)); //
                              ObjectSetInteger(0, "TL.0_50_50_100_high", OBJPROP_RAY_RIGHT, true); //
                              ObjectSetInteger(0, "TL.0_50_50_100_high", OBJPROP_WIDTH, 2); //
                              ObjectSetInteger(0, "TL.0_50_50_100_high", OBJPROP_COLOR, clrRed); //
                              //
                    }
                    IsPriceUnderLowTrend    = ObjectGetValueByShift("TL.0_50_50_100_Low", 0) > Close[0];
                    IsPriceAboveHigherTrend = ObjectGetValueByShift("TL.0_50_50_100_high", 0) < Close[0]; //
          }; //
};