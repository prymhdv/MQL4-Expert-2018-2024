//+------------------------------------------------------------------+
//|                                                      AutoRSI.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|             Class AutoRSI     BEGIN                              |
//+------------------------------------------------------------------+
class AutoRSI
{


          string        Program;
          bool          OpenBUY;
          bool          OpenSELL;
          int           RSIperiod;
          double        ManualLots;
          bool          AutoLot;
          double        Risk;
          double        StopLoss;
          double        TakeProfit;
          bool          CloseBySignal;
          double        TrailingStop;
          int           Slippage;
          int           MagicNumber;
//---
          int           OrderBuy, OrderSell;
          int           ticket;
          int           LotDigits;
          double        Trail, iTrailingStop;
          ////////////////////
          AutoRSI::AutoRSI();
          AutoRSI::~AutoRSI();
          bool AutoRSI::AutoRSIRun();
          void AutoRSI::OPBUY();
          void AutoRSI::OPSELL();
          void AutoRSI::CloseSell();
          void AutoRSI::CloseBuy();
          double AutoRSI::LOT();
//
};//TestOBJ;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
AutoRSI::AutoRSI()
{         //============================//============================
          RunCallFunction++; ________________________________________________________Xerorr.SuperviserX(_LastError, "-AutoRSI Error",  __LINE__, __FUNCTION__); //
          //============================//============================
          Program = "Auto Trade With RSI";
          OpenBUY = True;
          OpenSELL = True;
          RSIperiod = 14;
          ManualLots = 0.2;
          AutoLot = True;
          Risk = 5;
          StopLoss = 0;
          TakeProfit = 100;
          CloseBySignal = False;
          TrailingStop = 0;
          Slippage = 10;
          MagicNumber = 786;
//---
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-AutoRSI Error",  __LINE__, __FUNCTION__); //
          //============================//============================
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
AutoRSI::~AutoRSI()
{
//
//
          if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-AutoRSI Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool AutoRSI::AutoRSIRun()
{         //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-AutoRSI Error",  __LINE__, __FUNCTION__); //
          //============================//============================
          double stoplevel = MarketInfo(Symbol(), MODE_STOPLEVEL);
          OrderBuy = 0;
          OrderSell = 0;
          for(int cnt = 0; cnt < OrdersTotal(); cnt++)
          {         if(OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES))
                              if(OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber && OrderComment() == Program)
                              {         if(OrderType() == OP_BUY) OrderBuy++;
                                        if(OrderType() == OP_SELL) OrderSell++;
                                        if(TrailingStop > 0)
                                        {         iTrailingStop = TrailingStop;
                                                  if(TrailingStop < stoplevel) iTrailingStop = stoplevel;
                                                  Trail = iTrailingStop * Point;
                                                  double tsbuy = NormalizeDouble(Bid - Trail, Digits);
                                                  double tssell = NormalizeDouble(Ask + Trail, Digits);
                                                  if(OrderType() == OP_BUY && Bid - OrderOpenPrice() > Trail && Bid - OrderStopLoss() > Trail)
                                                  {         ticket = OrderModify(OrderTicket(), OrderOpenPrice(), tsbuy, OrderTakeProfit(), 0, Blue); }
                                                  if(OrderType() == OP_SELL && OrderOpenPrice() - Ask > Trail && (OrderStopLoss() - Ask > Trail || OrderStopLoss() == 0))
                                                  {         ticket = OrderModify(OrderTicket(), OrderOpenPrice(), tssell, OrderTakeProfit(), 0, Blue); }//
                                        } //
                              } //
          }
          double rsi0 = iRSI(Symbol(), 0, RSIperiod, PRICE_CLOSE, 0);
          double rsi1 = iRSI(Symbol(), 0, RSIperiod, PRICE_CLOSE, 1);
          double rsi2 = iRSI(Symbol(), 0, RSIperiod, PRICE_CLOSE, 2);
          double rsi3 = iRSI(Symbol(), 0, RSIperiod, PRICE_CLOSE, 3);
          double rsi4 = iRSI(Symbol(), 0, RSIperiod, PRICE_CLOSE, 4);
          double rsi5 = iRSI(Symbol(), 0, RSIperiod, PRICE_CLOSE, 5);
          double rsi6 = iRSI(Symbol(), 0, RSIperiod, PRICE_CLOSE, 6);
          double rsi7 = iRSI(Symbol(), 0, RSIperiod, PRICE_CLOSE, 7);
          double rsi8 = iRSI(Symbol(), 0, RSIperiod, PRICE_CLOSE, 8);
          double rsi9 = iRSI(Symbol(), 0, RSIperiod, PRICE_CLOSE, 9);
          double rsi10 = iRSI(Symbol(), 0, RSIperiod, PRICE_CLOSE, 10);
          double rsi11 = iRSI(Symbol(), 0, RSIperiod, PRICE_CLOSE, 11);
          double rsi12 = iRSI(Symbol(), 0, RSIperiod, PRICE_CLOSE, 12);
          double rsi13 = iRSI(Symbol(), 0, RSIperiod, PRICE_CLOSE, 13);
          double rsi14 = iRSI(Symbol(), 0, RSIperiod, PRICE_CLOSE, 14);
          double rsi15 = iRSI(Symbol(), 0, RSIperiod, PRICE_CLOSE, 15);
          double rsi16 = iRSI(Symbol(), 0, RSIperiod, PRICE_CLOSE, 16);
          double rsi17 = iRSI(Symbol(), 0, RSIperiod, PRICE_CLOSE, 17);
          double rsi18 = iRSI(Symbol(), 0, RSIperiod, PRICE_CLOSE, 18);
          double rsi19 = iRSI(Symbol(), 0, RSIperiod, PRICE_CLOSE, 19);
          double rsi20 = iRSI(Symbol(), 0, RSIperiod, PRICE_CLOSE, 20);
          double Tot_RSI = (rsi0 + rsi1 + rsi2 + rsi3 + rsi4 + rsi5 + rsi6
                            + rsi7 + rsi8 + rsi9 + rsi10 + rsi11 + rsi12
                            + rsi13 + rsi14 + rsi15 + rsi16 + rsi17 + rsi18 + rsi19 + rsi20)
                           / 21;
          if(OpenSELL)
          {         if(OrderSell < 1 && OrderBuy == 0 && Tot_RSI < 45)
                    {         OPSELL(); } //
          }
          if(OpenBUY)
          {         if(OrderBuy < 1 && OrderSell == 0 && Tot_RSI > 55)
                    {         OPBUY(); } //
          }
//--- Close By Signal
          if(CloseBySignal)
          {         if(OrderSell > 0 && Tot_RSI > 52)
                    {         CloseSell(); }
                    if(OrderBuy > 0 && Tot_RSI < 47)
                    {         CloseBuy(); } //
          }
//---
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-AutoRSI Error",  __LINE__, __FUNCTION__); //
          //============================//============================
          return(true);//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void AutoRSI::OPBUY()
{         double StopLossLevel;
          double TakeProfitLevel;
          if(StopLoss > 0) StopLossLevel = Bid - StopLoss * Point; else StopLossLevel = 0.0;
          if(TakeProfit > 0) TakeProfitLevel = Ask + TakeProfit * Point; else TakeProfitLevel = 0.0;
          ticket = OrderSend(Symbol(), OP_BUY, LOT(), Ask, Slippage, StopLossLevel, TakeProfitLevel, Program, MagicNumber, 0, DodgerBlue); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void AutoRSI::OPSELL()
{         double StopLossLevel;
          double TakeProfitLevel;
          if(StopLoss > 0) StopLossLevel = Ask + StopLoss * Point; else StopLossLevel = 0.0;
          if(TakeProfit > 0) TakeProfitLevel = Bid - TakeProfit * Point; else TakeProfitLevel = 0.0;
//---
          ticket = OrderSend(Symbol(), OP_SELL, LOT(), Bid, Slippage, StopLossLevel, TakeProfitLevel, Program, MagicNumber, 0, DeepPink); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void AutoRSI::CloseSell()
{         int  total = OrdersTotal();
          for(int y = OrdersTotal() - 1; y >= 0; y--)
          {         if(OrderSelect(y, SELECT_BY_POS, MODE_TRADES))
                              if(OrderSymbol() == Symbol() && OrderType() == OP_SELL && OrderMagicNumber() == MagicNumber)
                              {         ticket = OrderClose(OrderTicket(), OrderLots(), OrderClosePrice(), 5, Black); } } //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void AutoRSI::CloseBuy()
{         int  total = OrdersTotal();
          for(int y = OrdersTotal() - 1; y >= 0; y--)
          {         if(OrderSelect(y, SELECT_BY_POS, MODE_TRADES))
                              if(OrderSymbol() == Symbol() && OrderType() == OP_BUY && OrderMagicNumber() == MagicNumber)
                              {         ticket = OrderClose(OrderTicket(), OrderLots(), OrderClosePrice(), 5, Black); } } //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double AutoRSI::LOT()
{         double lotsi;
          double ilot_max = MarketInfo(Symbol(), MODE_MAXLOT);
          double ilot_min = MarketInfo(Symbol(), MODE_MINLOT);
          double tick = MarketInfo(Symbol(), MODE_TICKVALUE);
//---
          double  myAccount = AccountBalance();
//---
          if(ilot_min == 0.01) LotDigits = 2;
          if(ilot_min == 0.1) LotDigits = 1;
          if(ilot_min == 1) LotDigits = 0;
//---
          if(AutoLot)
          {         lotsi = NormalizeDouble((myAccount * Risk) / 20000, LotDigits); }
          else
          {         lotsi = ManualLots; }
//---
          if(lotsi >= ilot_max) { lotsi = ilot_max; }
//---
          return(lotsi);//
}
//+------------------------------------------------------------------+
//|             Class AutoRSI     BEGIN-END                          |
//+------------------------------------------------------------------+
