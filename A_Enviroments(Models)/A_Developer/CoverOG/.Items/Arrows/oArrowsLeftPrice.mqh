//+------------------------------------------------------------------+
//|                                               ArrowLeftPrice.mqh |
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
struct S_ArrowsLeftPrice: public _COBF_
{         void                  S_ArrowsLeftPrice() {TYPE_O_00 = OBJ_ARROW_LEFT_PRICE;}
          //============================================================================================================
          //string                NAME_A_01;          //Object name                                                     string
          ////----------------------------------
          //datetime              TIME;          //Time coordinate     datetime   modifier=number of anchor point
          //double                PRICE;         //Price coordinate
          ////----------------------------------
          // color                 COLOR;                        //Color                           color
          //ENUM_LINE_STYLE       STYLE;                        //Style                           ENUM_LINE_STYLE
          int                   WIDTH;                        //Line thickness                  int
          ////----------------------------------
          ENUM_ARROW_ANCHOR     ANCHOR_ARROW;                 //Location of the anchor point of a graphical object  ENUM_ARROW_ANCHOR (for OBJ_ARROW), ENUM_ANCHOR_POINT //(for OBJ_LABEL, OBJ_BITMAP_LABEL and OBJ_TEXT)
          ////----------------------------------
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
          //OBJECT.Color(COLOR);            //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_COLOR, COLOR);
          //OBJECT.Style(STYLE);            //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_STYLE, STYLE);
          //OBJECT.Width(Width);            //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_WIDTH, WIDTH);//
          ////----------------------------------
          //OBJECT.Anchor(ANCHOR_ARROW); /*ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_ANCHOR, ANCHOR_ARROW);*/
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
//       C_Objects                     C_ArrowsLeftPrice::OBJ;
class C_ArrowsLeftPrice: public __COBFA__<S_ArrowsLeftPrice>   
{
private:
//============================================================
public:
          void                          C_ArrowsLeftPrice() {};
          void                          ~C_ArrowsLeftPrice() {if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ArrowsLeftPrice Error",  __LINE__, __FUNCTION__); }
//============================================================ ChartObjectsArrows.mqh
          CChartObjectArrowLeftPrice    GAC;
          S_ArrowsLeftPrice             GDS;
         
//============================================================
          bool                          Create(int      mode    = MODE_CREATE,
                                               bool     IsKey  = false,
                                               string   Name    = "ShapeEllipse") {return false;};
//============================================================
};
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
