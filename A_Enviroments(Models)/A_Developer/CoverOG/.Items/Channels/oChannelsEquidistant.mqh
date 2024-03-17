//+------------------------------------------------------------------+
//|                                           ChannelEquidistant.mqh |
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
#define CHANNEL_DEF_tooltip       "tooltip_CHANNEL"
/*
  //---[---Channels.Equidistant---]
          {         Object_Pack.Channels.Equidistant.GDS.Set_Action_2(MODE_CREATE, true);
                    Object_Pack.Channels.Equidistant.GDS.Set_Desc_1("Channels.Equidistant");
                    Object_Pack.Channels.Equidistant.GDS.Set_Color_1(clrAqua);
                    Object_Pack.Channels.Equidistant.GDS.Set_Model_3(STYLE_SOLID, 3, false);
                    Object_Pack.Channels.Equidistant.GDS.Set_RayRight_1(false);
                    Object_Pack.Channels.Equidistant.GDS.Calc_Locations(PERIOD_CURRENT, 200, 0 + 600);
                    //---
                    Object_Pack.Channels.Equidistant.GDS.Set_Common_6(false, 100, false, false, true, CHANNEL_DEF_tooltip + "Channels.Equidistant");
                    Object_Pack.Channels.Equidistant.GDS.Set_Chart_6();
                    Object_Pack.Channels.Equidistant.Action(Object_Pack.Channels.Equidistant);//
          }//
*/
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\_COBF_.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\__COBFA__.mqh>
//---
struct S_EQUIDISTANT: public _COBF_
{         //============================================================================================================
          void                  S_EQUIDISTANT() {TYPE_O_00 = OBJ_CHANNEL;}; // {Point2XY(0, 0, 0, 0);};    //S_HLINE.PointTime.TIME1==0  S_HLINE.PointTime.PRICE1==0  S_HLINE.PointTime.TIME2==0   S_HLINE.PointTime.PRICE2==0
          void                  ~S_EQUIDISTANT(){};
          S_point                Point2XY;                                            //S_HLINE.PointTime.TIME1==0  S_HLINE.PointTime.PRICE1==0
          ////----------------------------------
          //color                 COLOR;                        //Color                           color
          //ENUM_LINE_STYLE       STYLE;                        //Style                           ENUM_LINE_STYLE
          //int                   WIDTH;                        //Line thickness                  int
          //bool                  RAY_RIGHT;                    //Ray goes to the right           bool
          ////----------------------------------

          bool                  Set_RayRight_1(bool rayRight) {   RAY_RIGHT_11 = rayRight; return true;}
          bool                  Is_Bulish;// = false;
          //////----------------------------------
          bool                  Calc_Locations(ENUM_TIMEFRAMES f, int AddBar, int StartBar )
          {         // if(IsCreated)return false;
                    datetime    Time1   = 0;
                    double      Price1  = 0;
                    datetime    Time2   = 0;
                    double      Price2  = 0;
                    datetime    Time3   = 0;
                    double      Price3  = 0;
                    Is_Bulish = false;
                    //---
                    {         int HighestBar            = iHighest(     StSymbol.Current, f, MODE_HIGH, AddBar, StartBar);    //-----600 ---800
                              int LowestBar             = iLowest(      StSymbol.Current, f, MODE_LOW,  AddBar, StartBar);
                              //---
                              Is_Bulish = LowestBar > HighestBar;
                              //---
                              if(Is_Bulish)
                              {         Time1                     = iTime(        StSymbol.Current, f, LowestBar); // Time[50];
                                        Price1                    = iLow(         StSymbol.Current, f, LowestBar);
                                        //---
                                        Price2                    = iHigh(        StSymbol.Current, f, HighestBar); //
                                        Time2                     = iTime(        StSymbol.Current, f, HighestBar); // Time[50];
                                        //---
                                        Time3                     = Time1; // Time[50];
                                        //Price3                  = iHigh(        StSymbol.Current, f, iHighest(     StSymbol.Current, f, MODE_HIGH, (HighestBar + LowestBar) / 2, LowestBar));//
                                        //Print("Is_Bulish: ", Is_Bulish, " LowestBar: ", LowestBar, " HighestBar: ", HighestBar, " AddBar: ", AddBar, " StartBar: ", StartBar, " _LastError", _LastError);
                                        //________________________________________________________Xerorr.SuperviserX(_LastError, "-C_RightMenuPad Error",  __LINE__, __FUNCTION__); //|
                                        int CiHighest             = iHighest(     StSymbol.Current, f, MODE_HIGH, LowestBar, (LowestBar + HighestBar) / 2);
                                        int CLowestBar            = iLowest(      StSymbol.Current, f, MODE_LOW,  LowestBar, (LowestBar + HighestBar) / 2);
                                        Price3                    = iHigh(        StSymbol.Current, f, CLowestBar ); //
                              }
                              else
                              {         Time1                     = iTime(        StSymbol.Current, f, HighestBar  ); // Time[50];
                                        Price1                    = iHigh(        StSymbol.Current, f, HighestBar);
                                        //---
                                        Time2                     = iTime(        StSymbol.Current, f, LowestBar); // Time[50];
                                        Price2                    = iLow(         StSymbol.Current, f, LowestBar); //
                                        //---
                                        Time3                     = Time1; // Time[50];
                                        //Price3                    = iLow(        StSymbol.Current, f, iLowest(     StSymbol.Current, f, MODE_LOW, (HighestBar + LowestBar) / 2, HighestBar)); //
                                        int CiHighest             = iHighest(     StSymbol.Current, f, MODE_HIGH,  HighestBar, (LowestBar + HighestBar) / 2);
                                        int CLowestBar            = iLowest(      StSymbol.Current, f, MODE_LOW,   HighestBar, (LowestBar + HighestBar) / 2);
                                        Price3                    = iLow(         StSymbol.Current, f, CiHighest ); //
                              }//
                    }//
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
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
          bool                  SetLocation(datetime Time1, double Price1, datetime Time2, double Price2, datetime Time3, double Price3)
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
          bool                  Set_Chart_6(long timeframe_41 = 0, string symbol_42 = "", datetime createtime_43 = 0, ENUM_OBJECT typr_44 = 0, long chart_45 = 0, int subwindow_46 = 0)
          {         if(IsCreated)return false;
                    TIMEFRAMES_O_00               /*= FRAME.TIMEFRAMES*/      = Period();
                    SYMBOL_O_00                   /*= FRAME.SYMBOL*/          = Symbol();
                    CREATETIME_O_00               /*= FRAME.CREATETIME*/      = TimeLocal();
                    TYPE_O_00                     /*= FRAME.TYPE*/            = OBJ_CHANNEL;
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
class C_ChannelsEquidistant: public __COBFA__<S_EQUIDISTANT>
{
//===================================================================
private:
//===================================================================
public:
          void                          C_ChannelsEquidistant() {};
          void                          ~C_ChannelsEquidistant() {};
//===================================================================
          CChartObjectChannel_MQL4           GAC;
          S_EQUIDISTANT                 GDS;

          void                          SetupSignal() {};
//===================================================================
          bool  Create(int                mode                    = MODE_CREATE,
                       bool               IsKey                  = false,
                       string             Equidistant_Name        = "Equidistant",
                       string             Description             = "Equidistant_Description",
                       int                XCordinate              = 10,
                       int                YCordinate              = 10,
                       int                XSize                   = 10,
                       int                YSize                   = 10,
                       ENUM_BASE_CORNER   Corner                  = CORNER_RIGHT_LOWER,
                       bool               Background              = false,
                       bool               Fill                    = false,
                       bool               RayRight                = false,
                       bool               RayLeft                 = false,
                       long               Style                   = 1, int Width = 1,
                       color              DescColorIN             = clrYellow,
                       double             Angle                   = 0);// Equidistant
//===================================================================
//===================================================================

//===================================================================

          void  Draw_GDS(int WhichMode, bool IsKey, string n, int AddBar, int StartBar, bool Is_Delete)
          {         //---[---Channels.Regression---]
                    {         GDS.Set_Action_2(WhichMode, IsKey);
                              GDS.Set_Desc_1("Channels.Equidistant" + n);
                              GDS.Set_Color_1(clrAqua);
                              GDS.Set_Model_3(STYLE_SOLID, 3, false);
                              GDS.Set_RayRight_1(false);
                              GDS.Calc_Locations(PERIOD_CURRENT, AddBar, StartBar);
                              //---
                              GDS.Set_Common_6(false, 100, true, false, true, CHANNEL_DEF_tooltip + "Channels.Equidistant" + n);
                              GDS.Set_Chart_6();
                              GDS.Set_ToDelete_1(Is_Delete);
                              GDS.Set_Signal_1(true);
                              Action(this);//
                    }//
          }//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_ChannelsEquidistant::Create(int                mode                    = MODE_CREATE,
                                   bool               IsKey                  = false,
                                   string             Equidistant_Name        = "Equidistant",
                                   string             Description             = "Equidistant_Description",
                                   int                XCordinate              = 10,
                                   int                YCordinate              = 10,
                                   int                XSize                   = 10,
                                   int                YSize                   = 10,
                                   ENUM_BASE_CORNER   Corner                  = CORNER_RIGHT_LOWER,
                                   bool               Background              = false,
                                   bool               Fill                    = false,
                                   bool               RayRight                = false,
                                   bool               RayLeft                 = false,
                                   long               Style                   = 1, int Width = 1,
                                   color              DescColorIN             = clrYellow,
                                   double             Angle                   = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Channel Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          if(mode == MODE_MOVE && IsKey && ObjectFind(ChartData_ChartInfo.ID, Equidistant_Name) >= 0  )
          {         ObjectSetInteger(0, Equidistant_Name, OBJPROP_XDISTANCE, XCordinate);//Label_.X_Distance(XCordinate);
                    ObjectSetInteger(0, Equidistant_Name, OBJPROP_YDISTANCE, YCordinate);////Label_.Y_Distance(YCordinate); //
                    return true;//
          }
          if(mode == MODE_CREATE  && !IsKey && ObjectFind(ChartData_ChartInfo.ID, Equidistant_Name) >= 0) {return ObjectDelete(ChartData_ChartInfo.ID, Equidistant_Name);}
          //  OBJ_CHANNEL
          if(mode == MODE_CREATE && IsKey && ObjectFind(ChartData_ChartInfo.ID, Equidistant_Name) < 0)
          {         if(!GAC.Create(ChartData_ChartInfo.ID, Equidistant_Name, ChartData_ChartInfo.SubWindow, Time[200], Close[200], Time[150], Close[150], Time[10], Close[10]))Alert("-Line:", __LINE__);
                    if(ObjectFind(ChartData_ChartInfo.ID, Equidistant_Name) >= 0)
                    {         GAC.Color(DescColorIN);
                              GAC.Fill(Fill);
                              GAC.RayRight(RayRight);
                              GAC.RayLeft(RayLeft);
                              GAC.Width(Width);
                              GAC.SetInteger(OBJPROP_STYLE, Style);//    Equidistant.Style(1);
                              GAC.Z_Order(1);//
                              GAC.Background(Background);
                              return true;///
                    }//
          }
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
