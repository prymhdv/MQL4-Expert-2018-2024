//+------------------------------------------------------------------+
//||   ||||||||||                 B_MQL.mqh                         ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\.BasePlane.mqh> //---Check Dependency--(Varibles)
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\.BaseWall.mqh> //---Check Dependency--(ErrorsManager)
//--Forward Declaring
class Ct_Drive;
//----------------------------------------------------//---Check Dependency--(Medium)
//+------------------------------------------------------------------------------+
//| Module ~~ Enviroment(View) ~~ MQL ~~ Terminal ~~ Mql ~~ Client ~~ Chart      |
//+------------------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\Ss_MqlConversion.mqh>
//--------------------------------------------------------------------------------
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\Ss_MqlCheckupClientTERMINAL.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\Ss_MqlCheckupClientMQL.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\Ss_MqlCheckupClient.mqh>
//---
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\uMqlCommon.mqh>                Su_MqlCommon    MqlCommon;         //Common Functions
//---
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\sFiles_.mqh>                   
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\uArrayer.mqh>                  Sd_MqlArray     MqlArray;                               //---base Arrayer Function
//---
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\CoveriOC\cMql_Math.mqh>        Sc_Mathematical MqlMath;
//---
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\CoveriOC\gMqlChartWindow.mqh>

////+------------------------------------------------------------------+
////|    Module ~~ MQL Time Service ~~ app ~~Base~~                   | //---   Service Trade app
////+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\sMql_DateTime.mqh>             Ss_Mql_DateTime MQL_DateTime;
////+------------------------------------------------------------------+
////|    Module ~~ MQL Trade Service ~~ app ~~Base~~                   | //---   Service Trade app
////+------------------------------------------------------------------+
//+----------------------------------------------------------------------------------------------------+                                                                                                              |
//|    Module ~~ Model ~~ Data ~~ DataLogic ~~ Material Business Trade ~~ Elements ~~ Series ~~ MARKET | DataBase Business Trade Logic Layer(Model)    (for GUI Layer)                                                |
//+----------------------------------------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\CoverOT\tMqlAccount.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\CoverOT\tMqlMarketMqlSymbol.mqh>
//----
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\CoverOT\tMqlSeries.mqh>
//---
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\CoverOT\tMqlCustomIndicators.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\CoverOT\tMqlConductor.mqh>        ///>>OKEY 052 //
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\CoverOT\tMqlSignals.mqh>          ///>>OKEY 040
//+--------------------------------------------------------------------------------------------------------------------+
//|    Module Material Graphical Solo ~~  Line ~ Shape ~ Text ~ Bitmaps ~ Events ~ Arrows ~ Fibos ~ Ganns ~ Channels   |Sg_ Struct Graphical
//+--------------------------------------------------------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\CoverOG\Sg_MqlObject.mqh>;                      Sg_MqlObject      MqlObject;       //--- noDependency (Build-In MQL)) //----object Functions (build in) Oprator
//+------------------------------------------------------------------------------+
//| Module ~~ Enviroment ~~ MQL ~~ Terminal ~~ Mql ~~ Client ~~ Chart            |  Print("       Passd StackOverflow",__FUNCSIG__);
//+------------------------------------------------------------------------------+
//+------------------------------------------------------------------+
//||   ||||||||||                 B_MQL.mqh                         ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
