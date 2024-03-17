//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class SignalDatas_FE
{
public:
          SignalDatas_FE(void)
          {         isBulishHL = false;
                    BarPoint3Price = 5000;
                    Is_Change = true; //
                    RangePriceHL = 0;//
          };
          ~SignalDatas_FE(void) {};
          //---
          bool       isBulishHL;
          bool       IsInChannel;

          double     BarPoint3Price;
          bool       Is_Change;
          double     RangePriceHL;
          void       Update(ENUM_TIMEFRAMES f, int l = 500)
          {         Is_Change =  isBulishHL ? BarPoint3Price + RangePriceHL * 1.71 < Ask : BarPoint3Price - RangePriceHL * 1.71 > Bid;
                    if(!Is_Change)Is_Change =  isBulishHL ? BarPoint3Price - RangePriceHL * 0.38 > Bid : BarPoint3Price + RangePriceHL * 0.38 < Ask;
                    if(Is_Change)
                    {         //-----------------
                              //-----------------
                              int lengh = l;
                              ENUM_TIMEFRAMES Periods = f;
                              int         ilow            = iLowest(_Symbol, Periods, MODE_LOW, lengh, 0);
                              int         ihigh           = iHighest(_Symbol, Periods, MODE_HIGH, lengh, 0);
                              double      Lowest          = iLow(_Symbol, Periods, ilow );
                              double      Highest         = iHigh(_Symbol, Periods, ihigh);
                              isBulishHL        = ilow > ihigh;
                              int CountBar = MathAbs(ilow - ihigh);
                              RangePriceHL  = MathAbs(Lowest - Highest);
                              int         BarPoint3;
                              if(isBulishHL)
                              {         //redefine highest
                                        Highest           = iHigh(_Symbol, Periods, iHighest(_Symbol, Periods, MODE_HIGH, lengh / 2, lengh / 2));
                                        BarPoint3         = iLowest(_Symbol, Periods, MODE_LOW, CountBar, ihigh - CountBar / 1); //
                                        BarPoint3Price    = iLow(_Symbol, Periods, BarPoint3); //
                                        ObjectDelete(0, "TL.FT" + EnumToString(f) + " " + (string)l  ); //
                                        ObjectCreate(0, "TL.FT" + EnumToString(f) + " " + (string)l, OBJ_TREND, 0, iTime(_Symbol, Periods, ilow), iLow(_Symbol, Periods, ilow), iTime(_Symbol, Periods, BarPoint3), iLow(_Symbol, Periods, BarPoint3)); //
                                        ObjectSetInteger(0, "TL.FT" + EnumToString(f) + " " + (string)l, OBJPROP_RAY_RIGHT, true); //
                                        ObjectSetInteger(0, "TL.FT" + EnumToString(f) + " " + (string)l, OBJPROP_WIDTH, 2); //
                                        ObjectSetInteger(0, "TL.FT" + EnumToString(f) + " " + (string)l, OBJPROP_COLOR, clrWhite); //
                                        //
                                        //
                                        ObjectDelete(0, "FE." + EnumToString(f) + " " + (string)l ); //
                                        ObjectCreate(0, "FE." + EnumToString(f) + " " + (string)l, OBJ_EXPANSION, 0, iTime(_Symbol, Periods, ilow), iLow(_Symbol, Periods, ilow), iTime(_Symbol, Periods, ihigh), iHigh(_Symbol, Periods, ihigh), iTime(_Symbol, Periods, BarPoint3), iLow(_Symbol, Periods, BarPoint3)); //
                                        ObjectSetInteger(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_COLOR, clrDodgerBlue);
                                        ObjectSetInteger(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_WIDTH, 3);
                                        ObjectSetInteger(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELS, 11);
                                        ObjectSetDouble(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELVALUE, 1, -1.61); ObjectSetString(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELTEXT, 1, "-1.61");
                                        ObjectSetDouble(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELVALUE, 2, -1.00); ObjectSetString(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELTEXT, 2, "-1.00");
                                        ObjectSetDouble(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELVALUE, 3, -0.61); ObjectSetString(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELTEXT, 3, "-0.61");
                                        ObjectSetDouble(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELVALUE, 4, -0.38); ObjectSetString(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELTEXT, 4, "-0.38");
                                        ObjectSetDouble(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELVALUE, 5, 0.00);  ObjectSetString(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELTEXT, 5, "+0.00");
                                        ObjectSetDouble(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELVALUE, 6, 0.38);  ObjectSetString(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELTEXT, 6, "+0.38");
                                        ObjectSetDouble(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELVALUE, 7, 0.61);  ObjectSetString(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELTEXT, 7, "+0.61");
                                        ObjectSetDouble(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELVALUE, 8, 1.00);  ObjectSetString(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELTEXT, 8, "+1.00");
                                        ObjectSetDouble(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELVALUE, 9, 1.61);  ObjectSetString(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELTEXT, 9, "+1.61");
                                        ObjectSetDouble(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELVALUE, 10, 2.61); ObjectSetString(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELTEXT, 10, "+2.61");
                                        ObjectSetDouble(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELVALUE, 11, 3.61); ObjectSetString(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELTEXT, 11, "+3.61");
                                        //
                                        //
                                        double RangeChannel = MathAbs(iHigh(_Symbol, Periods, ihigh) - ObjectGetValueByTime(0, "TL.FT" + EnumToString(f) + " " + (string)l, iTime(_Symbol, Periods, ihigh)));
                                        ObjectDelete(0, "TL.FTCH" + EnumToString(f) + " " + (string)l  ); //
                                        ObjectCreate(0, "TL.FTCH" + EnumToString(f) + " " + (string)l, OBJ_TREND, 0, iTime(_Symbol, Periods, ilow), iLow(_Symbol, Periods, ilow) + RangeChannel, iTime(_Symbol, Periods, BarPoint3), iLow(_Symbol, Periods, BarPoint3) + RangeChannel); //
                                        ObjectSetInteger(0, "TL.FTCH" + EnumToString(f) + " " + (string)l, OBJPROP_RAY_RIGHT, true); //
                                        ObjectSetInteger(0, "TL.FTCH" + EnumToString(f) + " " + (string)l, OBJPROP_WIDTH, 2); //
                                        ObjectSetInteger(0, "TL.FTCH" + EnumToString(f) + " " + (string)l, OBJPROP_COLOR, clrWhite); //
                                        //
                                        ObjectDelete(0, "TL.FTCL" + EnumToString(f) + " " + (string)l  ); //
                                        ObjectCreate(0, "TL.FTCL" + EnumToString(f) + " " + (string)l, OBJ_TREND, 0, iTime(_Symbol, Periods, ilow), iLow(_Symbol, Periods, ilow) - RangeChannel, iTime(_Symbol, Periods, BarPoint3), iLow(_Symbol, Periods, BarPoint3) - RangeChannel); //
                                        ObjectSetInteger(0, "TL.FTCL" + EnumToString(f) + " " + (string)l, OBJPROP_RAY_RIGHT, true); //
                                        ObjectSetInteger(0, "TL.FTCL" + EnumToString(f) + " " + (string)l, OBJPROP_WIDTH, 2); //
                                        ObjectSetInteger(0, "TL.FTCL" + EnumToString(f) + " " + (string)l, OBJPROP_COLOR, clrWhite); //
                                        //
                              }
                              else
                              {         //redefine lowest
                                        Lowest            = iLow(_Symbol, Periods, iLowest(_Symbol, Periods, MODE_LOW, lengh / 2, lengh / 2));
                                        BarPoint3         = iHighest(_Symbol, Periods, MODE_HIGH, CountBar, ilow - CountBar / 1); //
                                        BarPoint3Price    = iHigh(_Symbol, Periods, BarPoint3); //
                                        //ResetLastError();
                                        ObjectDelete(0, "TL.FT" + EnumToString(f) + " " + (string)l ); //
                                        ObjectCreate(0, "TL.FT" + EnumToString(f) + " " + (string)l, OBJ_TREND, 0, iTime(_Symbol, Periods, ihigh), iHigh(_Symbol, Periods, ihigh), iTime(_Symbol, Periods, BarPoint3), iHigh(_Symbol, Periods, BarPoint3)); //Print("01", ErrorDescription(_LastError)); //
                                        ObjectSetInteger(0, "TL.FT" + EnumToString(f) + " " + (string)l, OBJPROP_RAY_RIGHT, true); //
                                        ObjectSetInteger(0, "TL.FT" + EnumToString(f) + " " + (string)l, OBJPROP_WIDTH, 2); //
                                        ObjectSetInteger(0, "TL.FT" + EnumToString(f) + " " + (string)l, OBJPROP_COLOR, clrWhite); //
                                        //
                                        //
                                        ObjectDelete(0, "FE." + EnumToString(f) + " " + (string)l ); //
                                        ObjectCreate(0, "FE." + EnumToString(f) + " " + (string)l, OBJ_EXPANSION, 0, iTime(_Symbol, Periods, ihigh), iHigh(_Symbol, Periods, ihigh), iTime(_Symbol, Periods, ilow), iLow(_Symbol, Periods, ilow), iTime(_Symbol, Periods, BarPoint3), iHigh(_Symbol, Periods, BarPoint3)); //
                                        ObjectSetInteger(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_COLOR, clrDodgerBlue);
                                        ObjectSetInteger(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_WIDTH, 3);
                                        ObjectSetInteger(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELS, 11);
                                        ObjectSetDouble(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELVALUE, 1, -1.61); ObjectSetString(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELTEXT, 1, "-1.61");
                                        ObjectSetDouble(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELVALUE, 2, -1.00); ObjectSetString(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELTEXT, 2, "-1.00");
                                        ObjectSetDouble(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELVALUE, 3, -0.61); ObjectSetString(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELTEXT, 3, "-0.61");
                                        ObjectSetDouble(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELVALUE, 4, -0.38); ObjectSetString(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELTEXT, 4, "-0.38");
                                        ObjectSetDouble(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELVALUE, 5, 0.00);  ObjectSetString(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELTEXT, 5, "+0.00");
                                        ObjectSetDouble(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELVALUE, 6, 0.38);  ObjectSetString(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELTEXT, 6, "+0.38");
                                        ObjectSetDouble(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELVALUE, 7, 0.61);  ObjectSetString(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELTEXT, 7, "+0.61");
                                        ObjectSetDouble(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELVALUE, 8, 1.00);  ObjectSetString(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELTEXT, 8, "+1.00");
                                        ObjectSetDouble(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELVALUE, 9, 1.61);  ObjectSetString(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELTEXT, 9, "+1.61");
                                        ObjectSetDouble(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELVALUE, 10, 2.61); ObjectSetString(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELTEXT, 10, "+2.61");
                                        ObjectSetDouble(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELVALUE, 11, 3.61); ObjectSetString(0, "FE." + EnumToString(f) + " " + (string)l, OBJPROP_LEVELTEXT, 11, "+3.61");
                                        //
                                        //
                                        double RangeChannel = MathAbs(iLow(_Symbol, Periods, ilow) - ObjectGetValueByTime(0, "TL.FT" + EnumToString(f) + " " + (string)l, iTime(_Symbol, Periods, ilow)));
                                        ObjectDelete(0, "TL.FTCL" + EnumToString(f) + " " + (string)l ); //
                                        ObjectCreate(0, "TL.FTCL" + EnumToString(f) + " " + (string)l, OBJ_TREND, 0, iTime(_Symbol, Periods, ihigh), iHigh(_Symbol, Periods, ihigh) - RangeChannel, iTime(_Symbol, Periods, BarPoint3), iHigh(_Symbol, Periods, BarPoint3) - RangeChannel); //Print("01", ErrorDescription(_LastError)); //
                                        ObjectSetInteger(0, "TL.FTCL" + EnumToString(f) + " " + (string)l, OBJPROP_RAY_RIGHT, true); //
                                        ObjectSetInteger(0, "TL.FTCL" + EnumToString(f) + " " + (string)l, OBJPROP_WIDTH, 2); //
                                        ObjectSetInteger(0, "TL.FTCL" + EnumToString(f) + " " + (string)l, OBJPROP_COLOR, clrWhite); //
                                        //
                                        ObjectDelete(0, "TL.FTCH" + EnumToString(f) + " " + (string)l ); //
                                        ObjectCreate(0, "TL.FTCH" + EnumToString(f) + " " + (string)l, OBJ_TREND, 0, iTime(_Symbol, Periods, ihigh), iHigh(_Symbol, Periods, ihigh) + RangeChannel, iTime(_Symbol, Periods, BarPoint3), iHigh(_Symbol, Periods, BarPoint3) + RangeChannel); //Print("01", ErrorDescription(_LastError)); //
                                        ObjectSetInteger(0, "TL.FTCH" + EnumToString(f) + " " + (string)l, OBJPROP_RAY_RIGHT, true); //
                                        ObjectSetInteger(0, "TL.FTCH" + EnumToString(f) + " " + (string)l, OBJPROP_WIDTH, 2); //
                                        ObjectSetInteger(0, "TL.FTCH" + EnumToString(f) + " " + (string)l, OBJPROP_COLOR, clrWhite); //
                                        //
                              } //
                              IsInChannel = Ask < ObjectGetValueByTime(0, "TL.FTCH" + EnumToString(f) + " " + (string)l, iTime(_Symbol, Periods, 0)) && Ask > ObjectGetValueByTime(0, "TL.FTCL" + EnumToString(f) + " " + (string)l, iTime(_Symbol, Periods, 0)); //
                    }
                    //
          };//
};
//+------------------------------------------------------------------+
