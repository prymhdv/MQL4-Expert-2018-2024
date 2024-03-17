//+------------------------------------------------------------------+
//|                                                 C_LinesVertical.mqh |
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
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\_COBF_.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\__COBFA__.mqh>
struct S_VLINE: public _COBF_
{         //============================================================================================================
          void                 S_VLINE() {TYPE_O_00 = OBJ_VLINE;}; // {Point1X(0);};
          S_point               Point1X;                                     //S_HLINE.PointTime.TIME1==0  S_HLINE.PointTime.PRICE1==0
          ////----------------------------------
          //color                COLOR;                        //Color                           color
          //ENUM_LINE_STYLE      STYLE;                        //Style                           ENUM_LINE_STYLE
          //int                  WIDTH;                        //Line thickness                  int
          ////----------------------------------
          bool  Set_Location_1(datetime t) {  TIME1 = t;       return true;};
          bool  Set_Tip_2(ENUM_LINE_STYLE style_9, int width_10)
          {         if(IsCreated)return false;
                    this.STYLE_9               /* = FRAME.STYLE  */        = style_9;;
                    this.WIDTH_10              /* = FRAME.WIDTH  */        = width_10;
                    //
                    return true;//
          };//
          bool  Set_Chart_6(long timeframe_41 = 0, string symbol_42 = "", datetime createtime_43 = 0, ENUM_OBJECT typr_44 = 0, long chart_45 = 0, int subwindow_46 = 0)
          {         if(IsCreated)return false;
                    TIMEFRAMES_O_00               /*= FRAME.TIMEFRAMES*/      = Period();
                    SYMBOL_O_00                   /*= FRAME.SYMBOL*/          = Symbol();
                    CREATETIME_O_00               /*= FRAME.CREATETIME*/      = TimeLocal();
                    TYPE_O_00                     /*= FRAME.TYPE*/            = OBJ_VLINE;
                    CHART_O_00                    /*= FRAME.CHART*/           = ChartData_ChartInfo.ID;
                    SUBWINDOW_O_00                /*= FRAME.SUBWINDOW*/       = ChartData_ChartInfo.SubWindow;
                    //
                    return IS_Set_Chart_6_55 = true; //
          };//

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
                    ObjectSetInteger    (ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_COLOR, this.COLOR_C_00);
                    ObjectSetInteger    (ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_STYLE, this.STYLE_9);
                    ObjectSetInteger    (ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_WIDTH, this.WIDTH_10);
                    //
                    ObjectSetInteger    (ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_TIME,    this.TIME1);
                    //
                    return true;//
          };
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
};


//-------
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\ChartObjects\ChartObjectsLines.mqh>
class C_LinesVertical: public __COBFA__<S_VLINE>
{
//====================================================================
private:
          static uint                    ObjAllNum;
          static uint                    ObjAllNumDef;
          string                         ObjName;//name num comfe from ObjAllNum
          uint                           ObjNum;//just run once created obj
          datetime                       ObjCreateTime;
          //static int OBJCount;// = 0;>>may come error//resolved//by set value out class block::
          //template<typename T> bool     C_ObjectFrame::Action(T &sOBJ);    //--Drive from Parent
//====================================================================
public:
          void                  C_LinesVertical() {};
          void                  ~C_LinesVertical() {};
//====================================================================

          S_VLINE               GDS;                 //---  mine build structure of obj
          CChartObjectVLine_MQL4     GAC;         //---  API
          void                  SetupSignal()
          {         ObjectSetInteger(ChartData_ChartInfo.ID, GDS.NAME_A_01, OBJPROP_COLOR, GDS.COLOR_C_00);
                    ObjectSetInteger(ChartData_ChartInfo.ID, GDS.NAME_A_01, OBJPROP_STYLE, GDS.STYLE_9);
                    ObjectSetInteger(ChartData_ChartInfo.ID, GDS.NAME_A_01, OBJPROP_WIDTH, GDS.WIDTH_10);//
          };
//====================================================================
          int                   Count ;
          int                   Start ;
          bool                  Gradient;              // = TimeCordinateOne > TimeCordinateTwo;
          double                PriceCordinateOne;     // = PriceCordinateOne;
          datetime              TimeCordinateOne;      // = TimeCordinateOne;
          double                PriceCordinateTwo;     // = PriceCordinateTwo;
          datetime              TimeCordinateTwo;      // = TimeCordinateTwo;
          double                PriceCordinateThere;   // = PriceCordinateTwo;
          datetime              TimeCordinateThere;    // = TimeCordinateTwo;
//====================================================================
          bool Create(int                 mode            = MODE_CREATE,
                      bool                IsKey          = false,
                      string              Name            = "LineV",
                      datetime            XCordinate      = 0,
                      ENUM_LINE_STYLE     Style           = 1,
                      int                 Width           = 1,
                      color               DescColorIN     = clrYellow,
                      bool                Background      = false);// LineV
          template<typename T>
          bool CreateOBJ(T                   OBJECT,
                         int                 MODE            = MODE_CREATE,
                         bool                IsKey          = false,
                         string              Name            = "LineV",
                         datetime            XCordinate      = 0,
                         ENUM_LINE_STYLE     Style           = 1,
                         int                 Width           = 1,
                         color               DescColorIN     = clrYellow,
                         bool                Background      = false);// LineV
          void VlineS(const string UseName = "VlineS");  //--- UpDateHlineAsk
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          bool Delete() {return (GAC.Delete());}      //--- Manke Name
          //---[----Draw Trend Lines//ExtemumPlace by indexed---]
          void Draw_GDSVertical1(int WhichMode, bool IsKey, string n, datetime t, ENUM_LINE_STYLE s, int w, color c, bool Is_Delete ) //STYLE_DOT
          {         GDS.Set_Action_2(WhichMode, IsKey);
                    GDS.Set_Desc_1("Lines.Vertical" + n);
                    GDS.Set_Color_1(c);
                    GDS.Set_Location_1(t);
                    GDS.Set_Tip_2(s, w);
                    GDS.Set_Common_6(false, 10, false, false, false, "tooltip-Lines.Vertical" + n);
                    GDS.Set_Chart_6();
                    GDS.Set_ToDelete_1(Is_Delete);
                    GDS.Set_Signal_1(true);
                    Action(this); //
                    //
          }//
          void Draw_GDSVertical2(int WhichMode, bool IsKey, string n, datetime t, ENUM_LINE_STYLE s, int w, color c) //STYLE_DOT
          {         GDS.Set_Action_2(WhichMode, IsKey);
                    GDS.Set_Desc_1( n);//"Lines.Vertical" +
                    GDS.Set_Color_1(c);
                    GDS.Set_Location_1(t);
                    GDS.Set_Tip_2(s, w);
                    GDS.Set_Common_6(true, 10, false, false, false, "tooltip-" + n);//Lines.Vertical
                    GDS.Set_Chart_6();
                     GDS.Set_Signal_1(true);
                    Action(this); //
                    //
          }//
//====================================================================
};
uint C_LinesVertical::ObjAllNum = 0;
uint C_LinesVertical::ObjAllNumDef = 0;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_LinesVertical::Create(int                 mode            = MODE_CREATE,
                             bool                IsKey          = false,
                             string              Name            = "LineV",
                             datetime            XCordinate      = 0,
                             ENUM_LINE_STYLE     Style           = 1,
                             int                 Width           = 1,
                             color               DescColorIN     = clrYellow,
                             bool                Background      = false)// LineV
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_LinesVertical Error",  __LINE__, __FUNCTION__); //|
//=========================================================
          string              Description     = "LineVertical" + Name;
//=========================================================
          if(mode == MODE_MOVE   && IsKey  && ObjectFind(ChartData_ChartInfo.ID, Name) >= 0 ) {return ObjectSetInteger(0, Name, OBJPROP_XDISTANCE, XCordinate);} ////Label_.X_Distance(XCordinate);
          if(mode == MODE_CREATE && !IsKey && ObjectFind(ChartData_ChartInfo.ID, Name) >= 0 ) {return ObjectDelete(ChartData_ChartInfo.ID, Name);}
          if(mode == MODE_CREATE && IsKey  && ObjectFind(ChartData_ChartInfo.ID, Name) < 0)
          {         GAC.Create(ChartData_ChartInfo.ID, Name, ChartData_ChartInfo.SubWindow, XCordinate);
                    if(ObjectFind(ChartData_ChartInfo.ID, Name) >= 0)
                    {         GAC.Color(DescColorIN);
                              GAC.Width(Width);
                              GAC.Style(Style);//
                              //GAC.SetInteger(OBJPROP_STYLE, Style);   // GAC.Style(2)
                              GAC.Background(Background); //
                              GAC.Description(Description); //
                              //
                              //GAC.Background();
                              //GAC.Selectable();
                              //GAC.Selected();
                              //GAC.Hidden();
                              //GAC.Z_Order();
                              //GAC.Tooltip();
                              return true;//
                    } //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_LinesVertical Error",  __LINE__, __FUNCTION__); //|
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_LinesVertical::VlineS(const string UseName = "VlineS")  //UpDateHlineAsk
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          ChartData_ChartInfo.DayStart = Time[40];
          if(ct_Series_Base.IsRefreshRate )ChartData_ChartInfo.DayStart = iTime(NULL, PERIOD_D1, 0);
//============================//============================
          if(ObjectFind(ChartData_ChartInfo.ID, UseName) < 0)
                    if(!ObjectCreate(ChartData_ChartInfo.ID, UseName, OBJ_VLINE, ChartData_ChartInfo.SubWindow, ChartData_ChartInfo.DayStart, 0))Alert("Not Object Create" + (string)__LINE__);
          int i;
          if(ObjectFind(ChartData_ChartInfo.ID, UseName) >= 0)
          {         for(i = 0; i < 50; i++)//--- move object down and change its text
                              //if(true)
                    {         ChartRedraw(ChartID());  //--- forced chart redraw
                              Sleep(5);//
                              string textt = StringFormat("Simple Label at y= %d", i);
                              int formula2x = (int)((i * i + 5 * i + 10) * 0.05);
                              int formula3x =  (int)((i * i * i + 5 * i * i + 10 * i + 10) * 0.005);
                              if(formula3x > 2)formula3x /= 2 * i;
                              ObjectSetInteger(ChartID(), UseName, OBJPROP_COLOR, clrGray);//--- set color to Red
                              ObjectSetInteger(ChartID(), UseName, OBJPROP_WIDTH, formula3x);
                              ObjectSetString(ChartID(), UseName, OBJPROP_TEXT, textt); //--- set text property
                              // ObjectSet(Usename, OBJPROP_, i);  //--- set distance property
                              formula3x =  (int)((i * i * i + 5 * i * i + 10 * i + 10) * 0.005);
                              ObjectMove(ChartID(), UseName, 0, Time[0 + formula3x], 0);
                              ChartRedraw(ChartID());  //--- forced chart redraw
                    }
                    for(i = 1; i > 0; i--)  //--- move object up and change its text
                              //if(true)
                    {         ObjectSetString(ChartID(), UseName, OBJPROP_TEXT, StringFormat("Simple Label at y= %d", i));//--- set text property
                              //ObjectSet(Usename, OBJPROP_ANCHOR, i);   //--- set distance property
                              ChartRedraw(ChartID());  //--- forced chart redraw
                              Sleep(0);//
                    }
                    //C_STATICSUN::DeleteObject(obj_name, __LINE__);
          }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return;//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename T>
bool C_LinesVertical::CreateOBJ(T                   OBJECT,
                                int                 MODE            = MODE_CREATE,
                                bool                IsKey          = false,
                                string              Name            = "LineV",
                                datetime            XCordinate      = 0,
                                ENUM_LINE_STYLE     Style           = 1,
                                int                 Width           = 1,
                                color               DescColorIN     = clrYellow,
                                bool                Background      = false)// LineV
{
//=========================================================
          string              Description     = "LineVertical" + Name;
//=========================================================
          if(MODE == MODE_MOVE   && IsKey  && ObjectFind(ChartData_ChartInfo.ID, Name) >= 0 ) {return ObjectSetInteger(0, Name, OBJPROP_XDISTANCE, XCordinate);} ////Label_.X_Distance(XCordinate);
          if(MODE == MODE_CREATE && !IsKey && ObjectFind(ChartData_ChartInfo.ID, Name) >= 0 ) {return ObjectDelete(ChartData_ChartInfo.ID, Name);}
          if(MODE == MODE_CREATE && IsKey  && ObjectFind(ChartData_ChartInfo.ID, Name) < 0)
          {         OBJECT.Create(ChartData_ChartInfo.ID, Name, ChartData_ChartInfo.SubWindow, XCordinate);
                    if(ObjectFind(ChartData_ChartInfo.ID, Name) >= 0)
                    {         OBJECT.Color(DescColorIN);
                              OBJECT.Width(Width);
                              OBJECT.Style(Style);// LineV.SetInteger(OBJPROP_STYLE, Style);   // LineV.Style(2)
                              OBJECT.Background(Background); //
                              OBJECT.Description(Description); //
                              //
                              //
                              return true;//
                    } //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_LinesVertical Error",  __LINE__, __FUNCTION__); //|
          return false;//
}
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
