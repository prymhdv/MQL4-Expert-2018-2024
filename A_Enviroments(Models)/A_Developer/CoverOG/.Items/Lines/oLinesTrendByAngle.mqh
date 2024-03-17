//+------------------------------------------------------------------+
//|                                                 C_LinesTrendByAngle.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\__COBFA__.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\Item_Structs\S_TRENDBYANGLE.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\ChartObjects\ChartObjectsLines.mqh>

class C_LinesTrendByAngle_demo: public __COBFA__<S_TRENDBYANGLE>
{
//====================================================================
private:
          static uint                    ObjAllNum;
          static uint                    ObjAllNumDef;
          string                         ObjName;//name num comfe from ObjAllNum
          uint                           ObjNum;//just run once created obj
          datetime                       ObjCreateTime;
          //static int OBJCount;// = 0;>>may come error//resolved//by set value out class block::
//====================================================================
};
uint C_LinesTrendByAngle_demo::ObjAllNum = 0;
uint C_LinesTrendByAngle_demo:: ObjAllNumDef = 0;

class C_LinesTrendByAngle: public __COBFA__<S_TRENDBYANGLE>
{

public:
          void                          C_LinesTrendByAngle() {};
          void                          ~C_LinesTrendByAngle() {};
//====================================================================
          S_TRENDBYANGLE                GDS;
          CChartObjectTrendByAngle_MQL4      GAC;

          void                          SetupSignal(){ GDS.Setup(); }
//====================================================================
          int                           Count ;
          int                           Start ;
          bool                          GradientPositive;//        = TimeCordinateOne > TimeCordinateTwo;
          bool                          GradientNegative;//        = TimeCordinateOne < TimeCordinateTwo;
          double                        PriceCordinateOne;// = PriceCordinateOne;
          datetime                      TimeCordinateOne;//  = TimeCordinateOne;
          double                        PriceCordinateTwo;// = PriceCordinateTwo;
          datetime                      TimeCordinateTwo;//  = TimeCordinateTwo;
          double                        PriceCordinateThere;// = PriceCordinateTwo;
          datetime                      TimeCordinateThere;//  = TimeCordinateTwo;
//====================================================================
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          bool Create(bool Is_Create, bool Is_Move, const string TrendAngle_Name =  "TrendAngle_Name", const string DescriptionIN = "UseTrendAngleDescription",
                      const int XCordinate = 10, const int YCordinate = 10,
                      ENUM_LINE_STYLE StyleIN = STYLE_SOLID, int WidthIN = 1,   color  DescColorIN = clrYellow, const double AngleIN = 0, bool RayRightIN = false, bool RayLeftIN = false  );// UseTrend
//====================================================================
          bool Delete() {return (GAC.Delete());}
          //---[----Draw Trend Lines//ExtemumPlace by indexed---]
          void Draw_GDS(int WhichMode, bool IsKey, string n, int AddBar, int StartBar, bool Is_Delete)
          {         GDS.Set_Action_2(WhichMode, IsKey);
                    GDS.Set_Desc_1(  "Lines.TrendByAngle"  + n);
                    GDS.Set_Location_4(0, 0, 0, 0);
                    GDS.Calc_Locations(PERIOD_CURRENT, AddBar, StartBar);
                    GDS.Set_Angel(30);
                    GDS.Set_Color_1(clrGreen);
                    GDS.Set_Tip_2(STYLE_DOT, 3);
                    GDS.Set_Common_6(false, 10, true, false, true,  "Lines.TrendByAngle" + n);
                    GDS.Set_Chart_6();
                    GDS.Set_ToDelete_1(Is_Delete);
                    GDS.Set_Signal_1(true);
                    Action(this);//
          }//
          void Draw_GDS2(int WhichMode, bool IsKey, string n, datetime t1, double p1, datetime t2, double p2, double angl, bool Is_Delete)
          {         GDS.Set_Action_2(WhichMode, IsKey);
                    GDS.Set_Desc_1(  "Lines.TrendByAngle"  + n);
                    GDS.Set_Location_4(t1, p1, t2, p2);  // ObjectCreate(chart_ID,name,OBJ_TRENDBYANGLE,sub_window,time,price,time2,price2
                    //GDS.Calc_Locations(PERIOD_CURRENT, AddBar, StartBar);
                    GDS.Set_Angel(angl);
                    GDS.Set_Color_1(clrGreen);
                    GDS.Set_Tip_2(STYLE_DOT, 3);
                    GDS.Set_Common_6(false, 10, true, false, true,  "Lines.TrendByAngle" + n);
                    GDS.Set_Chart_6();
                    GDS.Set_ToDelete_1(Is_Delete);
                    GDS.Set_Signal_1(true);
                    Action(this);//
                    Print("Lines.TrendByAngle"  + n);//
          }//
          //====================================================================
};


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_LinesTrendByAngle::Create(bool Is_Create, bool Is_Move, const string TrendAngle_Name =  "TrendAngle_Name", const string DescriptionIN = "UseTrendAngleDescription",
                                 const int XCordinate = 10, const int YCordinate = 10,
                                 ENUM_LINE_STYLE StyleIN = STYLE_SOLID, int WidthIN = 1,   color  DescColorIN = clrYellow, const double AngleIN = 0, bool RayRightIN = false, bool RayLeftIN = false ) // UseTrend
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_LinesTrendByAngle Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          int HighestBar = iHighest(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT,   MODE_HIGH, Count = 500, Start);
          int HighestBar100 = iHighest(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT,   MODE_HIGH, Count = 100, Start);
          int LowestBar = iLowest(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT,  MODE_LOW, Count = 500, Start);
          int LowestBar100 = iLowest(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT,  MODE_LOW, Count = 100, Start);
//HighestBar = 0;
          int MeanBar = (HighestBar + LowestBar) / 2;
          if(false)
          {         if(HighestBar)MeanBar = (HighestBar + LowestBar) / 2;
                    else MeanBar = (HighestBar + LowestBar) / 2; }
          datetime TimeCordinateOneIN = iTime(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, HighestBar); // Time[50];
          datetime TimeCordinateTwoIN = iTime(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, LowestBar); // Time[50];
          datetime TimeCordinateMeanIN = iTime(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, MeanBar + HighestBar + LowestBar); // Time[50];
          datetime TimeCordinateThirdHighIN = iTime(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, HighestBar100); // Time[50];
          datetime TimeCordinateThirdLowIN = iTime(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, LowestBar100); // Time[50];
// datetime TimeCordinateThird;
          if (TimeCordinateOneIN > TimeCordinateTwoIN)
                    TimeCordinateOneIN = iTime(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, 10 ); // MathAbs(HighestBar - LowestBar)
///Close[150] / 1.1)
// Alert(PriceCordinateTwo,"-Line:",__LINE__);
          double PriceCordinateOneIN = High[HighestBar];
          double PriceCordinateTwoIN = Low[LowestBar];
          double PriceCordinateThirdHigh = High[HighestBar100];
          double PriceCordinateThirdHighThirdLow = Low[LowestBar100];
// double PriceCordinateThird;
          double PriceCordinateMean = Close[(HighestBar + LowestBar) / 2];
////,TimeCordinateThird,PriceCordinateThird
//=============================================================
          if(ObjectFind(ChartData_ChartInfo.ID, TrendAngle_Name) >= 0 && Is_Move )
          {         ObjectSetInteger(0, TrendAngle_Name, OBJPROP_XDISTANCE, XCordinate);//Label_.X_Distance(XCordinate);
                    ObjectSetInteger(0, TrendAngle_Name, OBJPROP_YDISTANCE, YCordinate);////Label_.Y_Distance(YCordinate); //
                    return true;//
          }
          if(ObjectFind(ChartData_ChartInfo.ID, TrendAngle_Name) >= 0 && !Is_Create) {return ObjectDelete(ChartData_ChartInfo.ID, TrendAngle_Name);}
          if(ObjectFind(ChartData_ChartInfo.ID, TrendAngle_Name) < 0)
                    if(! GAC.Create(ChartData_ChartInfo.ID, TrendAngle_Name, ChartData_ChartInfo.SubWindow, TimeCordinateOne, PriceCordinateOne, TimeCordinateTwo, PriceCordinateTwo))________________________________________________________Xerorr.SuperviserX(_LastError, "-C_LinesTrendByAngle Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          if(ObjectFind(ChartData_ChartInfo.ID, TrendAngle_Name) >= 0)
          {         GAC.Color(DescColorIN);
                    //GAC.RayRight(true);
                    GAC.Width(WidthIN);
                    GAC.SetInteger(OBJPROP_STYLE, StyleIN);   //
                    GAC.Style(StyleIN);
                    GAC.Angle(AngleIN);//
                    GAC.RayRight(RayRightIN);//
                    GAC.RayLeft(RayLeftIN);
                    GAC.Tooltip(DescriptionIN); //
                    return true;//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_LinesTrendByAngle Error",  __LINE__, __FUNCTION__); //|
          return false;//
//=========================================================|
}
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
