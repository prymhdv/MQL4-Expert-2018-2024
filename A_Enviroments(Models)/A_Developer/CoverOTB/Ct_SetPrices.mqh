//+------------------------------------------------------------------+
//|                                                    Ct_SetPrices.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOT\.CoverOT.mqh>
//+------------------------------------------------------------------+
//|             Class Ct_SetPrices::     BEGIN                        | ///////Money Manager////////          ///////Money Manager////////
//+------------------------------------------------------------------+//= 220;
#define TP_Mode 0
#define SL_Mode 1
/*************************************************************************************/
/* 150$ BlockDesc*/
sinput  string  Desc_Inp3               = "-------- Activation --------"; //------------------------
input   string  InpLicence              =  "enter licence code here"; // Licence key
input   string  InpPrivateKey           =  "enter Private Key here";
input   string  InpAccount              =  "enter Account here";
input   string  InpMaster               =  "enter Master here; get from Email:@Oprymhdv@Gmail.com";
input   string  Desc_Inp0               = "-------- Equity Lots --------"; //------------------------
input   double  Equity_Fixed_Inp        = 150;
input   double  Lot_Fixed_Inp           = 0.02;
sinput  string  Desc_Inp1               = "-------- SL TP PP --------"; //------------------------
input   int     SL_Pip_Fixed_inp        = 250;
input   int     TP_Pip_Fixed_inp        = 250;
input   int     PP_Pip_Fixed_inp        = 250;
sinput  string  Desc_Inp2               = "-------- TS MP --------"; //------------------------
input   int     TS_Pip_Fixed_inp        = 175;
input   int     MP_Pip_Fixed_inp        = 50;
//---Inputs DriveModifier //TrailingStop_Inp  //MinimumProfit_Inp

/*************************************************************************************/

struct St_SetPrices { double Open, TP, SL; };
struct St_SetPriceOrders
{         //**********************
          St_SetPrices        BuyMarket;
          St_SetPrices        SellMarket;
          //
          St_SetPrices        BuyStop;
          St_SetPrices        BuyLimit;
          //
          St_SetPrices        SellStop;
          St_SetPrices        SellLimit; //
};


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+ct_SetPrices.Update();
class Ct_SetPrices
{
private:

public:
          void          Ct_SetPrices();
          void          ~Ct_SetPrices();
          bool          Update();
          bool          PricesPool();
          bool          PLV(int TypeOrder);//PricesLevelsVerify
          //================================================================================
          bool          IS_SetPrices;
          string        WarningEntry; //= "";
          //************************************
          double PriceSellTP;
          double PriceSellSL;

          double PriceBuyTP;
          double PriceBuySL;
          //**********Updatung Value
          St_SetPriceOrders  Price;
          St_SetPriceOrders  Price_CalcX;
          //================================================================================oRDERS
          string        UseCommentX;
          int           UseAdjustPriceX;
          int           Add_Pips;
          double        UseOpenPriceX;
          double        UseStopVerifyPriceX;
          //================================================================================
          bool          VerifyUpperStopLevel( double argVerifyPrice, double op = 0);
          bool          VerifyLowerStopLevel(double argVerifyPrice, double op = 0, bool result = false);
          //
          double        Adjust_Above_StopLevel(double argAdjustPrice, int add_Pips = 0, double op = 0);  //---ok---
          double        Adjust_Below_StopLevel(double argAdjustPrice, int add_Pips = 0, double op = 0);  //---ok---
          //
          bool          Add_SL_TP_byTicket(const int argTicket, const double sl,  const double tp, bool result = false);
          //================================================================================
          double        Calc_TPSL_Level(int TPSL, int TypeOrder, int tp = 0, int sl = 0, double op = 0);

          double        PricePending,      PricePPFixed;
          //================================================================================Manage Trade Data
          double        PriceModify;
          //--
          double DayOpen;//                         = iOpen(NULL, PERIOD_D1, 0);//-- GetOpen&Close
          double DayClose;//                        = iClose(NULL, PERIOD_D1, 0);
          double DayHigh;//                         = iHigh(NULL, PERIOD_D1, 0);//-- GetOpen&Close
          double DayLow;//                          = iLow(NULL, PERIOD_D1, 0);//
//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Ct_SetPrices::Ct_SetPrices()
{         RunCallFunction++; ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_SetPrices Error",  __LINE__, __FUNCTION__); //
//================================================================================
          Price.BuyMarket.Open  = -1;  Price.BuyMarket.SL       = -1;  Price.BuyMarket.TP       = -1;
          Price.SellMarket.Open = -1;  Price.SellMarket.SL      = -1;  Price.SellMarket.TP      = -1;
          Price.BuyStop.Open    = -1;  Price.BuyStop.SL         = -1;  Price.BuyStop.TP         = -1;
          Price.BuyLimit.Open   = -1;  Price.BuyLimit.SL        = -1;  Price.BuyLimit.TP        = -1;
          Price.SellStop.Open   = -1;  Price.SellStop.SL        = -1;  Price.SellStop.TP        = -1;
          Price.SellLimit.Open  = -1;  Price.SellLimit.SL       = -1;  Price.SellLimit.TP       = -1; //
//================================================================================ buy for asks  sell for bids   bs vs sb
          Price.BuyMarket.Open  = Ask;
          Price.BuyStop.Open    = iClose(Symbol(), PERIOD_CURRENT, 0) + (ct_Drive.TDD.ct_Pending.Curr_Pip * ct_Drive.TDD.ct_Market_Symbol.POINT_PIP); //Alert(Price.BuyStop.Open,"---Price.BuyStop.Open","-Line:",__LINE__);
          Price.BuyLimit.Open   = iClose(Symbol(), PERIOD_CURRENT, 0) - (ct_Drive.TDD.ct_Pending.Curr_Pip * ct_Drive.TDD.ct_Market_Symbol.POINT_PIP); //Alert(Price.BuyLimit.Open,"---Price.BuyLimit.Open","-Line:",__LINE__);
          Price.SellMarket.Open = Bid  ;
          Price.SellLimit.Open  = iClose(Symbol(), PERIOD_CURRENT, 0) + (ct_Drive.TDD.ct_Pending.Curr_Pip * ct_Drive.TDD.ct_Market_Symbol.POINT_PIP); //Alert(Price.SellLimit.Open,"---Price.SellLimit.Open","-Line:",__LINE__);
          Price.SellStop.Open   = iClose(Symbol(), PERIOD_CURRENT, 0) - (ct_Drive.TDD.ct_Pending.Curr_Pip * ct_Drive.TDD.ct_Market_Symbol.POINT_PIP); //Alert(Price.SellStop.Open,"---Price.SellStop.Open","-Line:",__LINE__);
//================================================================================
          UseCommentX                     = "need Cheak";
          UseAdjustPriceX                 = 0;
          Add_Pips                     = 150;
          UseOpenPriceX                   = 0;
          UseStopVerifyPriceX             = 150;
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Ct_SetPrices::~Ct_SetPrices()
{}
//+------------------------------------------------------------------+
bool Ct_SetPrices::PricesPool()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
//
          ct_Drive.TDD.ct_StopLoss.Update(SL_Pip_Fixed_inp);
          ct_Drive.TDD.ct_TakeProfit.Update(TP_Pip_Fixed_inp);
          ct_Drive.TDD.ct_Pending.Update(PP_Pip_Fixed_inp);
//
          if(true)//Setting Prices TPSLPP// 0.0001    ////0.00001 * 10 = 0.0001
          {         if(ionX)
                    {         PriceBuySL                = Bid - ct_Drive.TDD.ct_StopLoss.SLAmount;           PriceBuyTP       = Bid + ct_Drive.TDD.ct_TakeProfit.TPAmount;
                              PriceSellSL               = Ask + ct_Drive.TDD.ct_StopLoss.SLAmount;           PriceSellTP      = Ask - ct_Drive.TDD.ct_TakeProfit.TPAmount;
                              //----------------------------------------------------------------------------------    //MathRound( Bid - (Bid * 0.02)); // Alert(SellTP, "---SellTP","-Line:",__LINE__); //;200;
                              //---off--- PriceBuySL                = Bid - (Bid * 0.02);           PriceBuyTP       = Ask + (Ask * 0.02) ;
                              //---off--- PriceSellSL               = Ask + (Ask * 0.02);           PriceSellTP      = Bid - (Bid * 0.02) ; //
                    }
                    //----------------------------------------------------------------------------------Price.BuyLimit.Open
                    if(ionX)//---ok---
                    {         Price.BuyMarket.Open      = Bid;
                              Price.BuyStop.Open        = Bid + ct_Drive.TDD.ct_Pending.PPAmount;
                              Price.BuyLimit.Open       = Bid - ct_Drive.TDD.ct_Pending.PPAmount;
                              Price.SellMarket.Open     = Ask;
                              Price.SellStop.Open       = Ask - ct_Drive.TDD.ct_Pending.PPAmount;
                              Price.SellLimit.Open      = Ask + ct_Drive.TDD.ct_Pending.PPAmount;
                              //----------------------------------------------------------------------------------
                              Price.BuyMarket.SL                     = Price.BuyMarket.Open  - ct_Drive.TDD.ct_StopLoss.SLAmount;        Price.BuyMarket.TP  = Price.BuyMarket.Open + ct_Drive.TDD.ct_TakeProfit.TPAmount;   //PriceBuyMarketPPTP  = PriceBuyTP;
                              Price.BuyStop.SL                       = Price.BuyStop.Open    - ct_Drive.TDD.ct_StopLoss.SLAmount;        Price.BuyStop.TP    = Price.BuyStop.Open   + ct_Drive.TDD.ct_TakeProfit.TPAmount;
                              Price.BuyLimit.SL                      = Price.BuyLimit.Open   - ct_Drive.TDD.ct_StopLoss.SLAmount;        Price.BuyLimit.TP   = Price.BuyLimit.Open  + ct_Drive.TDD.ct_TakeProfit.TPAmount;
                              //----------------------------------------------------------------------------------
                              Price.SellMarket.SL                    = Price.SellMarket.Open + ct_Drive.TDD.ct_StopLoss.SLAmount;        Price.SellMarket.TP = Price.BuyMarket.Open - ct_Drive.TDD.ct_TakeProfit.TPAmount;
                              Price.SellStop.SL                      = Price.SellStop.Open   + ct_Drive.TDD.ct_StopLoss.SLAmount;        Price.SellStop.TP   = Price.SellStop.Open  - ct_Drive.TDD.ct_TakeProfit.TPAmount;
                              Price.SellLimit.SL                     = Price.SellLimit.Open  + ct_Drive.TDD.ct_StopLoss.SLAmount;        Price.SellLimit.TP  = Price.SellLimit.Open - ct_Drive.TDD.ct_TakeProfit.TPAmount; //
                    }//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
          return(IS_SetPrices = true); //
}
//+------------------------------------------------------------------+
//|             Class Ct_SetPrices::     BEGIN                             | ///////Money Manager////////          ///////Money Manager////////
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_SetPrices::PLV(int TypeOrder)//PricesLevelsVerify
{         Add_Pips           = 0;//10;  2023.04.24 22:57:02.252       QUARTS_AF1 XAUUSD,M1: (Put-Price: 1989.62 )_(Put-SL: 1987.12 )_(Put-TP: 1992.12) E:0 -Putting BuyMarket succeed, Bid: 1989.12 Ask: 1989.62
          UseOpenPriceX      = 0;
//==========================
          int Put_TP_Pip        = ct_Drive.TDD.ct_TakeProfit.Curr_Pip; //
          int Put_SL_Pip        = ct_Drive.TDD.ct_StopLoss.Curr_Pip; //
          int PutPendingPips    = ct_Drive.TDD.ct_Pending.Curr_Pip;//
//==========================
          switch(TypeOrder)
          {         case OP_BUY:
                    {         Price_CalcX.BuyMarket.Open        = Adjust_Above_StopLevel( Price.BuyMarket.Open = Ask,  Add_Pips, UseOpenPriceX);  // OrderOpenPrice()); Bid ...time  changed values
                              Price_CalcX.BuyMarket.TP          = Calc_TPSL_Level( TP_Mode, OP_BUY, Put_TP_Pip, 0, Price_CalcX.BuyMarket.Open); //
                              Price_CalcX.BuyMarket.SL          = Calc_TPSL_Level( SL_Mode, OP_BUY, 0, Put_SL_Pip, Price_CalcX.BuyMarket.Open); //
                    }; break; //
                    case OP_SELL:
                    {         Price_CalcX.SellMarket.Open       = Adjust_Below_StopLevel( Price.SellMarket.Open = Bid,  Add_Pips, UseOpenPriceX); // OrderOpenPrice()); Ask  now change 2023 04 24
                              Price_CalcX.SellMarket.TP         = Calc_TPSL_Level( TP_Mode, OP_SELL, Put_TP_Pip, 0, Price_CalcX.SellMarket.Open); //
                              Price_CalcX.SellMarket.SL         = Calc_TPSL_Level( SL_Mode, OP_SELL, 0, Put_SL_Pip, Price_CalcX.SellMarket.Open);//
                    }; break; //
                    //---
                    case OP_BUYLIMIT:    // = Bid / 1.01
                    {         Price.BuyLimit.Open               = iLow(Symbol(), PERIOD_CURRENT, 0) - (PutPendingPips * ct_Drive.TDD.ct_Market_Symbol.POINT_PIP);
                              Price_CalcX.BuyLimit.Open         = Adjust_Below_StopLevel(Price.BuyLimit.Open,  Add_Pips, UseOpenPriceX); // OrderOpenPrice());
                              Price_CalcX.BuyLimit.TP           = Calc_TPSL_Level( TP_Mode, OP_BUYLIMIT, Put_TP_Pip, 0, Price_CalcX.BuyLimit.Open); //
                              Price_CalcX.BuyLimit.SL           = Calc_TPSL_Level( SL_Mode, OP_BUYLIMIT, 0, Put_SL_Pip, Price_CalcX.BuyLimit.Open); //
                              //========================================================
                              //VerifyUpperStopLevel( UseStopVerifyPriceX = 0, Price.BuyLimit.Open) ;
                              //VerifyLowerStopLevel( UseStopVerifyPriceX = 0, Price.BuyLimit.Open) ;//
                              //========================================================oRDERS
                    }; break; //
                    case OP_SELLLIMIT:
                    {         Price.SellLimit.Open              = iHigh(Symbol(), PERIOD_CURRENT, 0) + (PutPendingPips * ct_Drive.TDD.ct_Market_Symbol.POINT_PIP); //iHigh(Symbol(),PERIOD_CURRENT,0) may not catch price
                              Price_CalcX.SellLimit.Open        = Adjust_Above_StopLevel( Price.SellLimit.Open, Add_Pips, UseOpenPriceX ); // OrderOpenPrice());
                              Price_CalcX.SellLimit.TP          = Calc_TPSL_Level( TP_Mode, OP_SELLLIMIT, Put_TP_Pip, 0, Price_CalcX.SellLimit.Open); //
                              Price_CalcX.SellLimit.SL          = Calc_TPSL_Level( SL_Mode, OP_SELLLIMIT, 0, Put_SL_Pip, Price_CalcX.SellLimit.Open); //
                    }; break; //
                    //-------------------------------------
                    case OP_BUYSTOP:     // = Ask * 1.02
                    {         Price.BuyStop.Open                = iHigh(Symbol(), PERIOD_CURRENT, 0) + (PutPendingPips * ct_Drive.TDD.ct_Market_Symbol.POINT_PIP);
                              Price_CalcX.BuyStop.Open          = Adjust_Above_StopLevel( Price.BuyStop.Open,  Add_Pips, UseOpenPriceX); // OrderOpenPrice());
                              Price_CalcX.BuyStop.TP            = Calc_TPSL_Level( TP_Mode, OP_BUYSTOP, Put_TP_Pip, 0, Price_CalcX.BuyStop.Open); //
                              Price_CalcX.BuyStop.SL            = Calc_TPSL_Level( SL_Mode, OP_BUYSTOP, 0, Put_SL_Pip, Price_CalcX.BuyStop.Open); //
                    }
                    ; break; //
                    case OP_SELLSTOP:// = Close[10]  bool KeyP = true || (cb2 && cb3); // // = Ask * 1.02   //SellStopRunX
                    {         Price.SellStop.Open               = iLow(Symbol(), PERIOD_CURRENT, 0) - (PutPendingPips * ct_Drive.TDD.ct_Market_Symbol.POINT_PIP); //iHigh(Symbol(),PERIOD_CURRENT,0) may not catch price
                              Price_CalcX.SellStop.Open         = Adjust_Below_StopLevel( Price.SellStop.Open,  Add_Pips, UseOpenPriceX); // OrderOpenPrice());
                              Price_CalcX.SellStop.TP           = Calc_TPSL_Level( TP_Mode, OP_SELLSTOP, Put_TP_Pip, 0, Price_CalcX.SellStop.Open); //
                              Price_CalcX.SellStop.SL           = Calc_TPSL_Level( SL_Mode, OP_SELLSTOP, 0, Put_SL_Pip, Price_CalcX.SellStop.Open); //
                    }; break; //
          }
//==========================
          return false;//
}
//+------------------------------------------------------------------+
//|                    Verify Upper Stop Level                       |18
//+------------------------------------------------------------------+
bool Ct_SetPrices::VerifyUpperStopLevel( double argVerifyPrice, double op = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error", __LINE__, __FUNCTION__); //
          bool result = false;
          double OpenPrice;
          bool StopVerify;
          double StopLevel_Amount = MarketInfo(StSymbol.Current, MODE_STOPLEVEL) * Point;
          //==========================
          if(op == 0) {OpenPrice = MarketInfo(StSymbol.Current, MODE_ASK);}
          else {OpenPrice = op;}
          double Price_Upper_StopLevel = OpenPrice + StopLevel_Amount;
          //==========================
          if(argVerifyPrice > Price_Upper_StopLevel)
          {         StopVerify = true; result = true;}
          else {StopVerify = false; result = false;}
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error", __LINE__, __FUNCTION__); //
          return result ; //
}
//+------------------------------------------------------------------+
//|                    Verify Lower Stop Level                       |19
//+------------------------------------------------------------------+
bool Ct_SetPrices::VerifyLowerStopLevel(double argVerifyPrice, double op = 0, bool result = false)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error", __LINE__, __FUNCTION__); //
          double OpenPrice;
          bool StopVerify;
          double StopLevel_Amount = MarketInfo(StSymbol.Current, MODE_STOPLEVEL) * Point;
          //==========================
          if(op == 0)
          {         OpenPrice = MarketInfo(StSymbol.Current, MODE_BID);}
          else {OpenPrice = op;}
          //==========================
          double Price_Lower_StopLevel = OpenPrice - StopLevel_Amount;
          if(argVerifyPrice < Price_Lower_StopLevel)
          {         StopVerify = true; result = true;}
          else {StopVerify = false; result = false;}
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error", __LINE__, __FUNCTION__); //
          return result;//
}
//+------------------------------------------------------------------+
//|                 Adjust Above Stop Level                          |20//---ok--- ---alpary not accepted this changes just (bid for sell) and (ask for buy)
//+------------------------------------------------------------------+
double Ct_SetPrices::Adjust_Above_StopLevel(double argAdjustPrice, int add_Pips = 0, double op = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error", __LINE__, __FUNCTION__); //
          ///Stop Level Calculation
          double OpenPrice;
          double AdjustedPrice;
          if(op == 0) { OpenPrice = MarketInfo(StSymbol.Current, MODE_ASK);}
          else        { OpenPrice = op;}
          //=================================================
          double StopLevel_Amount      = MarketInfo(StSymbol.Current, MODE_STOPLEVEL) * Point;
          double Price_Upper_StopLevel = OpenPrice + StopLevel_Amount;
          double MinStop_Amount        = add_Pips * ct_Drive.TDD.ct_Market_Symbol.POINT_PIPf();;
          //=================================================
          if(argAdjustPrice <= Price_Upper_StopLevel)   { AdjustedPrice = Price_Upper_StopLevel + MinStop_Amount;}
          else                                          { AdjustedPrice = argAdjustPrice;}
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error", __LINE__, __FUNCTION__); //
          return(AdjustedPrice);//
}
//+------------------------------------------------------------------+
//|                     Adjust Price Below Stop Level                |21 //---ok---
//+------------------------------------------------------------------+
double Ct_SetPrices::Adjust_Below_StopLevel(double argAdjustPrice, int add_Pips = 0, double op = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error", __LINE__, __FUNCTION__); //
          double OpenPrice;
          double AdjustedPrice;
          if(op == 0) { OpenPrice = MarketInfo(StSymbol.Current, MODE_BID);}
          else        { OpenPrice = op;}
          //==========================================
          double StopLevel_Amount       = MarketInfo(StSymbol.Current, MODE_STOPLEVEL) * Point;
          double MinStop_Amount         = add_Pips * ct_Drive.TDD.ct_Market_Symbol.POINT_PIPf();
          double Price_Lower_StopLevel  = OpenPrice - StopLevel_Amount;
          ///========================================= Verifying Pending ct_Order SL-TP-Prices order
          if(argAdjustPrice >= Price_Lower_StopLevel)   { AdjustedPrice = Price_Lower_StopLevel - MinStop_Amount;}
          else                                          { AdjustedPrice = argAdjustPrice;}
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error", __LINE__, __FUNCTION__); //
          return(AdjustedPrice); //
}
//+------------------------------------------------------------------+
//|                        Add Stop Profit                           |22
//+------------------------------------------------------------------+
bool Ct_SetPrices::Add_SL_TP_byTicket(const int argTicket, const double sl,  const double tp, bool result = false)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error", __LINE__, __FUNCTION__); //
          bool select = OrderSelect(argTicket, SELECT_BY_TICKET);
          double OpenPrice = OrderOpenPrice();
          while(IsTradeContextBusy()) {Sleep(10);} // Modify ct_Order
          //Alert(argTicket, "=argTicket====","-Line:",__LINE__); Alert(OrderOpenPrice(), "=OrderOpenPrice()====","-Line:",__LINE__);
          //Alert(sl, "=sl====","-Line:",__LINE__); Alert(tp, "=tp====","-Line:",__LINE__);
          bool TicketMod = OrderModify(argTicket, OrderOpenPrice(), sl, tp, 0);
          if(TicketMod) {result = true;}
          if(!TicketMod)// Error Handling
          {         ct_Drive.TDD.ct_End.SONargTicket = argTicket;    ct_Drive.TDD.ct_End.SONargStopLoss = sl;  ct_Drive.TDD.ct_End.SONargTakeProfit = tp;
                    ct_Drive.TDD.ct_End.Superviser("Add Stop/Profit - Error ", __LINE__, __FUNCTION__, argTicket, (uint)OrderLots(), sl, tp);
                    result = false;//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error", __LINE__, __FUNCTION__); //
          return result ;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Ct_SetPrices::Calc_TPSL_Level(int TPSL, int TypeOrder, int tp = 0, int sl = 0, double op = 0)  //---op: open price
{
//==========================
          double TPXStopLoss = -1; //
          double PipPoint_val = ct_Drive.TDD.ct_Market_Symbol.POINT_PIP;//
          Add_Pips = 10;//
//==========================
          switch(TypeOrder)//SL
          {         case OP_BUY://OP_BUY|OP_BUYLIMIT|OP_BUYSTOP:
                    {         if(TPSL == SL_Mode)
                              {         if(sl == 0)     {return(PriceBuySL);}
                                        PriceBuySL = op - (sl * PipPoint_val);
                                        if(PriceBuySL > 0) return  Adjust_Below_StopLevel(PriceBuySL,  Add_Pips, op);//
                              } //
                              else if(TPSL == TP_Mode)
                              {         if(tp == 0)     {return(PriceBuyTP);}
                                        PriceBuyTP = op + (tp * PipPoint_val);
                                        if(PriceBuyTP > 0) return Adjust_Above_StopLevel( PriceBuyTP,  Add_Pips, op); //
                              } //
                    }; break; //
                    //-------------------------------------
                    case OP_BUYLIMIT:
                    {         if(TPSL == SL_Mode)
                              {         if(sl == 0)   {return(PriceBuySL);}
                                        PriceBuySL = op - (sl * PipPoint_val);
                                        if(PriceBuySL > 0)return Adjust_Below_StopLevel(PriceBuySL,  Add_Pips, op); //
                              } //
                              else if(TPSL == TP_Mode)
                              {         if(tp == 0) {return(PriceBuyTP);}
                                        PriceBuyTP = op + (tp * PipPoint_val);
                                        if(PriceBuyTP > 0)return Adjust_Above_StopLevel( PriceBuyTP,  Add_Pips, op); ///
                              } //
                    }; break; //
                    //-------------------------------------
                    case OP_BUYSTOP:
                    {         if(TPSL == SL_Mode)
                              {         if(sl == 0)   {return(PriceBuySL );}
                                        PriceBuySL = op - (sl * PipPoint_val);
                                        if(PriceBuySL > 0)return  Adjust_Below_StopLevel(PriceBuySL, Add_Pips, op); //
                              } //
                              else if(TPSL == TP_Mode)
                              {         if(tp == 0) {return(PriceBuyTP);}
                                        PriceBuyTP = op + (tp * PipPoint_val);
                                        if(PriceBuyTP > 0)return Adjust_Above_StopLevel( PriceBuyTP,  Add_Pips, op); //
                              } //
                    } ; break; //
                    //
                    //===========================================================================================
                    case OP_SELL:
                    {         if(TPSL == SL_Mode)
                              {         if(sl == 0)     {return(PriceSellSL);}
                                        PriceSellSL = op + (sl * PipPoint_val);
                                        if(PriceSellSL > 0)return Adjust_Above_StopLevel( PriceSellSL,  Add_Pips, op); //
                              } // ////Ask * 1.02
                              else if(TPSL == TP_Mode)
                              {         if(tp == 0)     {return(PriceSellTP);}
                                        PriceSellTP = op - (tp * PipPoint_val);
                                        if(PriceSellTP > 0)return Adjust_Below_StopLevel( PriceSellTP,  Add_Pips, op);// ////Bid * 1.02
                              }//
                              //Alert("", "");//
                    }; break; //
                    case OP_SELLLIMIT:
                    {         if(TPSL == SL_Mode)////Ask * 1.02
                              {         if(sl == 0)   {return(PriceSellSL);}
                                        PriceSellSL = op + (sl * PipPoint_val);
                                        if(PriceSellSL > 0) return Adjust_Above_StopLevel(PriceSellTP,  Add_Pips, op); //
                              }
                              else if(TPSL == TP_Mode) ////Bid * 1.02
                              {         if(tp == 0) { return(PriceSellTP);}
                                        PriceSellTP = op - (tp * PipPoint_val);
                                        if(PriceSellTP > 0)return Adjust_Below_StopLevel( PriceSellSL,  Add_Pips, op); //
                              } //
                    }; break; //
                    case OP_SELLSTOP:
                    {         if(TPSL == SL_Mode)
                              {         if(sl == 0)   {return(PriceSellSL);}
                                        PriceSellSL = op + (sl * PipPoint_val);
                                        if(PriceSellSL > 0)return Adjust_Above_StopLevel( PriceSellSL, Add_Pips, op); //
                              } ////Ask * 1.02
                              else if(TPSL == TP_Mode)////Bid * 1.02
                              {         if(tp == 0) {         return(PriceSellTP);}
                                        PriceSellTP = op - (tp * PipPoint_val);
                                        if(PriceSellTP > 0)return Adjust_Below_StopLevel(PriceSellTP,  Add_Pips, op); //
                              } //
                    }; break; //
          }
          //=============================Formulator
          //{         if(TPSL == 1) {if(TPXStopLoss == 0) {return(PriceBuySL);} PriceBuySL = op - (sl * PipPoint_val); return(PriceBuySL);} else if(TPSL == 0) {if(tp == 0) {return(PriceBuyTP);} PriceBuyTP = op + (tp * PipPoint_val); return(PriceBuyTP);} } //
          //==========================Assining
          switch(TypeOrder)
          {         case OP_BUY:
                    {  }; break; //
                    case OP_SELL:
                    {    }; break; //
                    //-------------------------------------
                    case OP_BUYLIMIT:
                    {      }; break; //
                    case OP_SELLLIMIT:
                    {     }; break; //
                    //-------------------------------------
                    case OP_BUYSTOP:
                    {      }; break; //
                    case OP_SELLSTOP:
                    {    }; break; //
          }
          //==========================
          return -1;//
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_SetPrices::Update()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //
          //
          {         // #1 Define Prices
                    PricesPool();
                    // #2 Adjust Prices
                    PLV(OP_BUY);//
                    PLV(OP_BUYLIMIT);//
                    PLV(OP_BUYSTOP);//
                    PLV(OP_SELL);//
                    PLV(OP_SELLLIMIT);//
                    PLV(OP_SELLSTOP);//
          }
//
          UseCommentX                     = "need Cheak";
          UseAdjustPriceX                 = 0;
          Add_Pips                     = 150;
          UseOpenPriceX                   = 0;
          UseStopVerifyPriceX             = 150;
          //BuyStopRunX
//
          PriceModify                     = iClose(Symbol(), PERIOD_CURRENT, 0) + (200 * Point); //
//
          DayOpen                         = iOpen(NULL, PERIOD_D1, 0);//-- GetOpen&Close
          DayClose                        = iClose(NULL, PERIOD_D1, 0);
          DayHigh                         = iHigh(NULL, PERIOD_D1, 0);//-- GetOpen&Close
          DayLow                          = iLow(NULL, PERIOD_D1, 0);//
//
          return true;//
//
}
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
void OpenOrderBy_ATR()
{         double              GapRange        = 10;
          double              SL_Factor       = 2;
          double              TP_Factor       = 3;
          double              MM_Risk         = 2;
          //---- ONE TRADE PER BAR
          static bool ToTrade;
          if(Detect_NewBar._CURRENT.CBT.Is_NewBar) { if( ct_Drive.TDD.ct_Bank.CheckOpenTrades(1, 101187) == 0 &&  ct_Drive.TDD.ct_Bank.CheckOpenTrades(2, 201187) == 0) ToTrade = true; }
          //---- GAP
          bool                GAP             = false;
          double              CurrOpen        = iOpen(NULL, 0, 0);
          double              PrevClose       = iClose(NULL, 0, 1);
          double              Range           = MathAbs(PrevClose - CurrOpen);
          if(Range >= GapRange * Point * 10) GAP = true;//
          //---- TP / SL
          double              ATR             = iATR(NULL, 0, 13, 1);
          double              Spread          = MarketInfo(Symbol(), MODE_SPREAD) * Point;
          double              TakeProfit_     = ATR * TP_Factor;
          double              StopLoss_       = (ATR * SL_Factor) + Spread;//
          //----------------
          //---- TRADE
          int Ticket_;
          if(ToTrade == true && GAP == true)
          {         if(CurrOpen < PrevClose)
                    {         Ticket_ = OrderSend(Symbol(), OP_BUY, ct_Drive.TDD.ct_Size.GetLotSizeByRisk_SL(MM_Risk, StopLoss_), Ask, 3, Ask - StopLoss_, Ask + TakeProfit_, "Gap_Trader.B", 101187, 0, Blue);
                              if(Ticket_ < 0)
                              {         Print("Error in OrderSend : ", GetLastError()); }
                              else {  ToTrade = false; } //
                    }
                    if(CurrOpen > PrevClose)
                    {         Ticket_ = OrderSend(Symbol(), OP_SELL, ct_Drive.TDD.ct_Size.GetLotSizeByRisk_SL(MM_Risk, StopLoss_), Bid, 3, Bid + StopLoss_, Bid - TakeProfit_, "Gap_Trader.S", 201187, 0, Red);
                              if(Ticket_ < 0)
                              {         Print("Error in OrderSend : ", GetLastError()); }
                              else {  ToTrade = false; } //
                    } //
          }
//----
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool SetOrderBy_Range()
{         double        validPoint      = ct_Drive.TDD.ct_Market_Symbol.PipPoint(Symbol());
          int           RangeAmount     = (int)(iHigh(Symbol(), PERIOD_CURRENT, 0) - iLow(Symbol(), PERIOD_CURRENT, 0)); //
          int           cashSL          = (int)RangeAmount / 10;
          //dynamic  SLPoints  TPPoints
          int           SLPoints2       = RangeAmount / 2; ///Ask - 25 * validPoint;
          int           SLPoints1       = RangeAmount / 1; ///Ask - 25 * validPoint;
          int           TPPoints1       = RangeAmount * 1; ///Ask + 25 * validPoint;
          int           TPPoints2       = RangeAmount * 2; ///Ask - 25 * validPoint;
          int           TPPoints3       = RangeAmount * 3; ///Ask - 25 * validPoint;
          int           SLPointsTPX     = SLPoints1; //
          int           TPPointsTPX     = SLPoints2; //
          //---------------------------------------
          double        PriceOpenTPX    = 0;//;Ask;//Bid
          int           TypeOrder       = 0; //
          (TypeOrder == OP_BUY) ? ( PriceOpenTPX = Ask ) : (PriceOpenTPX = Bid) ; //  //
//---------------------------------------
          double        SLPrice         = PriceOpenTPX - (SLPointsTPX * validPoint);
          double        TPPrice         = PriceOpenTPX + (TPPointsTPX * validPoint);
          int           ticket          = OrderSend(Symbol(), OP_BUY, 1, Ask, 3, SLPrice, TPPrice, "My order", 1234, 0, Green);
//---------------------------------------
          //PrintFormat("ticket  =(%i)", ticket);
          return(true);//
//---------------------------------------
}//
//+------------------------------------------------------------------+
