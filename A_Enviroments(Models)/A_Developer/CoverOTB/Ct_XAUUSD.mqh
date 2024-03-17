//+------------------------------------------------------------------+
//|                                                       Ct_XAUUSD.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
//---#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTC\tDevMarketDevSymbol.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOT\.CoverOT.mqh>;
//+------------------------------------------------------------------+
//|          IMPLANTING CLASS  C_SYMBOLS BEGIN-END                   |
//+------------------------------------------------------------------+

class Ct_XAUUSD//: C_SYMBOLS//accessProtected   ///---havy dependency to symbolManager
{
//===================================================================
private:
//===================================================================
public:
          void Ct_XAUUSD::Ct_XAUUSD() { RunCallFunction++; ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ERROR-Error",  __LINE__, __FUNCTION__); }
          void ~Ct_XAUUSD() {/*Alert("Deinit: ", __FUNCSIG__);*/};
          bool UPDATED;
          bool Update();
//===================================================================
          Ct_Market_Symbol    ct_Market_Symbol;
//===================================================================
          string                mName;
          datetime              __SymbolInfoSessionQuotefrom;
          datetime              __SymbolInfoSessionQuoteto;
          datetime              __SymbolInfoSessionTradefrom;
          datetime              __SymbolInfoSessionTradeto;

//===================================================================
          string                name;                // symbol name
          ENUM_DAY_OF_WEEK      day_of_week;         // day of the week
          uint                  session_index;       // session index
          datetime              from;                // session beginning time
          datetime              to;                   // session end time
//===================================================================Returns the zero-based day of week (0 means Sunday,1,2,3,4,5,6) of the specified date.
          ENUM_DAY_OF_WEEK      Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday;   // day of the week SUNDAY  MONDAY  TUESDAY  WEDNESDAY  THURSDAY  FRIDAY  SATURDAY
//===================================================================
          bool                  IsSymbolServerAvailableXAUUSDF;         //= SymbolSet.IsSymbolAvailable ( "ct_XAUUSD.F", false );
          bool                  IsSymbolMarketWatchAvailableXAUUSDF;    //= SymbolSet.IsSymbolAvailable ( "ct_XAUUSD.F", true );
//===================================================================
          bool                  Ct_XAUUSD::getSessionInfo(bool Type, string name, ENUM_DAY_OF_WEEK day_of_week, uint session_index);
//===================================================================
//===================================================================
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_XAUUSD::Update()
{         IsSymbolServerAvailableXAUUSDF        =  ct_Market_Symbol.IsSymbolAvailable ( "ct_XAUUSD.F", false );
          IsSymbolMarketWatchAvailableXAUUSDF   =  ct_Market_Symbol.IsSymbolAvailable ( "ct_XAUUSD.F", true );//
          return true;
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_XAUUSD::getSessionInfo(bool Type, string name_, ENUM_DAY_OF_WEEK day_of_week_, uint session_index_)
{
//===================================================================
          int j = (int)session_index_;
          int i = (int)day_of_week_;//
          IsSymbolMarketWatchAvailableXAUUSDF    = ct_Market_Symbol.IsSymbolAvailable ( "ct_XAUUSD.F", true );
          IsSymbolServerAvailableXAUUSDF         = ct_Market_Symbol.IsSymbolAvailable ( "ct_XAUUSD.F", false );
//===================================================================
//          switch()
//          {
////===================================================================
////===================================================================
//          }
//===================================================================SymbolInfoSessionQuote versus SymbolInfoSessionTrade
//SymbolInfoSessionTrade() is relevant (if I want to participate only in "Live" trading)?
          if(Type)
          {         for(i ; i  <= 6; i++)
                    {         for(j; j  <= 2; j++)
                              {         ct_Market_Symbol._Mql_.__SymbolInfoSessionTrade(name, (ENUM_DAY_OF_WEEK)i, j, from, to);// Allows receiving time of beginning and end of the specified trading sessions for a specified symbol and day of week.
                              }; //
                    };
                    //
          }
          else
          {         ct_Market_Symbol._Mql_.__SymbolInfoSessionQuote(name, day_of_week_, session_index_, from, to);// Allows receiving time of beginning and end of the specified quoting sessions for a specified symbol and day of week.
          };
//===================================================================
//===================================================================
          return true;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void  __OnStart ()
{         ENUM_DAY_OF_WEEK days [] =                    {  SUNDAY, MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY };// --- array with days of the week
          int size = ArraySize (days);// --- find the size of the array
          {         Print ( "Trading sessions:" );// --- display trading session data for all days// --- for the current financial instrument
                    for (int i = 0 ; i < size; i ++)    {PrintInfoForTradeSessions ( _Symbol, days [i]); } //
          }
          {         Print ( "Trading sessions:" );// --- display trading session data for all days// --- for the current financial instrument
                    for (int i = 0 ; i < size; i ++)  {PrintInfoForQuoteSessions ( _Symbol, days [i]); } //
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

// === CUSTOM FUNCTIONS ==============
// --- function to display trading session data
void PrintInfoForTradeSessions ( string f_symbol, ENUM_DAY_OF_WEEK f_day)
{
// ---
          datetime startSession, finishSession;
          uint sessionIndex = 0 ;
          bool sessionExist = true ;
// --- display a trading session
          while (sessionExist)
          {         // --- check if there is a trading session
                    sessionExist = SymbolInfoSessionTrade (f_symbol, f_day, sessionIndex, startSession, finishSession);
                    // --- if a trading session exists
                    if (sessionExist)
                    {         // --- display the day of the week, the session number
                              // --- and its start and end time
                              Print (DayToString (f_day), ": session index =", sessionIndex,
                                     ", start =", TimeToString (startSession, TIME_MINUTES ),
                                     ", end =", TimeToString (finishSession - 1, TIME_MINUTES | TIME_SECONDS )); //
                    }
                    // --- increase the session counter by 1
                    sessionIndex ++; //
          } //
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

// === CUSTOM FUNCTIONS ==============
// --- function to display the data of thetrading session
void  PrintInfoForQuoteSessions( string f_symbol, ENUM_DAY_OF_WEEK f_day)
{
// ---
          datetime startSession, finishSession;
          uint sessionIndex = 0 ;
          bool sessionExist = true ;
// --- display the trading session
          while (sessionExist)
          {         // --- check if there is a trading session
                    sessionExist = SymbolInfoSessionQuote (f_symbol, f_day, sessionIndex,
                                                           startSession, finishSession);
                    // --- if a trading session exists
                    if (sessionExist)
                    {         // --- display the day of the week, session number, start and end time
                              Print (DayToString (f_day), ": session index =", sessionIndex,
                                     ", start = ", TimeToString (startSession, TIME_MINUTES ),
                                     ", end = ", TimeToString (finishSession - 1, TIME_MINUTES | TIME_SECONDS )); }
                    // --- increase the session counter by 1
                    sessionIndex ++; //
          } //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

// --- function to return the day of the week as a text value
string DayToString ( ENUM_DAY_OF_WEEK f_day)
{         switch (f_day)
          {         case  SUNDAY :     return  "Sunday" ;
                    case  MONDAY :     return  "Monday" ;
                    case  TUESDAY :    return  "Tuesday" ;
                    case  WEDNESDAY : return  "Wednesday" ;
                    case  THURSDAY :   return  "Thursday" ;
                    case  FRIDAY :     return  "Friday" ;
                    case  SATURDAY :   return  "Saturday" ;
                    default :         return  "Unknown day of the week" ; }
          return ( "" ); //
}
//+------------------------------------------------------------------+
//|          IMPLANTING CLASS  C_SYMBOLS BEGIN-END                   |
//+------------------------------------------------------------------+
