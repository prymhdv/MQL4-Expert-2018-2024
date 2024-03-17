//+------------------------------------------------------------------+
//|                                                      Pivoter.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\gDefinesEnumsStracts.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
struct St_CondicatorData_Pivot
{         enum ENUM_PIVOT_MODE
          {         E_Normal = 0,
                    E_Fibonacci = 1//
          };
          St_CondicatorData_Pivot(ENUM_TIMEFRAMES F, bool b, int s, ENUM_PIVOT_MODE E_PIVOT_MODE, int idx, bool IsMACDSignal ) {Initer(F, b, s, E_PIVOT_MODE, idx, IsMACDSignal);};
          St_CondicatorData_Pivot() {};
          ~St_CondicatorData_Pivot() {}
          //------------------------------------------------
          double   pre_high, pre_low, pre_close ;          // high/low/close in last hour
          double   R1, R2, R3, R4, PP, S1, S2, S3, S4 ;    // pivot points
          //------------------------------------------------
          int               last_hour  ;                     // last integral 4 hour
          int               period   ;                      // bar range in 4 hour

          //--- inputs
          ENUM_PIVOT_MODE   PivotMode ;
          //------------------------------------------------
          bool     Initer(ENUM_TIMEFRAMES F, bool b, int s, ENUM_PIVOT_MODE E_PIVOT_MODE, int idx, bool IsMACDSignal )
          {         if(F == PERIOD_CURRENT && PeriodSeconds() == 60) {F = PERIOD_M1;}
                    period = (int)MathCeil(F / Period()); // bar range in 4 hour////*where not create Pivots!!!*/
                    //last_hour = -4;                     // last integral 4 hour
                    PivotMode = E_PIVOT_MODE;
                    calc(F, b, s, idx, IsMACDSignal); //
                    return true;//
          };
          void     calc(ENUM_TIMEFRAMES F, bool b, int s, int idx, bool IsMACDSignal )
          {         //--Alert("Periodpre_high: ", DoubleToStr(pre_high, 2)); ////2023.02.05 12:19:23.229        QUARTS_AF1 XAUUSD.F,M1: Alert: Periodpre_high: 1867.05
                    //--pre_high    = High[iHighest(NULL, 0, MODE_HIGH, Period(), i + 1)];
                    //--Alert("Period()pre_high: ", DoubleToStr(pre_high, 2));
                    //------------------------------------------------------------------------------------------------------
                    last_hour   = TimeHour(iTime(NULL,  F, idx));
                    pre_high    = iHigh(Symbol(), F, iHighest(NULL, F, MODE_HIGH, period, idx + 1));
                    pre_low     = iLow(Symbol(), F, iLowest(NULL, F, MODE_LOW, period, idx + 1));
                    pre_close   = iClose(Symbol(), F, idx + 1);
                    //------------------------------------------------------------------------------------------------------
                    {         //-- PivotMode == E_Normal
                              PP = NormalizeDouble((pre_high + pre_low + pre_close) / 3, _Digits);
                              R1 = NormalizeDouble((2 * PP) - pre_low, _Digits);
                              S1 = NormalizeDouble((2 * PP) - pre_high, _Digits);
                              R2 = NormalizeDouble(PP + (R1 - S1), _Digits);
                              S2 = NormalizeDouble(PP - (R1 - S1), _Digits);
                              R3 = NormalizeDouble(pre_high + (2 * (PP - pre_low)), _Digits);
                              S3 = NormalizeDouble(pre_low - (2 * (pre_high - PP)), _Digits);
                              R4 = NormalizeDouble(pre_high + (3 * (PP - pre_low)), _Digits);
                              S4 = NormalizeDouble(pre_low - (3 * (pre_high - PP)), _Digits);
                              //------------------------------------------------------------------------------------------------------
                              if(PivotMode == E_Fibonacci)
                              {         double R = NormalizeDouble(pre_high - pre_low, _Digits);
                                        R4 = NormalizeDouble(PP + (R * 1.618), _Digits);
                                        R3 = NormalizeDouble(PP + (R * 1.000), _Digits);
                                        R2 = NormalizeDouble(PP + (R * 0.618), _Digits);
                                        R1 = NormalizeDouble(PP + (R * 0.382), _Digits);
                                        S1 = NormalizeDouble(PP - (R * 0.382), _Digits);
                                        S2 = NormalizeDouble(PP - (R * 0.618), _Digits);
                                        S3 = NormalizeDouble(PP - (R * 1.000), _Digits);
                                        S4 = NormalizeDouble(PP - (R * 1.618), _Digits);//
                              }//
                    }
                    //------------------------------------------------------------------------------------------------------
                    datetime    time1 = iTime(NULL, F, idx + 60);
                    datetime    time2 = time1 + 60 * 60 * (datetime)7.5; ////defined by me PeriodSeconds() *10 )
                    //time2 = time1 + 60 * 60;
                    //---
                    string      obj_time = "_" + TimeToStr(time1);//
                    //------------------------------------------------------------------------------------------------------
                    if(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Pad_Is_All || (!ct_Drive.TDD.ct_Configs.IsShow_Pivots_Shapes&&Initer.IsBasic_Done)) {b = false; }
                    //------------------------------------------------------------------------------------------------------
                    if(!IsMACDSignal)
                    {         ObjectDelete(0, "TL.Pivots_PP_" + EnumToString(F));
                              ObjectDelete(0, "TL.Pivots_S1_" + EnumToString(F));
                              ObjectDelete(0, "TL.Pivots_R1_" + EnumToString(F));
                              ObjectDelete(0, "TL.Pivots_S2_" + EnumToString(F));
                              ObjectDelete(0, "TL.Pivots_R2_" + EnumToString(F));
                              ObjectDelete(0, "TL.Pivots_S3_" + EnumToString(F));
                              ObjectDelete(0, "TL.Pivots_R3_" + EnumToString(F));
                              ObjectDelete(0, "TL.Pivots_S4_" + EnumToString(F));
                              ObjectDelete(0, "TL.Pivots_R4_" + EnumToString(F));
                              Dev_Object_Pack.Lines.Trend.Draw_GDS_Lines(MODE_CREATE, b, "TL.Pivots_PP_" + EnumToString(F),"", iTime(Symbol(), F, 0) + PeriodSeconds() * F, PP, iTime(Symbol(), F, 0) + PeriodSeconds() * 0, PP, clrDodgerBlue,  1 + s, false, STYLE_DASH, false); //
                              Dev_Object_Pack.Lines.Trend.Draw_GDS_Lines(MODE_CREATE, b, "TL.Pivots_S1_" + EnumToString(F),"", iTime(Symbol(), F, 0) + PeriodSeconds() * F, S1, iTime(Symbol(), F, 0) + PeriodSeconds() * 0, S1, clrGreen, 1 + s, false, STYLE_DASH, false); //
                              Dev_Object_Pack.Lines.Trend.Draw_GDS_Lines(MODE_CREATE, b, "TL.Pivots_R1_" + EnumToString(F),"", iTime(Symbol(), F, 0) + PeriodSeconds() * F, R1, iTime(Symbol(), F, 0) + PeriodSeconds() * 0, R1, clrRed,   1 + s, false, STYLE_DASH, false); //
                              Dev_Object_Pack.Lines.Trend.Draw_GDS_Lines(MODE_CREATE, b, "TL.Pivots_S2_" + EnumToString(F),"", iTime(Symbol(), F, 0) + PeriodSeconds() * F, S2, iTime(Symbol(), F, 0) + PeriodSeconds() * 0, S2, clrGreen, 1 + s, false, STYLE_DASH, false); //
                              Dev_Object_Pack.Lines.Trend.Draw_GDS_Lines(MODE_CREATE, b, "TL.Pivots_R2_" + EnumToString(F),"", iTime(Symbol(), F, 0) + PeriodSeconds() * F, R2, iTime(Symbol(), F, 0) + PeriodSeconds() * 0, R2, clrRed,   1 + s, false, STYLE_DASH, false); //
                              Dev_Object_Pack.Lines.Trend.Draw_GDS_Lines(MODE_CREATE, b, "TL.Pivots_S3_" + EnumToString(F),"", iTime(Symbol(), F, 0) + PeriodSeconds() * F, S3, iTime(Symbol(), F, 0) + PeriodSeconds() * 0, S3, clrGreen, 1 + s, false, STYLE_DASH, false); //
                              Dev_Object_Pack.Lines.Trend.Draw_GDS_Lines(MODE_CREATE, b, "TL.Pivots_R3_" + EnumToString(F),"", iTime(Symbol(), F, 0) + PeriodSeconds() * F, R3, iTime(Symbol(), F, 0) + PeriodSeconds() * 0, R3, clrRed,   1 + s, false, STYLE_DASH, false); //
                              Dev_Object_Pack.Lines.Trend.Draw_GDS_Lines(MODE_CREATE, b, "TL.Pivots_S4_" + EnumToString(F),"", iTime(Symbol(), F, 0) + PeriodSeconds() * F, S4, iTime(Symbol(), F, 0) + PeriodSeconds() * 0, S4, clrGreen, 1 + s, false, STYLE_DASH, false); //
                              Dev_Object_Pack.Lines.Trend.Draw_GDS_Lines(MODE_CREATE, b, "TL.Pivots_R4_" + EnumToString(F),"", iTime(Symbol(), F, 0) + PeriodSeconds() * F, R4, iTime(Symbol(), F, 0) + PeriodSeconds() * 0, R4, clrRed,   1 + s, false, STYLE_DASH, false); //
                              //
                              ObjectDelete(0, "TL2.Pivots_PP_" + EnumToString(F));
                              ObjectDelete(0, "TL2.Pivots_S1_" + EnumToString(F));
                              ObjectDelete(0, "TL2.Pivots_R1_" + EnumToString(F));
                              ObjectDelete(0, "TL2.Pivots_S2_" + EnumToString(F));
                              ObjectDelete(0, "TL2.Pivots_R2_" + EnumToString(F));
                              ObjectDelete(0, "TL2.Pivots_S3_" + EnumToString(F));
                              ObjectDelete(0, "TL2.Pivots_R3_" + EnumToString(F));
                              ObjectDelete(0, "TL2.Pivots_S4_" + EnumToString(F));
                              ObjectDelete(0, "TL2.Pivots_R4_" + EnumToString(F));
                              Dev_Object_Pack.Lines.Trend.Draw_GDS_Lines(MODE_CREATE, b, "TL2.Pivots_PP_" + EnumToString(F),"", iTime(Symbol(), F, 0) + PeriodSeconds() * F * 2, PP, iTime(Symbol(), F, 0) + PeriodSeconds() * F + PeriodSeconds() * 1, PP, clrDodgerBlue,  1 + s, false, STYLE_DASH, false);  //
                              Dev_Object_Pack.Lines.Trend.Draw_GDS_Lines(MODE_CREATE, b, "TL2.Pivots_S1_" + EnumToString(F),"", iTime(Symbol(), F, 0) + PeriodSeconds() * F * 2, S1, iTime(Symbol(), F, 0) + PeriodSeconds() * F + PeriodSeconds() * 1, S1, clrYellowGreen, 1 + s, false, STYLE_DASH, false); //
                              Dev_Object_Pack.Lines.Trend.Draw_GDS_Lines(MODE_CREATE, b, "TL2.Pivots_R1_" + EnumToString(F),"", iTime(Symbol(), F, 0) + PeriodSeconds() * F * 2, R1, iTime(Symbol(), F, 0) + PeriodSeconds() * F + PeriodSeconds() * 1, R1, clrOrangeRed,   1 + s, false, STYLE_DASH, false); //
                              Dev_Object_Pack.Lines.Trend.Draw_GDS_Lines(MODE_CREATE, b, "TL2.Pivots_S2_" + EnumToString(F),"", iTime(Symbol(), F, 0) + PeriodSeconds() * F * 2, S2, iTime(Symbol(), F, 0) + PeriodSeconds() * F + PeriodSeconds() * 1, S2, clrYellowGreen, 1 + s, false, STYLE_DASH, false); //
                              Dev_Object_Pack.Lines.Trend.Draw_GDS_Lines(MODE_CREATE, b, "TL2.Pivots_R2_" + EnumToString(F),"", iTime(Symbol(), F, 0) + PeriodSeconds() * F * 2, R2, iTime(Symbol(), F, 0) + PeriodSeconds() * F + PeriodSeconds() * 1, R2, clrOrangeRed,   1 + s, false, STYLE_DASH, false); //
                              Dev_Object_Pack.Lines.Trend.Draw_GDS_Lines(MODE_CREATE, b, "TL2.Pivots_S3_" + EnumToString(F),"", iTime(Symbol(), F, 0) + PeriodSeconds() * F * 2, S3, iTime(Symbol(), F, 0) + PeriodSeconds() * F + PeriodSeconds() * 1, S3, clrYellowGreen, 1 + s, false, STYLE_DASH, false); //
                              Dev_Object_Pack.Lines.Trend.Draw_GDS_Lines(MODE_CREATE, b, "TL2.Pivots_R3_" + EnumToString(F),"", iTime(Symbol(), F, 0) + PeriodSeconds() * F * 2, R3, iTime(Symbol(), F, 0) + PeriodSeconds() * F + PeriodSeconds() * 1, R3, clrOrangeRed,   1 + s, false, STYLE_DASH, false); //
                              Dev_Object_Pack.Lines.Trend.Draw_GDS_Lines(MODE_CREATE, b, "TL2.Pivots_S4_" + EnumToString(F),"", iTime(Symbol(), F, 0) + PeriodSeconds() * F * 2, S4, iTime(Symbol(), F, 0) + PeriodSeconds() * F + PeriodSeconds() * 1, S4, clrYellowGreen, 1 + s, false, STYLE_DASH, false); //
                              Dev_Object_Pack.Lines.Trend.Draw_GDS_Lines(MODE_CREATE, b, "TL2.Pivots_R4_" + EnumToString(F),"", iTime(Symbol(), F, 0) + PeriodSeconds() * F * 2, R4, iTime(Symbol(), F, 0) + PeriodSeconds() * F + PeriodSeconds() * 1, R4, clrOrangeRed,   1 + s, false, STYLE_DASH, false); //
                    }//
          }
          //------------------------------------------------
};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class St_CondicatorData_Pivot_Periods
{
public:
          void       St_CondicatorData_Pivot_Periods();
          void       ~St_CondicatorData_Pivot_Periods() {};
          St_CondicatorData_Pivot   _MN;       //
          St_CondicatorData_Pivot   _W1;       //
          St_CondicatorData_Pivot   _D1;       //
          St_CondicatorData_Pivot   _H4;       //
          St_CondicatorData_Pivot   _H1;       //
          St_CondicatorData_Pivot   _M30;      //
          St_CondicatorData_Pivot   _M15;      //
          St_CondicatorData_Pivot   _M5;       //
          St_CondicatorData_Pivot   _M1;       //
          St_CondicatorData_Pivot   _Current;  //
//----------------------
          bool       Update()
          {         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                    {         //
                              St_CondicatorData_Pivot   MN       = St_CondicatorData_Pivot(PERIOD_MN1,     0, 0, E_Fibonacci, 0, false);  _MN       = MN;     //Print((string)( MN.Main.Max._Value),      "  inr--  MN.Main.Max._Value)");//  ////
                              St_CondicatorData_Pivot   W1       = St_CondicatorData_Pivot(PERIOD_W1,      0, 0, E_Fibonacci, 0, false);  _W1       = W1;     //Print((string)( W1.Main.Max._Value),      "  inr--  W1.Main.Max._Value)");//  ////
                              St_CondicatorData_Pivot   D1       = St_CondicatorData_Pivot(PERIOD_D1,      1, 5, E_Fibonacci, 0, false);  _D1       = D1;    // Print((string)( D1.Main.Max._Value),      "  inr--  D1.Main.Max._Value)");//  ////
                              St_CondicatorData_Pivot   H4       = St_CondicatorData_Pivot(PERIOD_H4,      1, 3, E_Fibonacci, 0, false);  _H4       = H4;     //Print((string)( H4.Main.Max._Value),      "  inr--  H4.Main.Max._Value)");//  ////
                              St_CondicatorData_Pivot   H1       = St_CondicatorData_Pivot(PERIOD_H1,      1, 0, E_Fibonacci, 0, false);  _H1       = H1;     //Print((string)( H1.Main.Max._Value),      "  inr--  H1.Main.Max._Value)");//  ////
                              St_CondicatorData_Pivot   M30      = St_CondicatorData_Pivot(PERIOD_M30,     1, 2, E_Fibonacci, 0, false);  _M30      = M30;     //Print((string)( M30.Main.Max._Value),     "  inr-- M30.Main.Max._Value)");//  ////
                              St_CondicatorData_Pivot   M15      = St_CondicatorData_Pivot(PERIOD_M15,     0, 0, E_Fibonacci, 0, false);  _M15      = M15;     //Print((string)( M15.Main.Max._Value),     "  inr-- M15.Main.Max._Value)");//  ////
                              St_CondicatorData_Pivot   M5       = St_CondicatorData_Pivot(PERIOD_M5,      1, 2, E_Fibonacci, 0, false);  _M5       = M5;     //Print((string)( M5.Main.Max._Value),      "  inr--  M5.Main.Max._Value)");//  ////
                              St_CondicatorData_Pivot   M1       = St_CondicatorData_Pivot(PERIOD_M1,      0, 0, E_Fibonacci, 0, false);  _M1       = M1;     //Print((string)( M1.Main.Max._Value),      "  inr--  M1.Main.Max._Value)");//  ////
                              St_CondicatorData_Pivot   Current  = St_CondicatorData_Pivot(PERIOD_CURRENT, 1, 0, E_Fibonacci, 0, false);  _Current  = Current; //Print((string)( Current.Main.Max._Value), "  inr--  Current.Main.Max._Value)");//  //
                              //
                              //Print("PERIOD_CURRENT:",PERIOD_CURRENT, "  PERIOD_M1:",PERIOD_M1);//
                    }//
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                    return true;//
          } //
          /* _Current make pointer  even false it re inited and bug making*/
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CondicatorData_Pivot_Periods::St_CondicatorData_Pivot_Periods()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          St_CondicatorData_Pivot   MN         = St_CondicatorData_Pivot(PERIOD_MN1,     0, 0, E_Fibonacci, 0, false);    _MN          = MN; //
          St_CondicatorData_Pivot   W1         = St_CondicatorData_Pivot(PERIOD_W1,      0, 0, E_Fibonacci, 0, false);    _W1          = W1; //
          St_CondicatorData_Pivot   D1         = St_CondicatorData_Pivot(PERIOD_D1,      0, 0, E_Fibonacci, 0, false);    _D1          = D1; //
          St_CondicatorData_Pivot   H4         = St_CondicatorData_Pivot(PERIOD_H4,      0, 0, E_Fibonacci, 0, false);    _H4          = H4; //
          St_CondicatorData_Pivot   H1         = St_CondicatorData_Pivot(PERIOD_H1,      0, 0, E_Fibonacci, 0, false);    _H1          = H1; //
          St_CondicatorData_Pivot   M30        = St_CondicatorData_Pivot(PERIOD_M30,     0, 0, E_Fibonacci, 0, false);    _M30         = M30; //
          St_CondicatorData_Pivot   M15        = St_CondicatorData_Pivot(PERIOD_M15,     0, 0, E_Fibonacci, 0, false);    _M15         = M15; //
          St_CondicatorData_Pivot   M5         = St_CondicatorData_Pivot(PERIOD_M5,      0, 0, E_Fibonacci, 0, false);    _M5          = M5; //
          St_CondicatorData_Pivot   M1         = St_CondicatorData_Pivot(PERIOD_M1,      0, 0, E_Fibonacci, 0, false);    _M1          = M1; //
          St_CondicatorData_Pivot   Current    = St_CondicatorData_Pivot(PERIOD_CURRENT, 0, 0, E_Fibonacci, 0, false);    _Current     = Current; //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
}
//+------------------------------------------------------------------+
