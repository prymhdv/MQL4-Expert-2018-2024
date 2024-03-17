//+------------------------------------------------------------------+
//|                                                    ArrowDown.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//|                                                                  |
//+------------------------------------------------------------------+
struct S_ArrowsDown: public _COBF_
{         void                  S_ArrowsDown() {TYPE_O_00 = OBJ_ARROW_DOWN;}
//============================================================================================================
          // string                NAME_A_01;          //Object name                                                     string
          ////----------------------------------
          //datetime              TIME;          //Time coordinate     datetime   modifier=number of anchor point
          //double                PRICE;         //Price coordinate
          ////----------------------------------
          // color                 COLOR;                        //Color                           color
          ENUM_LINE_STYLE       STYLE;                        //Style                           ENUM_LINE_STYLE
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
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//|                                                                  |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\ChartObjects\ChartObjectsArrows.mqh>///: public CChartObject
//       C_Objects                     C_ArrowsDown::OBJ;
class C_ArrowsDown: public __COBFA__<S_ArrowsDown>    
{
private:
//============================================================
public:
          void                           C_ArrowsDown() {};
          void                           ~C_ArrowsDown() {if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ArrowsDown Error",  __LINE__, __FUNCTION__); }
//============================================================ ChartObjectsArrows.mqh
          CChartObjectArrowDown          GAC;
          S_ArrowsDown                   GDS;
         
//============================================================
          bool           Create(int      mode    = MODE_CREATE,
                                bool     IsKey  = false,
                                string   Name    = "ArrowDown") {return false;};
//============================================================
};
//+------------------------------------------------------------------+
//| Create Array Down sign                                           |
//+------------------------------------------------------------------+
bool ArrowDownCreate(const long              chart_ID = 0,         // chart's ID
                     const string            name = "ArrowDown",   // sign name
                     const int               sub_window = 0,       // subwindow index
                     datetime                time = 0,             // anchor point time
                     double                  price = 0,            // anchor point price
                     const ENUM_ARROW_ANCHOR anchor = ANCHOR_BOTTOM, // anchor type
                     const color             clr = clrRed,         // sign color
                     const ENUM_LINE_STYLE   style = STYLE_SOLID,  // border line style
                     const int               width = 3,            // sign size
                     const bool              back = false,         // in the background
                     const bool              selection = true,     // highlight to move
                     const bool              hidden = true,        // hidden in the object list
                     const long              z_order = 0)          // priority for mouse click
{
//--- set anchor point coordinates if they are not set
          ChangeArrowEmptyPoint(time, price); ResetLastError(); //--- reset the error value
//--- create the sign
          if(!ObjectCreate(chart_ID, name, OBJ_ARROW_DOWN, sub_window, time, price)) {Print(__FUNCTION__, ": failed to create \"Arrow Down\" sign! Error code = ", GetLastError()); return(false); }
          ObjectSetInteger(chart_ID, name, OBJPROP_ANCHOR, anchor);//--- anchor type
          ObjectSetInteger(chart_ID, name, OBJPROP_COLOR, clr);//--- set a sign color
          ObjectSetInteger(chart_ID, name, OBJPROP_STYLE, style);//--- set the border line style
          ObjectSetInteger(chart_ID, name, OBJPROP_WIDTH, width);//--- set the sign size
          ObjectSetInteger(chart_ID, name, OBJPROP_BACK, back);//--- display in the foreground (false) or background (true)
//--- enable (true) or disable (false) the mode of moving the sign by mouse
//--- when creating a graphical object using ObjectCreate function, the object cannot be
//--- highlighted and moved by default. Inside this method, selection parameter
//--- is true by default making it possible to highlight and move the object
          ObjectSetInteger(chart_ID, name, OBJPROP_SELECTABLE, selection);
          ObjectSetInteger(chart_ID, name, OBJPROP_SELECTED, selection);
          ObjectSetInteger(chart_ID, name, OBJPROP_HIDDEN, hidden);//--- hide (true) or display (false) graphical object name in the object list
          ObjectSetInteger(chart_ID, name, OBJPROP_ZORDER, z_order);//--- set the priority for receiving the event of a mouse click in the chart
          return(true); ////--- successful execution
}
//+------------------------------------------------------------------+
//| Check anchor point values and set default values                 |
//| for empty ones                                                   |
//+------------------------------------------------------------------+
void ChangeArrowEmptyPoint(datetime &time, double &price)
{         if(!time)time = TimeCurrent();                                //--- if the point's time is not set, it will be on the current bar
          if(!price)price = SymbolInfoDouble(Symbol(), SYMBOL_BID);     //--- if the point's price is not set, it will have Bid value
}
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
