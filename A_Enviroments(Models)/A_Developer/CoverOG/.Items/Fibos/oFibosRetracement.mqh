//+------------------------------------------------------------------+
//|                                              FiboRetracement.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\_COBF_.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\__COBFA__.mqh>
#define Retracement_DEF_tooltip "Retracement"
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+

struct S_FIBO_RETRACEMENT: public _COBF_
{         //============================================================================================================
          //void                  S_FIBO_RETRACEMENT() {TYPE_O_00 = OBJ_FIBO;}; // {Point2XY(0, 0, 0, 0);}; //S_HLINE.PointTime.TIME1==0  S_HLINE.PointTime.PRICE1==0  S_HLINE.PointTime.TIME2==0   S_HLINE.PointTime.PRICE2==0
          S_point               Point2XY;                                                 //S_HLINE.PointTime.TIME1==0  S_HLINE.PointTime.PRICE1==0
          S_Level               Levels;
          ////----------------------------------
          //color                 COLOR;                        //Color                           color
          //ENUM_LINE_STYLE       STYLE;                        //Style                           ENUM_LINE_STYLE
          //int                   WIDTH;                        //Line thickness                  int
          bool                  Is_Level_Full;
          int                   levels;            // number of level lines
          double                values[];        // values of level lines
          color                 colors[];       // color of level lines
          ENUM_LINE_STYLE       styles[];        // style of level lines
          int                   widths[];         // width of level lines
          void S_FIBO_RETRACEMENT()
          {         ArrayResize(values, 11, 0);
                    ArrayResize(colors, 11, 0);
                    ArrayResize(styles, 11, 0);
                    ArrayResize(widths, 11, 0);//
          }
          ////----------------------------------
          //bool                  RAY_RIGHT;                    //Ray goes to the right     bool
          ////----------------------------------
          bool                  Is_Bulish;
          bool                  Set_RayRight_1(bool rayRight)      {   RAY_RIGHT_11        = rayRight;     return true;}
          bool                  SetLevelsCount(int l)           {   levels              = l;            return true;}
          bool                  SetLevelsFull(bool l)           {   Is_Level_Full       = l;            return true;}
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
          //--- FiboLevelsSet
          bool                  CalcLevels()
          {         //---
                    //--- successful execution
                    {         if(Is_Level_Full)
                              {         levels = 21;
                                        ArrayResize(values, levels, 0 );
                                        ArrayResize(colors, levels, 0 );
                                        ArrayResize(styles, levels, 0 );
                                        ArrayResize(widths, levels, 0 ); //
                                        values[0] =          0.0;
                                        values[1] =          0.382;
                                        values[2] =          0.618;
                                        values[3] =          0.782;
                                        values[4] =          1.0;
                                        values[5] =          1.382;
                                        values[6] =          1.618;
                                        values[7] =          2.382;
                                        values[8] =          2.618;
                                        values[9] =          3.382;
                                        values[10] =         3.618;
                                        //--
                                        values[11] =         -0.382;
                                        values[12] =         -0.618;
                                        values[13] =         -0.782;
                                        values[14] =         -1.0;
                                        values[15] =         -1.382;
                                        values[16] =         -1.618;
                                        values[17] =         -2.382;
                                        values[18] =         -2.618;
                                        values[19] =         -3.382;
                                        values[20] =         -3.618; //
                              } //
                              else
                              {         levels = 15;
                                        ArrayResize(values, levels, 0 );
                                        ArrayResize(colors, levels, 0 );
                                        ArrayResize(styles, levels, 0 );
                                        ArrayResize(widths, levels, 0 ); //
                                        values[0] =          0.0;
                                        values[1] =          0.382;
                                        values[2] =          0.618;
                                        values[3] =          0.782;
                                        values[4] =          1.0;
                                        values[5] =          1.618;
                                        values[6] =          2.618;
                                        values[7] =          3.618;
                                        //--
                                        values[8] =         -0.382;
                                        values[9] =         -0.618;
                                        values[10] =        -0.782;
                                        values[11] =        -1.0;
                                        values[12] =        -1.618;
                                        values[13] =        -2.618;
                                        values[14] =        -3.618; //
                              }
                              //--- set the number of levels
                              ObjectSetInteger(ChartData_ChartInfo.ID, NAME_A_01, OBJPROP_LEVELS, levels);
                              //--- set the properties of levels in the loop
                              for(int i = 0; i < levels; i++)
                              {         string Desc = DoubleToString(100 * values[i], 1) + "  %$";
                                        colors[i] = clrYellowGreen;     // color of level lines
                                        styles[i] = STYLE_DASH;      // style of level lines
                                        widths[i] = 1;       // width of level lines
                                        ObjectSetDouble (ChartData_ChartInfo.ID, NAME_A_01, OBJPROP_LEVELVALUE, i, values[i]);  //--- level value
                                        ObjectSetInteger(ChartData_ChartInfo.ID, NAME_A_01, OBJPROP_LEVELCOLOR, i, colors[i]); //--- level color
                                        ObjectSetInteger(ChartData_ChartInfo.ID, NAME_A_01, OBJPROP_LEVELSTYLE, i, styles[i]); //--- level style
                                        ObjectSetInteger(ChartData_ChartInfo.ID, NAME_A_01, OBJPROP_LEVELWIDTH, i, widths[i]); //--- level width
                                        ObjectSetString (ChartData_ChartInfo.ID, NAME_A_01, OBJPROP_LEVELTEXT,  i, Desc); //   //--- level description
                              }
                              //---
                              return true;//
                    }//
          }
          bool                  SetLevels() {return true;}
          bool                  Set_Chart_6(long timeframe_41 = 0, string symbol_42 = "", datetime createtime_43 = 0, ENUM_OBJECT typr_44 = 0, long chart_45 = 0, int subwindow_46 = 0)
          {         if(IsCreated)return false;
                    TIMEFRAMES_O_00               /*= FRAME.TIMEFRAMES*/      = Period();
                    SYMBOL_O_00                   /*= FRAME.SYMBOL*/          = Symbol();
                    CREATETIME_O_00               /*= FRAME.CREATETIME*/      = TimeLocal();
                    TYPE_O_00                     /*= FRAME.TYPE*/            = OBJ_FIBO;
                    CHART_O_00                    /*= FRAME.CHART*/           = ChartData_ChartInfo.ID;
                    SUBWINDOW_O_00                /*= FRAME.SUBWINDOW*/       = ChartData_ChartInfo.SubWindow;
                    //
                    return IS_Set_Chart_6_55 = true; //
          };
          bool Setup()
          {
                    {         //any type
                              ObjectSetInteger(ChartData_ChartInfo.ID, NAME_A_01, OBJPROP_BACK,         BACK_G_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, NAME_A_01, OBJPROP_SELECTABLE,   SELECTABLE_G_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, NAME_A_01, OBJPROP_SELECTED,     SELECTED_G_00);
                              //---off--- ObjectSetInteger(ChartData_ChartInfo.ID, NAME_A_01, OBJPROP_HIDDEN,       HIDDEN_G_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, NAME_A_01, OBJPROP_ZORDER,       ZORDER_G_00);
                              ObjectSetString( ChartData_ChartInfo.ID, NAME_A_01, OBJPROP_TOOLTIP,      TOOLTIP_G_00);//
                    }
                    {         //any type
                              //---off---  go.GAC.Background(go.GDS.BACK_G_00);          //ObjectSetInteger(ChartData_ChartInfo.ID, NAME, OBJPROP_BACK, BACK);
                              //---off---  go.GAC.Selectable(go.GDS.SELECTABLE_G_00);    //ObjectSetInteger(ChartData_ChartInfo.ID, NAME, OBJPROP_SELECTABLE, SELECTABLE);
                              //---off---  go.GAC.Selected(go.GDS.SELECTED_G_00);        //ObjectSetInteger(ChartData_ChartInfo.ID, NAME, OBJPROP_SELECTED, SELECTED);
                              //---off---  go.GAC.Hidden(go.GDS.HIDDEN_G_00);            //ObjectSetInteger(ChartData_ChartInfo.ID, NAME, OBJPROP_HIDDEN, HIDDEN);
                              //---off---  go.GAC.Z_Order(go.GDS.ZORDER_G_00);           //ObjectSetInteger(ChartData_ChartInfo.ID, NAME, OBJPROP_ZORDER, ZORDER);
                              //---off---  go.GAC.Tooltip(go.GDS.TOOLTIP_G_00);          //ObjectSetString(ChartData_ChartInfo.ID,  NAME, OBJPROP_TOOLTIP, TOOLTIP);//
                    }//
                    //---
                    {         //any type
                              ObjectSetInteger  (ChartData_ChartInfo.ID,  NAME_A_01, OBJPROP_COLOR,     COLOR_C_00);
                              ObjectSetInteger  (ChartData_ChartInfo.ID,  NAME_A_01, OBJPROP_STYLE,     STYLE_9);
                              ObjectSetInteger  (ChartData_ChartInfo.ID,  NAME_A_01, OBJPROP_WIDTH,     WIDTH_10);//
                              ObjectSetInteger  (ChartData_ChartInfo.ID,  NAME_A_01, OBJPROP_RAY_RIGHT, RAY_RIGHT_11);//
                    }
                    {         ObjectSetInteger  (ChartData_ChartInfo.ID, NAME_A_01, OBJPROP_TIME1,      TIME1);
                              ObjectSetDouble   (ChartData_ChartInfo.ID, NAME_A_01, OBJPROP_PRICE1,     PRICE1);
                              ObjectSetInteger  (ChartData_ChartInfo.ID, NAME_A_01, OBJPROP_TIME2,      TIME2);
                              ObjectSetDouble   (ChartData_ChartInfo.ID, NAME_A_01, OBJPROP_PRICE2,     PRICE2); //
                    }
                    CalcLevels();//
                    return true;//
          }
          //---

//============================================================================================================
//OBJECT.Color(COLOR);            //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_COLOR, COLOR);
//OBJECT.Style(STYLE);            //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_STYLE, STYLE);
//OBJECT.Width(Width);            //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_WIDTH, WIDTH);//
////----------------------------------
//OBJECT.RayRight(RAY_RIGHT);/*ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_RAY_RIGHT, RAY_RIGHT);*/
////----------------------------------
//ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_BACK, BACK);
//ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_SELECTABLE, SELECTABLE);
//ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_SELECTED, SELECTED);
//ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_HIDDEN, HIDDEN);
//ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_ZORDER, ZORDER);
//ObjectSetString(ChartData_ChartInfo.ID,  OBJ.CName, OBJPROP_TOOLTIP, TOOLTIP);//
//============================================================================================================
};
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\ChartObjects\ChartObjectsFibo.mqh>
struct St_Fibo_Retrace_data
{         double                         Price1;
          datetime                       Time1;
          double                         Price2;
          datetime                       Time2;
          double                         Price3;
          datetime                       Time3;//
          bool                           Is_Negative; //TimeCordinateOne > TimeCordinateTwo;
};

struct St_Fibo_Retrace
{         St_Fibo_Retrace_data          _CURRENT;
          St_Fibo_Retrace_data          _MN1;
          St_Fibo_Retrace_data          _W1;
          St_Fibo_Retrace_data          _D1;
          St_Fibo_Retrace_data          _H4;
          St_Fibo_Retrace_data          _H1;
          St_Fibo_Retrace_data          _M30;
          St_Fibo_Retrace_data          _M15;
          St_Fibo_Retrace_data          _M5;
          St_Fibo_Retrace_data          _M1;//
};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_FibosRetracement: public __COBFA__<S_FIBO_RETRACEMENT>
{
//===================================================================
private:
          string                        m_name;
          int                           m_index;
//===================================================================
public:
          void                          C_FibosRetracement() {};
          void                          ~C_FibosRetracement() {if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-C_FibosRetracement Error",  __LINE__, __FUNCTION__); }
//===================================================================CChartObjectFibo
          CChartObjectFibo             GAC;
          S_FIBO_RETRACEMENT           GDS;

          void                                  SetupSignal() {};
//===================================================================

//===================================================================
          bool                          Gradient;//       = TimeCordinateOne > TimeCordinateTwo;
          bool                          GradientNegative;//        = TimeCordinateOne < TimeCordinateTwo;
          //-------------
          double                        C_PriceCordinateOne;//   = PriceCordinateOne;
          datetime                      C_TimeCordinateOne;//    = TimeCordinateOne;
          double                        C_PriceCordinateTwo;//   = PriceCordinateTwo;
          datetime                      C_TimeCordinateTwo;//    = TimeCordinateTwo;
          double                        C_PriceCordinateThree;// = PriceCordinateThree;
          datetime                      C_TimeCordinateThree;//  = TimeCordinateThree;
          ///----------------------------------
          //case  PERIOD_CURRENT:           //
          //=================================================================ctd_GoldVIP_Signals_Periods.PeriodCurrent

          //=================================================================


          //---[---Fibos.FibosRetracement---]
          void  Draw_GDS(int WhichMode, bool IsKey, string n, int  AddBar, int StartBar, bool Is_Delete)
          {         GDS.Set_Action_2(WhichMode, IsKey);
                    GDS.Set_Desc_1("Fibos.Retracement" + n);
                    GDS.Set_Color_1(clrGreen);
                    GDS.Set_Model_3(STYLE_SOLID, 2, false);
                    GDS.Set_RayRight_1(false);
                    GDS.SetLevelsCount(9); //
                    GDS.SetLevelsFull(true);
                    GDS.Calc_Locations(PERIOD_CURRENT, AddBar, StartBar);
                    //---
                    GDS.Set_Common_6(false, 100, true, false, true, Retracement_DEF_tooltip + "Fibos.Retracement" + n);
                    GDS.Set_Chart_6();
                    GDS.Set_ToDelete_1(Is_Delete);
                    GDS.Set_Signal_1(true);
                    Action(this);//
          }
//===================================================================
          bool Create(bool Is_Create, bool Is_Move, const string Retracement_Name = "UseFibo", const string Description = "UseFiboDescription",
                      const bool Background = false, const bool Fill = false, const ENUM_LINE_STYLE style = STYLE_DASH, const int Width = 1,
                      color DescColorIN =  C'36, 52, 69', color DescColorNeg = clrRed,
                      const double Angle = 0, const int FontSize = 7, const string Font = "Arial");
//===================================================================
//===================================================================

};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_FibosRetracement::Create(bool Is_Create, bool Is_Move, const string Retracement_Name = "UseFibo", const string Description = "UseFiboDescription",
                                const bool Background = false, const bool Fill = false, const ENUM_LINE_STYLE style = STYLE_DASH, const int Width = 1,
                                color DescColorIN =  C'36, 52, 69', color DescColorNeg = clrRed,
                                const double Angle = 0, const int FontSize = 7, const string Font = "Arial")
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Fibo Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          int                           UseCount = 200;
          int                           UseStart = 0 ;
          int HighestBar = iHighest(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT,  MODE_HIGH, UseCount, UseStart);
          int LowestBar = iLowest(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, MODE_LOW, UseCount, UseStart);
          //HighestBar = 0;
          datetime TimeCordinateOne = iTime(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, HighestBar); // Time[50];
          datetime TimeCordinateTwo = iTime(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, LowestBar); // Time[50];
          // Alert(PriceCordinateTwo);
          double PriceCordinateOne = High[HighestBar];
          double PriceCordinateTwo = Low[LowestBar];
          Gradient = TimeCordinateOne > TimeCordinateTwo;
          if(PriceCordinateOne > PriceCordinateTwo)
          {         LowestBar = iLowest(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, MODE_LOW, UseCount = 200, UseStart);
                    PriceCordinateTwo = Low[LowestBar];//
          }
          if(ObjectFind(ChartData_ChartInfo.ID, Retracement_Name) >= 0 && Is_Move )
          {         int CordinateXone = 0; int  CordinateYone = 0;
                    int CordinateXtwo = 0; int  CordinateYtwo = 0;
                    Dev_Chart_Window.TimePrice_To_XY(TimeCordinateOne, PriceCordinateOne, CordinateXone, CordinateYone);
                    Dev_Chart_Window.TimePrice_To_XY(TimeCordinateTwo, PriceCordinateTwo, CordinateXtwo, CordinateYtwo);
                    ObjectSetInteger(0, Retracement_Name, OBJPROP_XDISTANCE, CordinateXone);//Label_.X_Distance(XCordinate);
                    ObjectSetInteger(0, Retracement_Name, OBJPROP_YDISTANCE, CordinateYone);////Label_.Y_Distance(YCordinate); //
                    return true;//
          }
          if(ObjectFind(ChartData_ChartInfo.ID, Retracement_Name) >= 0 && !Is_Create) {return ObjectDelete(ChartData_ChartInfo.ID, Retracement_Name);}
          //===========================
          if(ObjectFind(ChartData_ChartInfo.ID, Retracement_Name) < 0)
                    if(! GAC.Create(ChartData_ChartInfo.ID, Retracement_Name, ChartData_ChartInfo.SubWindow, TimeCordinateOne, PriceCordinateOne, TimeCordinateTwo, PriceCordinateTwo))Alert("-Line:", __LINE__);;
          if(ObjectFind(ChartData_ChartInfo.ID, Retracement_Name) >= 0)
          {         GAC.Color(DescColorIN);
                    GAC.Fill(false);
                    GAC.Z_Order(3);
                    GAC.SetInteger(OBJPROP_STYLE, 1);
                    GAC.Style(1);
                    GAC.Width(1);
                    GAC.Description(Description);
                    GAC.Selectable(false);
                    GAC.Z_Order(1);//
                    GAC.Background(Background);
                    Dev_Object.FiboService.FiboLeveler(GAC, Retracement_Name, Width, style, DescColorIN, DescColorNeg, Gradient) ; //
          }
          //
          //
          //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Fibo Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true; //
}

//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
