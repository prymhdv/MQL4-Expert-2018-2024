//+------------------------------------------------------------------+
//|                                           C_ChannelsPitchfork.mqh |
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
#define PITCHFORK_DEF_tooltip       "tooltip_PITCHFORK"
/*
  //---[---Channels.Pitchfork---]
          {         Object_Pack.Channels.Pitchfork.GDS.Set_Action_2(MODE_CREATE, true);
                    Object_Pack.Channels.Pitchfork.GDS.Set_Desc_1("Channels.Pitchfork");
                    Object_Pack.Channels.Pitchfork.GDS.Set_Color_1(clrYellowGreen);
                    Object_Pack.Channels.Pitchfork.GDS.Set_Model_3(STYLE_SOLID, 3, false);
                    Object_Pack.Channels.Pitchfork.GDS.Set_RayRight_1(false);
                    Object_Pack.Channels.Pitchfork.GDS.Calc_Locations(PERIOD_CURRENT, 200, 0 + 400);
                    //---
                    Object_Pack.Channels.Pitchfork.GDS.Set_Common_6(false, 100, false, false, true, PITCHFORK_DEF_tooltip + "Channels.Pitchfork");
                    Object_Pack.Channels.Pitchfork.GDS.Set_Chart_6();
                    Object_Pack.Channels.Pitchfork.Action(Object_Pack.Channels.Pitchfork);//
          }//

*/
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\_COBF_.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\__COBFA__.mqh>
//---
struct S_PITCHFORK: public _COBF_
{         //============================================================================================================
          void                  S_PITCHFORK() {TYPE_O_00 = OBJ_PITCHFORK;}; // {Point3XYZ(0, 0, 0, 0, 0, 0);}; //S_HLINE.PointTime.TIME1==0  S_HLINE.PointTime.PRICE1==0  S_HLINE.PointTime.TIME2==0   S_HLINE.PointTime.PRICE2==0
          S_point                Point3XYZ;                                                 //S_HLINE.PointTime.TIME1==0  S_HLINE.PointTime.PRICE1==0
          ////----------------------------------
          //color                 COLOR;                        //Color                           color
          //ENUM_LINE_STYLE       STYLE;                        //Style                           ENUM_LINE_STYLE
          //int                   WIDTH;                        //Line thickness                  int
          //bool                  RAY_RIGHT;                    //Ray goes to the right           bool
          ////----------------------------------
          bool                  Is_Bulish;
          bool                  Set_RayRight_1(bool rayRight) {   RAY_RIGHT_11 = rayRight; return true;}
          //////----------------------------------
          bool                  Calc_Locations(ENUM_TIMEFRAMES f, int AddBar, int StartBar )
          {         if(IsCreated)return false;
                    datetime    Time1   = 0;
                    double      Price1  = 0;
                    datetime    Time2   = 0;
                    double      Price2  = 0;
                    datetime    Time3   = 0;
                    double      Price3  = 0;
                    Is_Bulish = false;
                    //---
                    {         int LowestBar             = iLowest(      StSymbol.Current, f, MODE_LOW, AddBar, StartBar);
                              int HighestBar            = iHighest(     StSymbol.Current, f, MODE_HIGH, AddBar, StartBar);
                              //---
                              //--
                              Is_Bulish = LowestBar > HighestBar;
                              // if (Time2 > Time3) Time2  = iTime(        StSymbol.Current, f, StartBar + 10 ); // MathAbs(HighestBar - LowestBar)
                              //---
                              if(Is_Bulish)
                              {         Time1                     = iTime(        StSymbol.Current, f, LowestBar); // Time[50];
                                        Time2                     = iTime(        StSymbol.Current, f, HighestBar  ); // Time[50];
                                        Price1                    = iLow(         StSymbol.Current, f, LowestBar); //
                                        Price2                    = iHigh(        StSymbol.Current, f, HighestBar); //
                              }
                              else
                              {         Time1                     = iTime(        StSymbol.Current, f, HighestBar); // Time[50];
                                        Time2                     = iTime(        StSymbol.Current, f, LowestBar  ); // Time[50];
                                        Price1                    = iHigh(        StSymbol.Current, f, HighestBar); //
                                        Price2                    = iLow(         StSymbol.Current, f, LowestBar); //
                              }
                              //---.................................................................................................
                              if(Is_Bulish)
                              {         int LowestBar3            = iLowest(      StSymbol.Current, f, MODE_LOW, HighestBar, 0);
                                        Price3                    = iLow(         StSymbol.Current, f, LowestBar3); //
                                        Time3                     = iTime(        StSymbol.Current, f, LowestBar3); // Time[50];
                              }
                              else
                              {         int HighestBar3           = iHighest(     StSymbol.Current, f, MODE_HIGH, LowestBar, 0);
                                        Price3                    = iHigh(        StSymbol.Current, f, HighestBar3); //
                                        Time3                     = iTime(        StSymbol.Current, f, HighestBar3); // Time[50];
                              }//
                    }
                    //---
                    TIME1       = Time1;                //0       datetime        Datetime value to set/get first coordinate time part
                    PRICE1      = Price1;               //1       double          Double value to set/get first coordinate price part
                    TIME2       = Time2;                //2       datetime        Datetime value to set/get second coordinate time part
                    PRICE2      = Price2;               //3       double          Double value to set/get second coordinate price part
                    //--- OBJ_TRIANGLE && OBJ_TRIANGLE && OBJ_ELLIPSE
                    TIME3       = Time3;
                    PRICE3      = Price3;
                    //---
                    return true; //
          }

          bool  SetLocation(datetime Time1, double Price1, datetime Time2, double Price2, datetime Time3, double Price3)
          {         if(IsCreated)return false;
                    TIME1       = Time1;                //0       datetime        Datetime value to set/get first coordinate time part
                    PRICE1      = Price1;               //1       double          Double value to set/get first coordinate price part
                    TIME2       = Time2;                //2       datetime        Datetime value to set/get second coordinate time part
                    PRICE2      = Price2;               //3       double          Double value to set/get second coordinate price part
                    //--- OBJ_TRIANGLE && OBJ_TRIANGLE && OBJ_ELLIPSE
                    TIME3       = Time3;
                    PRICE3      = Price3;
                    return true; };
          //---
          bool  Set_Chart_6(long timeframe_41 = 0, string symbol_42 = "", datetime createtime_43 = 0, ENUM_OBJECT typr_44 = 0, long chart_45 = 0, int subwindow_46 = 0)
          {         if(IsCreated)return false;
                    TIMEFRAMES_O_00               /*= FRAME.TIMEFRAMES*/      = Period();
                    SYMBOL_O_00                   /*= FRAME.SYMBOL*/          = Symbol();
                    CREATETIME_O_00               /*= FRAME.CREATETIME*/      = TimeLocal();
                    TYPE_O_00                     /*= FRAME.TYPE*/            = OBJ_PITCHFORK;
                    CHART_O_00                    /*= FRAME.CHART*/           = ChartData_ChartInfo.ID;
                    SUBWINDOW_O_00                /*= FRAME.SUBWINDOW*/       = ChartData_ChartInfo.SubWindow;
                    //
                    return IS_Set_Chart_6_55 = true; //
          };

          //============================================================================================================
          //OBJECT.Color(COLOR);                      //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_COLOR, COLOR);
          //OBJECT.Style(STYLE);                      //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_STYLE, STYLE);
          //OBJECT.Width(WIDTH);                      //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_WIDTH, WIDTH);//
          //OBJECT.RayRight(RAY_RIGHT);               //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_RAY_RIGHT, RAY_RIGHT);//
          ////----------------------------------
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_BACK, BACK);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_SELECTABLE, SELECTABLE);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_SELECTED, SELECTED);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_HIDDEN, HIDDEN);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_ZORDER, ZORDER);
          //ObjectSetString(ChartData_ChartInfo.ID,  OBJ.CName, OBJPROP_TOOLTIP, TOOLTIP);//
          //============================================================================================================
};
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\ChartObjects\ChartObjectsChannels.mqh>

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_ChannelsPitchfork: public __COBFA__<S_PITCHFORK> 
{
//===================================================================
private:
//===================================================================
public:
          void                  C_ChannelsPitchfork() {};
          void                  ~C_ChannelsPitchfork() {};
//===================================================================
          bool  Create(bool                 Is_Create,
                       bool                 Is_Move,
                       string               Pitchfork_Name  = "Pitchfork",
                       string               Description     = "PitchforkDescription",
                       int                  XCordinate      = 10,
                       int                  YCordinate      = 10,
                       int                  XSize           = 10,
                       int                  YSize           = 10,
                       ENUM_BASE_CORNER     Corner          = CORNER_RIGHT_LOWER,
                       bool                 Fill            = false,
                       bool                 RayRight        = false,
                       bool                 RayLeft         = false,
                       ENUM_LINE_STYLE      Style           = 1,
                       int                  Width           = 1,
                       color                DescColorIN     = clrYellow,
                       double               Angle           = 0);
//===================================================================
          CChartObjectPitchfork_MQL4 GAC;
          S_PITCHFORK           GDS;
       
          void                  SetupSignal() {};
//===================================================================

          void  Draw_GDS(int WhichMode , bool IsKey ,string n, int AddBar, int StartBar, bool Is_Delete)
          {         //---[---Channels.Regression---]
                    {         GDS.Set_Action_2(WhichMode, IsKey);
                              GDS.Set_Desc_1("Channels.Pitchfork" + n);
                              GDS.Set_Color_1(clrYellowGreen);
                              GDS.Set_Model_3(STYLE_SOLID, 1, false);
                              GDS.Set_RayRight_1(false);
                              GDS.Calc_Locations(PERIOD_CURRENT, AddBar, StartBar);
                              //---
                              GDS.Set_Common_6(false, 2, false, false, true, PITCHFORK_DEF_tooltip + "Channels.Pitchfork" + n);
                              GDS.Set_Chart_6();
                              GDS.Set_ToDelete_1(Is_Delete);
                              GDS.Set_Signal_1(true);
                              Action(this);//
                              //
                    }//
          }
//===================================================================

};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_ChannelsPitchfork::Create(bool                 Is_Create,
                                 bool                 Is_Move,
                                 string               Pitchfork_Name  = "Pitchfork",
                                 string               Description     = "PitchforkDescription",
                                 int                  XCordinate      = 10,
                                 int                  YCordinate      = 10,
                                 int                  XSize           = 10,
                                 int                  YSize           = 10,
                                 ENUM_BASE_CORNER     Corner          = CORNER_RIGHT_LOWER,
                                 bool                 Fill            = false,
                                 bool                 RayRight        = false,
                                 bool                 RayLeft         = false,
                                 ENUM_LINE_STYLE      Style           = 1,
                                 int                  Width           = 1,
                                 color                DescColorIN     = clrYellow,
                                 double               Angle           = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Channel Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          color BackColorIN = C'36, 52, 69';
          color BorderColorIN = clrGray;//
          const int FontSize = 7;
          const string Font = "Arial";
          int AddBar, StartBar = 0;
          //---------
          int HighestBar = iHighest(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT,   MODE_HIGH, AddBar = 500, StartBar);
          int LowestBar = iLowest(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT,  MODE_LOW, AddBar = 500, StartBar);
//HighestBar = 0;
          int MeanBar = (HighestBar + LowestBar) / 2;
          if(false)
          {         if(HighestBar)MeanBar = (HighestBar + LowestBar) / 2;
                    else MeanBar = (HighestBar + LowestBar) / 2; }
          datetime TimeCordinateOne = iTime(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, HighestBar); // Time[50];
          datetime TimeCordinateTwo = iTime(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, LowestBar); // Time[50];
          datetime TimeCordinateMean = iTime(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, MeanBar + HighestBar + LowestBar); // Time[50];
// Alert(PriceCordinateTwo,"-Line:",__LINE__);
          double PriceCordinateOne = High[HighestBar];
          double PriceCordinateTwo = Low[LowestBar];
          double PriceCordinateMean = Close[(HighestBar + LowestBar) / 2];
//===========================
          if(ObjectFind(ChartData_ChartInfo.ID, Pitchfork_Name) >= 0 && Is_Move )
          {         ObjectSetInteger(0, Pitchfork_Name, OBJPROP_XDISTANCE, XCordinate);//Label_.X_Distance(XCordinate);
                    ObjectSetInteger(0, Pitchfork_Name, OBJPROP_YDISTANCE, YCordinate);////Label_.Y_Distance(YCordinate); //
                    return true;//
          }
          if(ObjectFind(ChartData_ChartInfo.ID, Pitchfork_Name) >= 0 && !Is_Create) {return ObjectDelete(ChartData_ChartInfo.ID, Pitchfork_Name);}
//==========================================================
          if(ObjectFind(ChartData_ChartInfo.ID, Pitchfork_Name) < 0)
                    if(! GAC.Create(ChartData_ChartInfo.ID, Pitchfork_Name, ChartData_ChartInfo.SubWindow, TimeCordinateMean, PriceCordinateMean, TimeCordinateOne, PriceCordinateOne, TimeCordinateTwo, PriceCordinateTwo))
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Channel Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          if(ObjectFind(ChartData_ChartInfo.ID, Pitchfork_Name) >= 0)
          {         GAC.Description(Description );
                    GAC.RayRight(RayRight);
                    GAC.RayLeft(RayLeft);
                    GAC.Color(DescColorIN);
                    GAC.Fill(Fill);
                    GAC.Width(Width);
                    GAC.Style(Style); //UseLabel.SetInteger(OBJPROP_STYLE, 3);
                    // UseLabel.Angle(Angle + 5);
                    GAC.Selectable(false);
                    GAC.Z_Order(1); //
                    //
                    //________________________________________________________Xerorr.SuperviserX(_LastError,"-C_Channel Error",  __LINE__, __FUNCTION__);//
                    //Pitchfork.LevelsCount(2); Pitchfork.LevelStyle(3);
                    //________________________________________________________Xerorr.SuperviserX(_LastError,"-C_Channel Error",  __LINE__, __FUNCTION__);//
                    //Pitchfork.LevelValue(Bid * 0.02);
                    //________________________________________________________Xerorr.SuperviserX(_LastError,"-C_Channel Error",  __LINE__, __FUNCTION__);//
                    //Pitchfork.LevelWidth(2); Pitchfork.LevelDescription(2);
                    //________________________________________________________Xerorr.SuperviserX(_LastError,"-C_Channel Error",  __LINE__, __FUNCTION__);//
                    //Pitchfork.LevelColor(DescColorIN);
                    return true;//
          }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Channel Error",  __LINE__, __FUNCTION__); //|
          return false;//
//=========================================================|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
