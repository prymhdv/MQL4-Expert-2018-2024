//+------------------------------------------------------------------+
//|                                                     C_Tester.mqh |
//|                                                    A pourya 2021 |
//|                                               @prymhdv@gmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdv@gmail.com"
#property version   "1.00"
#property strict

//The function can be called inside OnTester() or OnDeinit() in the tester. In other cases the result is undefined.
//The weClass sheObjected Set - emethodFunctional way true;
class C_Tester
{
//====================================================================
private:

public:
          void C_Tester::C_Tester() {};
          void C_Tester::~C_Tester() {};
          double C_Tester::Run();

//====================================================================
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double C_Tester::Run()
{         //
          //double xf = TesterStatistics(STAT_PROFIT), xc = TesterStatistics(STAT_INITIAL_DEPOSIT);
          //Print("END MyRoboTrader--INITIAL_DEPOSIT: " + DoubleToString(xc));
          //Print("END MyRoboTrader--- STAT_PROFIT:   " + DoubleToString(xf));
          //Print("END MyRoboTrader--- STAT_TRADES:   " + DoubleToString(TesterStatistics(STAT_TRADES)));
          //+------------------------------------------------------------------+
          /////UNDER CONSTRUCTION 2021-03-23-21-55-58//////////
          // Alert(_LastError);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-OnTester Error",  __LINE__, __FUNCTION__);
          return 1.2;
//
}
//====================================================================
//+------------------------------------------------------------------+
