//+------------------------------------------------------------------+
//||   ||||||||||                 A_Developer.mqh                   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\.B_MQL.mqh>
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Cs_DevCheckupClientTERMINAL
{
public:
          void                          Cs_DevCheckupClientTERMINAL() {  /*Alert("Deinit: ", __FUNCSIG__);*/}; //--Print("       Passd StackOverflow", __FUNCSIG__);
          void                          ~Cs_DevCheckupClientTERMINAL() { }
          bool                          Update() { Dev_Checkup_Mql.Update(); return UPDATED = true; };
          bool                          UPDATED;
          Ss_MqlCheckupClientTERMINAL   _Mql_;
          void                          terminal_close();

};
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void Cs_DevCheckupClientTERMINAL::terminal_close()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          Alert("(3863)-" + "Terminal of in 10 secound", "-Line:", __LINE__);
          Sleep(10000);
          TerminalClose(0);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return;//
}


//+------------------------------------------------------------------+
//||   ||||||||||                 A_Developer.mqh                   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
