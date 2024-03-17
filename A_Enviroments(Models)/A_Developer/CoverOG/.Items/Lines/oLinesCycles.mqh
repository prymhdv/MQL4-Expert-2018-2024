//+------------------------------------------------------------------+
//|                                                 C_LinesCycles.mqh |
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

struct S_CYCLES: public _COBF_
{         //============================================================================================================
          void                  S_CYCLES() {TYPE_O_00 = OBJ_CYCLES;}; // {Point2XY(0, 0, 0, 0);};    //S_HLINE.PointTime.TIME1==0  S_HLINE.PointTime.PRICE1==0  S_HLINE.PointTime.TIME2==0   S_HLINE.PointTime.PRICE2==0
          S_point                Point2XY;                                            //S_HLINE.PointTime.TIME1==0  S_HLINE.PointTime.PRICE1==0
          ////----------------------------------
          //color                 COLOR;                        //Color                           color
          //ENUM_LINE_STYLE       STYLE;                        //Style                           ENUM_LINE_STYLE
          //int                   WIDTH;                        //Line thickness                  int
          ////----------------------------------
          //============================================================================================================
          //OBJECT.Color(COLOR); //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_COLOR, COLOR);
          //OBJECT.Style(STYLE); //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_STYLE, STYLE);
          //OBJECT.Width(WIDTH); //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_WIDTH, WIDTH);
          ////----------------------------------
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_BACK, BACK);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_SELECTABLE, SELECTABLE);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_SELECTED, SELECTED);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_HIDDEN, HIDDEN);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_ZORDER, ZORDER);
          //ObjectSetString(ChartData_ChartInfo.ID,  OBJ.CName, OBJPROP_TOOLTIP, TOOLTIP);//

          //============================================================================================================
          bool Setup()
          {
                    {         //any type
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_BACK,            this.BACK_G_00); //Sleep(1);
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_HIDDEN,          this.HIDDEN_G_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_SELECTABLE,      this.SELECTABLE_G_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_SELECTED,        this.SELECTED_G_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_ZORDER,          this.ZORDER_G_00);
                              ObjectSetString( ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_TOOLTIP,         this.TOOLTIP_G_00);//
                    }
                    //any type Line
                    ObjectSetInteger (ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_COLOR, this.COLOR_C_00);
                    ObjectSetInteger (ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_STYLE, this.STYLE_9);
                    ObjectSetInteger (ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_WIDTH, this.WIDTH_10);
                    //
                    ObjectSetInteger        (ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_TIME1,    this.TIME1);
                    ObjectSetDouble         (ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_PRICE1,   this.PRICE1);
                    ObjectSetInteger        (ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_TIME2,    this.TIME2);
                    ObjectSetDouble         (ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_PRICE2,   this.PRICE2); //
                    //
                    return true;//
          } //

};
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\ChartObjects\ChartObjectsLines.mqh>
class C_LinesCycles: public __COBFA__<S_CYCLES>
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
public:
          void                          C_LinesCycles();
          void                          ~C_LinesCycles() {};
//====================================================================
          S_CYCLES                      GSD;
          CChartObjectCycles_MQL4            GAC;

//====================================================================
          int                           Count;
          int                           Start;
          bool                          GradientPositive;//        = TimeCordinateOne > TimeCordinateTwo;
          bool                          GradientNegative;//        = TimeCordinateOne < TimeCordinateTwo;
          double                        PriceCordinateOne_;// = PriceCordinateOne;
          datetime                      TimeCordinateOne_;//  = TimeCordinateOne;
          double                        PriceCordinateTwo_;// = PriceCordinateTwo;
          datetime                      TimeCordinateTwo_;//  = TimeCordinateTwo;
          double                        PriceCordinateThere_;// = PriceCordinateTwo;
          datetime                      TimeCordinateThere_;//  = TimeCordinateTwo;

          //========================
          int                           DiffDictanceCycle;
//====================================================================
//+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          bool Create(bool Is_Create = false, bool Is_Move = false, const string Cycles_Name = "UseCycles", const string Description = "UseCyclesDescription",
                      datetime TimeCordinateOneIN = 0, double PriceCordinateOneIN = 0, datetime TimeCordinateTwoIN = 0, double PriceCordinateTwoIN = 0,
                      const ENUM_BASE_CORNER Corner = CORNER_RIGHT_LOWER, bool Background = false,
                      color DescColorIN = clrYellow, const ENUM_LINE_STYLE Style = STYLE_DOT,
                      const int FontSize = 7, const string Font = "Arial");// UseCycles
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          bool Delete() {return (GAC.Delete());}
//====================================================================
};
uint C_LinesCycles::ObjAllNum = 0;
uint C_LinesCycles::ObjAllNumDef = 0;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_LinesCycles::C_LinesCycles()
{}


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_LinesCycles::Create(bool Is_Create = false, bool Is_Move = false, const string Cycles_Name = "UseCycles", const string Description = "UseCyclesDescription",
                           datetime TimeCordinateOneIN = 0, double PriceCordinateOneIN = 0, datetime TimeCordinateTwoIN = 0, double PriceCordinateTwoIN = 0,
                           const ENUM_BASE_CORNER Corner = CORNER_RIGHT_LOWER, bool Background = false,
                           color DescColorIN = clrYellow, const ENUM_LINE_STYLE Style = STYLE_DOT,
                           const int FontSize = 7, const string Font = "Arial")// UseCycles
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_LinesCycles Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          datetime      TimeCordinateOne;
          datetime      TimeCordinateTwo;
          double        PriceCordinateOne;
          double        PriceCordinateTwo;
          datetime      TimeCordinateMid;
          double        PriceCordinateMid;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_LinesCycles Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          int HighestBar = iHighest(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT,  MODE_HIGH, Count = 200, Start);
          int LowestBar = iLowest(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, MODE_LOW, Count = 200, Start);
//HighestBar = 0;
          TimeCordinateOne = iTime(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, HighestBar); // Time[50];
          TimeCordinateTwo = iTime(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, LowestBar); // Time[50];
// Alert(PriceCordinateTwo,"-Line:",__LINE__);
          PriceCordinateOne = High[HighestBar];
          PriceCordinateTwo = Low[LowestBar];
//================================================
          GradientPositive       = TimeCordinateOne > TimeCordinateTwo;
          GradientNegative       = TimeCordinateOne < TimeCordinateTwo;
//================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_LinesCycles Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          if(PriceCordinateOne > PriceCordinateTwo && 0)
          {         LowestBar = iLowest(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, MODE_LOW, Count = 200, Start);
                    PriceCordinateTwo = Low[LowestBar];//
          }
          DiffDictanceCycle = (int)MathAbs(LowestBar - HighestBar);
          int MoveX = DiffDictanceCycle * 3;
//Alert("MoveX: ", MoveX, "--Bars: ", Bars);
          if(MoveX > Bars)MoveX = (int)(DiffDictanceCycle * 0.5);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_LinesCycles Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          if(GradientPositive)//back uper
          {         ///reverse mode
                    {         // Alert(PriceCordinateTwo,"-Line:",__LINE__);
                              // PriceCordinateTwo = Low[LowestBar];//
                              TimeCordinateOne    = iTime(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, LowestBar + MoveX); // Time[50];
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_LinesCycles Error",  __LINE__, __FUNCTION__); //|
                              //=========================================================|
                              TimeCordinateTwo    = iTime(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, HighestBar + MoveX); // Time[50];
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_LinesCycles Error",  __LINE__, __FUNCTION__); //|
                              //=========================================================|
                              PriceCordinateOne   = Low[LowestBar]; //
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_LinesCycles Error",  __LINE__, __FUNCTION__); //|
                              //=========================================================|
                              PriceCordinateTwo   = High[HighestBar]; //
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_LinesCycles Error",  __LINE__, __FUNCTION__); //|
                              //=========================================================|
                    } //
          }
          else if(GradientNegative)//back uper
          {         ///reverse mode
                    {         // Alert(PriceCordinateTwo",-Line:",__LINE__);
                              TimeCordinateOne    = iTime(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, HighestBar + MoveX); // Time[50];LowestBar
                              TimeCordinateTwo    = iTime(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, LowestBar + MoveX); // Time[50];HighestBar
                              PriceCordinateOne   =  High[HighestBar];
                              PriceCordinateTwo   =  Low[LowestBar];//
                    }//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_LinesCycles Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          TimeCordinateMid = (TimeCordinateOne + TimeCordinateTwo) / 2;
          PriceCordinateMid = (PriceCordinateOne + PriceCordinateTwo) / 2;
//=================================================================================
          PriceCordinateOne_ = PriceCordinateOne;
          TimeCordinateOne_ = TimeCordinateOne;
          PriceCordinateTwo_ = PriceCordinateTwo;
          TimeCordinateTwo_ = TimeCordinateTwo;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_LinesCycles Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          if(ObjectFind(ChartData_ChartInfo.ID, Cycles_Name) >= 0 && Is_Move )
          {         int CordinateXone = 0; int  CordinateYone = 0;
                    int CordinateXtwo = 0; int  CordinateYtwo = 0;
                    Dev_Chart_Window.TimePrice_To_XY(TimeCordinateOne, PriceCordinateOne, CordinateXone, CordinateYone);
                    Dev_Chart_Window.TimePrice_To_XY(TimeCordinateTwo, PriceCordinateTwo, CordinateXtwo, CordinateYtwo);
                    ObjectSetInteger(0, Cycles_Name, OBJPROP_XDISTANCE, CordinateXone);//Label_.X_Distance(XCordinate);
                    ObjectSetInteger(0, Cycles_Name, OBJPROP_YDISTANCE, CordinateYone);////Label_.Y_Distance(YCordinate); //
                    ObjectSetInteger(0, Cycles_Name, OBJPROP_XDISTANCE, CordinateXtwo);//Label_.X_Distance(XCordinate);
                    ObjectSetInteger(0, Cycles_Name, OBJPROP_YDISTANCE, CordinateYtwo);////Label_.Y_Distance(YCordinate); //
                    return true;//
          }
          if(ObjectFind(ChartData_ChartInfo.ID, Cycles_Name) >= 0 && !Is_Create) {return ObjectDelete(ChartData_ChartInfo.ID, Cycles_Name);}
          if(Is_Create)
          {         if( ObjectFind(ChartData_ChartInfo.ID, Cycles_Name) < 0)
                              if(! GAC.Create(ChartData_ChartInfo.ID, Cycles_Name, ChartData_ChartInfo.SubWindow, TimeCordinateOne, PriceCordinateOne, TimeCordinateTwo, PriceCordinateTwo))
                                        ________________________________________________________Xerorr.SuperviserX(_LastError, "C_LinesCycles Error",  __LINE__, __FUNCTION__); //|
                    if(ObjectFind(ChartData_ChartInfo.ID, Cycles_Name) >= 0)
                    {         GAC.Color(DescColorIN);
                              GAC.Width(1);
                              GAC.SetInteger(OBJPROP_STYLE, 3);
                              GAC.Style(Style);
                              GAC.Description(Description);
                              GAC.Selectable(false);
                              GAC.Z_Order(1);
                              GAC.Background(Background); //
                    }//
                    return true;//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_LinesCycles Error",  __LINE__, __FUNCTION__); //|
          return false;//
}
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
