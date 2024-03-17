//+------------------------------------------------------------------+
//|                                                     C_BookEvent.mqh |
//|                                                    A pourya 2021 |
//|                                               @prymhdv@gmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdv@gmail.com"
#property version   "1.00"
#property strict
//The NewTick event is generated for Expert Advisors only when a new tick for a symbol is received,
//to the chart of which the Expert Advisor is attached.
class C_BookEvent
{
//====================================================================
private:

public:
          void C_BookEvent::C_BookEvent() {};
          void C_BookEvent::~C_BookEvent() {};
          bool C_BookEvent::Run();

//====================================================================
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_BookEvent::Run()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-OnChartEventEND",  __LINE__, __FUNCTION__); //
          bool result = false;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-OnChartEventEND",  __LINE__, __FUNCTION__); //
          return result;//
//
}
//====================================================================
//+------------------------------------------------------------------+
