//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
/*
                {
                Trend.GDS.Set_Action_2(WhichMode, IsKey);
                Trend.GDS.Set_Desc_1(  "Trend" +" " );
                Trend.GDS.Set_Location_4(datetime Time_1, double price_1, datetime Time_2, double price_2)
                Trend.GDS.Set_Color_1(clrRed);
                Trend.GDS.Set_Tip_2(STYLE_4,WIDTH_5);
                Trend.GDS.Set_Common_6(false, 10, false, false, false, "tooltip");
                Trend.GDS.Set_Chart_6();
                Trend.Action(Trend);//
                }
                {
                    GDS.Set_Action_2(MODE_CREATE, true);
                    GDS.Set_Desc_1("Lines.Trend "  + n);
                    GDS.Set_Location_4(t1, p1, t2, p2);
                    //GDS.Calc_Locations(PERIOD_CURRENT, AddBar, StartBar);
                    GDS.Set_Color_1(c);
                    GDS.Set_Tip_2(s, w, r); //STYLE_DOT
                    GDS.Set_Common_6(false, 10, true, false, true,  "Lines.Trend " + n);
                    GDS.Set_Chart_6();
                    GDS.Set_ToDelete_1(Is_Show);
                    GDS.Set_Signal_1(true);
                    Action(this);//

                }
*/
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\_COBF_.mqh>
struct S_TREND: public _COBF_
{         //============================================================================================================
          void                  S_TREND() {TYPE_O_00 = OBJ_TREND;}; // {Point2XY(0, 0, 0, 0);};   //S_HLINE.PointTime.TIME1==0  S_HLINE.PointTime.PRICE1==0  S_HLINE.PointTime.TIME2==0   S_HLINE.PointTime.PRICE2==0
          S_point                Point2XY;                                         //S_HLINE.PointTime.TIME1==0  S_HLINE.PointTime.PRICE1==0
          ////----------------------------------
          //color                 COLOR;                        //Color                           color
          //ENUM_LINE_STYLE       STYLE;                        //Style                           ENUM_LINE_STYLE
          //int                   WIDTH;                        //Line thickness                  int
          ////----------------------------------
          //bool                  RAY_RIGHT;                    //Ray goes to the right           bool
          //////----------------------------------
          bool          Is_Bulish;
          bool          Is_touchedLine;
          bool          Is_Broken;
          int           i_BarBrokn;
          bool          Cheak_Is_Broken;
          //---
          datetime      Time1;
          double        Price1;
          datetime      Time2;
          double        Price2;
          //---
          int           Bar1, Bar2;
          //============================================================================================================
          //OBJECT.Color(COLOR); //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_COLOR, COLOR);
          //OBJECT.Style(STYLE); //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_STYLE, STYLE);
          //OBJECT.Width(WIDTH); //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_WIDTH, WIDTH);
          ////----------------------------------
          //OBJECT.RayRight(RAY_RIGHT);   /*ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_RAY_RIGHT, RAY_RIGHT);*/
          ////----------------------------------
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_BACK, BACK);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_SELECTABLE, SELECTABLE);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_SELECTED, SELECTED);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_HIDDEN, HIDDEN);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_ZORDER, ZORDER);
          //ObjectSetString(ChartData_ChartInfo.ID,  OBJ.CName, OBJPROP_TOOLTIP, TOOLTIP);//
          //============================================================================================================
          void       Set_Check_IsBroken(bool IsBrokenCheack) { Cheak_Is_Broken = IsBrokenCheack; }
          bool       Calc_Locations(ENUM_TIMEFRAMES f, int AddBar, int StartBar )
          {         //if(IsCreated)return false;
                    //--reset
                    Time1       = 0;
                    Price1      = 0;
                    Time2       = 0;
                    Price2      = 0;
                    Is_Bulish = false;
                    //---
                    {         //--- find Lowest bar and Highest bar in range com
                              int LowestBar             = iLowest(      StSymbol.Current, f, MODE_LOW,  AddBar, StartBar);
                              int HighestBar            = iHighest(     StSymbol.Current, f, MODE_HIGH, AddBar, StartBar);
                              //---
                              //-- Defibe Bulish or Bearish
                              Is_Bulish = LowestBar > HighestBar;
                              // if (Time2 > Time3) Time2  = iTime(        StSymbol.Current, f, StartBar + 10 ); // MathAbs(HighestBar - LowestBar)
                              //---
                              //--- define cordinate one and two...
                              if(true)
                              {         if(Is_Bulish)
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
                                        Bar1                      = iBarShift(StSymbol.Current, f, Time1);
                                        Bar2                      = iBarShift(StSymbol.Current, f, Time2); //
                              }//
                              //---define cordinate 3 //---not work for tend line cordinate 3
                              //---define cordinate 2 again
                              if(true)
                              {         if(Is_Bulish)     //---support line
                                        {         int LowestBar2            = iLowest(      StSymbol.Current, f, MODE_LOW, HighestBar, 0);
                                                  Price2                    = iLow(         StSymbol.Current, f, LowestBar2); //
                                                  Time2                     = iTime(        StSymbol.Current, f, LowestBar2); // Time[50];
                                        }
                                        else              //---ressistance line
                                        {         int HighestBar2           = iHighest(     StSymbol.Current, f, MODE_HIGH, LowestBar, 0);
                                                  Price2                    = iHigh(        StSymbol.Current, f, HighestBar2); //
                                                  Time2                     = iTime(        StSymbol.Current, f, HighestBar2); // Time[50];
                                        }//
                              }
                              //---
                              //#Line never Touch bars   ObjectGetValueByShift("Lines.Trend " + "FiboExpantionTrendLine1", i); // bar index
                              //---Test is trend line broken forder? update cordinate 2 again
                              if(Cheak_Is_Broken)          //
                              {         Is_touchedLine = false;
                                        Is_Broken      = false;
                                        if(Is_Bulish)   //---support line
                                        {         for(int i = HighestBar; 0 < i; i--)
                                                  {         Is_Broken = Is_touchedLine  =       false;
                                                            double      LinePrice       =       ObjectGetValueByShift(NAME_A_01, i);
                                                            Is_Broken = Is_touchedLine  =       Low[i]  < LinePrice; // //---crossed line at that point
                                                            if(LinePrice == 0.0) {continue;} //---work well
                                                            if(Is_Broken)
                                                            {         Price2                    = iLow(         StSymbol.Current, f, i); //
                                                                      Time2                     = iTime(        StSymbol.Current, f, i); //
                                                                      break; //
                                                            } //
                                                  } //
                                        }
                                        else //---ressistance line
                                        {         for(int i = LowestBar; i > 0; i--)
                                                  {         Is_Broken = Is_touchedLine = false;
                                                            double LinePrice =    ObjectGetValueByShift(NAME_A_01, i);
                                                            if(LinePrice == 0.0) {continue;} //---work well
                                                            Is_Broken = Is_touchedLine =  High[i]  > LinePrice; // //---crossed line at that point
                                                            if(Is_Broken)
                                                            {         Price2                    = iHigh(        StSymbol.Current, f, i); //
                                                                      Time2                     = iTime(        StSymbol.Current, f, i); //
                                                                      //Alert("Is_Broken: ", Is_Broken, "   i: ", i, "   ObjectGetValueByShift(NAME_A_01, i): ", ObjectGetValueByShift(NAME_A_01, i) );
                                                                      break; //
                                                            } //
                                                  } //
                                        } //
                                        //
                              }
                              //
                    }
                    //---
                    TIME1       = Time1;                //0       datetime        Datetime value to set/get first coordinate time part
                    PRICE1      = Price1;               //1       double          Double value to set/get first coordinate price part
                    TIME2       = Time2;                //2       datetime        Datetime value to set/get second coordinate time part
                    PRICE2      = Price2;               //3       double          Double value to set/get second coordinate price part
                    //---
                    return true; //
          }
          bool       Set_Location_4(datetime Time_1, double price_1, datetime Time_2, double price_2)
          {         //  if(IsCreated)return false;
                    this.TIME1          /*= FRAME.TIME1 */          = Time_1;
                    this.PRICE1         /*= FRAME.PRICE1*/          = price_1;
                    this.TIME2          /*= FRAME.TIME2  */         = Time_2;
                    this.PRICE2         /*= FRAME.PRICE2*/          = price_2;
                    return IS_Set_Location_5_52 = true; //
          }
          bool       Set_Location_4_Bar(int bar1, int bar2, ENUM_TIMEFRAMES f)
          {         //  if(IsCreated)return false;
                    this.TIME1                               /*= FRAME.TIME1*/           = iTime( StSymbol.Current, f, bar1  );
                    if(Is_Bulish)       {this.PRICE1         /*= FRAME.PRICE1 */         = iLow( StSymbol.Current, f, bar1);}
                    else                {this.PRICE1         /*= FRAME.PRICE1 */         = iHigh( StSymbol.Current, f, bar1);}
                    //
                    this.TIME2                               /*= FRAME.TIME2 */          = iTime( StSymbol.Current, f, bar2  );
                    if(Is_Bulish)       {this.PRICE2         /*= FRAME.PRICE2 */         = iLow( StSymbol.Current, f, bar2);}
                    else                {this.PRICE2         /*= FRAME.PRICE2 */         = iHigh( StSymbol.Current, f, bar2);}
                    return IS_Set_Location_5_52 = true; //
          }
          bool       Set_Tip_2(ENUM_LINE_STYLE style_9, int width_10, bool Is_ray)
          {         //if(IsCreated)return false;
                    this.STYLE_9                /* = FRAME.STYLE */         = style_9;;
                    this.WIDTH_10               /* = FRAME.WIDTH*/          = width_10;
                    RAY_RIGHT_11                                       = Is_ray;
                    //
                    return true;//
          };//
          bool       Set_Chart_6(long timeframe_41 = 0, string symbol_42 = "", datetime createtime_43 = 0, ENUM_OBJECT typr_44 = 0, long chart_45 = 0, int subwindow_46 = 0)
          {         // if(IsCreated)return false;
                    TIMEFRAMES_O_00               /*= FRAME.TIMEFRAMES*/      = Period();
                    SYMBOL_O_00                   /*= FRAME.SYMBOL*/          = Symbol();
                    CREATETIME_O_00               /*= FRAME.CREATETIME*/      = TimeLocal();
                    TYPE_O_00                     /*= FRAME.TYPE*/            = OBJ_TREND;
                    CHART_O_00                    /*= FRAME.CHART*/           = ChartData_ChartInfo.ID;
                    SUBWINDOW_O_00                /*= FRAME.SUBWINDOW*/       = ChartData_ChartInfo.SubWindow;
                    //
                    return IS_Set_Chart_6_55 = true; //
          };

          void       LookIs_Broken()
          {         Is_Broken = false;;
                    i_BarBrokn = 0;
                    //
                    double BarLow_Price        = 0;
                    double BarHigh_Price       = 0;
                    double LineShift_Price     = 0;
                    bool   Is_BrokenHigh       = false;
                    bool   Is_BrokenLow        = false;
                    //
                    if(ObjectFind(NAME_A_01) >= 0)
                    {         //
                              //
                              Is_BrokenHigh       = false;
                              Is_BrokenLow        = false;
                              //----ResetLastError();
                              BarLow_Price   = iLow(NAME_A_01, PERIOD_CURRENT, i_BarBrokn);
                              //----Alert(ErrorDescription(_LastError));
                              for(  i_BarBrokn = 0; i_BarBrokn < 500; i_BarBrokn++)
                              {         if(Is_Bulish) { BarLow_Price   = Low[i_BarBrokn];}//iLow(NAME_A_01, PERIOD_CURRENT, i_BarBrokn);}
                                        else          { BarHigh_Price  = High[i_BarBrokn];}//iHigh(NAME_A_01, PERIOD_CURRENT, i_BarBrokn);}
                                        LineShift_Price =                      ObjectGetValueByShift(NAME_A_01, i_BarBrokn);
                                        //----Alert(NAME_A_01, "````LookIs_Broken: ", i_BarBrokn, "    Is_Bulish: ", Is_Bulish, "    Is_BrokenHigh: ", Is_BrokenHigh,  "    Is_BrokenLow: ", Is_BrokenLow, "    LineShift_Price: ", LineShift_Price, "    BarLow_Price: ", BarLow_Price, "    BarHigh_Price: ", BarHigh_Price);
                                        //
                                        if(Is_Bulish) { Is_BrokenHigh = LineShift_Price > BarLow_Price;}
                                        else          { Is_BrokenLow  = LineShift_Price < BarHigh_Price;} //
                                        if(Is_BrokenHigh || Is_BrokenLow ) { Is_Broken = true; break; } //
                              }
                              //
                    }
                    ///----Alert("LookIs_Broken: ", i_BarBrokn, "    Is_Bulish: ", Is_Bulish, "    Is_BrokenHigh: ", Is_BrokenHigh,  "    Is_BrokenLow: ", Is_BrokenLow, "    LineShift_Price: ", LineShift_Price, "    BarLow_Price: ", BarLow_Price, "    BarHigh_Price: ", BarHigh_Price);
                    //
                    //  if(Is_Bulish)        {Is_Broken = false;}
                    //  else                {Is_Broken = false;}//
          }
          //
          bool Setup()
          {
                    {         //any type
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_BACK,            this.BACK_G_00);  
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
                    if(this.TYPE_O_00 == OBJ_TREND)
                    {         ObjectSetInteger        (ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_TIME1,     this.TIME1);
                              ObjectSetDouble         (ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_PRICE1,    this.PRICE1);
                              ObjectSetInteger        (ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_TIME2,     this.TIME2);
                              ObjectSetDouble         (ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_PRICE2,    this.PRICE2); //
                              ObjectSetInteger        (ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_RAY_RIGHT, this.RAY_RIGHT_11); //
                    }
                    return true;//
          }; //
};
//+------------------------------------------------------------------+
