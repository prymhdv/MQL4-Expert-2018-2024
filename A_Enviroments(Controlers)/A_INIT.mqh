//+------------------------------------------------------------------+
//|                                                       C_INIT.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Interface_Control.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Data_Model.mqh>
//+------------------------------------------------------------------+
//|             Class C_INIT     BEGIN                               |
//+------------------------------------------------------------------+
class C_INIT
{
private:
          int  TimerInterval;// = 150;
public:
          void                          C_INIT() {};
          void                          ~C_INIT() {};
          ENUM_INIT_RETCODE             RunStatic();
          ENUM_INIT_RETCODE             Run();
          void                          initProsess();
          bool                          IsBasic_Done; //--- Initer.IsBasic_Done    if(!Initer.IsBasic_Done) {return;}
          //
          int ExportData()
          {         // By default you find a folder "files" at the same level of your "Expert" folder, under the "MQL4" folder
                    // Or, if run thru Expert Advisor, similarly, but under the "Tester" folder
                    // Or, see FileOpen help for other options
                    int myFile = FileOpen("myHistory.csv", FILE_WRITE | FILE_CSV, ",");
                    if ( )
                    {         // Decide if you want just latest 1000 candle for this Symbol / timeframe
                              for (int k = 100000; k > 0; k--)
                              {         // Or place here any other condition / filter
                                        datetime        time = iTime(Symbol(), Period(), k);
                                        double          open = iOpen(Symbol(), Period(), k);
                                        double          close = iClose(Symbol(), Period(), k);
                                        // Add more info from the Symbol, i.e. low price, high price, or even other indicators, media, averages, etc.
                                        FileWrite(myFile, time, open, close, "etc., etc."); //
                              }
                              FileClose(myFile);//
                    } //
          }//

          void  OnExportBars()
          {         Comment("Loading...");
                    int maxBars = MathMin(TerminalInfoInteger(TERMINAL_MAXBARS), 100000);
                    string comment = "";
                    ENUM_TIMEFRAMES periods[] = {PERIOD_M1, PERIOD_M5, PERIOD_M15, PERIOD_M30, PERIOD_H1, PERIOD_H4, PERIOD_D1 };
                    for(int p = 0; p < ArraySize(periods); p++)
                    {         comment += ExportBars(periods[p], maxBars) + "\n";
                              Comment(comment); }
                    comment += "Ready";
                    Comment(comment); }

          string ExportBars(ENUM_TIMEFRAMES period, int maxBars)
          {         MqlRates  rates_array[];
                    ArraySetAsSeries(rates_array, true);
                    int bars = CopyRates(_Symbol, period, 0, maxBars, rates_array);
                    string fileName = _Symbol + PeriodToStr(period) + ".csv";
                    string comment = "";
                    if(bars > 1)
                    {         int filehandle = FileOpen(fileName, FILE_WRITE | FILE_CSV);
                              for(int i = bars - 1; i >= 0; i--)
                              {         FileWrite(filehandle,
                                                  TimeToString(rates_array[i].time, TIME_DATE),
                                                  TimeToString(rates_array[i].time, TIME_MINUTES),
                                                  rates_array[i].open,
                                                  rates_array[i].high,
                                                  rates_array[i].low,
                                                  rates_array[i].close,
                                                  rates_array[i].tick_volume); }
                              FileFlush(filehandle);
                              FileClose(filehandle);
                              comment = "File exported: " + fileName + ", " + IntegerToString(bars) + " bars"; }
                    else
                    {         comment = "Error with exporting: " + fileName; }
                    return (comment); }

          string PeriodToStr(ENUM_TIMEFRAMES period)
          {         string strper;
                    switch(period)
                    {         case PERIOD_M1  : strper = "1";      break;
                              case PERIOD_M5  : strper = "5";      break;
                              case PERIOD_M15 : strper = "15";     break;
                              case PERIOD_M30 : strper = "30";     break;
                              case PERIOD_H1  : strper = "60";     break;
                              case PERIOD_H4  : strper = "240";    break;
                              case PERIOD_D1  : strper = "1440";   break;
                              case PERIOD_W1  : strper = "10080";  break;
                              case PERIOD_MN1 : strper = "302400"; break;
                              default : strper = ""; }
                    return (strper); } //
          int startOutput()
          {         bool M1_Scan  = false,
                                   M5_Scan  = true,
                                   M15_Scan = true,
                                   M30_Scan = true,
                                   H1_Scan  = true,
                                   H4_Scan  = true,
                                   D1_Scan  = true,
                                   W1_Scan  = true,
                                   MN1_Scan = false;
                    if (TimeMinute(iTime(Symbol(), PERIOD_M1, 1)) != Last_scan)
                    {         if (M1_Scan)  CreateFile(PERIOD_M1);
                              if (M5_Scan)  CreateFile(PERIOD_M5);
                              if (M15_Scan) CreateFile(PERIOD_M15);
                              if (M30_Scan) CreateFile(PERIOD_M30);
                              if (H1_Scan)  CreateFile(PERIOD_H1);
                              if (H4_Scan)  CreateFile(PERIOD_H4);
                              if (D1_Scan)  CreateFile(PERIOD_D1);
                              if (W1_Scan)  CreateFile(PERIOD_W1);
                              if (MN1_Scan) CreateFile(PERIOD_MN1);
                              Last_scan = TimeMinute(iTime(Symbol(), PERIOD_M1, 1)); }
                    return(0); }
//+---------------------------------------------------------------------------------------------------------------+
//+---- Craete Output File             ---------------------------------------------------------------------------+
//+---------------------------------------------------------------------------------------------------------------+
          void CreateFile(int _timeframe)
          {         int fp;
                    string outstring;
                    string file_name, idxdate, idxtime;
                    file_name = "DT_" + Symbol() + "_" + GetTimeText(_timeframe) + ".prn";
                    fp = FileOpen(file_name, FILE_CSV | FILE_WRITE, ",");
                    if(fp < 1)
                    {         Print("can not open file. error-" + GetLastError());
                              return(0); }
                    int j = MathMin(iBars(Symbol(), _timeframe), 2500);
                    for(int i = j; i >= 0; i--)
                    {         if(i == j)
                              {         FileWrite(fp, "<DTYYYYMMDD>,<TIME>,<OPEN>,<HIGH>,<LOW>,<CLOSE>,<VOL>");
                                        continue; }
                              idxdate = TimeToStr(iTime(NULL, _timeframe, i), TIME_DATE);
                              idxtime = TimeToStr(iTime(NULL, _timeframe, i), TIME_SECONDS);
                              outstring = StringSubstr(idxdate, 0, 4) + StringSubstr(idxdate, 5, 2) + StringSubstr(idxdate, 8, 2) + "," +
                                          StringSubstr(idxtime, 0, 2) + StringSubstr(idxtime, 3, 2) + StringSubstr(idxtime, 6, 2) + "," +
                                          DoubleToStr(iOpen(NULL, _timeframe, i), Digits) + "," +
                                          DoubleToStr(iHigh(NULL, _timeframe, i), Digits) + "," +
                                          DoubleToStr(iLow(NULL, _timeframe, i), Digits) + "," +
                                          DoubleToStr(iClose(NULL, _timeframe, i), Digits) + "," +
                                          DoubleToStr(iVolume(NULL, _timeframe, i), 0);
                              FileWrite(fp, outstring); }
                    FileClose(fp);
                    return(0); }
//+---------------------------------------------------------------------------------------------------------------+
//+---- Getting Time Text    -------------------------------------------------------------------------------------+
//+---------------------------------------------------------------------------------------------------------------+
          string GetTimeText(int _timeframe)
          {         switch (_timeframe)
                    {         case PERIOD_M1 :  return ("M1");
                              case PERIOD_M5 :  return ("M5");
                              case PERIOD_M15:  return ("M15");
                              case PERIOD_M30:  return ("M30");
                              case PERIOD_H1 :  return ("H1");
                              case PERIOD_H4 :  return ("H4");
                              case PERIOD_D1 :  return ("D1");
                              case PERIOD_W1 :  return ("W1");
                              case PERIOD_MN1:  return ("MN1"); }
                    return(0); } };

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
ENUM_INIT_RETCODE C_INIT::Run()//OnStart//The function is called when the  Start event occurs to perform actions set in the script
{         //
          if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
          //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "- OnInit Start Error",  __LINE__, __FUNCTION__); //
          //---Alert("===========ENUM_INIT_RETCODE C_INIT::Run===============2022 06 29");
          //---PlaySound("bulk.wav") ;
          ENUM_INIT_RETCODE Result =  RunStatic();
          //------------------------------------------------------------------------------------------------------------------------------------------
          /*ResetZone*/
          Comment("");
          //
          if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
          //
          //Cd_MySql_Dev  MySql_Dev;
          //MySql_Dev.MainProgress();
          /*jsonParserZone*/
          //json_demo();
          //xml_demo();
          /*----------------LicenceZone-----------------------*/
          Licence.Activation();
          /*----------------LicenceZone-----------------------*/
          /*LoginZone*/
          //Login.Activation();// on init and ontimer need off
          //------------------------------------------------------------------------------------------------------------------------------------------
          if(Result == INIT_SUCCEEDED)                  {IsBasic_Done = Vg_IsBasic_INITED = true;       Timer.Update(false);    return(INIT_SUCCEEDED);}
          else if(Result == INIT_PARAMETERS_INCORRECT ) {IsBasic_Done = Vg_IsBasic_INITED = false;                              return(INIT_PARAMETERS_INCORRECT);}
          else                                          {IsBasic_Done = Vg_IsBasic_INITED = false;                              return(INIT_FAILED);    /*Some Act todo*/  } //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-OnInit Error",  __LINE__, __FUNCTION__); //
          return (INIT_FAILED); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
ENUM_INIT_RETCODE C_INIT::RunStatic()
{         RunCallFunction++;//--- utilization of resources
          //ObjectSetString(0, "bitmap_name", OBJPROP_BMPFILE, 0, "::Images\\euro.bmp");
          //
          if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
          //
          if(false)Print("       OnInit>>        STARTCalling-Go>" + (string)RunCallFunction + "         " + (string)TimeLocal() + "     " + "erorrCounting:" + (string)________________________________________________________Xerorr.__Count__ + "      ");
          if(false)Alert("       OnInit>>      STARTCalling-Go>" + (string)RunCallFunction + "         " + (string)TimeLocal() + "     " + "erorrCounting:" + (string)________________________________________________________Xerorr.__Count__ + "      ");
          //
          if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
          //
          /* Cheacking State */
          {         if (!IsDllsAllowed())
                    {         //DLL calls must be allowed
                              Alert("Dll calls must be allowed");
                              //
                              if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
                              //
                              return (INIT_FAILED); //
                    }
                    if(IsVisualMode())///2023.04.07 14:42:46.734         2023.04.05 01:00:00  QUARTS_AF1 XAUUSD.F,M1: Some functions are not available in the strategy tester.
                    {         //DLL calls must be allowed
                              Print("NotRuning on Test Mode");
                              //
                              if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
                              //
                              //return (INIT_FAILED); //
                    } //
          }
          //--- if(IsConnected())PlaySound("bulk.wav") ; //---file not exist
          //if(!IsTesting())//---on tester run nnedded
          {         //
                    if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
                    //
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "OnInit Error",  __LINE__, __FUNCTION__);
                    if(true)
                    {         //---PlaySound("Expert Initializationed.wav") ; //---file not exist
                              //
                              if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
                              //
                              initProsess();
                              if(false)Print("   OnInit>>        STARTCalling-END        " + (string)TimeLocal() + "     " + "erorrCounting:" + (string)________________________________________________________Xerorr.__Count__ + "      ");
                              if(false)Alert(" OnInit>>        STARTCalling-END        " + (string)TimeLocal() + "     " + "erorrCounting:" + (string)________________________________________________________Xerorr.__Count__ + "      ");
                              //
                              if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
                              //
                              if(!IsTesting())ExtDialog.OnInitX();
                              return(INIT_SUCCEEDED);//
                    }
                    else
                    {         ________________________________________________________Xerorr.SuperviserX(_LastError, "-OnInit Error",  __LINE__, __FUNCTION__); //
                              if(!IsTesting())PlaySound("Trance hit, modulator") ;
                              return(INIT_FAILED); //
                    } //
          }
          //else     {  initProsess();     return(INIT_SUCCEEDED);}// PlaySound("Trance hit, modulator") ;
          if(0)
          {         //--- run this EA at chart with M1 timeframe
                    bool IsOneMinute = (Period() != PeriodSeconds(PERIOD_M1) / 60);
                    if(IsOneMinute) { Alert("The Expert Advisor must be attached to M1 chart!"); return(INIT_FAILED); } //
          }//
          //---Dev_Chart_Window.ChartEventMouseMoveSet(true);//?>>>>>prossesing mose move events///Open Mose move traking...//--- Check the event by pressing a mouse button
          //---PlaySound("Trance hit, modulator") ;//UninitReason(); //---file not exist
          //----------
          return INIT_SUCCEEDED;///
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_INIT::initProsess()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Capitan.mqh Error",  __LINE__, __FUNCTION__); //
          //
          if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
          //
          if(!IsTesting())Dev_Chart_Window.FrameSetting();
          //
          if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
          //
          //--- create timer
          TimerInterval = 500;  /*150 heavy sticky*/  /*300 most runed value*/ /*250 best *//*800 good*/ /*1000 lately*/  //1250  /*CPU REAL TIME 25 >>>NORMAL 10-15*/      // = 250; ///   TimerInterval = (int)(250*1.1); ///
          if(DoOnTimer && IsTesting())
          {         static bool IsCheackTimer = true;
                    if(IsCheackTimer)
                    {         bool high_resolutionTimer = false; //conds [in] Number of seconds that determine the frequency of the timer event occurrence.
                              //if(false)
                              //{         EventSetTimer(1);} //28 secound lag
                              /*>>>>>*/  EventSetMillisecondTimer(TimerInterval);//more lag
                              /*>>>>>*/ //EventSetTimer(10); //for int OnInit();
                              if(false)
                              {         if(high_resolutionTimer) { if(!Timer.IS_TimerEnabled && !IsTesting() ) Timer.IS_TimerEnabled = EventSetMillisecondTimer( TimerInterval); }
                                        else                     { /*//high-resolution timer*/if(!IsTesting()) Timer.IS_TimerEnabled = EventSetMillisecondTimer(100); } //
                              }//
                    }
                    //OnTrade();
                    if (ChartPeriod(0) != FristChart)
                    {         Complex.Expert_RECT(MODE_CREATE, true); //Why off???
                              Dev_Chart_Window.Set_Theme(); //Why off???
                    }
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "Capitan.mqh Error",  __LINE__, __FUNCTION__); //
                    if(false)Print("     The Expert Advisor with name ", MQLInfoString(MQL_PROGRAM_NAME), " is running, inited ", __LINE__); //
          }//
}//
//+------------------------------------------------------------------+
//|             Class C_INIT     BEGIN                               |
//+------------------------------------------------------------------+
