//+------------------------------------------------------------------+
//|                                                      C_CHART.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict

//+------------------------------------------------------------------+
//|             Class Ct_Trade_Info_Out                 BEGIN-END       |
//+------------------------------------------------------------------+
class Ct_Trade_Info_Out
{

public :
          bool Ct_Trade_Info_Out::CommentTrade();



};
//+------------------------------------------------------------------+
//|             Class Ct_Trade_Info_Out                 BEGIN-END       |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Trade_Info_Out::CommentTrade()//cant run in script
{
//-----For Show Comment
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          string        comment = StringFormat("Printing prices:\nAsk = %G\nBid = %G\nSpread = %d", Ask, Bid, ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_SPREAD);
          bool          restlt  = false;
          ChartSetString(0, CHART_COMMENT, comment) ;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return restlt;//
}


//+------------------------------------------------------------------+
//|             Class Ct_Trade_Info_Out                 BEGIN-END       |
//+------------------------------------------------------------------+
