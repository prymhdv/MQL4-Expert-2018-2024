//+------------------------------------------------------------------+
//|                                                   SoloTrader.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|             Class SoloTrader     BEGIN                           |
//+------------------------------------------------------------------+
class SoloTrader
{
public:
          int MagicNumber  ;
          double LotSize   ;
          double StopLoss  ;
          double TakeProfit  ;
          int TrailingStop ;
          int Slippage  ;

          SoloTrader::SoloTrader();
          SoloTrader::~SoloTrader();
          int SoloTrader::SoloTraderRunX();

//======================================================================================
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
SoloTrader::SoloTrader()
{         //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError,"-SoloTrader Error",  __LINE__, __FUNCTION__);//
          //============================//============================
          MagicNumber = 13691;
          LotSize = 0.01;
          StopLoss = 1000;
          TakeProfit = 2000;
          TrailingStop = 0;
          Slippage = 3;
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError,"-SoloTrader Error",  __LINE__, __FUNCTION__);//
          //============================//============================
          return; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
SoloTrader::~SoloTrader()
{         //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError,"-SoloTrader Error",  __LINE__, __FUNCTION__);//
           //============================//============================
          return; //
}

//+------------------------------------------------------------------+
//    expert start function
//+------------------------------------------------------------------+
int SoloTrader::SoloTraderRunX()
{         //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError,"-SoloTrader Error",  __LINE__, __FUNCTION__);//
          //============================//============================
          double MyPoint = Point;
          if(Digits == 3 || Digits == 5) MyPoint = Point * 10;
          double TheStopLoss = 0;
          double TheTakeProfit = 0;
          if( ct_Drive.TotalOrdersCount() == 0 )
          {         int result = 0;
                    if((iMA(NULL, 0, 20, 0, MODE_EMA, PRICE_CLOSE, 0) > iMA(NULL, 0, 40, 0, MODE_EMA, PRICE_CLOSE, 0)) && (iOBV(NULL, 0, PRICE_CLOSE, 0) > iOBV(NULL, 0, PRICE_LOW, 0)) && (iWPR(NULL, 0, 14, 0) > iWPR(NULL, 0, 7, 0))) // Here is your open buy rule
                    {         result = OrderSend(Symbol(), OP_BUY, ct_Drive.AdvancedMM(), Ask, Slippage, 0, 0, "EA Generator www.ForexEAdvisor.com", MagicNumber, 0, Blue);
                              if(result > 0)
                              {         TheStopLoss = 0;
                                        TheTakeProfit = 0;
                                        if(TakeProfit > 0) TheTakeProfit = Ask + TakeProfit * MyPoint;
                                        if(StopLoss > 0) TheStopLoss = Ask - StopLoss * MyPoint;
                                        if(OrderSelect(result, SELECT_BY_TICKET))
                                                  if(OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(TheStopLoss, Digits), NormalizeDouble(TheTakeProfit, Digits), 0, Green)) Print("OrderTakeProfit: ", OrderTakeProfit()); //
                              }
                              return(0); }
                    if((iMA(NULL, 0, 20, 0, MODE_EMA, PRICE_CLOSE, 0) < iMA(NULL, 0, 40, 0, MODE_EMA, PRICE_CLOSE, 0)) && (iOBV(NULL, 0, PRICE_CLOSE, 0) > iOBV(NULL, 0, PRICE_HIGH, 0)) && (iWPR(NULL, 0, 7, 0) > iWPR(NULL, 0, 14, 0))) // Here is your open Sell rule
                    {         result = OrderSend(Symbol(), OP_SELL, ct_Drive.AdvancedMM(), Bid, Slippage, 0, 0, "EA Generator www.ForexEAdvisor.com", MagicNumber, 0, Red);
                              if(result > 0)
                              {         TheStopLoss = 0;
                                        TheTakeProfit = 0;
                                        if(TakeProfit > 0) TheTakeProfit = Bid - TakeProfit * MyPoint;
                                        if(StopLoss > 0) TheStopLoss = Bid + StopLoss * MyPoint;
                                        if(OrderSelect(result, SELECT_BY_TICKET))
                                                  if(OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(TheStopLoss, Digits), NormalizeDouble(TheTakeProfit, Digits), 0, Green))Print("OrderTakeProfit: ", OrderTakeProfit()); //
                              }//
                              return(0); } }
          for(int cnt = 0; cnt < OrdersTotal(); cnt++)
          {         if(OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES))
                              if(OrderType() <= OP_SELL && OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber)
                              {         if(OrderType() == OP_BUY)
                                        {         if(TrailingStop > 0)
                                                  {         if(Bid - OrderOpenPrice() > MyPoint * TrailingStop)
                                                            {         if(OrderStopLoss() < Bid - MyPoint * TrailingStop)
                                                                      {         if(OrderModify(OrderTicket(), OrderOpenPrice(), Bid - TrailingStop * MyPoint, OrderTakeProfit(), 0, Green))Print("OrderTakeProfit: ", OrderTakeProfit());
                                                                                return(0); //
                                                                      }//
                                                            }//
                                                  }//
                                        }//
                                        else
                                        {         if(TrailingStop > 0)
                                                  {         if((OrderOpenPrice() - Ask) > (MyPoint * TrailingStop))
                                                            {         if((OrderStopLoss() > (Ask + MyPoint * TrailingStop)) || (OrderStopLoss() == 0))
                                                                      {         if(OrderModify(OrderTicket(), OrderOpenPrice(), Ask + MyPoint * TrailingStop, OrderTakeProfit(), 0, Red))Print("OrderTakeProfit: ", OrderTakeProfit());
                                                                                return(0); //
                                                                      }//
                                                            }//
                                                  }//
                                        }//
                              }//
          }//
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError,"-SoloTrader Error",  __LINE__, __FUNCTION__);//
          //============================//============================
          return(0); //
}
//+------------------------------------------------------------------+
//|             Class SoloTrader     BEGIN-END                       |
//+------------------------------------------------------------------+
