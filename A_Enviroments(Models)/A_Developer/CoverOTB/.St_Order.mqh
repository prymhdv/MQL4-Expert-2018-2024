//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOT\.CoverOT.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct St_OrderHistory
{         datetime TimeX;
          double   PriceX;

};
struct St_Orders
{         static int Total; //===all order count
          int        Ticket;//      = -1;   //
          string     Symbol;//            = NULL; //
          int        Type;//              = -1;   //
          double     OpenPrice;//     = 0;    //
          double     Lots;//              = -1;   //
          double     ClosePrice;//             = -1;   //
          int        Slippage;//          = -1;   // ct_Drive.TDD.ct_Market_Symbol.Slippage
          double     SL;//                = -1;   // ct_SetPrices.BuyMarketSL,
          double     TP;//                = -1;   // ct_SetPrices.BuyMarketTP,
          string     Comment;//           = NULL; // CommentBuyMarket,
          int        MagicNumber;//       = -1;   //  ct_Bank.MagicNumber,
          datetime   Expiration;//        = -1;   // ct_SCMETime.Expiration,
          color      Arrow;//             = -1;   // ArrowColor_
          double     Commission;
          double     Profit;
          double     Swap;
          //--------------------------------------------
          St_OrderHistory Terminate;
          St_OrderHistory Initation;
          //--------------------------------------------
          void set( int ticket)
          {         Ticket      = OrderTicket();
                    Symbol      = OrderSymbol();
                    Type        = OrderType();
                    OpenPrice   = OrderOpenPrice();
                    Lots        = OrderLots();
                    ClosePrice  = OrderClosePrice();
                    Slippage    = ct_Drive.TDD.ct_Market_Symbol.Slippage;
                    SL          = OrderStopLoss();
                    TP          = OrderTakeProfit();
                    Comment     = OrderComment();
                    MagicNumber = OrderMagicNumber();
                    Expiration  = OrderExpiration();
                    Arrow       = 0;
                    Commission  = OrderCommission();
                    Profit      = OrderProfit();
                    Swap        = OrderSwap();
                    //
          }
          void SetInitOrder(int ticket)
          {         if(OrderType() == OP_BUY)  {Initation.PriceX    = Ask;}
                    if(OrderType() == OP_SELL) {Initation.PriceX    = Bid;}
                    Initation.TimeX = Time[0];//
          }
          void SetTerminOrder(int ticket)
          {         if(OrderType() == OP_BUY)  {Terminate.PriceX    = Bid;}
                    if(OrderType() == OP_SELL) {Terminate.PriceX    = Ask;}
                    Terminate.TimeX = Time[0];//
          }



};
int St_Orders::Total = 0;
//+------------------------------------------------------------------+
