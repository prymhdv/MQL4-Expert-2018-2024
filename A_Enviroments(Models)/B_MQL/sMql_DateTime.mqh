//+------------------------------------------------------------------+
//|                                         Ss_Mql_DateTime.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|             Class MyRoboTrader     BEGIN                         |
//+------------------------------------------------------------------+
class Ss_Mql_DateTime
{

          /*
          *Date and Time
          * This is the group of functions for working with data of datetime type (an integer that represents the number of seconds elapsed from 0 hours of January 1, 1970).
          * To arrange high-resolution counters and timers, use the GetTickCount() function, which produces values in milliseconds.
          //================================================================================================================================================================
          * Functionb                     Action
          * TimeCurrent                   Returns the last known server time (time of the last quote receipt) in the datetime format
          * TimeLocal                     Returns the local computer time in datetime format
          * TimeGMT                       Returns GMT in datetime format with the Daylight Saving Time by local time of the computer, where the client terminal is running
          * TimeDaylightSavings           Returns the sign of Daylight Saving Time switch
          * TimeGMTOffset                 Returns the current difference between GMT time and the local computer time in seconds, taking into account DST switch
          * TimeToStruct                  Converts a datetime value into a variable of MqlDateTime structure type
          * StructToTime                  Converts a variable of MqlDateTime structure type into a datetime value
          * Day                           Returns the current day of the month, i.e., the day of month of the last known server time
          * DayOfWeek                     Returns the current zero-based day of the week of the last known server time
          * DayOfYear                     Returns the current day of the year i.e., the day of year of the last known server time
          * Hour                          Returns the hour of the last known server time by the moment of the program start
          * Minute                        Returns the current minute of the last known server time by the moment of the program start
          * Month                         Returns the current month as number, i.e., the number of month of the last known server time
          * Seconds                       Returns the amount of seconds elapsed from the beginning of the current minute of the last known server time by the moment of the program start
          * TimeDay                       Returns the day of month of the specified date
          * TimeDayOfWeek                 Returns the zero-based day of week of the specified date
          * TimeDayOfYear                 Returns the day of year of the specified date
          * TimeHour                      Returns the hour of the specified time
          * TimeMinute                    Returns the minute of the specified time
          * TimeMonth                     Returns the month number of the specified time
          * TimeSeconds                   Returns the amount of seconds elapsed from the beginning of the minute of the specified time
          * TimeYear                      Returns year of the specified date
          * Year                          Returns the current year, i.e., the year of the last known server time
          *================================================================================================================================================================
          * What's new in MQL5
          * Added the MqlDateTime structure containing eight int type fields:
          * struct MqlDateTime
          * {
          * int year;           // year
          * int mon;            // month
          * int day;            // day
          * int hour;           // hour
          * int min;            // minutes
          * int sec;            // seconds
          * int day_of_week;    // day of week (0 - Sunday, 1 - Monday, ..., 6 - Saturday)
          * int day_of_year;    // number of a day in a year (January 1 has number 0)
          * };
          *================================================================================================================================================================
          * datetime     TimeCurrent();
          * datetime     TimeLocal();
          * datetime     TimeGMT();
          * int          TimeDaylightSavings();
          * int          TimeGMTOffset();                        TimeGMTOffset() =  TimeGMT() - TimeLocal()
          * void         TimeToStruct( datetime dt, MqlDateTime&  dt_struct );
          * datetime     StructToTime( MqlDateTime$  dt_struct );
          * int          Day();
          * int          DayOfWeek();                           // do not work on holidays. if(DayOfWeek()==0 || DayOfWeek()==6) return(0);
          * int          DayOfYear();
          * int          Hour();                                Returns the hour (0,1,2,..23) of the last known server time by the moment of the program start.
          * int          Minute();                              Returns the current minute (0,1,2,..59) of the last known server time by the moment of the program start.
          * int          Month();                               Returns the current month as number (1-January,2,3,4,5,6,7,8,9,10,11,12), i.e., the number of month of the last known server time.
          * int          Seconds();                             Returns the amount of seconds elapsed from the beginning of the current minute of the last known server time by the moment of the program start.
          * int          TimeDay(datetime date);                Returns the day of month (1 - 31) of the specified date.
          * int          TimeDayOfWeek( datetime date );        Returns the zero-based day of week (0 means Sunday,1,2,3,4,5,6) of the specified date.
          * int          TimeDayOfYear( datetime date );        Returns the day of year of the specified date.    Day (1 means 1 January,..,365(6) does 31 December) of year of the specified date.
          * int          TimeHour( datetime date );             Hour of the specified time.     int h=TimeHour(TimeCurrent());
          * int          TimeMinute( datetime date );           Minute (0-59) for the specified time.  int m=TimeMinute(TimeCurrent());
          * int          TimeMonth( datetime date );            Month number (1-January,2,3,4,5,6,7,8,9,10,11,12) of the specified time.
          * int          TimeSeconds( datetime date );          The amount of seconds elapsed from the beginning of the minute of the specified time. int m=TimeSeconds(TimeCurrent());
          * int          TimeYear( datetime date );             Year of the specified date. The returned value can be within the range of 1970 to 3000.    int y=TimeYear(TimeCurrent());
          * int          Year();                                At the testing, the last known server time is modelled.// return if the date is within the range from 1 Jan. to 30 Apr., 2006.  if(Year()==2006 && Month()<5)  return(0);
          *================================================================================================================================================================
          Datetime Type
          The datetime type is intended for storing the date and time as the number of seconds elapsed since January 01, 1970. This type occupies 8 bytes of memory.
          Constants of the date and time can be represented as a literal string, which consists of 6 parts showing the numerical value of the year, month, day (or day, month, year), hours, minutes and seconds. The constant is enclosed in single quotation marks and starts with the D character.
          Values range from 1 January, 1970 to 31 December, 3000. Either date (year , month, day) or time (hours, minutes, seconds), or all together can be omitted.
          With literal date specification, it is desirable that you specify year, month and day. Otherwise the compiler returns a warning about an incomplete entry.
          Examples:
          datetime NY=D'2015.01.01 00:00';     // Time of beginning of year 2015
          datetime d1=D'1980.07.19 12:30:27';  // Year Month Day Hours Minutes Seconds
          datetime d2=D'19.07.1980 12:30:27';  // Equal to D'1980.07.19 12:30:27';
          datetime d3=D'19.07.1980 12';        // Equal to D'1980.07.19 12:00:00'
          datetime d4=D'01.01.2004';           // Equal to D'01.01.2004 00:00:00'
          datetime compilation_date=__DATE__;             // Compilation date
          datetime compilation_date_time=__DATETIME__;    // Compilation date and time
          datetime compilation_time=__DATETIME__-__DATE__;// Compilation time
          //--- Examples of declarations after which compiler warnings will be returned
          datetime warning1=D'12:30:27';       // Equal to D'[date of compilation] 12:30:27'
          datetime warning2=D'';               // Equal to __DATETIME__
          //=================================================================================
          The string representation of datetime type depends on compilation mode:
          datetime date=D'2014.03.05 15:46:58';
          string str="mydate="+date;
          //--- str="mydate=1394034418" - without #property strict
          //--- str="mydate=2014.03.05 15:46:58" - with #property strict
          *================================================================================================================================================================
          */
private:
//===================================================================
public:
          void                  Ss_Mql_DateTime() {/*RunCallFunction++; ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ERROR-Error",  __LINE__, __FUNCTION__); */ }
          void                  ~Ss_Mql_DateTime() {};
          bool                  Update();
          //---functions ==========================================================
          datetime              _TimeCurrent()                  {return TimeCurrent();};                                                   //TimeCurrent();
          datetime              _TimeLocal()                    {return TimeLocal();};                                                     //TimeLocal();
          datetime              _TimeGMT()                      {return TimeGMT();};                                                       //TimeGMT();
          int                   _TimeDaylightSavings()          {return TimeDaylightSavings();};                                           //TimeDaylightSavings();
          int                   _TimeGMTOffset()                {return TimeGMTOffset();};                                                 //TimeGMTOffset();                        TimeGMTOffset() =  TimeGMT() - TimeLocal()
          bool                  _TimeToStruct(datetime dt, MqlDateTime& dt_struct) {TimeToStruct( dt, dt_struct ); return true;};
          datetime              _StructToTime(MqlDateTime&  dt_struct) {return StructToTime( dt_struct );};
          int                   _Day()                          {return Day();};
          int                   _DayOfWeek()                    {return DayOfWeek();};                                   // do not work on holidays. if(DayOfWeek()==0 || DayOfWeek()==6) return(0);
          int                   _DayOfYear()                    {return DayOfYear();};
          int                   _Hour()                         {return Hour();};                                        // Returns the hour (0,1,2,..23) of the last known server time by the moment of the program start.
          int                   _Minute()                       {return Minute();};                                      // Returns the current minute (0,1,2,..59) of the last known server time by the moment of the program start.
          int                   _Month()                        {return Month();};                                       // Returns the current month as number (1-January,2,3,4,5,6,7,8,9,10,11,12), i.e., the number of month of the last known server time.
          int                   _Seconds()                      {return Seconds();}                                      // Returns the amount of seconds elapsed from the beginning of the current minute of the last known server time by the moment of the program start.

          int                   _TimeDay(datetime date)         {return TimeDay(date);};               //Returns the day of month (1 - 31) of the specified date.
          int                   _TimeDayOfWeek(datetime date)   {return TimeDayOfWeek(date);};   //Returns the zero-based day of week (0 means Sunday,1,2,3,4,5,6) of the specified date.
          int                   _TimeDayOfYear(datetime date)   {return TimeDayOfYear(date);};   //Returns the day of year of the specified date.    Day (1 means 1 January,..,365(6) does 31 December) of year of the specified date.
          int                   _TimeHour(datetime date)        {return TimeHour(date);};             //Hour of the specified time.     int h=TimeHour(TimeCurrent());
          int                   _TimeMinute(datetime date)      {return TimeMinute(date);};         //Minute (0-59) for the specified time.  int m=TimeMinute(TimeCurrent());
          int                   _TimeMonth(datetime date)       {return TimeMonth(date);};           //Month number (1-January,2,3,4,5,6,7,8,9,10,11,12) of the specified time.
          int                   _TimeSeconds(datetime date)     {return TimeSeconds(date);};       //The amount of seconds elapsed from the beginning of the minute of the specified time. int m=TimeSeconds(TimeCurrent());
          int                   _TimeYear(datetime date)        {return TimeYear(date);};             //Year of the specified date. The returned value can be within the range of 1970 to 3000.    int y=TimeYear(TimeCurrent());
          int                   _Year()                         {return Year();} //
          //----
          datetime              _TimeCurrent_;
          datetime              _TimeLocal_;
          datetime              _TimeGMT_;
          int                   _TimeDaylightSavings_;
          int                   _TimeGMTOffset_;
          bool                  _TimeToStruct_;
          datetime              _StructToTime_;
          int                   _Day_;
          int                   _DayOfWeek_;
          int                   _DayOfYear_;
          int                   _Hour_;
          int                   _Minute_;
          int                   _Month_;
          int                   _Seconds_;

          int                   _TimeDay_;
          int                   _TimeDayOfWeek_;
          int                   _TimeDayOfYear_;
          int                   _TimeHour_;
          int                   _TimeMinute_;
          int                   _TimeMonth_;
          int                   _TimeSeconds_;
          int                   _TimeYear_;
          int                   _Year_;
          //----

//===================================================================
//KeyOffDayCandel     = (MarketInfo(Symbol(), MODE_TIME) == SATURDAY || MarketInfo(Symbol(), MODE_TIME) == SUNDAY) ; //ArrayCopySeries(daytimes,MODE_TIME,Symbol(),PERIOD_D1);
//===================================================================
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ss_Mql_DateTime::Update()
{
//===================================================================
          //================================
          //---functions ==========================================================
          _TimeCurrent_          = TimeCurrent();
          _TimeLocal_            = TimeLocal();
          _TimeGMT_              = TimeGMT();
          _TimeDaylightSavings_  = TimeDaylightSavings();
          _TimeGMTOffset_        = TimeGMTOffset();                      //        TimeGMTOffset() =  TimeGMT() - TimeLocal()
          //---TimeToStruct_         = TimeToStruct( datetime dt, MqlDateTime &  dt_struct );
          //---StructToTime_         = StructToTime( MqlDateTime&  dt_struct );
          _Day_                  = Day();
          _DayOfWeek_            = DayOfWeek();                          // do not work on holidays. if(DayOfWeek()==0 || DayOfWeek()==6) return(0);
          _DayOfYear_            = DayOfYear();
          _Hour_                 = Hour();                                //Returns the hour (0, 1, 2, ..23) of the last known server time by the moment of the program start.
          _Minute_               = Minute();                              //Returns the current minute (0, 1, 2, ..59) of the last known server time by the moment of the program start.
          _Month_                = Month();                               //Returns the current month as number (1 - January, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12), i.e., the number of month of the last known server time.
          _Seconds_              = Seconds();                             //Returns the amount of seconds elapsed from the beginning of the current minute of the last known server time by the moment of the program start.
          //---TimeDay_              = TimeDay(datetime date);                //Returns the day of month (1 - 31) of the specified date.
          //---TimeDayOfWeek_        = TimeDayOfWeek( datetime date );        //Returns the zero - based day of week (0 means Sunday, 1, 2, 3, 4, 5, 6) of the specified date.
          //---TimeDayOfYear_        = TimeDayOfYear( datetime date );        //Returns the day of year of the specified date.    Day (1 means 1 January, .., 365(6) does 31 December) of year of the specified date.
          //---TimeHour_             = TimeHour( datetime date );             //Hour of the specified time.     int h = TimeHour(TimeCurrent());
          //---TimeMinute_           = TimeMinute( datetime date );           //Minute (0 - 59) for the specified time.  int m = TimeMinute(TimeCurrent());
          //---TimeMonth_            = TimeMonth( datetime date );            //Month number (1 - January, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12) of the specified time.
          //---TimeSeconds_          = TimeSeconds( datetime date );          //The amount of seconds elapsed from the beginning of the minute of the specified time. int m = TimeSeconds(TimeCurrent());
          //---TimeYear_             = TimeYear( datetime date );             //Year of the specified date. The returned value can be within the range of 1970 to 3000.    int y = TimeYear(TimeCurrent());
          _Year_                 = Year();
          //===================================================================
          //================================
          return true;//
}
//+------------------------------------------------------------------+
//|             Class MyRoboTrader     BEGIN                         |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
