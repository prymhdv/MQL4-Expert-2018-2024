//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\_COBF_.mqh>
struct S_TRENDBYANGLE: public _COBF_
{         //============================================================================================================
          void                  S_TRENDBYANGLE() {TYPE_O_00 = OBJ_TRENDBYANGLE;}; // {Point2XY(0, 0, 0, 0);};    //S_HLINE.PointTime.TIME1==0  S_HLINE.PointTime.PRICE1==0  S_HLINE.PointTime.TIME2==0   S_HLINE.PointTime.PRICE2==0
          S_point               Point2XY;                                                        //S_HLINE.PointTime.TIME1==0  S_HLINE.PointTime.PRICE1==0
          ////----------------------------------
          //color                 COLOR;                        //Color                           color
          //ENUM_LINE_STYLE       STYLE;                        //Style                           ENUM_LINE_STYLE
          //int                   WIDTH;                        //Line thickness                  int
          ////----------------------------------
          //bool                  RAY_RIGHT;                 //Ray goes to the right           bool
          //double                ANGLE;                          //Angle.  For the objects with no angle specified, created from a program, the value is equal to EMPTY_VALUE      double
          bool     Is_Bulish;
          //////----------------------------------

          bool Set_Angel(double a) {  ANGLE_8 = a;      return true;}
          bool  Calc_Locations(ENUM_TIMEFRAMES f, int AddBar, int StartBar )
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
          bool Set_Location_4(datetime Time_1, double price_1, datetime Time_2, double price_2)
          {         //if(IsCreated)return false;
                    this.TIME1          /*= FRAME.TIME1    */       = Time_1;
                    this.PRICE1         /*= FRAME.PRICE1   */       = price_1;
                    this.TIME2          /*= FRAME.TIME2   */        = Time_2;
                    this.PRICE2         /*= FRAME.PRICE2  */        = price_2;
                    return IS_Set_Location_5_52 = true; //
          }
          bool Set_Tip_2(ENUM_LINE_STYLE style_9, int width_10)
          {         //if(IsCreated)return false;
                    this.STYLE_9                 /*= FRAME.STYLE  */        = style_9;;
                    this.WIDTH_10               /* = FRAME.WIDTH   */       = width_10;
                    //
                    return true;//
          };//
          bool Set_Chart_6(long timeframe_41 = 0, string symbol_42 = "", datetime createtime_43 = 0, ENUM_OBJECT typr_44 = 0, long chart_45 = 0, int subwindow_46 = 0)
          {         //if(IsCreated)return false;
                    TIMEFRAMES_O_00               /*= FRAME.TIMEFRAMES*/      = Period();
                    SYMBOL_O_00                   /*= FRAME.SYMBOL*/          = Symbol();
                    CREATETIME_O_00               /*= FRAME.CREATETIME*/      = TimeLocal();
                    TYPE_O_00                     /*= FRAME.TYPE*/            = OBJ_TRENDBYANGLE;
                    CHART_O_00                    /*= FRAME.CHART*/           = ChartData_ChartInfo.ID;
                    SUBWINDOW_O_00                /*= FRAME.SUBWINDOW*/       = ChartData_ChartInfo.SubWindow;
                    //
                    return IS_Set_Chart_6_55 = true; //
          };
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
                    ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_COLOR, this.COLOR_C_00);
                    ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_STYLE, this.STYLE_9);
                    ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_WIDTH, this.WIDTH_10);
                    //
                    if(  this.TYPE_O_00 == OBJ_TRENDBYANGLE)
                    {         ObjectSetInteger        (ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_TIME1,    this.TIME1);
                              ObjectSetDouble         (ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_PRICE1,   this.PRICE1);
                              ObjectSetInteger        (ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_TIME2,    this.TIME2);
                              ObjectSetDouble         (ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_PRICE2,   this.PRICE2); //
                              ObjectSetDouble         (ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_ANGLE,    this.ANGLE_8);
                              ObjectSetInteger        (ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_RAY_RIGHT, this.RAY_RIGHT_11);
                              //ObjectSetInteger        (ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_TIME1,    this.TIME1);
                              //ObjectSetDouble         (ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_PRICE1,   this.PRICE1);
                              //ObjectSetInteger        (ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_TIME2,    this.TIME2 = 0);
                              //ObjectSetDouble         (ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_PRICE2,   this.PRICE2 = 0); //
                           
                    }
                    //
                    return true;//
          };

          //
          //============================================================================================================
          //OBJECT.Color(COLOR); //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_COLOR, COLOR);
          //OBJECT.Style(STYLE); //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_STYLE, STYLE);
          //OBJECT.Width(WIDTH); //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_WIDTH, WIDTH);
          ////----------------------------------
          //OBJECT.RayRight(RAY_RIGHT);   /*ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_RAY_RIGHT, RAY_RIGHT);*/
          //OBJECT.Angle(ANGLE); /*ObjectSetDouble(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_ANGLE, ANGLE);*/
          ////----------------------------------
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_BACK, BACK);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_SELECTABLE, SELECTABLE);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_SELECTED, SELECTED);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_HIDDEN, HIDDEN);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_ZORDER, ZORDER);
          //ObjectSetString(ChartData_ChartInfo.ID,  OBJ.CName, OBJPROP_TOOLTIP, TOOLTIP);//
          //============================================================================================================
};
//+------------------------------------------------------------------+
