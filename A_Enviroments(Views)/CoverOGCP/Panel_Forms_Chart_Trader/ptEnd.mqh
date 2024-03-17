//+------------------------------------------------------------------+
//|                                                       C_Size.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|             Class C_CHART::BEGIN                                 |
//+------------------------------------------------------------------+
class C_OEND_Pad
{
public:
          bool          C_OEND_Pad::Update();// {return true;};
          bool          C_OEND_Pad::UPDATED;

          void          C_OEND_Pad::OrderTerminate();

};
//+------------------------------------------------------------------+
//|             Class C_CHART::BEGIN                                 |IsPendingsBuyLimit
//+------------------------------------------------------------------+
bool C_OEND_Pad::Update()
{         UPDATED = false;
          {          ct_Drive.TDD.ct_End.OrderEnding.Is_Orders                   = RightMenu.SubController.OrderEnding.Is_Orders;
                    //Is_OrdersPuted;
                     ct_Drive.TDD.ct_End.OrderEnding.Is_MarketsBuy               = RightMenu.SubController.OrderEnding.Is_OrdersBuy;              ct_Drive.TDD.ct_End.OrderEnding.Is_MarketsSell           = RightMenu.SubController.OrderEnding.Is_OrdersSell;
                    //Is_BuyMarketPuted,                Is_SellMarketPuted;
                     ct_Drive.TDD.ct_End.OrderEnding.Is_PendingsBuyLimit         = RightMenu.SubController.OrderEnding.Is_PendingsBuyLimit;       ct_Drive.TDD.ct_End.OrderEnding.Is_PendingsBuyStop       = RightMenu.SubController.OrderEnding.Is_PendingsBuyStop;
                    //Is_BuyLimitPuted,                 Is_BuyStopPuted;
                     ct_Drive.TDD.ct_End.OrderEnding.Is_PendingsSellLimit        = RightMenu.SubController.OrderEnding.Is_PendingsSellLimit;      ct_Drive.TDD.ct_End.OrderEnding.Is_PendingsSellStop      = RightMenu.SubController.OrderEnding.Is_PendingsSellStop;
                    //Is_SellLimitPuted,                Is_SellStopPuted;
                     ct_Drive.TDD.ct_End.OrderEnding.Is_Pendings                 = RightMenu.SubController.OrderEnding.Is_Pendings;
                     ct_Drive.TDD.ct_End.OrderEnding.Is_Markets                  = RightMenu.SubController.OrderEnding.Is_Markets;
                    //
          }
          this.UPDATED = true;//
          if(!this.UPDATED)    {Alert("End_Pad.UPDATED: ", this.UPDATED);}
          return UPDATED;//
}

//+------------------------------------------------------------------+
//| OrderClose                                                       |
//+------------------------------------------------------------------+
void C_OEND_Pad::OrderTerminate()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
//--
          double ordprofit = 0;
          double ordlots = 0;
//--
          int c_tkt = 0;
          int ordtype = 0;
          uint tick = 0;
          uint ex_time = 0;
//--
          double rq_price = 0;
          double slippage = 0;
//--
          string ordtypestr = "";
//--- reset the error value
          if(Capitan_ResetLastErrorX)ResetLastError();
          if(IsTradeAllowed() && !IsTradeContextBusy() && IsConnected())//-- CheckOrdTerminateequirements
          {         //-- SelectOrder
                    for(int i = OrdersTotal() - 1; i >= 0; i--)
                    {         if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
                              {         if(OrderSymbol() == _Symbol && OrderMagicNumber() ==  ct_Drive.TDD.ct_Bank.MagicNumber)
                                        {         if(OrderType() <= OP_SELL) //MarketOrdersOnly
                                                  {         //--
                                                            ordprofit = OrderProfit() + OrderCommission() + OrderSwap(); //GetPtofit
                                                            ordlots = (TradePanel.CloseMode == CLOSEPARTIAL) ? ordlots = ct_Drive.TDD.st_Size.INP : OrderLots(); //Set_Lots
                                                            if(ordlots > OrderLots())ordlots = OrderLots();
                                                            //--
                                                            if((TradePanel.CloseMode == CLOSEALL) || (TradePanel.CloseMode == CLOSELAST) || (TradePanel.CloseMode == CLOSEPROFIT && ordprofit > 0) || (TradePanel.CloseMode == CLOSELOSS && ordprofit < 0) || (TradePanel.CloseMode == CLOSEPARTIAL))
                                                            {         tick = GetTickCount();
                                                                      rq_price = OrderClosePrice();
                                                                      c_tkt = OrderTicket();
                                                                      ordtype = OrderType();
                                                                      ordtypestr = (OrderType() == OP_SELL) ? ordtypestr = "Sell" : ordtypestr = "Buy";
                                                                      //--
                                                                      if(!OrderClose(OrderTicket(), ordlots, rq_price, 0, std_Global.COLOR_CLOSE))//-- Error
                                                                      {         Print("OrderClose failed with error #", _LastError); Sleep(________________________________________________________Xerorr.ErrorInterval); return;}
                                                                      else
                                                                      {         //-- Succeeded
                                                                                ex_time = GetTickCount() - tick; //CalcExeTime
                                                                                slippage = (ordtype == OP_SELL) ? (ct_Drive.TDD.ct_Order.GetPriceByTicket(CLOSEPRICE, c_tkt) - rq_price) / _Point : (rq_price - ct_Drive.TDD.ct_Order.GetPriceByTicket(CLOSEPRICE, c_tkt)) / _Point; //CalcSlippage
                                                                                Print("ct_Order closed successfully" + " (Close " + ordtypestr + ") " + "#" + IntegerToString(c_tkt) + " | Execuction Time: " + IntegerToString(ex_time) + "ms" + " | " + "Slippage: " + DoubleToString(slippage, 0) + "p");
                                                                                Sound.PlaySoundS("close.wav");
                                                                                //--
                                                                                if(TradePanel.CloseMode == CLOSELAST || TradePanel.CloseMode == CLOSEPARTIAL) break; //
                                                                      } //
                                                            }
                                                            //--
                                                  } //
                                        } //
                              } //
                    }
                    //--
          }
          else
          {         //-- RequirementsNotFulfilled
                    if(!IsConnected())
                              Print("No Internet connection found! Please check your network connection and try again.");
                    if(IsTradeContextBusy())
                              Print("Trade context is busy, Please wait...");
                    if(!IsTradeAllowed())
                              Print("Check if automated trading is allowed in the terminal / program settings and try again.");
                    //--
                    Sound.PlaySoundS(Sound.ErrorSound );
                    //--
                    Sleep(________________________________________________________Xerorr.ErrorInterval);
                    return; //
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
}
//+------------------------------------------------------------------+
