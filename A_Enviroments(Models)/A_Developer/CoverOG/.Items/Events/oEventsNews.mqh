//+------------------------------------------------------------------+
//|                                                      oEvents.mqh |
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
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\_COBF_.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Events\Cg_EventNews.mqh>
// Define event structure
#define OBJ_EVENTNEWS   8000
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//|                                                                  |
//+------------------------------------------------------------------+
struct S_EventsNews: public _COBF_
{         void                  S_EventsNews() {TYPE_O_00 = (ENUM_OBJECT)OBJ_EVENTNEWS;}
//============================================================================================================
          string                TEXT;          //Description of the object (the text contained in the object)    string
          //color                 COLOR;                        //Color                           color
          int                   WIDTH;                        //Line thickness                  int
          ////----------------------------------
          //bool                  BACK;          //Object in the background        bool
          //long                  ZORDER;        //Priority of a graphical object for receiving events of clicking on a chart (CHARTEVENT_CLICK).The default zero value is set when creating an object; the priority can be increased if necessary.When objects are placed one atop another, only one of them with the highest priority will receive the CHARTEVENT_CLICK event.       long
          //bool                  HIDDEN;        //Prohibit showing of the name of a graphical object in the list of objects from the terminal menu "Charts" - "Objects" - "List of objects". The true value allows to hide an object from the list. By default, true is set to the objects that display calendar events, trading history and to the objects created from MQL4 programs. To see such graphical objects and access their properties, click on the "All" button in the "List of objects" window.   bool
          //bool                  SELECTED;      //Object is selected   bool
          //bool                  SELECTABLE;    //Object availability    bool
          //string                TOOLTIP;       //The text of a tooltip. If the property is not set, then the tooltip generated automatically by the terminal is shown. A tooltip can be disabled by setting the "\n" (line feed) value to it    string
          //////----------------------------------
          //long                  TIMEFRAMES;    //Visibility of an object at timeframes    set of flags flags (OBJ_ALL_PERIODS)  ObjectSetInteger(0,highlevel,OBJPROP_TIMEFRAMES,OBJ_PERIOD_M15|OBJ_PERIOD_H1);
          //string                NAME;          //Object name                                                     string
          //string                SYMBOL;        //Symbol for the Chart object                                     string
          //datetime              CREATETIME;    //Time of object creation      datetime    r/o
          //ENUM_OBJECT           TYPE;          //Object type   ENUM_OBJECT   r/o
          //============================================================================================================
          //OBJECT.Description(TEXT);  // ObjectSetString( CChart_ID, CName, OBJPROP_TEXT, TEXT);
          //OBJECT.Color(COLOR);       //ObjectSetInteger(CChart_ID, CName, OBJPROP_COLOR, COLOR);
          //OBJECT.Width(Width);       //ObjectSetInteger(CChart_ID, CName, OBJPROP_WIDTH, WIDTH);//
          ////----------------------------------
          //ObjectSetInteger(CChart_ID, CName, OBJPROP_BACK, BACK);
          //ObjectSetInteger(CChart_ID, CName, OBJPROP_SELECTABLE, SELECTABLE);
          //ObjectSetInteger(CChart_ID, CName, OBJPROP_SELECTED, SELECTED);
          //ObjectSetInteger(CChart_ID, CName, OBJPROP_HIDDEN, HIDDEN);
          //ObjectSetInteger(CChart_ID, CName, OBJPROP_ZORDER, ZORDER);
          //ObjectSetString(CChart_ID,  CName, OBJPROP_TOOLTIP, TOOLTIP);//
          //============================================================================================================

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_EventsNews : public __COBFA__<S_EventsNews> 
{
public:
          ///--- constructors

          void                   C_EventsNews() {};
          void                   ~C_EventsNews() {};

//===================================================================
          CChartObjectEventNews  GAC;
          S_EventsNews           GDS;
        
//===================================================================
          bool          Create(int WhichMode, bool IsKey, string name) {return false;}
//===================================================================
          //   CChartObjectEvent C_EventsNews::GannLine;

//===================================================================
//===================================================================
//===================================================================
};
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
