//+------------------------------------------------------------------+
//|                                                      Defines.mqh |
//|                             Copyright © 2012-2021, EarnForex.com |
//|                                     Based on panel by qubbit.com |
//|                                       https://www.earnforex.com/ |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Data_Model.mqh>
////+----------------------------------------------------------------+
////|      Module ~~ Main Runs Handler                               |
////+----------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Controlers)\A_INIT.mqh>                    C_INIT                  Initer;                                       ///>>OKEY 040 
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Controlers)\A_EVENT.mqh>                   C_EVENT                 Eventer;                          ///>>OKEY 10 >>>>by ordering calll class.   //>>>>InTimer>>>Must defined tools,Charter    //<<<normal ///in uniniting clear all created object//depending it
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Controlers)\A_TIMER.mqh>                   C_TIMER                 Timer;                          ///>>OKEY 11 >>>>by ordering calll class.    //<<<normal ///in uniniting clear all created object//depending it
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Controlers)\A_TICK.mqh>                    C_TICK                  Ticker;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Controlers)\A_DEINIT.mqh>                  C_DEINIT                Deiniter;
//==============================================================================================================================================
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Controlers)\A_TRADE.mqh>                   C_TRADE                 Trader;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Controlers)\A_TradeTransaction.mqh>        C_TradeTransaction      TradeTransactioner;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Controlers)\A_BookEvent.mqh>               C_BookEvent             BookEventer;
//==============================================================================================================================================
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Controlers)\A_TESTER.mqh>                  C_Tester                Tester;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Controlers)\A_TesterDeinit.mqh>            C_TesterDeinit          TesterDeiniter;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Controlers)\A_TesterInit.mqh>              C_TesterInit            TesterIniter;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Controlers)\A_TesterPass.mqh>              C_TesterPass            TesterPasser;
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+