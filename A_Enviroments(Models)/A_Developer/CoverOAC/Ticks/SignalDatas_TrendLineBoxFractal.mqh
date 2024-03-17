class SignalDatas_TrendLineBoxFractal
{
public:
          SignalDatas_TrendLineBoxFractal(void) {};
          ~SignalDatas_TrendLineBoxFractal(void) {};
          bool       IsLowTp1Achiwed;
          void       Update()
          {
                    {         //TrendBoxFractals
                              ENUM_TIMEFRAMES periods = PERIOD_M5;
                              int shift = 1;
                              double upperFractal_a1 = 1;
                              int    upperFractal_INDX_a1 = 0;
                              double lowerFractal_a2 = 99999;
                              int    lowerFractal_INDX_a2 = 0;
                              //
                              double upperFractal_b1 = 1;
                              int    upperFractal_INDX_b1 = 0;
                              double lowerFractal_b2 = 99999;
                              int    lowerFractal_INDX_b2 = 0;
                              //Print("shift: : ", shift, "upperFractal: ", upperFractal, " lowerFractal: ", lowerFractal);
                              for(int i = 0; i < 100; i++)
                              {         //upperFractal_a1 = iFractals(_Symbol, periods, MODE_UPPER, i) > 0 && iFractals(_Symbol, periods, MODE_UPPER, i) > upperFractal_a1 ? iFractals(_Symbol, periods, MODE_UPPER, i) : upperFractal_a1;
                                        //lowerFractal_a2 = iFractals(_Symbol, periods, MODE_LOWER, i) > 0 && iFractals(_Symbol, periods, MODE_LOWER, i) < lowerFractal_a2 ? iFractals(_Symbol, periods, MODE_LOWER, i) : lowerFractal_a2; //
                                        if(iFractals(_Symbol, periods, MODE_UPPER, i) > 0 && iFractals(_Symbol, periods, MODE_UPPER, i) > upperFractal_a1)
                                        {         upperFractal_a1 = iFractals(_Symbol, periods, MODE_UPPER, i); upperFractal_INDX_a1 = i;} //
                                        else
                                        {         upperFractal_a1 = upperFractal_a1; } //
                                        if(iFractals(_Symbol, periods, MODE_LOWER, i) > 0 && iFractals(_Symbol, periods, MODE_LOWER, i) < lowerFractal_a2)
                                        {         lowerFractal_a2 = iFractals(_Symbol, periods, MODE_LOWER, i); lowerFractal_INDX_a2 = i; } //
                                        else
                                        {         lowerFractal_a2 = lowerFractal_a2; } //
                              }
                              for(int i = 100; i < 200; i++)
                              {         //upperFractal_b1 = iFractals(_Symbol, periods, MODE_UPPER, i) > 0 && iFractals(_Symbol, periods, MODE_UPPER, i) > upperFractal_b1 ? iFractals(_Symbol, periods, MODE_UPPER, i) : upperFractal_b1;
                                        //lowerFractal_b2 = iFractals(_Symbol, periods, MODE_LOWER, i) > 0 && iFractals(_Symbol, periods, MODE_LOWER, i) < lowerFractal_b2 ? iFractals(_Symbol, periods, MODE_LOWER, i) : lowerFractal_b2; //
                                        if(iFractals(_Symbol, periods, MODE_UPPER, i) > 0 && iFractals(_Symbol, periods, MODE_UPPER, i) > upperFractal_b1)
                                        {         upperFractal_b1 = iFractals(_Symbol, periods, MODE_UPPER, i); upperFractal_INDX_b1 = i;} //
                                        else
                                        {         upperFractal_b1 = upperFractal_b1; } //
                                        if(iFractals(_Symbol, periods, MODE_LOWER, i) > 0 && iFractals(_Symbol, periods, MODE_LOWER, i) < lowerFractal_b2)
                                        {         lowerFractal_b2 = iFractals(_Symbol, periods, MODE_LOWER, i); lowerFractal_INDX_b2 = i; } //
                                        else
                                        {         lowerFractal_b2 = lowerFractal_b2; } //
                              }
                              // Draw the trend line
                              ObjectDelete(0, "TrendLineFractalsUpper" ); //
                              int trendLineObj = ObjectCreate(0, "TrendLineFractalsUpper", OBJ_TREND, 0, iTime(_Symbol, periods, upperFractal_INDX_b1), upperFractal_b1, iTime(_Symbol, periods, upperFractal_INDX_a1), upperFractal_a1);
                              ObjectSetInteger(0, "TrendLineFractalsUpper", OBJPROP_COLOR, clrOrange);
                              ObjectSetInteger(0, "TrendLineFractalsUpper", OBJPROP_RAY_RIGHT, true); //
                              ObjectSetInteger(0, "TrendLineFractalsUpper", OBJPROP_WIDTH, 2); //
                              ObjectSetInteger(0, "TrendLineFractalsUpper", OBJPROP_STYLE, STYLE_SOLID);///
                              //-----------------------
                              ObjectDelete(0, "TrendLineFractalsLower" ); //
                              int trendLineObj2 = ObjectCreate(0, "TrendLineFractalsLower", OBJ_TREND, 0, iTime(_Symbol, periods, lowerFractal_INDX_b2), lowerFractal_b2, iTime(_Symbol, periods, lowerFractal_INDX_a2), lowerFractal_a2);
                              ObjectSetInteger(0, "TrendLineFractalsLower", OBJPROP_COLOR, clrOrange);
                              ObjectSetInteger(0, "TrendLineFractalsLower", OBJPROP_RAY_RIGHT, true); //
                              ObjectSetInteger(0, "TrendLineFractalsLower", OBJPROP_WIDTH, 2); //
                              ObjectSetInteger(0, "TrendLineFractalsLower", OBJPROP_STYLE, STYLE_SOLID);///
                              //iFractals() function with the MODE_UPPER and MODE_LOWER modes to get the most recent [0] upper and lower fractals, respectively.
                              //---------------------------------------------------------
                              //box tp2 //find two point  4 axis
                              double ExtermomUpperPrice1 = MAX(upperFractal_b1, upperFractal_a1);
                              int    ExtermomUpperShift1 = ExtermomUpperPrice1 == upperFractal_b1 ? upperFractal_INDX_b1 : upperFractal_INDX_a1;
                              double ExtermomLowerPrice1 = MIN(lowerFractal_b2, lowerFractal_a2);
                              int    ExtermomLowerShift1 = ExtermomLowerPrice1 == lowerFractal_b2 ? lowerFractal_INDX_b2 : lowerFractal_INDX_a2;
                              //------------
                              int Shift_OLD_ExtermomUpper = iLowest(_Symbol, periods, MODE_LOW, 10, ExtermomUpperShift1);
                              int Shift_NEW_ExtermomUpper = iLowest(_Symbol, periods, MODE_LOW, 10, ExtermomUpperShift1 - 10);
                              int Shift_OLD_ExtermomLower = iHighest(_Symbol, periods, MODE_HIGH, 10, ExtermomLowerShift1);
                              int Shift_NEW_ExtermomLower = iHighest(_Symbol, periods, MODE_HIGH, 10, ExtermomLowerShift1 - 10);
                              //------------
                              double ExtermomUpperPrice2 = MIN(iLow(_Symbol, periods, Shift_OLD_ExtermomUpper), iLow(_Symbol, periods, Shift_NEW_ExtermomUpper));
                              int    ExtermomUpperShift2 = ExtermomUpperPrice2 == iLow(_Symbol, periods, Shift_OLD_ExtermomUpper) ? Shift_OLD_ExtermomUpper : Shift_NEW_ExtermomUpper;
                              double ExtermomLowerPrice2 = MIN(iHigh(_Symbol, periods, Shift_OLD_ExtermomLower), iLow(_Symbol, periods, Shift_NEW_ExtermomLower));
                              int    ExtermomLowerShift2 = ExtermomLowerPrice2 == iHigh(_Symbol, periods, Shift_OLD_ExtermomLower) ? Shift_OLD_ExtermomLower : Shift_NEW_ExtermomLower;
                              //---------------------------------------------------------
                              ObjectDelete(0, "TrendBoxFractalsUpper_TP1" ); //
                              int trendBoxUpper_TP1_Obj2 = ObjectCreate(0, "TrendBoxFractalsUpper_TP1", OBJ_RECTANGLE, 0, iTime(_Symbol, periods, ExtermomUpperShift1), ExtermomUpperPrice1, iTime(_Symbol, periods, ExtermomUpperShift2), ExtermomUpperPrice2);
                              ObjectSetInteger(0, "TrendBoxFractalsUpper_TP1", OBJPROP_COLOR, clrGreen);
                              //
                              double trendBoxUpperBoxHighth = MathAbs(ExtermomUpperPrice2 - ExtermomUpperPrice1);
                              ObjectDelete(0, "TrendBoxFractalsUpper_TP2" ); //
                              int trendBoxUpper_TP2_Obj2 = ObjectCreate(0, "TrendBoxFractalsUpper_TP2", OBJ_RECTANGLE, 0, iTime(_Symbol, periods, ExtermomUpperShift1 - 1), ExtermomUpperPrice1 - trendBoxUpperBoxHighth - 10 * Point(), iTime(_Symbol, periods, ExtermomUpperShift2 - 1), ExtermomUpperPrice2 - trendBoxUpperBoxHighth);
                              ObjectSetInteger(0, "TrendBoxFractalsUpper_TP2", OBJPROP_COLOR, clrGreen);
                              //
                              ObjectDelete(0, "TrendBoxFractalsUpper_TP3" ); //
                              int trendBoxUpper_TP3_Obj2 = ObjectCreate(0, "TrendBoxFractalsUpper_TP3", OBJ_RECTANGLE, 0, iTime(_Symbol, periods, ExtermomUpperShift1 - 2), ExtermomUpperPrice1 - trendBoxUpperBoxHighth * 2 - 10 * Point(), iTime(_Symbol, periods, ExtermomUpperShift2 - 2), ExtermomUpperPrice2 - trendBoxUpperBoxHighth * 2);
                              ObjectSetInteger(0, "TrendBoxFractalsUpper_TP3", OBJPROP_COLOR, clrGreen);
                              //
                              ObjectDelete(0, "TrendBoxFractalsUpper_SL" ); //
                              int trendBoxUpper_SL_Obj2 = ObjectCreate(0, "TrendBoxFractalsUpper_SL", OBJ_RECTANGLE, 0, iTime(_Symbol, periods, ExtermomUpperShift1 - 1), ExtermomUpperPrice1 + 10 * Point(), iTime(_Symbol, periods, ExtermomUpperShift2 - 1), ExtermomUpperPrice1 + trendBoxUpperBoxHighth * 1);
                              ObjectSetInteger(0, "TrendBoxFractalsUpper_SL", OBJPROP_COLOR, clrRed);
                              //
                              //
                              //
                              ObjectDelete(0, "TrendBoxFractalsLower_TP1" ); //
                              int trendBoxLower_TP1_Obj2 = ObjectCreate(0, "TrendBoxFractalsLower_TP1", OBJ_RECTANGLE, 0, iTime(_Symbol, periods, ExtermomLowerShift1), ExtermomLowerPrice1, iTime(_Symbol, periods, ExtermomLowerShift2), ExtermomLowerPrice2);
                              ObjectSetInteger(0, "TrendBoxFractalsLower_TP1", OBJPROP_COLOR, clrGreen);
                              //
                              double trendBoxLowerBoxHighth = MathAbs(ExtermomLowerPrice2 - ExtermomLowerPrice1);
                              ObjectDelete(0, "TrendBoxFractalsLower_TP2" ); //
                              int trendBoxLower_TP2_Obj2 = ObjectCreate(0, "TrendBoxFractalsLower_TP2", OBJ_RECTANGLE, 0, iTime(_Symbol, periods, ExtermomLowerShift1 - 1), ExtermomLowerPrice1 + trendBoxLowerBoxHighth + 10 * Point(), iTime(_Symbol, periods, ExtermomLowerShift2 - 1), ExtermomLowerPrice2 + trendBoxLowerBoxHighth);
                              ObjectSetInteger(0, "TrendBoxFractalsLower_TP2", OBJPROP_COLOR, clrGreen);
                              //
                              ObjectDelete(0, "TrendBoxFractalsLower_TP3" ); //
                              int trendBoxLower_TP3_Obj2 = ObjectCreate(0, "TrendBoxFractalsLower_TP3", OBJ_RECTANGLE, 0, iTime(_Symbol, periods, ExtermomLowerShift1 - 2), ExtermomLowerPrice1 + trendBoxLowerBoxHighth * 2 + 10 * Point(), iTime(_Symbol, periods, ExtermomLowerShift2 - 2), ExtermomLowerPrice2 + trendBoxLowerBoxHighth * 2);
                              ObjectSetInteger(0, "TrendBoxFractalsLower_TP3", OBJPROP_COLOR, clrGreen);
                              //
                              ObjectDelete(0, "TrendBoxFractalsLower_SL" ); //
                              int trendBoxLower_SL_Obj2 = ObjectCreate(0, "TrendBoxFractalsLower_SL", OBJ_RECTANGLE, 0, iTime(_Symbol, periods, ExtermomLowerShift1 - 1), ExtermomLowerPrice1 - 10 * Point(), iTime(_Symbol, periods, ExtermomLowerShift2 - 1), ExtermomLowerPrice1 - trendBoxLowerBoxHighth );
                              ObjectSetInteger(0, "TrendBoxFractalsLower_SL", OBJPROP_COLOR, clrRed);
                              //---------------------------------------------------------
                    } //
          }; //
};