//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+

//|                                        Automated Trend Lines.mq4 |
#property strict
/*
 * This script automates the generation and plotting of sloping trend
 * lines and horizontal trend lines using swing points as reference
 * points.
 * v1.0 = MetaTrader 4 version released 20120709
 * v1.1 = Trend lines AutoTrend_now have the ability to be extended after they have
 *        been broken by setting AutoTrend_lineLife variable.
 * v1.2 = Make trend line EA viewable on the weekends when market is
 *        closed.
 * v1.2.1 = Delete all objects when deinitialised.
 * v1.2.2 = Delete all objects when change of bar made.
 * v2.0 = Operates on time frame of chart, AutoTrend_level variable added to determine
 *        amount of swing points used to create turning point.
 */

datetime AutoTrend_now;
double AutoTrend_pad;
extern int AutoTrend_level = 3; // how many swing points to use to form a major turning point: Min = 0 Max = 3
string AutoTrend_bot = "^"; // symbol used to designate AutoTrend_bottom (trough)
string AutoTrend_top = "^"; // symbol used to designate AutoTrend_top (peak)
int AutoTrend_fontSize = 10; // size of font for symbols and text
int AutoTrend_lineLife = 30; // how many bars after a broken line do you want to see?
int AutoTrend_brk = 2; // number of breaks needed for trend line to be considered broken
int AutoTrend_tch = 2; // number of touches needed for trend line to be drawn
bool AutoTrend_body = false; // are candle bodies considered a break? Yes = true, No (only closes) = false
string AutoTrend_fontFace = "Times New Roman"; // style of font
int AutoTrend_resColour = Red;
int AutoTrend_supColour = Blue;
int AutoTrend_slresColour = LightPink;
int AutoTrend_slsupColour = LightBlue;
//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+
class SignalDatas_TrendLineAuto
{
public:
          SignalDatas_TrendLineAuto(void) {initer();};
          ~SignalDatas_TrendLineAuto(void) {};
          //---------
          int initer();
          int starting();
          void plotLines( int AutoTrend_brk, bool AutoTrend_body, int AutoTrend_tch );
          string SignalDatas_TrendLineAuto::countHCrosses(int fromBar, int AutoTrend_brk, double rng, bool pk, bool AutoTrend_body);
          string SignalDatas_TrendLineAuto::countSlopingCrosses(int fromBar, int toBar, int AutoTrend_brk, double rng, bool pk, bool AutoTrend_body);
          //---------
          void Update()
          {         starting();//
          }

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int SignalDatas_TrendLineAuto::initer()
{
//----
          // remove all objects from the chart
          // if you draw your own trend lines you may want to delete this
          ObjectsDeleteAll(0, "TrendLineAuto_");
          // if the last bar is greater than the current local time PLUS an offset
          // then we are exhibiting a weekend or broker holiday
          // to calculate your offset, subtract your local GMT time by the server.
          // At present Pepperstone exhibits GMT+3:
          // https://pepperstone.com/forex-news/mt4-server-time-change-on-12th-march
          int offset = 7 * 60; // Therefore, my calcs are => 7 hours (x 60 minutes) = GMT+10 (local) - GMT+3 (server)
          if ( TimeLocal() - TimeCurrent() > (offset / Period()) )
          {         starting(); }
//----
          return(0); }

//+------------------------------------------------------------------+
//| expert start function                                            |
//+------------------------------------------------------------------+
int SignalDatas_TrendLineAuto::starting()
{
//----
          AutoTrend_pad = MarketInfo(Symbol(), MODE_POINT) * Period(); // add AutoTrend_padding for the text display on price
          // only needs to be done at the change of every TF bar
          if ( AutoTrend_now != Time[0] )
          {         ObjectsDeleteAll(0, "TrendLineAuto_");
                    plotLines( AutoTrend_brk, AutoTrend_body, AutoTrend_tch );
                    AutoTrend_now = Time[0];
                    //
          }
//----
          return(0); }
//+------------------------------------------------------------------+

/*
 * In this function we will plot our trend lines automatically based
 * upon identifying swing points.
 * @param sym  string Symbol of currency being analysed
 * @param TF   int TimeFrame of chart being analysed
 * @param AutoTrend_brk  int Number of breaks before trend line considered to be null
 * @param AutoTrend_body bool Are opens beyond the trend line considered a break? TRUE = yes
 * @param AutoTrend_tch  int How many touches are needed to be considered a significant trend line?
 * @return void
 */

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SignalDatas_TrendLineAuto::plotLines( int _AutoTrend_brk, bool _AutoTrend_body, int _AutoTrend_tch )
{         /*
           int pkArr[1]; // lowest peak array good for weekly+ timeframes
                    int trArr[1]; // good for daily timeframe
                    int pk0A, pk0B, pk0C, pk1A, pk1B, pk1C; // good for 4H timeframe
                    int p = 0; // counters for their respective peak arrays
                    int tr0A, tr0B, tr0C, tr1A, tr1B, tr1C; // good for 4H timeframe
                    int t = 0; // counters for their respective trough arrays
                    double slope, endLine, xLine;
                    for ( int i = 1; i < Bars - 100; i++ )
                    {         if ( High[i + 1] > High[i] && High[i + 1] >= High[i + 2] )
                              {         pk0C = pk0B;
                                        pk0B = pk0A;
                                        pk0A = i + 1;
                                        if ( AutoTrend_level < 1 )
                                        {         if ( p > 0 )
                                                  {         ArrayResize( pkArr, p + 1 ); }
                                                  pkArr[p] = i + 1;
                                                  //ObjectDelete("Pk@" + pk0A);
                                                  ObjectCreate( "TrendLineAuto_"+"Pk@" + pk0A, OBJ_TEXT, 0, Time[pk0A], High[pk0A] + AutoTrend_pad);
                                                  ObjectSetText( "TrendLineAuto_"+"Pk@" + pk0A, AutoTrend_top, AutoTrend_fontSize, AutoTrend_fontFace, AutoTrend_resColour);
                                                  p++; }
                                        else if ( pk0C > 0 && High[pk0B] > High[pk0A] && High[pk0B] >= High[pk0C] )
                                        {         pk1C = pk1B;
                                                  pk1B = pk1A;
                                                  pk1A = pk0B;
                                                  if ( AutoTrend_level < 2 )
                                                  {         if ( p > 0 )
                                                            {         ArrayResize( pkArr, p + 1 ); }
                                                            pkArr[p] = pk0B;
                                                            //ObjectDelete("Pk@" + pk0B);
                                                            ObjectCreate( "TrendLineAuto_"+"Pk@" + pk0B, OBJ_TEXT, 0, Time[pk0B], High[pk0B] + AutoTrend_pad);
                                                            ObjectSetText( "TrendLineAuto_"+"Pk@" + pk0B, AutoTrend_top, AutoTrend_fontSize, AutoTrend_fontFace, AutoTrend_resColour );
                                                            p++; }
                                                  else if ( pk1C > 0 && High[pk1B] > High[pk1A] && High[pk1B] >= High[pk1C] )
                                                  {         if ( p > 0 )
                                                            {         ArrayResize( pkArr, p + 1 ); }
                                                            pkArr[p] = pk1B;
                                                            //Print( sym + " p " + pk0C );
                                                            // any conditions put in here
                                                            //ObjectDelete("Pk@" + pk1B);
                                                            ObjectCreate( "TrendLineAuto_"+"Pk@" + pk1B, OBJ_TEXT, 0, Time[pk1B], High[pk1B] + AutoTrend_pad);
                                                            ObjectSetText( "TrendLineAuto_"+"Pk@" + pk1B, AutoTrend_top, AutoTrend_fontSize, AutoTrend_fontFace, AutoTrend_resColour );
                                                            p++; } } }
                              if ( Low[i + 1] < Low[i] && Low[i + 1] <= Low[i + 2] )
                              {         tr0C = tr0B;
                                        tr0B = tr0A;
                                        tr0A = i + 1;
                                        if ( AutoTrend_level < 1 )
                                        {         if ( t > 0 )
                                                  {         ArrayResize( trArr, t + 1 ); }
                                                  trArr[t] = i + 1;
                                                  //ObjectDelete("Tr@" + tr0A);
                                                  ObjectCreate( "TrendLineAuto_"+"Tr@" + tr0A, OBJ_TEXT, 0, Time[tr0A], High[tr0A] - AutoTrend_pad);
                                                  ObjectSetText( "TrendLineAuto_"+"Tr@" + tr0A, AutoTrend_bot, AutoTrend_fontSize, AutoTrend_fontFace, AutoTrend_supColour );
                                                  t++; }
                                        else if ( tr0C > 1 && Low[tr0B] < Low[tr0A] && Low[tr0B] <= Low[tr0C] )
                                        {         tr1C = tr1B;
                                                  tr1B = tr1A;
                                                  tr1A = tr0B;
                                                  if ( AutoTrend_level < 2 )
                                                  {         if ( t > 0 )
                                                            {         ArrayResize( trArr, t + 1 ); }
                                                            trArr[t] = tr0B;
                                                            //ObjectDelete("Tr@" + tr0B);
                                                            ObjectCreate( "TrendLineAuto_"+"Tr@" + tr0B, OBJ_TEXT, 0, Time[tr0B], High[tr0B] - AutoTrend_pad);
                                                            ObjectSetText( "TrendLineAuto_"+"Tr@" + tr0B, AutoTrend_bot, AutoTrend_fontSize, AutoTrend_fontFace, AutoTrend_supColour );
                                                            t++; }
                                                  else if ( tr1C > 0 && Low[tr1B] < Low[tr1A] && Low[tr1B] <= Low[tr1C] )
                                                  {         if ( t > 0 )
                                                            {         ArrayResize(trArr, t + 1); }
                                                            trArr[t] = tr1B;
                                                            // any conditions go here
                                                            //ObjectDelete("Tr@" + tr1B);
                                                            ObjectCreate( "TrendLineAuto_"+"Tr@" + tr1B, OBJ_TEXT, 0, Time[tr1B], Low[tr1B] - AutoTrend_pad);
                                                            ObjectSetText( "TrendLineAuto_"+"Tr@" + tr1B, AutoTrend_bot, AutoTrend_fontSize, AutoTrend_fontFace, AutoTrend_supColour );
                                                            t++; } } } } // end for-bars loop
                    // AutoTrend_now that we have obtained our swing points let's create our sloping and
                    // horizontal trendlines by going through each point.
                    // we'll loop through the highest PEAK array first
                    string u;
                    int x, a, j;
                    if ( ArraySize(pkArr) > 1 )
                    {         // we will sort the array so that the closest bars are at the end of the array
                              ArraySort( pkArr, WHOLE_ARRAY, 0, MODE_DESCEND );
                              a = ArraySize(pkArr);
                              for ( int i = 0; i < a; i++ )
                              {         u = countHCrosses(pkArr[i], AutoTrend_brk, 0, true, AutoTrend_body);
                                        t = StrToInteger(StringSubstr(u, 0, StringFind(u, ",")));
                                        x = StrToInteger(StringSubstr(u, StringFind(u, ",") + 1, StringLen(u) - StringFind(u, ",") - 1));
                                        if ( t > AutoTrend_tch && x <= AutoTrend_lineLife )
                                        {         //ObjectDelete("Res@" + pkArr[i]);
                                                  ObjectCreate( "TrendLineAuto_"+"Res@" + pkArr[i], OBJ_TREND, 0, Time[pkArr[i]], High[pkArr[i]], Time[x], High[pkArr[i]] );
                                                  ObjectSet( "TrendLineAuto_"+"Res@" + pkArr[i], OBJPROP_STYLE, STYLE_SOLID );
                                                  ObjectSet( "TrendLineAuto_"+"Res@" + pkArr[i], OBJPROP_COLOR, AutoTrend_resColour );
                                                  //ObjectDelete("ResText@" + pkArr[i]);
                                                  ObjectCreate( "TrendLineAuto_"+"ResText@" + pkArr[i], OBJ_TEXT, 0, Time[pkArr[i]], High[pkArr[i]] + AutoTrend_pad);
                                                  ObjectSetText( "TrendLineAuto_"+"ResText@" + pkArr[i], DoubleToStr(High[pkArr[i]], MarketInfo(Symbol(), MODE_DIGITS)), AutoTrend_fontSize, AutoTrend_fontFace, AutoTrend_resColour );
                                                  Print( Symbol() + "TrendLineAuto_"+" res@ " + DoubleToStr(High[pkArr[i]], MarketInfo(Symbol(), MODE_DIGITS)) + " t:" + AutoTrend_tch + " dist:" +
                                                         DoubleToStr( (High[pkArr[i]] - MarketInfo(Symbol(), MODE_ASK)) / (MarketInfo(Symbol(), MODE_POINT) * 10), 1 ));
                                                  if ( x > 0 )
                                                  {         ObjectSet( "TrendLineAuto_"+"Res@" + pkArr[i], OBJPROP_RAY, false );
                                                            //ObjectDelete("BrokenRes@" + pkArr[i]);
                                                            ObjectCreate( "TrendLineAuto_"+"BrokenRes@" + pkArr[i], OBJ_TREND, 0, Time[x], High[pkArr[i]], Time[0], High[pkArr[i]] );
                                                            ObjectSet( "TrendLineAuto_"+"BrokenRes@" + pkArr[i], OBJPROP_RAY, true );
                                                            ObjectSet( "TrendLineAuto_"+"BrokenRes@" + pkArr[i], OBJPROP_STYLE, STYLE_DOT );
                                                            ObjectSet( "TrendLineAuto_"+"BrokenRes@" + pkArr[i], OBJPROP_COLOR, AutoTrend_resColour ); } }
                                        // here we will be checking against sloping trend lines
                                        for ( j = i + 1; j < a; j++ )
                                        {         u = countSlopingCrosses(pkArr[i], pkArr[j], AutoTrend_brk, 0, true, AutoTrend_body);
                                                  t = StrToInteger(StringSubstr(u, 0, StringFind(u, ",")));
                                                  x = StrToInteger(StringSubstr(u, StringFind(u, ",") + 1, StringLen(u) - StringFind(u, ",") - 1));
                                                  if ( t > AutoTrend_tch && x <= AutoTrend_lineLife )
                                                  {         slope = (High[pkArr[i]] - High[pkArr[j]]) / (pkArr[i] - pkArr[j]);
                                                            endLine = (slope * (0 - pkArr[i])) + High[pkArr[i]];
                                                            xLine = (slope * (x - pkArr[i])) + High[pkArr[i]];
                                                            //ObjectDelete("SlopeRes@" + pkArr[i]);
                                                            ObjectCreate( "TrendLineAuto_"+"SlopeRes@" + pkArr[i], OBJ_TREND, 0, Time[pkArr[i]], High[pkArr[i]], Time[x], xLine );
                                                            ObjectSet( "TrendLineAuto_"+"SlopeRes@" + pkArr[i], OBJPROP_STYLE, STYLE_SOLID );
                                                            ObjectSet( "TrendLineAuto_"+"SlopeRes@" + pkArr[i], OBJPROP_COLOR, AutoTrend_slresColour );
                                                            Print( Symbol() + "TrendLineAuto_"+" res@ " + DoubleToStr(endLine, MarketInfo(Symbol(), MODE_DIGITS)) + " t:" + AutoTrend_tch + " dist:" +
                                                                   DoubleToStr( (endLine - MarketInfo(Symbol(), MODE_ASK)) / (MarketInfo(Symbol(), MODE_POINT) * 10), 1 ));
                                                            if ( x > 0 )
                                                            {         ObjectSet( "TrendLineAuto_"+"SlopeRes@" + pkArr[i], OBJPROP_RAY, false );
                                                                      //ObjectDelete("BrokenSlopeRes@" + pkArr[i]);
                                                                      ObjectCreate( "TrendLineAuto_"+"BrokenSlopeRes@" + pkArr[i], OBJ_TREND, 0, Time[x], xLine, Time[0], endLine );
                                                                      ObjectSet( "TrendLineAuto_"+"BrokenSlopeRes@" + pkArr[i], OBJPROP_RAY, true );
                                                                      ObjectSet( "TrendLineAuto_"+"BrokenSlopeRes@" + pkArr[i], OBJPROP_STYLE, STYLE_DOT );
                                                                      ObjectSet( "TrendLineAuto_"+"BrokenSlopeRes@" + pkArr[i], OBJPROP_COLOR, AutoTrend_slresColour ); } } } } }
                    // AutoTrend_now we'll loop through the TROUGH array
                    if ( ArraySize(trArr) > 1 )
                    {         ArraySort( trArr, WHOLE_ARRAY, 0, MODE_DESCEND );
                              a = ArraySize(trArr);
                              for ( int i = 0; i < a; i++ )
                              {         u = countHCrosses(trArr[i], AutoTrend_brk, 0, false, AutoTrend_body);
                                        t = StrToInteger(StringSubstr(u, 0, StringFind(u, ",")));
                                        x = StrToInteger(StringSubstr(u, StringFind(u, ",") + 1, StringLen(u) - StringFind(u, ",") - 1));
                                        if ( t > AutoTrend_tch && x <= AutoTrend_lineLife )
                                        {         //ObjectDelete("Sup@" + trArr[i]);
                                                  ObjectCreate( "TrendLineAuto_"+"Sup@" + trArr[i], OBJ_TREND, 0, Time[trArr[i]], Low[trArr[i]], Time[x], Low[trArr[i]] );
                                                  ObjectSet( "TrendLineAuto_"+"Sup@" + trArr[i], OBJPROP_STYLE, STYLE_SOLID );
                                                  ObjectSet( "TrendLineAuto_"+"Sup@" + trArr[i], OBJPROP_COLOR, AutoTrend_supColour );
                                                  //ObjectDelete("SupText@" + trArr[i]);
                                                  ObjectCreate( "TrendLineAuto_"+"SupText@" + trArr[i], OBJ_TEXT, 0, Time[trArr[i]], Low[trArr[i]] - AutoTrend_pad);
                                                  ObjectSetText( "TrendLineAuto_"+"SupText@" + trArr[i], DoubleToStr(Low[trArr[i]], MarketInfo(Symbol(), MODE_DIGITS)), AutoTrend_fontSize, AutoTrend_fontFace, AutoTrend_supColour );
                                                  ObjectSet( "TrendLineAuto_"+"SupText@" + trArr[i], OBJPROP_COLOR, AutoTrend_supColour );
                                                  Print( Symbol() + "TrendLineAuto_"+" sup@ " + DoubleToStr(Low[trArr[i]], MarketInfo(Symbol(), MODE_DIGITS)) + " t:" + AutoTrend_tch + " dist:" +
                                                         DoubleToStr( (MarketInfo(Symbol(), MODE_BID) - Low[trArr[i]]) / (MarketInfo(Symbol(), MODE_POINT) * 10), 1 ));
                                                  if ( x > 0 )
                                                  {         ObjectSet( "TrendLineAuto_"+"Sup@" + trArr[i], OBJPROP_RAY, false );
                                                            //ObjectDelete("BrokenSup@" + trArr[i]);
                                                            ObjectCreate( "TrendLineAuto_"+"BrokenSup@" + trArr[i], OBJ_TREND, 0, Time[x], Low[trArr[i]], Time[0], Low[trArr[i]] );
                                                            ObjectSet( "TrendLineAuto_"+"BrokenSup@" + trArr[i], OBJPROP_RAY, true );
                                                            ObjectSet( "TrendLineAuto_"+"BrokenSup@" + trArr[i], OBJPROP_STYLE, STYLE_DOT );
                                                            ObjectSet( "TrendLineAuto_"+"BrokenSup@" + trArr[i], OBJPROP_COLOR, AutoTrend_supColour ); } }
                                        // here we will be checking against sloping trend lines
                                        for ( j = i + 1; j < a; j++ )
                                        {         u = countSlopingCrosses(trArr[i], trArr[j], AutoTrend_brk, 0, false, AutoTrend_body);
                                                  t = StrToInteger(StringSubstr(u, 0, StringFind(u, ",")));
                                                  x = StrToInteger(StringSubstr(u, StringFind(u, ",") + 1, StringLen(u) - StringFind(u, ",") - 1));
                                                  if ( t > AutoTrend_tch && x <= AutoTrend_lineLife )
                                                  {         slope = (Low[trArr[i]] - Low[trArr[j]]) / (trArr[i] - trArr[j]);
                                                            endLine = (slope * (0 - trArr[i])) + Low[trArr[i]];
                                                            xLine = (slope * (x - trArr[i])) + Low[trArr[i]];
                                                            //ObjectDelete("SlopeSup@" + trArr[i]);
                                                            ObjectCreate( "TrendLineAuto_"+"SlopeSup@" + trArr[i], OBJ_TREND, 0, Time[trArr[i]], Low[trArr[i]], Time[x], xLine );
                                                            ObjectSet( "TrendLineAuto_"+"SlopeSup@" + trArr[i], OBJPROP_STYLE, STYLE_SOLID );
                                                            ObjectSet( "TrendLineAuto_"+"SlopeSup@" + trArr[i], OBJPROP_COLOR, AutoTrend_slsupColour );
                                                            Print( Symbol() + "TrendLineAuto_"+" sup@ " + DoubleToStr(endLine, MarketInfo(Symbol(), MODE_DIGITS)) + " t:" + AutoTrend_tch + " dist:" +
                                                                   DoubleToStr( (MarketInfo(Symbol(), MODE_BID) - endLine) / (MarketInfo(Symbol(), MODE_POINT) * 10), 1 ));
                                                            if ( x > 0 )
                                                            {         ObjectSet( "TrendLineAuto_"+"SlopeSup@" + trArr[i], OBJPROP_RAY, false );
                                                                      //ObjectDelete("BrokenSlopeSup@" + trArr[i]);
                                                                      ObjectCreate( "TrendLineAuto_"+"BrokenSlopeSup@" + trArr[i], OBJ_TREND, 0, Time[x], xLine, Time[0], endLine );
                                                                      ObjectSet( "TrendLineAuto_"+"BrokenSlopeSup@" + trArr[i], OBJPROP_RAY, true );
                                                                      ObjectSet( "TrendLineAuto_"+"BrokenSlopeSup@" + trArr[i], OBJPROP_STYLE, STYLE_DOT );
                                                                      ObjectSet( "TrendLineAuto_"+"BrokenSlopeSup@" + trArr[i], OBJPROP_COLOR, AutoTrend_slsupColour ); } } } } }
                                                                      */
}

/*
 * With this function we will count how many crosses and how many touches there have
 * been on an horizontal trend line. If the quantity of crosses exceeds the number of
 * breaks we will return the last bar when crosses == AutoTrend_brk, otherwise we will return
 * 0, meaning the trend line is still alive.
 * @param sym     string Symbol of the currency being analysed
 * @param TF      int Timeframe of the symbol being analysed
 * @param fromBar int Starting point - going all the way to 1 NOT 0
 * @param AutoTrend_brk     int Max number of breaks allowed
 * @param rng     double Allowable distance H/L price can be considered touched/broken (not used on breaks)
 * @param pk      bool If line is resistance make it "true" otherwise "false"
 * @param AutoTrend_body    bool Is the AutoTrend_body of a candle considered to be a cross? TRUE = yes, FALSE = no
 * @return string  touches,crosses
 * TODO - add capacity to signal/colour bars responsible for touching (may not be evident with rng)
 */
string SignalDatas_TrendLineAuto::countHCrosses(int fromBar, int _AutoTrend_brk, double rng, bool pk, bool _AutoTrend_body)
{         int t = 0, x = 0, lastCross = 0;
          bool flag=0;
          for ( int i = fromBar; i > 0; i-- )
          {         flag = true;
                    if ( pk == true )
                    {         // watching the highs
                              if ( High[i] + rng >= High[fromBar] )
                              {         t++; }
                              if ( _AutoTrend_body == true && Open[i] > High[fromBar] )
                              {         flag = false; // need to make sure we don't double count if the close has broken above too!
                                        x++; }
                              if ( flag == true && Close[i] > High[fromBar] )
                              {         x++; } }
                    else
                    {         // watching the lows
                              if ( Low[i] - rng <= Low[fromBar] )
                              {         t++; }
                              if ( _AutoTrend_body == true && Open[i] < Low[fromBar] )
                              {         flag = false;
                                        x++; }
                              if ( flag == true && Close[i] < Low[fromBar] )
                              {         x++; } }
                    if ( x > _AutoTrend_brk && _AutoTrend_brk > 0 )
                    {         lastCross = i;
                              break; } } // end for-bars loop
          return( StringConcatenate(t, ",", lastCross) ); }

/*
 * With this function we will count how many crosses and how many touches there have
 * been on a SLOPING trend line.
 * @param sym     string Symbol of the currency being analysed
 * @param TF      int Timeframe of the symbol being analysed
 * @param fromBar int Starting point - going all the way to 1 NOT 0
 * @param toBar   int Ending point of the trend line
 * @param AutoTrend_brk     int Max number of breaks allowed
 * @param rng     double Allowable distance H/L price can be considered touched/broken (not used on breaks)
 * @param pk      bool If line is resistance make it "true" otherwise "false"
 * @param AutoTrend_body    bool Is the AutoTrend_body of a candle considered to be a cross? TRUE = yes, FALSE = no
 * @return string  touches,crosses
 * TODO - add capacity to signal/colour bars responsible for touching (may not be evident with rng)
 */
string SignalDatas_TrendLineAuto::countSlopingCrosses(int fromBar, int toBar, int _AutoTrend_brk, double rng, bool pk, bool _AutoTrend_body)
{         int t=0, x=0, lastCross = 0;
          bool flag=0;
          double slope, val;
          // obtain the slope of the trend line
          if ( pk == true )
          {         slope = ((High[fromBar] - High[toBar]) / (fromBar - toBar)); }
          else
          {         slope = ((Low[fromBar] - Low[toBar]) / (fromBar - toBar)); }
          for ( int i = fromBar; i > 0; i-- )
          {         flag = true;
                    if ( pk == true )
                    {         // calculate the value of the trend line at "i"
                              val = (slope * (i - fromBar)) + High[fromBar];
                              if ( High[i] + rng >= val )
                              {         t++; }
                              if ( _AutoTrend_body == true && Open[i] > val )
                              {         flag = false; // need to make sure we don't double count if the close has broken above too!
                                        x++; }
                              if ( flag == true && Close[i] > val )
                              {         x++; } }
                    else
                    {         // calculate it's current value at bar "i"
                              val = (slope * (i - fromBar)) + Low[fromBar];
                              if ( Low[i] - rng <= val )
                              {         t++; }
                              if ( _AutoTrend_body == true && Open[i] < val )
                              {         flag = false;
                                        x++; }
                              if ( flag == true && Close[i] < val )
                              {         x++; } }
                    if ( x > _AutoTrend_brk && _AutoTrend_brk > 0 )
                    {         lastCross = i;
                              break; } } // end for-bars loop
          return( StringConcatenate(t, ",", lastCross) ); }
//+------------------------------------------------------------------+
