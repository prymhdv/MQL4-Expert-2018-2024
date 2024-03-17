//+------------------------------------------------------------------+
//|                                                     C_ArrowsArrow.mqh |
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
//{         ArrowX.GDS.Set_Action_2(WhichMode, IsKey);                          ArrowX.GDS.SetDesc2(obj_name, 4);
//          ArrowX.GDS.SetLocation3(OrderOpenTime(), OrderTakeProfit(), ANCHOR_BOTTOM );
//          ArrowX.GDS.Set_Color_1(COLOR_BUY);                                  ArrowX.GDS.SetStyle2(STYLE_SOLID, 15);
//          ArrowX.GDS.Set_Common_6(false, 91, false, false, false, obj_name);  ArrowX.GDS.Set_Chart_6();
//          ArrowX.Action(ArrowX);//
//}//
struct S_ArrowsArrow : public _COBF_
{         //============================================================================================================
          // string                NAME_A_01;          //Object name
          uchar                 ARROWCODE_2;                    //Arrow code for the Arrow object    uchar
          ////----------------------------------
          S_point                Point1XY;                                                 //S_HLINE.PointTime.TIME1==0  S_HLINE.PointTime.PRICE1==0
          datetime              TIME_3;          //Time coordinate     datetime   modifier=number of anchor point
          double                PRICE_4;         //Price coordinate
          ENUM_ARROW_ANCHOR     ANCHOR_ARROW_5;                 //Location of the anchor point of a graphical object  ENUM_ARROW_ANCHOR (for OBJ_ARROW), ENUM_ANCHOR_POINT //(for OBJ_LABEL, OBJ_BITMAP_LABEL and OBJ_TEXT)

          ////----------------------------------
          //color                 COLOR_6;                        //Color                           color
          ENUM_LINE_STYLE       STYLE_7;                        //Style                           ENUM_LINE_STYLE
          int                   WIDTH_8;                        //Line thickness                  int
          ////----------------------------------
          //int                   MODE_I_00;          //= MODE_CREATE;= MODE_MOVE;= MODE_MODIFY;
          //bool                  IsKey_I_00;        //= false;
          //bool                  IS_SET_I_00;
          ////===================================
          bool                    IS_Set_Desc_2_51;
          //bool                  IS_Set_Desc_4_51;
          //bool                  IS_Set_Location_5_52;
          bool                    IS_Set_Location_3_52;
          //bool                  IS_Set_Color_1_53;
          //bool                  IS_Set_Common_6_54;
          //bool                  IS_Set_Chart_6_55;
          //bool                  IS_Set_Action_2_56;
          bool                    IS_Set_Style_2_57;
          //////----------------------------------
          //bool                  BACK_G_00;          //Object in the background        bool
          //long                  ZORDER_G_00;        //Priority of a graphical object for receiving events of clicking on a chart (CHARTEVENT_CLICK).The default zero value is set when creating an object; the priority can be increased if necessary.When objects are placed one atop another, only one of them with the highest priority will receive the CHARTEVENT_CLICK event.       long
          //bool                  HIDDEN_G_00;        //Prohibit showing of the name of a graphical object in the list of objects from the terminal menu "Charts" - "Objects" - "List of objects". The true value allows to hide an object from the list. By default, true is set to the objects that display calendar events, trading history and to the objects created from MQL4 programs. To see such graphical objects and access their properties, click on the "All" button in the "List of objects" window.   bool
          //bool                  SELECTED_G_00;      //Object is selected   bool
          //bool                  SELECTABLE_G_00;    //Object availability    bool
          //string                TOOLTIP_G_00;       //The text of a tooltip. If the property is not set, then the tooltip generated automatically by the terminal is shown. A tooltip can be disabled by setting the "\n" (line feed) value to it    string
          //////----------------------------------
          //long                  TIMEFRAMES_O_00;    //Visibility of an object at timeframes    set of flags flags (OBJ_ALL_PERIODS)  ObjectSetInteger(0,highlevel,OBJPROP_TIMEFRAMES,OBJ_PERIOD_M15|OBJ_PERIOD_H1);
          //string                SYMBOL_O_00;        //Symbol for the Chart object                                     string
          //datetime              CREATETIME_O_00;    //Time of object creation      datetime    r/o
          //ENUM_OBJECT           TYPE_O_00;          //Object type   ENUM_OBJECT   r/o
          //long                  CHART_O_00;         //Object chart  id number in
          //int                   SUBWINDOW_O_00;
          //============================================================================================================
          void                  S_ArrowsArrow()  {TYPE_O_00 = OBJ_ARROW_SELL;};//{Point1XY(0, 0);}; //S_HLINE.PointTime.TIME1==0  S_HLINE.PointTime.PRICE1==0  S_HLINE.PointTime.TIME2==0   S_HLINE.PointTime.PRICE2==0
          void                  ~S_ArrowsArrow() {};
          //============================================================================================================
          bool                  Set_Desc_2(string name_1, uchar arrowcode_2)
          {         this.NAME_A_01                      /*= FRAME.NAME     */       = name_1; //"Name";
                    this.ARROWCODE_2                    /*= FRAME.ARROWCODE*/       = arrowcode_2; //"Name";
                    //
                    return IS_Set_Desc_2_51 = true; //
          };
          //============================================================================================================
          bool                  Set_Style_2(ENUM_LINE_STYLE style_7, int width_8)
          {         //this.COLOR_6                      /*= FRAME.COLOR   */         = COLOR_6; //"Name";
                    this.STYLE_7                        /*= FRAME.STYLE    */        = style_7; //"Name";
                    this.WIDTH_8                        /*= FRAME.WIDTH    */        = width_8; //"Name";
                    //
                    return IS_Set_Style_2_57 = true; //
          };
          //============================================================================================================
          bool                  Set_Location_3( datetime time_3, double price_4, ENUM_ARROW_ANCHOR anchor_arrow_5)
          {         this.TIME_3                         /*= FRAME.TIME    */        = time_3;
                    this.PRICE_4                        /*= FRAME.PRICE   */        = price_4;
                    this.ANCHOR_ARROW_5                 /*= FRAME.ANCHOR_ARROW*/    = anchor_arrow_5;
                    //
                    return IS_Set_Location_3_52 = true; //
          };
          //============================================================================================================

          //OBJECT.Color(COLOR);            //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_COLOR, COLOR);
          //OBJECT.Style(STYLE);            //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_STYLE, STYLE);
          //OBJECT.Width(Width);            //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_WIDTH, WIDTH);//
          ////----------------------------------
          //OBJECT.Anchor(ANCHOR_ARROW); /*ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_ANCHOR, ANCHOR_ARROW);*/
          ////----------------------------------
          //OBJECT.ArrowCode(ARROWCODE); /*ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_ARROWCODE, ARROWCODE);*/
          ////----------------------------------
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_BACK, BACK);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_SELECTABLE, SELECTABLE);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_SELECTED, SELECTED);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_HIDDEN, HIDDEN);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_ZORDER, ZORDER);
          //ObjectSetString(ChartData_ChartInfo.ID,  OBJ.CName, OBJPROP_TOOLTIP, TOOLTIP);//
          //============================================================================================================
};
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\ChartObjects\ChartObjectsArrows.mqh>///: public CChartObject
//       C_Objects                     OBJ;
class C_ArrowsArrow: public __COBFA__<S_ArrowsArrow> 
{
private:
//============================================================
public:
          void                          C_ArrowsArrow() {};
          void                          ~C_ArrowsArrow() {if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ArrowsArrow Error",  __LINE__, __FUNCTION__); }
//============================================================ ChartObjectsArrows.mqh
          bool                          SetAttribe();
          bool                          Create(int                     MODE            = MODE_CREATE,
                                               bool                    IsKey          = false,
                                               string                  Name            = "LineV",
                                               const uchar             arrow_code      = 252,
                                               datetime                time            = 0,
                                               double                  price           = 0,
                                               const color             clr             = clrRed,
                                               const ENUM_LINE_STYLE   style           = STYLE_SOLID,
                                               const int               width           = 3,
                                               const ENUM_ARROW_ANCHOR anchor_arrow    = ANCHOR_BOTTOM,
                                               const bool              back            = false);
//============================================================
          CChartObjectArrow             GAC;
          S_ArrowsArrow                 GDS;
   
         // void                          SetupSignal() {}
          bool                          GAC_CreateCall(long ChartID_, string Name_, int SubWindow_) {return GAC.Create(ChartID_, Name_, SubWindow_, 0, 0, 0);}

//============================================================

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_ArrowsArrow::Create(int                     mode            = MODE_CREATE,
                           bool                    IsKey          = false,
                           string                  Name            = "LineV",
                           const uchar             arrow_code      = 252,
                           datetime                time            = 0,
                           double                  price           = 0,
                           const color             clr             = clrRed,
                           const ENUM_LINE_STYLE   style           = STYLE_SOLID,
                           const int               width           = 3,
                           const ENUM_ARROW_ANCHOR anchor_arrow    = ANCHOR_BOTTOM,
                           const bool              back            = false)// LineV
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_LineVertical Error",  __LINE__, __FUNCTION__); //|
//=========================================================
          string              Description     = "LineVertical" + Name;
//=========================================================
          if(mode == MODE_MOVE   && IsKey  && ObjectFind(ChartData_ChartInfo.ID, Name) >= 0 ) {ObjectSetInteger(0, Name, OBJPROP_TIME, time); return ObjectSetDouble(0, Name, OBJPROP_PRICE, price);} ////Label_.X_Distance(XCordinate);
          if(mode == MODE_CREATE && !IsKey && ObjectFind(ChartData_ChartInfo.ID, Name) >= 0 ) {return ObjectDelete(ChartData_ChartInfo.ID, Name);}
          if(mode == MODE_CREATE && IsKey  && ObjectFind(ChartData_ChartInfo.ID, Name) < 0)   {GAC.Create(ChartData_ChartInfo.ID, Name, ChartData_ChartInfo.SubWindow, 0, 0, 0); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_LineVertical Error",  __LINE__, __FUNCTION__); //|
          return false;//
          //
          {         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
//===================================================================
                    if(Capitan_ResetLastErrorX)ResetLastError();
//===================================================================
//===================================================================
                    return Create(MODE_CREATE, true); //  if(!ObjectCreate(chart_ID, name, OBJ_RECTANGLE_LABEL, sub_window, 0, 0))
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
                    return(true);//
          }
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_ArrowsArrow::SetAttribe()
{         if(ObjectFind(ChartData_ChartInfo.ID, GDS.NAME_A_01) >= 0)
          {         //
                    GAC.ArrowCode(GDS.ARROWCODE_2);                        //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_ARROWCODE, GDS.ARROWCODE_2);
                    GAC.Time(GDS.ANCHOR_ARROW_5, GDS.TIME_3);           //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_TIME,      GDS.TIME_3);
                    GAC.Price(GDS.ANCHOR_ARROW_5, GDS.PRICE_4);         //ObjectSetDouble(0, GDS.NAME_A_01, OBJPROP_PRICE,      GDS.PRICE_4);
                    GAC.Anchor(GDS.ANCHOR_ARROW_5);                        //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_ARROWCODE, GDS.ANCHOR_ARROW_5);
                    //
                    GAC.Color(GDS.COLOR_C_00);                       //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_COLOR, GDS.COLOR_6);
                    GAC.Style(GDS.STYLE_7);                       //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_STYLE, GDS.STYLE_7);
                    GAC.Width(GDS.WIDTH_8);                        //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_WIDTH, GDS.WIDTH_8);
                    //
                    //
                    GAC.Background(GDS.BACK_G_00);                //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_BACK,             Background);        //CORNER_RIGHT_UPPER
                    GAC.Z_Order(GDS.ZORDER_G_00);                 //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_ZORDER,           11);//UseLabel.GAC(false);
                    GAC.Hidden(GDS.HIDDEN_G_00);                  //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_HIDDEN,           true);
                    GAC.Selected(GDS.SELECTED_G_00);              //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_SELECTED,         false);
                    GAC.Selectable(GDS.SELECTABLE_G_00);          //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_SELECTABLE,       false);
                    GAC.Tooltip(GDS.TOOLTIP_G_00);                //ObjectSetString(0,  GDS.NAME_A_01, OBJPROP_TOOLTIP,          sRectLabel.TOOLTIP_G_00);
                    //==================================================================
          } //
          return true;//
}
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
