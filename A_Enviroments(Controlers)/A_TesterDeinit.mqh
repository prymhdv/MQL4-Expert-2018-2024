//+------------------------------------------------------------------+
//|                                                     C_TesterDeinit.mqh |
//|                                                    A pourya 2021 |
//|                                               @prymhdv@gmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdv@gmail.com"
#property version   "1.00"
#property strict
//The weClass sheObjected Set - emethodFunctional way true;
class C_TesterDeinit
{
//====================================================================
private:

public:
          void C_TesterDeinit::C_TesterDeinit() {};
          void C_TesterDeinit::~C_TesterDeinit() {};
          void C_TesterDeinit::Run();

//====================================================================
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_TesterDeinit::Run()
{         //double xf = TesterStatistics(STAT_PROFIT), xc = TesterStatistics(STAT_INITIAL_DEPOSIT);
          //Print("END MyRoboTrader--INITIAL_DEPOSIT: " + DoubleToString(xc));
          //Print("END MyRoboTrader--- STAT_PROFIT:   " + DoubleToString(xf));
          //Print("END MyRoboTrader--- STAT_TRADES:   " + DoubleToString(TesterStatistics(STAT_TRADES)));
          //+------------------------------------------------------------------+
          /////UNDER CONSTRUCTION 2021-03-23-21-55-58//////////
          // Alert(_LastError);
          //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-OnTesterDeinit Error",  __LINE__, __FUNCTION__);
//
}
//====================================================================
//+------------------------------------------------------------------+
