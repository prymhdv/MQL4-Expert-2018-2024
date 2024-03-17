//+------------------------------------------------------------------+
//|                                                       C_Pivots.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|             Class C_Pivots::     BEGIN                           | ///////C_Pivots Manager////////
//+------------------------------------------------------------------+
class C_Pivots
{
//===================================================================

private:
          string                C_Pivots::m_name;
          int                   C_Pivots::m_index;
//===================================================================
public:
          void          C_Pivots::C_Pivots() {};
          void          C_Pivots::~C_Pivots() {};
          void          C_Pivots::C_Pivots(string name = "none")
          {         m_name = name + (string)++m_index;
                    //if(KeyAlert)Alert("Constructor: " + m_name + "_" + (string)++ObjTry + "--------C_Pivots----------", __FUNCSIG__, __LINE__); //
          };
//===================================================================



//===================================================================--=--Address in memory slot
          C_Pivots       *P_Prev, *P_Next;
//===================================================================---=-
          bool      C_Pivots::Set() {return true;};
          bool      C_Pivots::Get() {return true;};
//===================================================================---=-
};

//+------------------------------------------------------------------+
//|             Class C_Pivots::     BEGIN                           | ///////C_Pivots Manager////////
//+------------------------------------------------------------------+
