//+------------------------------------------------------------------+
//|                                             C_Panel_ChartObj.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
class C_Panel_ChartObj
{
private:
          string                        C_Panel_ChartObj::m_name;
          int                           C_Panel_ChartObj::m_index;
//===================================================================
private:        CChartObjectPanel       C_Panel_ChartObj::Panel_ChartObj_private;
protected:      CChartObjectPanel       C_Panel_ChartObj::Panel_ChartObj_protected;
public:         CChartObjectPanel       C_Panel_ChartObj::Panel_ChartObj_public;
          void                          C_Panel_ChartObj::C_Panel_ChartObj() {};
          void                          C_Panel_ChartObj::~C_Panel_ChartObj() {};
//===================================================================
          CChartObjectPanel             C_Panel_ChartObj::Panel_ChartObj;
//===================================================================
//===================================================================
//===================================================================
//===================================================================
//===================================================================
//===================================================================
//===================================================================
};
//+------------------------------------------------------------------+
