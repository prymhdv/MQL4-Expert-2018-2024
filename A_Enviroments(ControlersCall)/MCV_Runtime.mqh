//+--------------------------------------------------------------------+ ProjectName - CompanyName - Copyright - WebSite
//||    |||||||||||                 RunTime.mqh                       || Hello world-cout.mq4
//|||   ||||||xx|||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| MyRoboTrader V00-build FC-2021-01-10
//||||+ ||xyzt|||||             Email: @prymhdvgmail.com           -|||| MyRoboTrader V06-build FC-2021-04-10
//|||   |||||||||||             HTTPS: www.Oprymhdv.com              ||| MyRoboTrader V08-build FC-2022-01-13
//||    |||||||||||             HTTPS: www.Oprymhdv.com               ||
//+--------------------------------------------------------------------+
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\    |
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Infos_property.mqh>
//===========================================================================SEE MAP ^^ * O ^4 rED ALERT B E S T A N S W E R !!!!!.txt  [18^15]
//#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\ProjectManager.mqh>
//#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\uLearn.mqh>
//#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\uLearn2.mqh>
//#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\Artificial_Intelligence\Artificial_Intelligence.mqh>   ///--- ML EA GA NN
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\uErorrBypass.mqh>
//-----------------------------------------------------------------------------------
//--- insert into New_Table2 values (212,'judy','kole',77)    select * from New_Table2
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Data_Model.mqh> //--Sun--//==gOLDENsUN//==SU,M//==SU,N//
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Method_View.mqh>         //CLASS STRUCT OBJECT PERSONEL ACTION HANDLER..// ----Panels
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Method_Event.mqh>        //CLASS STRUCT OBJECT EVENT ACTION HANDLER..// ///---UnSolid eVENTS #ISHADOWEN#
//===================================================================================================================
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Interface_Control.mqh>   //MACHINE ACCEPT CLASS OBJ FUNCTIONS//
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Extention.mqh>           //UYUENgLOBAL//
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\    |
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
 
//-------------------------------------------------------------------------------------------------------------------------------gending to virtual machine parameters
void    OnChartEvent(const int id, const long &lparam, const double &dparam, const string &sparam)
/*                                   */ {   if(DoOnChartEvent)     { if(IsTesting())return;     Eventer.Run(id, lparam, dparam, sparam);} return;}
//-------------------------------------------------------------------------------------------------------------------------------
int     OnInit()                        {   if(DoOnInit)           {  ObjectsDeleteAll(0, "Fit Point.NN"); return   Initer.Run();}        return (INIT_FAILED); } //
void    OnTimer()                       {   if(DoOnTimer)          { if(IsTesting())return;             Timer.Update(true);}    return;} //
void    OnTick()                        {   if(DoOnTick)           {                                    Ticker.Run(); }         return;}; ////'return' - 'void' function returns a value   QUARTS_DEBUG.mq4    30        66///---faield opration--if(IsTesting()) { Timer.Update(true);}
void    OnDeinit(const int reason)      {   if(DoOnDeinit)         {                                    Deiniter.Run(reason);}  return;} //
/*
int     OnCalculate(const int rates_total, const int prev_calculated, const datetime& time[], const double& open[], const double& high[], const double& low[], const double& close[], const long& tick_volume[], const long& volume[], const int& spread[])
                        {         //--- Get the number of bars available for the current symbol and chart period
                                  int bars = Bars(Symbol(), 0);
                                  Print("Bars = ", bars, ", rates_total = ", rates_total, ",  prev_calculated = ", prev_calculated);
                                  Print("time[0] = ", time[0], " time[rates_total-1] = ", time[rates_total - 1]);
                                  //--- return value of prev_calculated for next call
                                  return(rates_total);//no indicator window property is defined, indicator_chart_window is applied                    0         0
                        }
*/
//-------------------------------------------------------------------------------------------------------------------------------
double  OnTester()                        {   if(DoOnTester)         {Initer.Run(); return Tester.Run();}          return -0.01;} //
void    OnTesterInit()                    {   if(DoOnTesterInit)     {       TesterIniter.Run();}    return;} //
void    OnTesterDeinit()                  {   if(DoOnTesterDeinit)   {       TesterDeiniter.Run();}  return;} //
void    OnTesterPass()                    {   if(DoOnTesterPass)     {       TesterPasser.Run();}    return;} //
//-------------------------------------------------------------------------------------------------------------------------------MQL5
//bool    OnBookEvent(const string &symbol)                                                                                     {if(DoOnBookEvent)      {return BookEventer.Run();}     return false;}//   OnBookEvent function declared with wrong type or/and parameters         QUARTS_DEBUG.mq4    38        9
//void    OnTrade()                                                                                                             {if(DoOnTrade)          {  Trader.Run();}          return; };//  The function is called in EAs when the Trade event occurs. The function is meant for processing changes in order, position and trade lists.
//void    OnTradeTransaction(const MqlTradeTransaction &trans, const MqlTradeRequest &request, const MqlTradeResult &result)    {if(DoTradeTransaction) {TradeTransactioner.Run(trans, request, result);} return;} //OnTradeTransaction function declared with wrong type or/and parameters          QUARTS_DEBUG.mq4    40        9
//-------------------------------------------------------------------------------------------------------------------------------
//+------------------------------------------------------------------+ ProjectName - CompanyName - Copyright - WebSite
//||   ||||||||||                 RunTime.mqh                       || Hello world-cout.mq4
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| MyRoboTrader V00-build FC-2021-01-10
//|||  ||   |||||             Email: @prymhdvgmail.com             ||| MyRoboTrader V06-build FC-2021-04-10
//||   ||||||||||             HTTPS: www.Oprymhdv.com               || MyRoboTrader V08-build FC-2022-01-13
//+------------------------------------------------------------------+
