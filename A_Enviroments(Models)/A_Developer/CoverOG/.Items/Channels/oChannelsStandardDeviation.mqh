//+------------------------------------------------------------------+
//|                                     ChannelStandardDeviation.mqh |
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
#define STDDEVCHANNEL_DEF_tooltip       "tooltip_STDDEVCHANNEL"
/*
   //---[---Channels.StandardDeviation---]
          {         Object_Pack.Channels.StandardDeviation.GDS.Set_Action_2(MODE_CREATE, true);
                    Object_Pack.Channels.StandardDeviation.GDS.Set_Desc_1("Channels.StandardDeviation");
                    Object_Pack.Channels.StandardDeviation.GDS.Set_Color_1(clrYellow);
                    Object_Pack.Channels.StandardDeviation.GDS.Set_Model_3(STYLE_SOLID, 3, false);
                    Object_Pack.Channels.StandardDeviation.GDS.Set_RayRight_1(false);
                    Object_Pack.Channels.StandardDeviation.GDS.Set_Deviation_1(1.6);
                    Object_Pack.Channels.StandardDeviation.GDS.Calc_Locations(PERIOD_CURRENT, 200, 0 + 200);
                    //---
                    Object_Pack.Channels.StandardDeviation.GDS.Set_Common_6(false, 100, false, false, true, STDDEVCHANNEL_DEF_tooltip + "Channels.StandardDeviation");
                    Object_Pack.Channels.StandardDeviation.GDS.Set_Chart_6();
                    Object_Pack.Channels.StandardDeviation.Action(Object_Pack.Channels.StandardDeviation);//
          }//

*/
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\_COBF_.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\__COBFA__.mqh>
//---
struct S_STDDEVCHANNEL: public _COBF_
{         //============================================================================================================
          void                  S_STDDEVCHANNEL() {TYPE_O_00 = OBJ_STDDEVCHANNEL;}; // {Point2XY(0, 0, 0, 0);}; //S_HLINE.PointTime.TIME1==0  S_HLINE.PointTime.PRICE1==0  S_HLINE.PointTime.TIME2==0   S_HLINE.PointTime.PRICE2==0
          S_point                Point2XY;                                                       //S_HLINE.PointTime.TIME1==0  S_HLINE.PointTime.PRICE1==0
          ////----------------------------------
          //color                 COLOR;                        //Color                           color
          //ENUM_LINE_STYLE       STYLE;                        //Style                           ENUM_LINE_STYLE
          //int                   WIDTH;                        //Line thickness                  int
          //bool                  RAY_RIGHT;                    //Ray goes to the right           bool
          ////----------------------------------
          //double                DEVIATION;     //Deviation for the Standard Deviation Channel     double
          bool                  Is_Bulish;// = false;
          //////----------------------------------
          bool                  Set_RayRight_1(bool rayRight) {   RAY_RIGHT_11 = rayRight; return true;}
          bool                  Set_Deviation_1(double Deviation) {   DEVIATION = Deviation; return true;}

          //////----------------------------------
          bool                  Calc_Locations(ENUM_TIMEFRAMES f, int AddBar, int StartBar )
          {         if(IsCreated)return false;
                    TIME1   = iTime(Symbol(), f, StartBar);
                    PRICE1  = iClose(Symbol(), f, StartBar);
                    TIME2   = iTime(Symbol(), f, AddBar);
                    PRICE2  = iClose(Symbol(), f, StartBar);
                    //---
                    return true; //
          }

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
                    TYPE_O_00                     /*= FRAME.TYPE*/            = OBJ_STDDEVCHANNEL;
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
          //////----------------------------------
          //OBJECT.Deviations(DEVIATION);/*ObjectSetDouble(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_DEVIATION, DEVIATION);*/
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
class C_ChannelsStandardDeviation: public __COBFA__<S_STDDEVCHANNEL>
{
//===================================================================
private:
//===================================================================
public:
          void                          C_ChannelsStandardDeviation() {};
          void                          ~C_ChannelsStandardDeviation() {};
//===================================================================
          CChartObjectStdDevChannel_MQL4     GAC;
          S_STDDEVCHANNEL               GDS;

          void                          SetupSignal() {}
//===================================================================
          bool          Create(bool Is_Create, bool Is_Move,
                               const string StandardDeviation_Name = "StandardDeviation", const string Description = "StandardDeviation_Description", const int XCordinate = 10,
                               const int YCordinate = 10, const int XSize = 10, const int YSize = 10,
                               const ENUM_BASE_CORNER Corner = CORNER_RIGHT_LOWER, bool Background = false,
                               bool Fill = false, bool RayRight = false, bool RayLeft = false, long Style = 1, int Width = 1,  color  DescColorIN = clrYellow, const double Angle = 0);// StandardDeviation
//===================================================================
//===================================================================

//===================================================================

          void  Draw_GDS(int WhichMode, bool IsKey, string n, ENUM_TIMEFRAMES f, double d, int AddBar, int StartBar, int w, bool r, color c, ENUM_LINE_STYLE s, bool Is_Delete)
          {         //---[---Channels.Regression---]
                    if(!ct_Drive.TDD.ct_Configs.IsShow_CHSD_Shapes&&Initer.IsBasic_Done) {IsKey = false;}
                    //-----------------------------------------------------------------------------------
                    {         GDS.Set_Action_2(WhichMode, IsKey);
                              GDS.Set_Desc_1("Channels.StandardDeviation" + n);
                              GDS.Set_Color_1(c);
                              GDS.Set_Model_3(s, w, false);//STYLE_SOLID
                              GDS.Set_RayRight_1(r);
                              GDS.Set_Deviation_1(d);//1.6
                              GDS.Calc_Locations(f, AddBar, StartBar);
                              //---
                              GDS.Set_Common_6(false, 100, true, false, true, STDDEVCHANNEL_DEF_tooltip + "Channels.StandardDeviation" + n); //FILL not work with this
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
bool C_ChannelsStandardDeviation::Create(bool Is_Create, bool Is_Move, const string StandardDeviation_Name = "StandardDeviation", const string Description = "StandardDeviation_Description", const int XCordinate = 10,
                    const int YCordinate = 10, const int XSize = 10, const int YSize = 10,
                    const ENUM_BASE_CORNER Corner = CORNER_RIGHT_LOWER, bool Background = false,
                    bool Fill = false, bool RayRight = false, bool RayLeft = false, long Style = 1, int Width = 1,  color  DescColorIN = clrYellow, const double Angle = 0)// StandardDeviation
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Channel Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          if(ObjectFind(ChartData_ChartInfo.ID, StandardDeviation_Name) >= 0 && Is_Move )
          {         ObjectSetInteger(0, StandardDeviation_Name, OBJPROP_XDISTANCE, XCordinate);//Label_.X_Distance(XCordinate);
                    ObjectSetInteger(0, StandardDeviation_Name, OBJPROP_YDISTANCE, YCordinate);////Label_.Y_Distance(YCordinate); //
                    return true;//
          }
          if(ObjectFind(ChartData_ChartInfo.ID, StandardDeviation_Name) >= 0 && !Is_Create) {return ObjectDelete(ChartData_ChartInfo.ID, StandardDeviation_Name);}
          if(ObjectFind(ChartData_ChartInfo.ID, StandardDeviation_Name) < 0)
                    if(!GAC.Create(ChartData_ChartInfo.ID, StandardDeviation_Name, ChartData_ChartInfo.SubWindow, Time[200], Time[10], 0.618 ))Alert("-Line:", __LINE__);
          if(ObjectFind(ChartData_ChartInfo.ID, StandardDeviation_Name) >= 0)
          {         GAC.Color(clrGainsboro);
                    GAC.Fill(Fill);
                    GAC.RayRight(RayRight);
                    GAC.RayLeft(RayLeft);
                    GAC.Width(Width);
                    GAC.SetInteger(OBJPROP_STYLE, Style);   // StandardDeviation.Style(2)
                    GAC.Z_Order(1);
                    GAC.Background( Background );
                    GAC.Deviations(0.61);
                    //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Channel Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
