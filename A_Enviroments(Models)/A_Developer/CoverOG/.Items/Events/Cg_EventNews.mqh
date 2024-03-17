//#include <ChartObjects\ChartObjectsGann.mqh>
// C_Objects             C_EventsNews::OBJ;
//#include <ChartObjects\ChartObject.mqh>;

#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\ChartObjects\ChartObject.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct EVENTS
{         string   time;
          string   title;
          string   currency;
          bool     displayed; //
};//
EVENTS      DailyEvents[20];
class CChartObjectEventNews : public CChartObject_MQL4
{
//===================================================================  HighImpactEvents.mq4
private:
          string                Event_name;
          int                   Event_index;
          int                   MaxDailyEvents;         // 20 --- If you think you'll have more than 20 High Impact events, increase this number.
//===================================================================
public:
          void                  CChartObjectEventNews();
          void                  ~CChartObjectEventNews();
          //
          ///---
          void                  startX();
          string                GetHTMLElement(string HTML, string ElementStart, string ElementEnd);
          bool                  GetHighImpactEvents();
          string                MthName(int Mth, bool ShortName = true);
          //--- method of identifying the object
          virtual int           Type(void) const { return(OBJ_BITMAP_LABEL); }
          bool                  EventTextChange(const long chart_ID = 0, const string name = "Event", const string text = "Text"); // text
          bool                  EventMove(const long chart_ID = 0, const string name = "Event", datetime time = 0);
          bool                  EventDelete(const long chart_ID = 0, const string name = "Event");
          //--- methods for working with files
          virtual bool          Save(const int file_handle) {return false;};
          virtual bool          Load(const int file_handle) {return false;};
          color                 Color(void) const;
          bool                  Color(const color new_color) const;
          ///---
          string          InpName;// = "Event";  // Event name
          int             InpDate;// = 25;       // Event date, %
          string          InpText;// = "Text";   // Event text
          color           InpColor;// = clrRed;  // Event color
          int             InpWidth;// = 1;       // Point size when highlighted
          bool            InpBack;// = false;    // Background event
          bool            InpSelection;// = false; // Highlight to move
          bool            InpHidden;// = true;   // Hidden in the object list
          long            InpZOrder;// = 0;      // Priority for mouse click
          //
          bool          Create(string           Name            = "Event",
                               long             chart_ID        = 0,    // chart's ID
                               int              sub_window      = 0,  // subwindow index
                               string           text            = "Text",   // event text
                               datetime         time            = 0,
                               color            clr             = clrRed,
                               int              width           = 1,       // point width when highlighted
                               bool             back            = false,    // in the background
                               bool             selection       = false, // highlight to move
                               bool             hidden          = true,   // hidden in the object list
                               long             z_order         = 0);     // priority for mouse click

          void          OnStartRun();
          ///---
};
//+------------------------------------------------------------------+
//| Change Event object text                                         |
//+------------------------------------------------------------------+
bool CChartObjectEventNews::EventTextChange(const long   chart_ID = 0, // chart's ID
                    const string name = "Event", // event name
                    const string text = "Text") // text
{
//--- reset the error value
          ResetLastError();
//--- change object text
          if(!ObjectSetString(chart_ID, name, OBJPROP_TEXT, text))
          {         Print(__FUNCTION__,
                          ": failed to change the text! Error code = ", GetLastError());
                    return(false); }
//--- successful execution
          return(true); }
//+------------------------------------------------------------------+
//| Move Event object                                                |
//+------------------------------------------------------------------+
bool CChartObjectEventNews::EventMove(const long   chart_ID = 0, // chart's ID
                                      const string name = "Event", // event name
                                      datetime     time = 0)     // time
{
//--- if time is not set, move event to the last bar
          if(!time)
                    time = TimeCurrent();
//--- reset the error value
          ResetLastError();
//--- move the object
          if(!ObjectMove(chart_ID, name, 0, time, 0))
          {         Print(__FUNCTION__,
                          ": failed to move \"Event\" object! Error code = ", GetLastError());
                    return(false); }
//--- successful execution
          return(true); }
//+------------------------------------------------------------------+
//| Delete Event object                                              |
//+------------------------------------------------------------------+
bool CChartObjectEventNews::EventDelete(const long   chart_ID = 0, const string name = "Event") // event name
{
//--- reset the error value
          ResetLastError();
//--- delete the object
          if(!ObjectDelete(chart_ID, name))
          {         Print(__FUNCTION__,
                          ": failed to delete \"Event\" object! Error code = ", GetLastError());
                    return(false); }
//--- successful execution
          return(true); }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CChartObjectEventNews::Create(
          string           Name            = "Event",
          long             chart_ID        = 0,    // chart's ID
          int              sub_window      = 0,  // subwindow index
          string           text            = "Text",   // event text
          datetime         time            = 0,        // time
          color            clr             = clrRed,    // color
          int              width           = 1,       // point width when highlighted
          bool             back            = false,    // in the background
          bool             selection       = false, // highlight to move
          bool             hidden          = true,   // hidden in the object list
          long             z_order         = 0)     // priority for mouse click
{
//--- if time is not set, create the object on the last bar
          if(!time)
                    time = TimeCurrent();
//--- reset the error value
          ResetLastError();
//--- create Event object
          if(!ObjectCreate(chart_ID, Name, OBJ_EVENT, sub_window, time, 0))
          {         Print(__FUNCTION__,
                          ": failed to create \"Event\" object! Error code = ", GetLastError());
                    return(false); }
//--- set event text
          ObjectSetString(chart_ID, Name, OBJPROP_TEXT, text);
//--- set color
          ObjectSetInteger(chart_ID, Name, OBJPROP_COLOR, clr);
//--- set anchor point width if the object is highlighted
          ObjectSetInteger(chart_ID, Name, OBJPROP_WIDTH, width);
//--- display in the foreground (false) or background (true)
          ObjectSetInteger(chart_ID, Name, OBJPROP_BACK, back);
//--- enable (true) or disable (false) the mode of moving event by mouse
          ObjectSetInteger(chart_ID, Name, OBJPROP_SELECTABLE, selection);
          ObjectSetInteger(chart_ID, Name, OBJPROP_SELECTED, selection);
//--- hide (true) or display (false) graphical object name in the object list
          ObjectSetInteger(chart_ID, Name, OBJPROP_HIDDEN, hidden);
//--- set the priority for receiving the event of a mouse click in the chart
          ObjectSetInteger(chart_ID, Name, OBJPROP_ZORDER, z_order);
//--- successful execution
          return(true);//
}
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void CChartObjectEventNews::OnStartRun()
{
//--- check correctness of the input parameters
          if(InpDate < 0 || InpDate > 100)
          {         Print("Error! Incorrect values of input parameters!");
                    return; }
//--- number of visible bars in the chart window
          int bars = (int)ChartGetInteger(0, CHART_VISIBLE_BARS);
//--- array for storing the date values to be used
//--- for setting and changing line anchor point's coordinates
          datetime date[];
//--- memory allocation
          ArrayResize(date, bars);
//--- fill the array of dates
          ResetLastError();
          if(CopyTime(Symbol(), Period(), 0, bars, date) == -1)
          {         Print("Failed to copy time values! Error code = ", GetLastError());
                    return; }
//--- define the points to create an object
          int d = InpDate * (bars - 1) / 100;
          // if(!Create(0, InpName, 0, InpText, date[d], InpColor, InpWidth, InpBack, InpSelection, InpHidden, InpZOrder)) { return; } //--- create Event object
//--- redraw the chart and wait for 1 second
          ChartRedraw();
          Sleep(1000);
//--- now, move the object
//--- loop counter
          int h_steps = bars / 2;
//--- move the object
          for(int i = 0; i < h_steps; i++)
          {         //--- use the following value
                    if(d < bars - 1)
                              d += 1;
                    //--- move the point
                    if(!EventMove(0, InpName, date[d]))
                              return;
                    //--- check if the script's operation has been forcefully disabled
                    if(IsStopped())
                              return;
                    //--- redraw the chart
                    ChartRedraw();
                    // 0.05 seconds of delay
                    Sleep(50); }
//--- 1 second of delay
          Sleep(1000);
//--- delete the channel from the chart
          EventDelete(0, InpName);
          ChartRedraw();
//--- 1 second of delay
          Sleep(1000);
//---
}

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
void CChartObjectEventNews::CChartObjectEventNews()
{         // Get today's events
         //--- GetHighImpactEvents();
          // return(INIT_SUCCEEDED);
}

//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void CChartObjectEventNews::~CChartObjectEventNews()
{         // ObjectsDeleteAll();
//
}

//+------------------------------------------------------------------+
//| Expert start function                                             |
//+------------------------------------------------------------------+
void CChartObjectEventNews::startX()
{         string   event = NULL;
          // Is there a high impact event in the next 5 minutes?
          for(int i = 0; i < MaxDailyEvents; i++)
          {         if(StringLen(DailyEvents[i].time) == 0) break;
                    if(TimeCurrent() >= StrToTime(DailyEvents[i].time) - 300 && TimeCurrent() < StrToTime(DailyEvents[i].time) && !DailyEvents[i].displayed)
                    {         // Event in 5 minutes...
                              event += DailyEvents[i].title + " (" + DailyEvents[i].currency + "), ";
                              DailyEvents[i].displayed = true;
                              // Delete the vertical line associated to the event
                              if(ObjectFind("VLine" + DoubleToStr(i, 0)) >= 0) ObjectDelete("VLine" + DoubleToStr(i, 0)); } }
          // Anything to display?
          if(StringLen(event) != 0)
          {         event += "in 5 minutes.";
                    Alert(event); }//
}

//+------------------------------------------------------------------+
//| Extract an HTML element
//+------------------------------------------------------------------+
string CChartObjectEventNews::GetHTMLElement(string HTML, string ElementStart, string ElementEnd)
{         string   data = NULL;
          // Find start and end position for element
          int s = StringFind(HTML, ElementStart) + StringLen(ElementStart);
          int e = StringFind(StringSubstr(HTML, s), ElementEnd);
          // Return element content
          if(e != 0) data = StringSubstr(HTML, s, e);
          return(data); }

//+------------------------------------------------------------------+
//| Get today's high impact events from ForexFactory.com
//+------------------------------------------------------------------+
bool CChartObjectEventNews::GetHighImpactEvents()
{         string   cookie = NULL, headers, HTML;
          string   url = "";//"http://www.forexfactory.com/calendar.php?day=";
          string   time = NULL, lasttime = NULL, currency, impact, title;
          char     post[], result[];
          int      res, cntr = 0, timeout = 5000;
          // If offline, just exit as if it was properly read
          if(!IsConnected() || IsTesting()) return(true);
          // Clear daily event structure
          for(res = 0; res < MaxDailyEvents; res++)
          {         DailyEvents[res].time = DailyEvents[res].title = DailyEvents[res].currency = NULL; DailyEvents[res].displayed = false; ++res; }
          // Send web request
          url += MthName(Month()) + DoubleToStr(Day(), 0) + "." + DoubleToStr(Year(), 0);
          ResetLastError();
          res = WebRequest("GET", url, cookie, NULL, timeout, post, 0, result, headers);
          // Check for errors
          if(res == -1)
          {         Print("Error in WebRequest. Error code = ", GetLastError());
                    //MessageBox("Add the address 'http://forexfactory.com/' in the\nlist of allowed URLs on tab 'Expert Advisors'", "Error", MB_ICONINFORMATION);//
          }
          else
          {         // Convert character array to a string
                    HTML = CharArrayToString(result);
                    // Calendar loaded, make sure it's for today's date
                    int i = StringFind(HTML, "<span class=\"date\">");
                    if(i == -1) return(false);
                    HTML = StringSubstr(HTML, i);
                    string date = GetHTMLElement(HTML, "<span>", "</span>");
                    if(date != MthName(Month()) + " " + DoubleToStr(Day(), 0)) return(false);
                    // Now get table rows for each event
                    lasttime = NULL;
                    date = DoubleToStr(Year(), 0) + "." + DoubleToStr(Month(), 0) + "." + DoubleToStr(Day(), 0) + " ";
                    do
                    {         // Get event information
                              time = GetHTMLElement(HTML, "<td class=\"calendar__cell calendar__time time\">", "</td>");
                              if(StringFind(time, "<a name=\"upnext\"") == 0) time = GetHTMLElement(time, "class=\"upnext\">", "</span>");
                              if(StringLen(time) != 0) lasttime = time;
                              if(StringLen(time) == 0) time = lasttime;
                              // If the time has 'pm' in it, add 12 hours.  StrToTime only understands a 24 hour clock.
                              if(StringFind(time, "pm") != -1) time = TimeToStr(StrToTime(time) + (12 * 60 * 60));
                              time = date + time;
                              // Get the other elements we need
                              currency = GetHTMLElement(HTML, "<td class=\"calendar__cell calendar__currency currency\">", "</td>");
                              impact = GetHTMLElement(HTML, "<span title=\"", "\" class=\"");
                              i = StringFind(impact, " Impact");
                              if(i != -1) impact = StringSubstr(impact, 0, i);
                              title = GetHTMLElement(HTML, "\"calendar__event-title\">", "</span>");
                              // Is this a high impact event for my currency pair?
                              if(StringFind(Symbol(), currency) != -1 && impact == "High")
                              {         // Add to daily event structure
                                        DailyEvents[cntr].displayed = false;
                                        DailyEvents[cntr].time = time;
                                        DailyEvents[cntr].title = title;
                                        DailyEvents[cntr++].currency = currency; }
                              // Cut HTML string to the next table row
                              i = StringFind(HTML, "</tbody> </table> </td> </tr> ");
                              if(i != -1) HTML = StringSubstr(HTML, i + 30);
                              if(StringFind(HTML, "</table> <div class=\"foot\">") == 0) i = -1; }
                    while(i != -1 || cntr == MaxDailyEvents); }
          // Display the high impact events, if any
          lasttime = NULL;
          for(cntr = 0; cntr < MaxDailyEvents; cntr++)
          {         if(StringLen(DailyEvents[cntr].time) == 0) break;
                    // Create event marker on chart if last market wasn't the same time
                    if(lasttime != DailyEvents[cntr].time)
                    {         res = cntr;
                              if(ObjectCreate(0, "Event" + DoubleToStr(cntr, 0), OBJ_EVENT, 0, StrToTime(DailyEvents[cntr].time), 0))
                              {         ObjectSetString(0, "Event" + DoubleToStr(cntr, 0), OBJPROP_TEXT, DailyEvents[cntr].title + " (" + DailyEvents[cntr].currency + ")");
                                        ObjectSetInteger(0, "Event" + DoubleToStr(cntr, 0), OBJPROP_COLOR, Red);
                                        ObjectSetInteger(0, "Event" + DoubleToStr(cntr, 0), OBJPROP_WIDTH, 2);
                                        ObjectSetInteger(0, "Event" + DoubleToStr(cntr, 0), OBJPROP_BACK, true);
                                        ObjectSetInteger(0, "Event" + DoubleToStr(cntr, 0), OBJPROP_SELECTABLE, false);
                                        ObjectSetInteger(0, "Event" + DoubleToStr(cntr, 0), OBJPROP_SELECTED, false);
                                        ObjectSetInteger(0, "Event" + DoubleToStr(cntr, 0), OBJPROP_HIDDEN, true);
                                        ObjectSetString(0, "Event" + DoubleToStr(cntr, 0), OBJPROP_TOOLTIP, DailyEvents[cntr].title + " (" + DailyEvents[cntr].currency + ")"); }
                              // Create vertical line if event is in the future
                              if(TimeCurrent() < StrToTime(DailyEvents[cntr].time))
                              {         if(ObjectCreate(0, "VLine" + DoubleToStr(cntr, 0), OBJ_VLINE, 0, StrToTime(DailyEvents[cntr].time), 0))
                                        {         ObjectSetInteger(0, "VLine" + DoubleToStr(cntr, 0), OBJPROP_COLOR, Red);
                                                  ObjectSetInteger(0, "VLine" + DoubleToStr(cntr, 0), OBJPROP_WIDTH, 1);
                                                  ObjectSetInteger(0, "VLine" + DoubleToStr(cntr, 0), OBJPROP_BACK, true);
                                                  ObjectSetInteger(0, "VLine" + DoubleToStr(cntr, 0), OBJPROP_SELECTABLE, false);
                                                  ObjectSetInteger(0, "VLine" + DoubleToStr(cntr, 0), OBJPROP_SELECTED, false);
                                                  ObjectSetInteger(0, "VLine" + DoubleToStr(cntr, 0), OBJPROP_HIDDEN, true);
                                                  ObjectSetString(0, "VLine" + DoubleToStr(cntr, 0), OBJPROP_TOOLTIP, DailyEvents[cntr].title + " (" + DailyEvents[cntr].currency + ")");
                                                  ObjectSetInteger(0, "VLine" + DoubleToStr(cntr, 0), OBJPROP_TIMEFRAMES, OBJ_PERIOD_M1 | OBJ_PERIOD_M5 | OBJ_PERIOD_M15 | OBJ_PERIOD_M30 | OBJ_PERIOD_H1); } }
                              else
                                        DailyEvents[cntr].displayed = true; }
                    else
                    {         title = ObjectGetString(0, "Event" + DoubleToStr(res, 0), OBJPROP_TOOLTIP);
                              title += "\n" + DailyEvents[cntr].title + " (" + DailyEvents[cntr].currency + ")";
                              ObjectSetString(0, "Event" + DoubleToStr(res, 0), OBJPROP_TOOLTIP, title);
                              if(TimeCurrent() < StrToTime(DailyEvents[cntr].time)) ObjectSetString(0, "Vline" + DoubleToStr(res, 0), OBJPROP_TOOLTIP, title); }
                    lasttime = DailyEvents[cntr].time; }
          // Exit
          return(true); }

//+------------------------------------------------------------------+
//| Return the long or short month name
//+------------------------------------------------------------------+
string CChartObjectEventNews::MthName(int Mth, bool ShortName = true)
{         switch(Mth)
          {         case 1:
                              return((ShortName ? "Jan" : "January"));
                              break;
                    case 2:
                              return((ShortName ? "Feb" : "February"));
                              break;
                    case 3:
                              return((ShortName ? "Mar" : "March"));
                              break;
                    case 4:
                              return((ShortName ? "Apr" : "April"));
                              break;
                    case 5:
                              return((ShortName ? "May" : "May"));
                              break;
                    case 6:
                              return((ShortName ? "Jun" : "June"));
                              break;
                    case 7:
                              return((ShortName ? "Jul" : "July"));
                              break;
                    case 8:
                              return((ShortName ? "Aug" : "August"));
                              break;
                    case 9:
                              return((ShortName ? "Sep" : "September"));
                              break;
                    case 10:
                              return((ShortName ? "Oct" : "October"));
                              break;
                    case 11:
                              return((ShortName ? "Nov" : "November"));
                              break;
                    case 12:
                              return((ShortName ? "Dec" : "December"));
                              break; }
          // Unknown month
          return("?"); }

//+------------------------------------------------------------------+
//| END OF CODE
//+------------------------------------------------------------------+
color CChartObjectEventNews::Color(void) const
{
//--- check
          if(m_chart_id == -1)
                    return(CLR_NONE);
//--- result
          return((color)ObjectGetInteger(m_chart_id, m_name, OBJPROP_COLOR)); //
}
//+------------------------------------------------------------------+
//| Set object color                                                 |
//+------------------------------------------------------------------+
bool CChartObjectEventNews::Color(const color new_color) const
{
//--- check
          if(m_chart_id == -1)
                    return(false);
//--- result
          return(ObjectSetInteger(m_chart_id, m_name, OBJPROP_COLOR, new_color)); //
}
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//|                                                                  |
//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//| Writing parameters of object to file                             |
//+------------------------------------------------------------------+
//bool C_EventsNews::Save(const int file_handle)
//{         int    len;
//          string str;
////--- check
//          if(file_handle == INVALID_HANDLE || m_chart_id == -1)
//                    return(false);
////--- write
//          if(!CChartObject_MQL4::Save(file_handle))
//                    return(false);
////--- write value of the "X-distance" property
//          if(FileWriteInteger(file_handle, (int)ObjectGetInteger(m_chart_id, m_name, OBJPROP_XDISTANCE), INT_VALUE) != sizeof(int))
//                    return(false);
////--- write value of the "Y-distance" property
//          if(FileWriteInteger(file_handle, (int)ObjectGetInteger(m_chart_id, m_name, OBJPROP_YDISTANCE), INT_VALUE) != sizeof(int))
//                    return(false);
////--- write value of the "Corner" property
//          if(FileWriteInteger(file_handle, (int)ObjectGetInteger(m_chart_id, m_name, OBJPROP_CORNER), INT_VALUE) != sizeof(int))
//                    return(false);
////--- write value of the "filename bmp-ON" property
//          str = ObjectGetString(m_chart_id, m_name, OBJPROP_BMPFILE, 0);
//          len = StringLen(str);
//          if(FileWriteInteger(file_handle, len, INT_VALUE) != INT_VALUE)
//                    return(false);
//          if(len != 0 && FileWriteString(file_handle, str, len) != len)
//                    return(false);
////--- write value of the "filename bmp-OFF" property
//          str = ObjectGetString(m_chart_id, m_name, OBJPROP_BMPFILE, 1);
//          len = StringLen(str);
//          if(FileWriteInteger(file_handle, len, INT_VALUE) != INT_VALUE)
//                    return(false);
//          if(len != 0 && FileWriteString(file_handle, str, len) != len)
//                    return(false);
////--- write state
//          if(FileWriteLong(file_handle, ObjectGetInteger(m_chart_id, m_name, OBJPROP_STATE)) != sizeof(long))
//                    return(false);
////--- successful
//          return(true); //
//}
////+------------------------------------------------------------------+
////| Reading object parameters from file                              |
////+------------------------------------------------------------------+
//bool C_EventsNews::Load(const int file_handle)
//{         int    len;
//          string str;
////--- check
//          if(file_handle == INVALID_HANDLE || m_chart_id == -1)
//                    return(false);
////--- read
//          if(!CChartObject_MQL4::Load(file_handle))
//                    return(false);
////--- read value of the "X-distance" property
//          if(!ObjectSetInteger(m_chart_id, m_name, OBJPROP_XDISTANCE, FileReadInteger(file_handle, INT_VALUE)))
//                    return(false);
////--- read value of the "Y-distance" property
//          if(!ObjectSetInteger(m_chart_id, m_name, OBJPROP_YDISTANCE, FileReadInteger(file_handle, INT_VALUE)))
//                    return(false);
////--- read value of "Corner" property
//          if(!ObjectSetInteger(m_chart_id, m_name, OBJPROP_CORNER, FileReadInteger(file_handle, INT_VALUE)))
//                    return(false);
////--- read value of the "filename bmp-ON" property
//          len = FileReadInteger(file_handle, INT_VALUE);
//          str = (len != 0) ? FileReadString(file_handle, len) : "";
//          if(!ObjectSetString(m_chart_id, m_name, OBJPROP_BMPFILE, 0, str))
//                    return(false);
////--- read value of the "filename bmp-OFF" property
//          len = FileReadInteger(file_handle, INT_VALUE);
//          str = (len != 0) ? FileReadString(file_handle, len) : "";
//          if(!ObjectSetString(m_chart_id, m_name, OBJPROP_BMPFILE, 1, str))
//                    return(false);
////--- read state
//          if(!ObjectSetInteger(m_chart_id, m_name, OBJPROP_STATE, FileReadLong(file_handle)))
//                    return(false);
////--- successful
//          return(true);//
//}

//+------------------------------------------------------------------+
