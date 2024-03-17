//+------------------------------------------------------------------+
//||   ||||||||||                 CoverOGCP.mqh                     ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#ifndef __OGCP__
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTD\.CoverOTD.mqh>
//+------------------------------------------------------------------+
//|     Module ~~ View ~~ GUI ~~ Panels Complete                     |
//+------------------------------------------------------------------+
//=================================================================================================================================================================================
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\Panel_Forms_Chart\Sgpd_CandelBoxPanel.mqh>                          Sgpdg_CandelBoxPanel    gCandelBox_Pad;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\Panel_Forms_Chart\Sgpd_AutoCharterPanel.mqh>                        Sgpdg_AutoCharterPanel  gAutoCharter_Pad;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\Panel_Forms_Chart\Sgpd_ElliotWavePanel.mqh>                         Sgpdg_ElliotWavePanel   gElliotWave_Pad;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\Panel_Forms_Chart\Sgpd_ToolsBoxPanel.mqh>                           Sgpdg_ToolsBoxPanel     gToolsBox_Pad;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\Panel_Forms_Chart\Sgpd_FlowPanel.mqh> /*Sgpd_FlowPanel FlowPad; */  Sgpdg_FlowPanel         gFlow_Pad;
////------------------------------------------------------------------------------------------------------ //---   Material ~~ GUI ~~ Chart Analiser Forms Panel Complete
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\Panel_Forms_Chart_Analiser\oElliottWave.mqh>                        Cgp_ElliotWavePAD       Elliott_PAD;               ///>>OKEY 050      
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\Panel_Forms_Chart_Analiser\toPivotsDivergence.mqh>                  C_PivotsDivergence      TradePivotsDivergence;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\Panel_Forms_Chart_Analiser\pGoldVIP.mqh>                            C_GOLDVIP               GoldVIP;               //CAN USE INER OF Technical
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\Panel_Forms_Chart_Analiser\Ctp_Technical.mqh>                       Ctp_TECHNICAL           TechnicalO;            ///>>OKEY 060 >>>>by ordering calll class.//==>>used Tools   //off-cant access by ALt+G in classes //Technical TechnicalO;//<<<normal ///in uniniting clear all created object//depending it
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\Panel_Forms_Chart_Analiser\pAutoCharter.mqh>                        C_AutoCharter           AutoCharter;
//////=================================================================================================================================================================================
/////>>OKEY 15 >>>>by ordering calll class.  //<<<normal ///in uniniting clear all created object//depending it
////------------------------------------------------------------------------------------------------------//---   Material ~~ GUI ~~ Chart Trader Forms Panels Complete
////+------------------------------------------------------------------+
////|                   Trade GUI View UTILITIES                       |
////+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\Panel_Forms_Chart_Trader\ptSymbols.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\Panel_Forms_Chart_Trader\ptSize.mqh>                                C_Size_Pad              Size_Pad;
//
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\Panel_Forms_Chart_Trader\ptBank.mqh>                                C_BANK_Pad              bank_Pad;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\Panel_Forms_Chart_Trader\ptDrive_Pad_Inputs.mqh>                    Ctp_Drive_Pad_Inputs              ct_Drive_Pad_Inputs;
////=================================================================================================================================================================================
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\Panel_Forms_Chart_Trader\ptStart.mqh>                               C_OSTART_Pad            Start_Pad;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\Panel_Forms_Chart_Trader\ptEnd.mqh>                                 C_OEND_Pad              End_Pad;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\Panel_Forms_Chart_Trader\ptModifyPad.mqh>                           C_OMODIFY_Pad           Modify_Pad;      //---   Material ~~ GUI ~~ Chart Trader Modify Forms Panel Complete  
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\Panel_Forms_Chart_Trader\ptUtilities.mqh>;                          C_TradeUTILITIES        TradeUtillities;
////+------------------------------------------------------------------+
////|                   Trade GUI View UTILITIES                       |
////+------------------------------------------------------------------+
////====================================================================================================== //---   Material ~~ GUI ~~ Chart Forms Panel Complete
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\Panel_Forms_Chart\uCandels_Box.mqh>                                 C_Candels_Box           Candels_Box;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\Panel_Forms_Chart\pChartUTILITIES.mqh>                              C_ChartUTILITIES        ChartUtillities;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\Panel_Forms_Chart\pToolsCall.mqh>                                   C_TOOLSCALL             ToolsCall;
//=================================================================================================================================================================================
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\Panel_Forms_Chart_Trader\pTradePanel.mqh>                           C_TRADEPANEL            TradePanel;            //
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\Panel_Forms_Chart_Trader\ptPositionsCalculatorPad(Model).mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\Panel_Forms_Chart_Trader\ptPositionsCalculatorPad(view).mqh>        C_CalculatorPad         ExtDialog;             //
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\Panel_Forms_Chart\T_Pattern.mqh>                                    T_Pattern               t_Pattern;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\Panel_Forms_Chart\pFlowPanel.mqh>                                   C_FLOWPANEL             FlowPanel;  //FlowPanel.IsMove           //  FlowPanel //why not remmeber??coming uper sizesss of C_TOOLS child C_COMPLEXTOOLS
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\Panel_Forms_Chart\pRightMenuPad.mqh>                                C_RightMenuPad          RightMenu;
//=================================================================================================================================================================================
////+------------------------------------------------------------------+
////|                   Trade Ommenter View UTILITIES                  |
////+------------------------------------------------------------------+
////+------------------------------------------------------------------+
////|                    Trade Manager Status information              | View Oprated DataBase
////+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTC\Ct_Trade_Info_Out.mqh>;                                 Ct_Trade_Info_Out          TradeInfoOut;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\Panel_Forms_Chart_Comments\ViewComments.mqh>                        Cv_ViewComments         ViewComments;
//=================================================================================================================================================================================
#endif 
//+------------------------------------------------------------------+
//|     Module ~~ View ~~ GUI ~~ Panels Complete                     |
//+------------------------------------------------------------------+
