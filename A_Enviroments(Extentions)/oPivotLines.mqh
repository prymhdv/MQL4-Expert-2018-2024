//+------------------------------------------------------------------+
//|                                                      Pivoter.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
 
//+------------------------------------------------------------------+
//|             Class Pivoter     BEGIN                              |
//+------------------------------------------------------------------+
class C_PivotLines
{

public:   void           C_PivotLines();
          void           ~C_PivotLines();
          bool           Update();
          bool           UPDATED;
          //====================================================================
          int            PivoterRun();
          bool           Is_Pivot;//
          bool           IsDelete;
          bool           IsClear;
          bool           IsExist;
          //+------------------------------------------------------------------+
          //| Define the ways of calculating Pivot Points                      |
          //+------------------------------------------------------------------+
          enum ENUM_PIVOT_MODES
          {         Normal = 0,
                    Fibonacci = 1//
          };
          //--- inputs
          ENUM_PIVOT_MODES  PivotMode ;
          bool              CurrentHourOnly ;
          int               CountBars   ;
          string            Pivot_Lines   ;
          bool              ShowPivotLines ;
          int               LineWidth     ;
          ENUM_LINE_STYLE   LineStyle     ;
          color             RColor         ;
          color             PColor          ;
          color             SColor           ;
          string            Pivot_Areas      ;
          bool              AreasFilling     ;
          color             R1AreaColor       ;
          color             R2AreaColor       ;
          color             R3AreaColor      ;
          color             R4AreaColor       ;
          color             S1AreaColor        ;
          color             S2AreaColor        ;
          color             S3AreaColor       ;
          color             S4AreaColor       ;
          string            Pivot_Labels      ;
          bool              ShowLabels       ;
          //--- global variables
          int               last_hour  ;                     // last integral 4 hour
          int               period   ;                      // bar range in 4 hour

          string            short_name  ;//const
          //////////////////////////////////////////////////////////////////////////////////////////
          /*handel indicator*/
          double            ExtRSIBuffer[];
          double            ExtPosBuffer[];
          double            ExtNegBuffer[];
          int               rates_total;
          int               prev_calculated;
          datetime          time[];
          double            open[];
          double            high[];
          double            low[];
          double            close[];
          long              tick_volume[];
          long              volume[];
          int               spread[];
          //========================================================================================

          bool  CalculateHourlyPivotPoints(int bars_count, bool d);
          bool  FindExistingObj(datetime obj_time);
          bool  TrendCreate(const string          name   = "TrendLine", // line name
                            datetime              time1  = 0,         // first point time
                            double                price1 = 0,        // first point price
                            datetime              time2  = 0,         // second point time
                            double                price2 = 0,        // second point price
                            const color           clr    = clrRed);      // line color
          void  ChangeTrendEmptyPoints(datetime &time1, double &price1, datetime &time2, double &price2);
          bool  TextCreate(const string            name = "Text",            // object name
                           datetime                argtime = 0,                 // anchor point time
                           double                  price = 0,                // anchor point price
                           const string            text = "Text",            // the text itself
                           const color             clr = clrRed);             // color
          void  ChangeTextEmptyPoint(datetime &argtime, double &price);
          bool  RectangleCreate(const string          name = "Rectangle", // rectangle name
                                datetime              time1 = 0,         // first point time
                                double                price1 = 0,        // first point price
                                datetime              time2 = 0,         // second point time
                                double                price2 = 0,        // second point price
                                const color           clr = clrRed);      // rectangle color
          void  ChangeRectangleEmptyPoints(datetime &time1, double &price1, datetime &time2, double &price2);

};
//Pivoter1;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_PivotLines::C_PivotLines()
{         RunCallFunction++; ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_PivotLines Error",  __LINE__, __FUNCTION__); //
          Is_Pivot = false;
          //--- inputs
          PivotMode         = Fibonacci;
          CurrentHourOnly   = true;
          CountBars         = 500;
          Pivot_Lines       = "===== Pivot Lines =====";
          ShowPivotLines    = true;
          LineWidth         = 2;
          LineStyle         = STYLE_SOLID;
          RColor            = clrFireBrick;
          PColor            = clrDodgerBlue;
          SColor            = clrGreen;
          Pivot_Areas       = "===== Pivot Areas =====";
          AreasFilling      = false;//false//true
          R1AreaColor       = clrMaroon;
          R2AreaColor       = clrMaroon;
          R3AreaColor       = clrMaroon;
          R4AreaColor       = clrMaroon;
          S1AreaColor       = clrDarkGreen;
          S2AreaColor       = clrDarkGreen;
          S3AreaColor       = clrDarkGreen;
          S4AreaColor       = clrDarkGreen;
          Pivot_Labels      = "===== Pivot Labels =====";
          ShowLabels        = true;
          //--- global variables
          last_hour = -4;                     // last integral 4 hour
          period = (int)MathCeil(240 / Period()); // bar range in 4 hour
          short_name = "4HourlyPivot";
          //Custom Indicators////This is the group functions used in the creation of custom indicators. These functions can't be used when writing Expert Advisors and Scripts
          //IndicatorDigits(_Digits);//--- indicator digits
          //IndicatorShortName(short_name);//--- indicator short name
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_PivotLines Error",  __LINE__, __FUNCTION__); //
          return;//
}
//+------------------------------------------------------------------+
//| Custom indicator uninitalization function                        |
//+------------------------------------------------------------------+
C_PivotLines::~C_PivotLines()
{         if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-C_PivotLines Error",  __LINE__, __FUNCTION__); //
          // const int reason = 0;
          long             chart_ID = ChartID(); // chart ID   chart_ID = ChartID();
          const string     prefix = short_name ;  // prefix in object name
          int              sub_window = EMPTY; // window index
          int              object_type = EMPTY; // object type
          //ObjectsDeleteAll(ChartID(), short_name, 0, -1);
          //ObjectsDeleteAll(ChartID(), short_name);
          // Print(__FUNCTION__, "_Uninitalization reason code = ", reason);
          //Alert("Deinit: ", __FUNCSIG__); //
          if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-C_PivotLines Error",  __LINE__, __FUNCTION__); //
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_PivotLines::Update()
{         UPDATED = false;
          PivoterRun(); //Alert(" Pivoter1.OnWork()","-Line:",__LINE__);
          //==========================================================
          // SYS Timer Cheackup Start C_WINUSER32 App Enviroments<<<<|
          //==========================================================
          //
          UPDATED = true;
          //
          //==========================================================
          // SYS Timer Cheackup End C_WINUSER32 App Enviroments<<<<<<|
          //==========================================================
          if(!this.UPDATED)       {Alert("PivotLines.UPDATED: ", this.UPDATED);}
          return UPDATED;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int C_PivotLines::PivoterRun()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_PivotLines Error",  __LINE__, __FUNCTION__); //
          if(Is_Pivot )
          {         if(IsExist) {return 0; }
                    if(Period() > PERIOD_H4)  return(0);//--- do not calculate if period > 4 hour
                    //if(rates_total < 0)       return(-1);//--- check rates_total  //--!! there is no loop call no ned this
                    //------------------------------------------------------------------------------
                    int limit;//--- set calculation ending point
                    //---
                    if(CountBars > WindowBarsPerChart()) {limit = WindowBarsPerChart();}
                    else {limit = CountBars;}
                    //---
                    if(prev_calculated > 0) {limit = rates_total - IndicatorCounted() - 1;}//The function returns the amount of bars not changed after the indicator had been launched last.
                    //---
                    last_hour = -4;                     // last integral 4 hour
                    IsExist = CalculateHourlyPivotPoints(limit, false); //--- calculate pivot point
          }//
          else if(IsExist)
          {         //
                    Alert("the Pivoter PivoterRun-IsExist");
                    ///
                    if(Period() > PERIOD_H4)  return(0);//--- do not calculate if period > 4 hour
                    //if(rates_total < 0)       return(-1);//--- check rates_total
                    //-------------------------------------------------------------------------------------------
                    int limit;//--- set calculation ending point
                    //---
                    if(CountBars > WindowBarsPerChart()) {limit = WindowBarsPerChart();}
                    else {limit = CountBars;}
                    //---
                    if(prev_calculated > 0) {limit = rates_total - IndicatorCounted() - 1;}//The function returns the amount of bars not changed after the indicator had been launched last.
                    //---
                    IsClear = CalculateHourlyPivotPoints(limit, true); //--- calculate pivot point
                    if(IsClear) {         IsExist = false; } //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_PivotLines Error",  __LINE__, __FUNCTION__); //
          return(rates_total);//--- return value of prev_calculated for next call
          //
}
//+------------------------------------------------------------------+
//| Calculate hourly Pivot Points                                    |
//+------------------------------------------------------------------+
bool C_PivotLines::CalculateHourlyPivotPoints(int bars_count, bool d)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_PivotLines Error",  __LINE__, __FUNCTION__); //
          double   pre_high, pre_low, pre_close ; // high/low/close in last hour
          double   R1, R2, R3, R4, PP, S1, S2, S3, S4 ;    // pivot points
          pre_high = pre_low = pre_close = 0;
          R1 = R2 = R3 = R4 = PP = S1 = S2 = S3 = S4 = 0;
          //-------------------------------------------------------
          IsDelete = d;  //Alert("the Pivoter CalculateHourlyPivotPoints:" + (string)bars_count + "  " + (string)d);
          //-------------------------------------------------------
          if(!IsDelete)
          {         for(int i = 100; i >= 0 && !IsStopped(); i--) //--- for(int i = bars_count; i >= 0 && !IsStopped(); i--)
                    {         //---define target how?
                              bool is_target = false;
                              if(CurrentHourOnly)
                              {         bool Is_Time =  TimeHour    (iTime(NULL, 0, i)) == TimeHour    (TimeCurrent()) &&
                                                        TimeDay     (iTime(NULL, 0, i)) == TimeDay     (TimeCurrent()) &&
                                                        TimeMonth   (iTime(NULL, 0, i)) == TimeMonth   (TimeCurrent()) &&
                                                        TimeYear    (iTime(NULL, 0, i)) == TimeYear    (TimeCurrent()) &&
                                                        TimeMinute  (iTime(NULL, 0, i)) == 0;
                                        if(Is_Time)is_target = true;//
                              }
                              else {if(TimeMinute(iTime(NULL, 0, i)) == 0) {is_target = true;}}
                              //---creating
                              if(is_target && last_hour != TimeHour(iTime(NULL, 0, i)) && FindExistingObj(iTime(NULL, 0, i)) == false)
                              {         //------------------------------------------------------------------------------------------------------
                                        last_hour   = TimeHour(iTime(NULL, 0, i));
                                        pre_high    = High[iHighest(NULL, 0, MODE_HIGH, period, i + 1)];
                                        pre_low     = Low[iLowest(NULL, 0, MODE_LOW, period, i + 1)];
                                        pre_close   = Close[i + 1];
                                        //------------------------------------------------------------------------------------------------------
                                        PP = NormalizeDouble((pre_high + pre_low + pre_close) / 3, _Digits);
                                        R1 = NormalizeDouble((2 * PP) - pre_low, _Digits);
                                        S1 = NormalizeDouble((2 * PP) - pre_high, _Digits);
                                        R2 = NormalizeDouble(PP + (R1 - S1), _Digits);
                                        S2 = NormalizeDouble(PP - (R1 - S1), _Digits);
                                        R3 = NormalizeDouble(pre_high + (2 * (PP - pre_low)), _Digits);
                                        S3 = NormalizeDouble(pre_low - (2 * (pre_high - PP)), _Digits);
                                        //---
                                        if(PivotMode == Fibonacci)
                                        {         double R = NormalizeDouble(pre_high - pre_low, _Digits);
                                                  R4 = NormalizeDouble(PP + (R * 1.618), _Digits);
                                                  R3 = NormalizeDouble(PP + (R * 1.000), _Digits);
                                                  R2 = NormalizeDouble(PP + (R * 0.618), _Digits);
                                                  R1 = NormalizeDouble(PP + (R * 0.382), _Digits);
                                                  S1 = NormalizeDouble(PP - (R * 0.382), _Digits);
                                                  S2 = NormalizeDouble(PP - (R * 0.618), _Digits);
                                                  S3 = NormalizeDouble(PP - (R * 1.000), _Digits);
                                                  S4 = NormalizeDouble(PP - (R * 1.618), _Digits);//
                                        }
                                        //---
                                        datetime    time1 = iTime(NULL, 0, i + 60);
                                        datetime    time2 = time1 + 60 * 60 * (datetime)7.5; ////defined by me
                                        //time2 = time1 + 60 * 60;
                                        //---
                                        string      obj_time = "_" + TimeToStr(time1);
                                        //----
                                        if(AreasFilling)//--- create rectangle
                                        {         RectangleCreate(short_name + "_R1_Area" + obj_time, time1, PP, time2, R1, R1AreaColor);
                                                  RectangleCreate(short_name + "_R2_Area" + obj_time, time1, R1, time2, R2, R2AreaColor);
                                                  RectangleCreate(short_name + "_R3_Area" + obj_time, time1, R2, time2, R3, R3AreaColor);
                                                  RectangleCreate(short_name + "_R4_Area" + obj_time, time1, R3, time2, R4, R3AreaColor);
                                                  RectangleCreate(short_name + "_S1_Area" + obj_time, time1, PP, time2, S1, S1AreaColor);
                                                  RectangleCreate(short_name + "_S2_Area" + obj_time, time1, S1, time2, S2, S2AreaColor);
                                                  RectangleCreate(short_name + "_S3_Area" + obj_time, time1, S2, time2, S3, S3AreaColor);
                                                  RectangleCreate(short_name + "_S4_Area" + obj_time, time1, S3, time2, S4, S3AreaColor); //
                                        }
                                        if(ShowPivotLines) //--- create level lines
                                        {         TrendCreate(short_name + "_PP" + obj_time, time1, PP, time2, PP, PColor);
                                                  TrendCreate(short_name + "_R1" + obj_time, time1, R1, time2, R1, RColor);
                                                  TrendCreate(short_name + "_R2" + obj_time, time1, R2, time2, R2, RColor);
                                                  TrendCreate(short_name + "_R3" + obj_time, time1, R3, time2, R3, RColor);
                                                  TrendCreate(short_name + "_R4" + obj_time, time1, R4, time2, R4, RColor);
                                                  TrendCreate(short_name + "_S1" + obj_time, time1, S1, time2, S1, SColor);
                                                  TrendCreate(short_name + "_S2" + obj_time, time1, S2, time2, S2, SColor);
                                                  TrendCreate(short_name + "_S3" + obj_time, time1, S3, time2, S3, SColor);
                                                  TrendCreate(short_name + "_S4" + obj_time, time1, S4, time2, S4, SColor); //
                                        }
                                        if(ShowLabels)//--- create labels for the level lines
                                        {         if(PivotMode == Fibonacci)
                                                  {         TextCreate(short_name + "_PP_Label" + obj_time, time2, PP, "H4 PP", PColor);
                                                            TextCreate(short_name + "_R1_Label" + obj_time, time2, R1, "H4 R1 Fibo", RColor);
                                                            TextCreate(short_name + "_R2_Label" + obj_time, time2, R2, "H4 R2 Fibo", RColor);
                                                            TextCreate(short_name + "_R3_Label" + obj_time, time2, R3, "H4 R3 Fibo", RColor);
                                                            TextCreate(short_name + "_R4_Label" + obj_time, time2, R4, "H4 R4 Fibo", RColor);
                                                            TextCreate(short_name + "_S1_Label" + obj_time, time2, S1, "H4 S1 Fibo", SColor);
                                                            TextCreate(short_name + "_S2_Label" + obj_time, time2, S2, "H4 S2 Fibo", SColor);
                                                            TextCreate(short_name + "_S3_Label" + obj_time, time2, S3, "H4 S3 Fibo", SColor);
                                                            TextCreate(short_name + "_S4_Label" + obj_time, time2, S4, "H4 S4 Fibo", SColor);//
                                                  }
                                                  else
                                                  {         TextCreate(short_name + "_PP_Label" + obj_time, time2, PP, "H4 PP", PColor);
                                                            TextCreate(short_name + "_R1_Label" + obj_time, time2, R1, "H4 R1", RColor);
                                                            TextCreate(short_name + "_R2_Label" + obj_time, time2, R2, "H4 R2", RColor);
                                                            TextCreate(short_name + "_R3_Label" + obj_time, time2, R3, "H4 R3", RColor);
                                                            TextCreate(short_name + "_R4_Label" + obj_time, time2, R3, "H4 R4", RColor);
                                                            TextCreate(short_name + "_S1_Label" + obj_time, time2, S1, "H4 S1", SColor);
                                                            TextCreate(short_name + "_S2_Label" + obj_time, time2, S2, "H4 S2", SColor);
                                                            TextCreate(short_name + "_S3_Label" + obj_time, time2, S3, "H4 S3", SColor);
                                                            TextCreate(short_name + "_S4_Label" + obj_time, time2, S3, "H4 S4", SColor);//
                                                  }//
                                        }//
                              }//
                    }//
                    return(true);//
          }//
          if(IsDelete)//---work
          {         //Alert("the Pivoter CalculateHourlyPivotPoints:   is delete " );
                    for(int i = 100; i >= 0 && !IsStopped(); i--) //--- for(int i = bars_count; i >= 0 && !IsStopped(); i--)
                    {         //---define target
                              bool is_target = false;
                              if(CurrentHourOnly)
                              {         bool Is_Time =  TimeHour    (iTime(NULL, 0, i)) == TimeHour    (TimeCurrent()) &&
                                                        TimeDay     (iTime(NULL, 0, i)) == TimeDay     (TimeCurrent()) &&
                                                        TimeMonth   (iTime(NULL, 0, i)) == TimeMonth   (TimeCurrent()) &&
                                                        TimeYear    (iTime(NULL, 0, i)) == TimeYear    (TimeCurrent()) &&
                                                        TimeMinute  (iTime(NULL, 0, i)) == 0;
                                        if(Is_Time)is_target = true;//
                              }
                              else {if(TimeMinute(iTime(NULL, 0, i)) == 0) {is_target = true;}}
                              //---deleting
                              if(true ) //just delete
                              {         //------------------------------------------------------------------------------------------------------
                                        last_hour   = TimeHour(iTime(NULL, 0, i));
                                        pre_high    = High[iHighest(NULL, 0, MODE_HIGH, period, i + 1)];
                                        pre_low     = Low[iLowest(NULL, 0, MODE_LOW, period, i + 1)];
                                        pre_close   = Close[i + 1];
                                        //------------------------------------------------------------------------------------------------------
                                        PP = NormalizeDouble((pre_high + pre_low + pre_close) / 3, _Digits);
                                        R1 = NormalizeDouble((2 * PP) - pre_low, _Digits);
                                        S1 = NormalizeDouble((2 * PP) - pre_high, _Digits);
                                        R2 = NormalizeDouble(PP + (R1 - S1), _Digits);
                                        S2 = NormalizeDouble(PP - (R1 - S1), _Digits);
                                        R3 = NormalizeDouble(pre_high + (2 * (PP - pre_low)), _Digits);
                                        S3 = NormalizeDouble(pre_low - (2 * (pre_high - PP)), _Digits);
                                        //---
                                        if(PivotMode == Fibonacci)
                                        {         double R = NormalizeDouble(pre_high - pre_low, _Digits);
                                                  R4 = NormalizeDouble(PP + (R * 1.618), _Digits);
                                                  R3 = NormalizeDouble(PP + (R * 1.000), _Digits);
                                                  R2 = NormalizeDouble(PP + (R * 0.618), _Digits);
                                                  R1 = NormalizeDouble(PP + (R * 0.382), _Digits);
                                                  S1 = NormalizeDouble(PP - (R * 0.382), _Digits);
                                                  S2 = NormalizeDouble(PP - (R * 0.618), _Digits);
                                                  S3 = NormalizeDouble(PP - (R * 1.000), _Digits);
                                                  S4 = NormalizeDouble(PP - (R * 1.618), _Digits);//
                                        }
                                        //---
                                        datetime    time1 = iTime(NULL, 0, i + 60);
                                        datetime    time2 = time1 + 60 * 60 * (datetime)7.5; ////defined by me
                                        //time2 = time1 + 60 * 60;
                                        //---
                                        string      obj_time = "_" + TimeToStr(time1);
                                        //----
                                        if(AreasFilling)//--- create rectangle
                                        {         RectangleCreate(short_name + "_R1_Area" + obj_time, time1, PP, time2, R1, R1AreaColor);
                                                  RectangleCreate(short_name + "_R2_Area" + obj_time, time1, R1, time2, R2, R2AreaColor);
                                                  RectangleCreate(short_name + "_R3_Area" + obj_time, time1, R2, time2, R3, R3AreaColor);
                                                  RectangleCreate(short_name + "_R4_Area" + obj_time, time1, R3, time2, R4, R3AreaColor);
                                                  RectangleCreate(short_name + "_S1_Area" + obj_time, time1, PP, time2, S1, S1AreaColor);
                                                  RectangleCreate(short_name + "_S2_Area" + obj_time, time1, S1, time2, S2, S2AreaColor);
                                                  RectangleCreate(short_name + "_S3_Area" + obj_time, time1, S2, time2, S3, S3AreaColor);
                                                  RectangleCreate(short_name + "_S4_Area" + obj_time, time1, S3, time2, S4, S3AreaColor); //
                                        }
                                        if(ShowPivotLines) //--- create level lines
                                        {         TrendCreate(short_name + "_PP" + obj_time, time1, PP, time2, PP, PColor);
                                                  TrendCreate(short_name + "_R1" + obj_time, time1, R1, time2, R1, RColor);
                                                  TrendCreate(short_name + "_R2" + obj_time, time1, R2, time2, R2, RColor);
                                                  TrendCreate(short_name + "_R3" + obj_time, time1, R3, time2, R3, RColor);
                                                  TrendCreate(short_name + "_R4" + obj_time, time1, R4, time2, R4, RColor);
                                                  TrendCreate(short_name + "_S1" + obj_time, time1, S1, time2, S1, SColor);
                                                  TrendCreate(short_name + "_S2" + obj_time, time1, S2, time2, S2, SColor);
                                                  TrendCreate(short_name + "_S3" + obj_time, time1, S3, time2, S3, SColor);
                                                  TrendCreate(short_name + "_S4" + obj_time, time1, S4, time2, S4, SColor); //
                                        }
                                        if(ShowLabels)//--- create labels for the level lines
                                        {         if(PivotMode == Fibonacci)
                                                  {         TextCreate(short_name + "_PP_Label" + obj_time, time2, PP, "H4 PP", PColor);
                                                            TextCreate(short_name + "_R1_Label" + obj_time, time2, R1, "H4 R1 Fibo", RColor);
                                                            TextCreate(short_name + "_R2_Label" + obj_time, time2, R2, "H4 R2 Fibo", RColor);
                                                            TextCreate(short_name + "_R3_Label" + obj_time, time2, R3, "H4 R3 Fibo", RColor);
                                                            TextCreate(short_name + "_R4_Label" + obj_time, time2, R4, "H4 R4 Fibo", RColor);
                                                            TextCreate(short_name + "_S1_Label" + obj_time, time2, S1, "H4 S1 Fibo", SColor);
                                                            TextCreate(short_name + "_S2_Label" + obj_time, time2, S2, "H4 S2 Fibo", SColor);
                                                            TextCreate(short_name + "_S3_Label" + obj_time, time2, S3, "H4 S3 Fibo", SColor);
                                                            TextCreate(short_name + "_S4_Label" + obj_time, time2, S4, "H4 S4 Fibo", SColor);//
                                                  }
                                                  else
                                                  {         TextCreate(short_name + "_PP_Label" + obj_time, time2, PP, "H4 PP", PColor);
                                                            TextCreate(short_name + "_R1_Label" + obj_time, time2, R1, "H4 R1", RColor);
                                                            TextCreate(short_name + "_R2_Label" + obj_time, time2, R2, "H4 R2", RColor);
                                                            TextCreate(short_name + "_R3_Label" + obj_time, time2, R3, "H4 R3", RColor);
                                                            TextCreate(short_name + "_R4_Label" + obj_time, time2, R3, "H4 R4", RColor);
                                                            TextCreate(short_name + "_S1_Label" + obj_time, time2, S1, "H4 S1", SColor);
                                                            TextCreate(short_name + "_S2_Label" + obj_time, time2, S2, "H4 S2", SColor);
                                                            TextCreate(short_name + "_S3_Label" + obj_time, time2, S3, "H4 S3", SColor);
                                                            TextCreate(short_name + "_S4_Label" + obj_time, time2, S3, "H4 S4", SColor);//
                                                  }//
                                        }//
                              }//
                    }//
                    return(true);//
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_PivotLines Error",  __LINE__, __FUNCTION__); //
          return(false); //
}
//+------------------------------------------------------------------+
//| Calculate object numbers                                         |
//+------------------------------------------------------------------+
bool C_PivotLines::FindExistingObj(datetime obj_time)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_PivotLines Error",  __LINE__, __FUNCTION__); //
          string time_str = TimeToStr(obj_time);
          string name;
          if(ObjectsTotal(ChartID(), 0, -1) > 0)
          {         for(int i = 0; i < ObjectsTotal(); i++)
                    {         name = ObjectName(i);
                              if(StringFind(name, time_str, 0) >= 0) return(true); } //as time indexer in name or shortname
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_PivotLines Error",  __LINE__, __FUNCTION__); //
          //---
          return(false);//
}
//+------------------------------------------------------------------+
//| Create a trend line by the given coordinates                     |
//+------------------------------------------------------------------+
bool C_PivotLines::TrendCreate(const string          name   = "TrendLine", // line name
                               datetime              time1  = 0,         // first point time
                               double                price1 = 0,        // first point price
                               datetime              time2  = 0,         // second point time
                               double                price2 = 0,        // second point price
                               const color           clr    = clrRed)      // line color
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_PivotLines Error",  __LINE__, __FUNCTION__); //
          if(IsDelete) { /*Alert("the Pivoter TrendCreate");*/ return ObjectDelete(name);}
          //--- set anchor points' coordinates if they are not set
          ChangeTrendEmptyPoints(time1, price1, time2, price2);
          //--- reset the error value
          if(Capitan_ResetLastErrorX) ResetLastError();
          //--- create a trend line by the given coordinates
          if(ObjectFind(ChartData_ChartInfo.ID, name) < 0)
                    if(!ObjectCreate(ChartID(), name, OBJ_TREND, 0, time1, price1, time2, price2))
                    {         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_PivotLines failed to create a trend line!",  __LINE__, __FUNCTION__); return(false); }
          if(ObjectFind(ChartData_ChartInfo.ID, name) >= 0)
          {         //--- set line color
                    ObjectSetInteger(ChartID(), name, OBJPROP_COLOR, clr);
                    //--- set line display style
                    ObjectSetInteger(ChartID(), name, OBJPROP_STYLE, LineStyle);
                    ObjectSetInteger(ChartID(), name, OBJPROP_WIDTH, LineWidth);
                    ObjectSetInteger(ChartID(), name, OBJPROP_BACK, true);
                    ObjectSetInteger(ChartID(), name, OBJPROP_SELECTABLE, false);
                    ObjectSetInteger(ChartID(), name, OBJPROP_SELECTED, false);
                    ObjectSetInteger(ChartID(), name, OBJPROP_RAY_RIGHT, false);
                    ObjectSetInteger(ChartID(), name, OBJPROP_HIDDEN, true);
                    ObjectSetInteger(ChartID(), name, OBJPROP_ZORDER, 0);//
          }
          //--- successful execution
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_PivotLines Error",  __LINE__, __FUNCTION__); //
          return(true);//
}
//+------------------------------------------------------------------+
//| Check the values of trend line's anchor points and set default   |
//| values for empty ones                                            |
//+------------------------------------------------------------------+
void C_PivotLines::ChangeTrendEmptyPoints(datetime &time1, double &price1, datetime &time2, double &price2)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_PivotLines Error",  __LINE__, __FUNCTION__); //
          //--- if the first point's time is not set, it will be on the current bar
          if(!time1)time1 = TimeCurrent();
          //--- if the first point's price is not set, it will have Bid value
          if(!price1)price1 = SymbolInfoDouble(Symbol(), SYMBOL_BID);
          //--- if the second point's time is not set, it is located 9 bars left from the second one
          if(!time2)
          {         //--- array for receiving the open time of the last 10 bars
                    datetime temp[10];
                    CopyTime(Symbol(), Period(), time1, 10, temp);
                    //--- set the second point 9 bars left from the first one
                    time2 = temp[0]; }
          //--- if the second point's price is not set, it is equal to the first point's one
          if(!price2)price2 = price1; //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_PivotLines Error",  __LINE__, __FUNCTION__); //
          return;//
}
//+------------------------------------------------------------------+
//| Creating Text object                                             |
//+------------------------------------------------------------------+
bool C_PivotLines::TextCreate(const string            name = "Text",            // object name
                              datetime                argtime = 0,                 // anchor point time
                              double                  price = 0,                // anchor point price
                              const string            text = "Text",            // the text itself
                              const color             clr = clrRed)             // color
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_PivotLines Error",  __LINE__, __FUNCTION__); //
          if(IsDelete) { /*Alert("the Pivoter TextCreate");*/ return ObjectDelete(name); }
          //--- set anchor point coordinates if they are not set
          ChangeTextEmptyPoint(argtime, price);
          /* reset the error value*/ if(Capitan_ResetLastErrorX)ResetLastError();
          //--- create Text object
          if(ObjectFind(ChartData_ChartInfo.ID, name) < 0)
                    if(!ObjectCreate(ChartID(), name, OBJ_TEXT, 0, argtime, price) ) { return(false); }
          if(ObjectFind(ChartData_ChartInfo.ID, name) >= 0)
          {         //--- set the text
                    ObjectSetString(ChartID(), name, OBJPROP_TEXT, text);
                    ObjectSetInteger(ChartID(), name, OBJPROP_COLOR, clr);
                    ObjectSetString(ChartID(), name, OBJPROP_FONT, "Arial");
                    ObjectSetInteger(ChartID(), name, OBJPROP_FONTSIZE, 7);
                    ObjectSetDouble(ChartID(), name, OBJPROP_ANGLE, 0.0);
                    ObjectSetInteger(ChartID(), name, OBJPROP_ANCHOR, ANCHOR_RIGHT_LOWER);
                    ObjectSetInteger(ChartID(), name, OBJPROP_BACK, true);
                    ObjectSetInteger(ChartID(), name, OBJPROP_SELECTABLE, false);
                    ObjectSetInteger(ChartID(), name, OBJPROP_SELECTED, false);
                    ObjectSetInteger(ChartID(), name, OBJPROP_HIDDEN, true);
                    ObjectSetInteger(ChartID(), name, OBJPROP_ZORDER, 0);
                    //
          }
          //--- successful execution
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_PivotLines Error",  __LINE__, __FUNCTION__); //
          return(true); //
}
//+------------------------------------------------------------------+
//| Check anchor point values and set default values                 |
//| for empty ones                                                   |
//+------------------------------------------------------------------+
void C_PivotLines::ChangeTextEmptyPoint(datetime &argtime, double &price)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_PivotLines Error",  __LINE__, __FUNCTION__); //
          //--- if the point's time is not set, it will be on the current bar
          if(!argtime)
                    argtime = TimeCurrent();
          //--- if the point's price is not set, it will have Bid value
          if(!price)
                    price = SymbolInfoDouble(Symbol(), SYMBOL_BID);//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_PivotLines Error",  __LINE__, __FUNCTION__); //
          return;//
}
//+------------------------------------------------------------------+
//| Create rectangle by the given coordinates                        |
//+------------------------------------------------------------------+
bool C_PivotLines::RectangleCreate( const string          name = "Rectangle", // rectangle name
                                    datetime              time1 = 0,         // first point time
                                    double                price1 = 0,        // first point price
                                    datetime              time2 = 0,         // second point time
                                    double                price2 = 0,        // second point price
                                    const color           clr = clrRed)      // rectangle color
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_PivotLines Error",  __LINE__, __FUNCTION__); //
          // Alert("the Pivoter RectangleCreate"); ok
          if(IsDelete) {/*Alert("the Pivoter RectangleCreate");*/ return ObjectDelete(name); }
          //--- set anchor points' coordinates if they are not set
          ChangeRectangleEmptyPoints(time1, price1, time2, price2);
          //--- reset the error value
          if(Capitan_ResetLastErrorX)ResetLastError();
          //--- create a rectangle by the given coordinates
          if(ObjectFind(ChartData_ChartInfo.ID, name) < 0)
                    if(!ObjectCreate(ChartID(), name, OBJ_RECTANGLE, 0, time1, price1, time2, price2) )
                    {         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_PivotLines failed to create a rectangle! Error code = ",  __LINE__, __FUNCTION__); return(false); }
          if(ObjectFind(ChartData_ChartInfo.ID, name) >= 0)
          {         //--- set rectangle color
                    ObjectSetInteger(ChartID(), name, OBJPROP_COLOR, clr);
                    ObjectSetInteger(ChartID(), name, OBJPROP_FILL, true);
                    ObjectSetInteger(ChartID(), name, OBJPROP_STYLE, STYLE_SOLID);
                    ObjectSetInteger(ChartID(), name, OBJPROP_WIDTH, 1);
                    ObjectSetInteger(ChartID(), name, OBJPROP_BACK, true);
                    ObjectSetInteger(ChartID(), name, OBJPROP_SELECTABLE, false);
                    ObjectSetInteger(ChartID(), name, OBJPROP_SELECTED, false);
                    ObjectSetInteger(ChartID(), name, OBJPROP_HIDDEN, true);
                    ObjectSetInteger(ChartID(), name, OBJPROP_ZORDER, 0);//
          }
          //--- successful execution
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_PivotLines Error",  __LINE__, __FUNCTION__); //
          return(true);//
}
//+------------------------------------------------------------------+
//| Check the values of rectangle's anchor points and set default    |
//| values for empty ones                                            |
//+------------------------------------------------------------------+
void C_PivotLines::ChangeRectangleEmptyPoints(datetime &time1, double &price1, datetime &time2, double &price2)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_PivotLines Error",  __LINE__, __FUNCTION__); //
          //--- if the first point's time is not set, it will be on the current bar
          if(!time1)time1 = TimeCurrent();
          //--- if the first point's price is not set, it will have Bid value
          if(!price1)price1 = SymbolInfoDouble(Symbol(), SYMBOL_BID);
          //--- if the second point's time is not set, it is located 9 bars left from the second one
          if(!time2)
          {         //--- array for receiving the open time of the last 10 bars
                    datetime temp[10];
                    CopyTime(Symbol(), Period(), time1, 10, temp);
                    //--- set the second point 9 bars left from the first one
                    time2 = temp[0]; }
          //--- if the second point's price is not set, move it 300 points lower than the first one
          if(!price2)price2 = price1 - 300 * SymbolInfoDouble(Symbol(), SYMBOL_POINT);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_PivotLines Error",  __LINE__, __FUNCTION__); //
          return;//
}
//+------------------------------------------------------------------+
//|             Class Pivoter     BEGIN-END                          |
//+------------------------------------------------------------------+
