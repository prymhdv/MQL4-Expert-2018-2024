//+------------------------------------------------------------------+
//|                                                     ArrowBuy.mqh |
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

struct S_ArrowsBuy: public _COBF_
{         void                  S_ArrowsBuy() {TYPE_O_00 = OBJ_ARROW_BUY;}
//============================================================================================================
          //string                NAME_A_01;          //Object name                                                     string
          ////----------------------------------
          //datetime              TIME;          //Time coordinate     datetime   modifier=number of anchor point
          //double                PRICE;         //Price coordinate
          ////----------------------------------
          //color                 COLOR;                        //Color                           color
          //ENUM_LINE_STYLE       STYLE;                        //Style                           ENUM_LINE_STYLE
          int                   WIDTH;                        //Line thickness                  int
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
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_BACK, BACK);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_SELECTABLE, SELECTABLE);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_SELECTED, SELECTED);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_HIDDEN, HIDDEN);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_ZORDER, ZORDER);
          //ObjectSetString(ChartData_ChartInfo.ID,  OBJ.CName, OBJPROP_TOOLTIP, TOOLTIP);//
          //============================================================================================================
};
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\ChartObjects\ChartObjectsArrows.mqh>///: public CChartObject
// C_Objects             C_ArrowsBuy::OBJ;
class C_ArrowsBuy: public __COBFA__<S_ArrowsBuy>    
{//===================================================================
private:
          string                        m_name;
          int                           m_index;
//===================================================================
public:
          void                          C_ArrowsBuy()  {};
          void                          ~C_ArrowsBuy() {};
          //===================================================================
          CChartObjectArrow             GAC;
          S_ArrowsBuy                   GDS;
        
//===================================================================
          color InpColor;// = C'3,95,172'; // Color of signs
          bool                          Create(int             mode            = MODE_CREATE,
                                               bool            IsKey          = false,
                                               string          Name            = "ArrowBuy",
                                               long            chart_ID        = 0,
                                               int             sub_window      = 0,
                                               datetime        time            = 0,            // anchor point time
                                               double          price           = 0,            // anchor point price
                                               color           clr             = C'3,95,172',  // sign color
                                               ENUM_LINE_STYLE style           = STYLE_SOLID,  // line style (when highlighted)
                                               int             width           = 1,            // line size (when highlighted)
                                               bool            back            = false,        // in the background
                                               bool            selection       = false,        // highlight to move
                                               bool            hidden          = true,         // hidden in the object list
                                               long            z_order         = 0);       // priority for mouse click
          bool                          ArrowBuyMove(const long   chart_ID = 0, const string name = "ArrowBuy", datetime time = 0, double price = 0);       // anchor point price coordinate
          bool                          ArrowBuyDelete(const long   chart_ID = 0, const string name = "ArrowBuy"); // sign name
          void                          ChangeArrowEmptyPoint(datetime &time, double &price);
          void                          OnStartx();

//===================================================================
//===================================================================
//===================================================================
};

//+------------------------------------------------------------------+
//| Create Buy sign                                                  |
//+------------------------------------------------------------------+
bool C_ArrowsBuy::Create(int             mode            = MODE_CREATE,
                         bool            IsKey          = false,
                         string          Name            = "ArrowBuy",
                         long            chart_ID        = 0,
                         int             sub_window      = 0,
                         datetime        time            = 0,            // anchor point time
                         double          price           = 0,            // anchor point price
                         color           clr             = C'3,95,172',  // sign color
                         ENUM_LINE_STYLE style           = STYLE_SOLID,  // line style (when highlighted)
                         int             width           = 1,            // line size (when highlighted)
                         bool            back            = false,        // in the background
                         bool            selection       = false,        // highlight to move
                         bool            hidden          = true,         // hidden in the object list
                         long            z_order         = 0)            // priority for mouse click
{
//--- set anchor point coordinates if they are not set
          ChangeArrowEmptyPoint(time, price);
//--- reset the error value
          ResetLastError();
//--- create the sign
          if(!ObjectCreate(chart_ID, Name, OBJ_ARROW_BUY, sub_window, time, price))
          {         Print(__FUNCTION__,
                          ": failed to create \"Buy\" sign! Error code = ", GetLastError());
                    return(false); }
//--- set a sign color
          ObjectSetInteger(chart_ID, Name, OBJPROP_COLOR, clr);
//--- set a line style (when highlighted)
          ObjectSetInteger(chart_ID, Name, OBJPROP_STYLE, style);
//--- set a line size (when highlighted)
          ObjectSetInteger(chart_ID, Name, OBJPROP_WIDTH, width);
//--- display in the foreground (false) or background (true)
          ObjectSetInteger(chart_ID, Name, OBJPROP_BACK, back);
//--- enable (true) or disable (false) the mode of moving the sign by mouse
          ObjectSetInteger(chart_ID, Name, OBJPROP_SELECTABLE, selection);
          ObjectSetInteger(chart_ID, Name, OBJPROP_SELECTED, selection);
//--- hide (true) or display (false) graphical object name in the object list
          ObjectSetInteger(chart_ID, Name, OBJPROP_HIDDEN, hidden);
//--- set the priority for receiving the event of a mouse click in the chart
          ObjectSetInteger(chart_ID, Name, OBJPROP_ZORDER, z_order);
//--- successful execution
          return(true); }
//+------------------------------------------------------------------+
//| Move the anchor point                                            |
//+------------------------------------------------------------------+
bool C_ArrowsBuy::ArrowBuyMove(const long   chart_ID = 0,    // chart's ID
                               const string name = "ArrowBuy", // object name
                               datetime     time = 0,        // anchor point time coordinate
                               double       price = 0)       // anchor point price coordinate
{
//--- if point position is not set, move it to the current bar having Bid price
          if(!time)
                    time = TimeCurrent();
          if(!price)
                    price = SymbolInfoDouble(Symbol(), SYMBOL_BID);
//--- reset the error value
          ResetLastError();
//--- move the anchor point
          if(!ObjectMove(chart_ID, name, 0, time, price))
          {         Print(__FUNCTION__,
                          ": failed to move the anchor point! Error code = ", GetLastError());
                    return(false); }
//--- successful execution
          return(true); }
//+------------------------------------------------------------------+
//| Delete Buy sign                                                  |
//+------------------------------------------------------------------+
bool C_ArrowsBuy::ArrowBuyDelete(const long   chart_ID = 0,    // chart's ID
                                 const string name = "ArrowBuy") // sign name
{
//--- reset the error value
          ResetLastError();
//--- delete the sign
          if(!ObjectDelete(chart_ID, name))
          {         Print(__FUNCTION__,
                          ": failed to delete \"Buy\" sign! Error code = ", GetLastError());
                    return(false); }
//--- successful execution
          return(true); }
//+------------------------------------------------------------------+
//| Check anchor point values and set default values                 |
//| for empty ones                                                   |
//+------------------------------------------------------------------+
void C_ArrowsBuy::ChangeArrowEmptyPoint(datetime &time, double &price)
{
//--- if the point's time is not set, it will be on the current bar
          if(!time)time = TimeCurrent();
//--- if the point's price is not set, it will have Bid value
          if(!price)price = SymbolInfoDouble(Symbol(), SYMBOL_BID);//
}
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void C_ArrowsBuy::OnStartx()
{         datetime date[]; // array for storing dates of visible bars
          double   low[];  // array for storing Low prices of visible bars
          double   high[]; // array for storing High prices of visible bars
//--- number of visible bars in the chart window
          int bars = (int)ChartGetInteger(0, CHART_VISIBLE_BARS);
//--- memory allocation
          ArrayResize(date, bars);
          ArrayResize(low, bars);
          ArrayResize(high, bars);
//--- fill the array of dates
          ResetLastError();
          if(CopyTime(Symbol(), Period(), 0, bars, date) == -1)
          {         Print("Failed to copy time values! Error code = ", GetLastError());
                    return; }
//--- fill the array of Low prices
          if(CopyLow(Symbol(), Period(), 0, bars, low) == -1)
          {         Print("Failed to copy the values of Low prices! Error code = ", GetLastError());
                    return; }
//--- fill the array of High prices
          if(CopyHigh(Symbol(), Period(), 0, bars, high) == -1)
          {         Print("Failed to copy the values of High prices! Error code = ", GetLastError());
                    return; }
          for(int i = 0; i < bars; i++)//--- create Buy signs in Low point for each visible bar
          {         //if(!Create(MODE_CREATE, true, "ArrowBuy_" + (string)i, 0, date[i], low[i], InpColor))
                    return;
                    //--- check if the script's operation has been forcefully disabled
                    if(IsStopped())
                              return;
                    //--- redraw the chart
                    ChartRedraw();
                    // 0.05 seconds of delay
                    Sleep(50); }
//--- move Buy signs to High point for each visible bar
          for(int i = 0; i < bars; i++)
          {         // if(!ArrowBuyMove(0, "ArrowBuy_" + (string)i, date[i], high[i]))
                    return;
                    //--- check if the script's operation has been forcefully disabled
                    if(IsStopped())
                              return;
                    //--- redraw the chart
                    ChartRedraw();
                    // 0.05 seconds of delay
                    Sleep(50); }
//--- delete Buy signs
          for(int i = 0; i < bars; i++)
          {         // if(!ArrowBuyDelete(0, "ArrowBuy_" + (string)i))
                    return;
                    //--- redraw the chart
                    ChartRedraw();
                    // 0.05 seconds of delay
                    Sleep(50); }
//---
}
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
