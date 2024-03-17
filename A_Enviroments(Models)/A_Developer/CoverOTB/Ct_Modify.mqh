//+------------------------------------------------------------------+
//|                                                Ct_Modify.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Data_Model.mqh>
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|             Class MyRoboTrader     BEGIN                         |
//+------------------------------------------------------------------+
#define MagicNumber_Mofied 99999

#define MofieTypeALL                000
#define MofieTypeMarketAll          100
#define MofieTypeBuyMarket          110
#define MofieTypeSellMarket         120
#define MofieTypePending_BuyStop   210
#define MofieTypePending_BuyLimit  211
#define MofieTypePending_SellStop  220
#define MofieTypePending_SellLimit 221
#define MofieTypePendingAll        200
#define MofieTypePendingAllBuy     212
#define MofieTypePendingAllSell    222
struct St_OrderCom
{         int           MagicNumber;//     = OrderMagicNumber();
          string        SymbolCom;//       = OrderSymbol()
          int           TicketNum;//       = OrderTicket();
          double        OpenPrice;//       = OrderOpenPrice();
          double        StopLoss;//          = 0;
          double        TakeProfit;//      = OrderTakeProfit();
          datetime      Expiration;//      = OrderExpiration();;
          double        Lots;
          color         Color;//           = Yellow;
          int           Type;//
          int           Totals;
          double        Profit;//OrderProfit();
          //------------------------------------------------------
          double        Diff_Open_SL;
          double        Diff_Open_TP;//

};
struct St_OrderModify
{         int           TicketNum;//       = OrderTicket();
          double        OpenPrice;//       = OrderOpenPrice();
          double        StopLoss;//          = 0;
          double        StopLoss_Crossed_v_StartPrice;
          double        TakeProfit;//      = OrderTakeProfit();
          datetime      Expiration;//      = OrderExpiration();;
          color         Color;//           = Yellow;
          int           Totals;
          double        Profit;//OrderProfit();
          //------------------------------------------------------
          double        Diff_Open_SL;
          double        Diff_Open_TP; //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct St_Stops
{         double        PriceCurrent;                             // = _OrderCom.TakeProfit;
          double        Price_MaxSell;                            // = Ask - Stops * ct_Drive.TDD.ct_Market_Symbol.POINT_PIP  ;; //
          double        Price_MaxBUY;                             // = Bid + Stops * ct_Drive.TDD.ct_Market_Symbol.POINT_PIP  ;; //
          bool          Is_PriceCurrent_Grater_PriceMaxSELL;      // = (TrailTP.PriceCurrent  > TrailTP.Price_MaxSell) || (TrailTP.PriceCurrent == 0) ;  // = BID; for Buy    ASK for Sell
          bool          Is_PriceCurrent_Lower_PriceMaxBUY;        // = TrailTP.PriceCurrent   < TrailTP.Price_MaxBUY;
          //----------------------------------------------------------------------
          int Curr_Pip_temp;//
          int Curr_Pip;//
          int INP_Pip;
          int Fixed_Pip;
          bool  Update(int TS_Fixed_Pip)//  if(true)//Calcing TPSLPP
          {         Fixed_Pip = TS_Fixed_Pip;//200; //Pipet
                    if(true)//ManualModeGet
                    {         //when actie pannel
                              if(ObjectFind(0, "S_EDIT " + "Set TS..") >= 0)
                              {         //---force to digit
                                        if(Utilities.StringLieraled("S_EDIT " + "Set TS.." )) { ObjectSetString(0, "S_EDIT " + "Set TS..", OBJPROP_TEXT, "Set TS.."); }
                                        //--- click ok
                                        if(ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_TS_Ok) { INP_Pip = (int)Utilities.DescToDouble("S_EDIT " + "Set TS.."); } //
                              }//
                    }
                    else if(!ct_Drive.TDD.ct_Bank.Is_MoneyManagerPad)//AutoModeGet
                    {         INP_Pip       = (int)MathRound(MathAbs(Ask - Bid) + Bid * 0.01) ;  }
                    //---------------------------------------------------Assignment
                    if(INP_Pip > 0) {Curr_Pip = INP_Pip;}
                    else            {Curr_Pip = Fixed_Pip;}
                    //---------------------------------------------------checking & verifying
                    //--if (Curr_Pip < 200)           {Curr_Pip    = Fixed_Pip;}
                    //---------------------------------------------------GetAmount TPSLPP
                    //StopLossAmount(Curr_Pip);
                    //RiskedStopLossPoints = Curr_Pip;
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
                    return true;//
          }//
};
struct St_Profit_Min
{         double        diff_PipsProfit_SellCurrent, diff_PipsProfit_BuyCurrent;
          double        MinProfit, MinProfit_1, MinProfit_2, MinProfit_3;
          bool          Is_Current_Grater_MinProfit_SELL;                        // = PipsProfit_Sell_TPCurrent >= MinProfit_SellTP; //--get minimum then step step inc
          bool          Is_Current_Grater_MinProfit_BUY;                        // = PipsProfit_Buy_TPCurrent  >= MinProfit_BuyTP;  //--get minimum then step step inc
          //--------------------------------------------------------
          int Curr_Pip;//  Profit_Min_Pip_want
          int INP_Pip;
          int Fixed_Pip;
          //--------------------------------------------------------
          int MinimumProfit_Pip;
          //--------------------------------------------------------
          bool  Update(int MP_Fixed_Pip)//  if(true)//Calcing TPSLPP
          {         Fixed_Pip = MP_Fixed_Pip;//200; //Pipet
                    if(true)//ManualModeGet
                    {         //when actie pannel
                              if(ObjectFind(0, "S_EDIT " + "Set MP..") >= 0)
                              {         //---force to digit
                                        if(Utilities.StringLieraled("S_EDIT " + "Set MP.." )) { ObjectSetString(0, "S_EDIT " + "Set MP..", OBJPROP_TEXT, "Set MP.."); }
                                        //--- click ok
                                        if(ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_MP_Ok)    { INP_Pip = (int)Utilities.DescToDouble("S_EDIT " + "Set MP.."); } //
                              }//
                    }
                    else if(!ct_Drive.TDD.ct_Bank.Is_MoneyManagerPad)//AutoModeGet
                    {         INP_Pip       = (int)MathRound(MathAbs(Ask - Bid) + Bid * 0.01) ;  }
                    //---------------------------------------------------Assignment
                    if(INP_Pip > 0) {Curr_Pip = INP_Pip;}
                    else            {Curr_Pip = Fixed_Pip;}
                    //---------------------------------------------------checking & verifying
                    //if (Curr_Pip < 200)           {Curr_Pip    = Fixed_Pip;}
                    //---------------------------------------------------GetAmount TPSLPP
                    //StopLossAmount(Curr_Pip);
                    //RiskedStopLossPoints = Curr_Pip;
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
                    return true;//
          }//
};
struct Stm_Trail_Data
{         //----------------------------------------------------------------------
          St_Stops         Stops;
          St_Profit_Min    ProfitMin;
          //----------------------------------------------------------------------
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct Stm_Trails
{         //
          Stm_Trails()
          {         initer( 50);         //--175 , 50  TrailingStop_Inp, MinimumProfit_Inp      // for(int Counter = 0; Counter <= OrdersTotal() - 1; Counter++)// Calculate Max Stop and Min Profit    //bool select = OrderSelect(Counter, SELECT_BY_POS);
          }
          ~Stm_Trails() {}
          void Update()
          {         initer( MP_Pip_Fixed_inp);
                    TrailSL.Stops.Update(TS_Pip_Fixed_inp); TrailSL.ProfitMin.Update(MP_Pip_Fixed_inp);
                    TrailTP.Stops.Update(TS_Pip_Fixed_inp); TrailTP.ProfitMin.Update(MP_Pip_Fixed_inp);
                    //
          }
          //===============================================
          bool          Is_Order_Closed         ;//= false;
          bool          Is_Order_Trailed_Over   ;//= false;
          bool          Is_Order_Trailed_Inver  ;
          bool          Is_Cross_StartPrice     ;//= false;
          //
          bool          Is_CurrentSL_Toched              ;//= _OrderCom.StopLoss            >  _OrderModify.StopLoss;


          bool          Is_Do                            ;//= false;  //= Profit_Real_Amount           >  Distance;

          bool          Is_MagicNumber                   ;//= _OrderCom.MagicNumber ==  ct_Drive.TDD.ct_Bank.MagicNumber;
          bool          Is_Symbol                        ;//= _OrderCom.SymbolCom   == StSymbol.Current;

          double        Temp_Base_Trail_Price          ;//= 0;
          bool          Is_saveSL                      ;//= false;
          //+------------------------------------------------------------------+
          Stm_Trail_Data  TrailSL;
          Stm_Trail_Data  TrailTP;
          //-------------------------------------------------------------------
          int           BreakEvenProfitPips;
          //-------------------------------------------------------------------
          bool          TrailingSL_TP(bool IsOnTick); //must selected..  //*** when Profited one Dollar. then Trailing...

          void                  initer( int PM_P_W);
          void                  HandelOrders();
          bool                  Cheacker();
          St_OrderCom           _OrderCom;
          St_OrderModify        _OrderModify;
          void                  Get_OrderCom();
          void                  Set_OrderModify();
          void                  Select_Trail_Price(bool b);
          //
          double                Calc_Profit_Real_Amount();

          void                  CheackCross_Start();
          void                  set_StopLoss_Crossed_StartPrice(int div);
          double                Calc_RealProfit_ByLot(int leverage);
          void                  CheackCurrentSL_Toched();
          void                  Set_Modify__By_Cross_StartPrice__Else();
          void                  Define_SL_Trailing_By_MinProfit(uchar minMode, int sl_curr_Pip, int sl_MinimumProfit_Pips, int tp_curr_Pip, int tp_MinimumProfit_Pips);

          void                  Define_SL_BreakEvenStop(int f_BreakEvenProfitPips, double factor);
          //
};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Stm_Trails::initer( int PM_P_W)
{         BreakEvenProfitPips = TrailSL.ProfitMin.MinimumProfit_Pip = TrailTP.ProfitMin.MinimumProfit_Pip = PM_P_W;
          //
          Is_Order_Closed                       = false;
          Is_Order_Trailed_Over                 = false;
          Is_Order_Trailed_Inver                = false;
          Is_Cross_StartPrice                   = false;
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Stm_Trails::TrailingSL_TP(bool IsOnTick) //must selected..  //*** when Profited one Dollar. then Trailing...
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Modify Error", __LINE__, __FUNCTION__); //
          /*
          #1 Init & Collect order info
          #2 Cheak & Calc SL    is sl cross start support that profit just no chane sl again
          #3 Send New Values
          */
          bool result  = false;
          HandelOrders();
          if(!Cheacker())return false;
          Select_Trail_Price(true);
          //--------------------------------------------------------------------------------------------------------
          if(IsOnTick)
          {         int factor = 0;
                    switch(Ticker.eTradeRisk)
                    {         case  eVoid_TradeRisk:            break;
                              case  eVoid_TradeRisk_High2:  { factor = 3;  }     break;
                              case  eVoid_TradeRisk_High1:  { factor = 2;  }    break;
                              case  eVoid_TradeRisk_Medium: { factor = 1;  }    break;
                              case  eVoid_TradeRisk_Low1:   { factor = 2;  }    break;
                              case  eVoid_TradeRisk_Low2:   { factor = 3;  }    break;
                              default:  break;//
                    }
                    if(_OrderCom.Profit < 2 * factor)
                    {         Define_SL_BreakEvenStop(BreakEvenProfitPips = 250 * factor, 2);         ///---fixed stoploss //--after profit 2.50 $ half keeper
                              Define_SL_Trailing_By_MinProfit(0, TrailSL.Stops.Curr_Pip = 150 * factor, TrailSL.ProfitMin.MinimumProfit_Pip = 50 * factor, TrailTP.Stops.Curr_Pip = 150 * factor, TrailTP.ProfitMin.MinimumProfit_Pip = 50 * factor); /////--Gap Distance Follow with price
                    }
                    if(_OrderCom.Profit > 2 * factor)
                    {         Define_SL_BreakEvenStop(BreakEvenProfitPips = 250 * factor, 2);  ///---fixed stoploss //--after profit 2.50 $ half keeper
                              Define_SL_Trailing_By_MinProfit(1, TrailSL.Stops.Curr_Pip = 150 * factor, TrailSL.ProfitMin.MinimumProfit_Pip = 100 * factor, TrailTP.Stops.Curr_Pip = 150 * factor, TrailTP.ProfitMin.MinimumProfit_Pip = 100 * factor); /////--Gap Distance Follow with price
                    }
                    if(_OrderCom.Profit > 4 * factor)
                    {         Define_SL_BreakEvenStop(BreakEvenProfitPips = 250 * factor, 0.8); ///---fixed stoploss //--after profit 2.50 $ half keeper
                              Define_SL_Trailing_By_MinProfit(2, TrailSL.Stops.Curr_Pip = 100 * factor, TrailSL.ProfitMin.MinimumProfit_Pip = 200 * factor, TrailTP.Stops.Curr_Pip = 100 * factor, TrailTP.ProfitMin.MinimumProfit_Pip = 300 * factor); //
                    }
                    if(_OrderCom.Profit > 5 * factor)
                    {         Define_SL_BreakEvenStop(BreakEvenProfitPips = 250 * factor, 1.3); ///---fixed stoploss //--after profit 2.50 $ half keeper
                              Define_SL_Trailing_By_MinProfit(3, TrailSL.Stops.Curr_Pip = 75 * factor, TrailSL.ProfitMin.MinimumProfit_Pip = 300 * factor, TrailTP.Stops.Curr_Pip = 75 * factor, TrailTP.ProfitMin.MinimumProfit_Pip = 400 * factor); //
                    }
                    if(_OrderCom.Profit > 7 * factor)
                    {         Define_SL_BreakEvenStop(BreakEvenProfitPips = 250 * factor, 0.4);  ///---fixed stoploss //--after profit 2.50 $ half keeper
                              Define_SL_Trailing_By_MinProfit(3, TrailSL.Stops.Curr_Pip = 50 * factor, TrailSL.ProfitMin.MinimumProfit_Pip = 400 * factor, TrailTP.Stops.Curr_Pip = 50 * factor, TrailTP.ProfitMin.MinimumProfit_Pip = 500 * factor); //
                    }//
          }
          else
          {         if(_OrderCom.Profit < 2)
                    {         Define_SL_BreakEvenStop(BreakEvenProfitPips = 250, 2);           ///---fixed stoploss //--after profit 2.50 $ half keeper
                              Define_SL_Trailing_By_MinProfit(0, TrailSL.Stops.Curr_Pip = 150, TrailSL.ProfitMin.MinimumProfit_Pip = 50, TrailTP.Stops.Curr_Pip = 150, TrailTP.ProfitMin.MinimumProfit_Pip = 50); /////--Gap Distance Follow with price
                    }
                    if(_OrderCom.Profit > 2)
                    {         Define_SL_BreakEvenStop(BreakEvenProfitPips = 250, 2);   ///---fixed stoploss //--after profit 2.50 $ half keeper
                              Define_SL_Trailing_By_MinProfit(1, TrailSL.Stops.Curr_Pip = 150, TrailSL.ProfitMin.MinimumProfit_Pip = 100, TrailTP.Stops.Curr_Pip = 150, TrailTP.ProfitMin.MinimumProfit_Pip = 100); /////--Gap Distance Follow with price
                    }
                    if(_OrderCom.Profit > 4)
                    {         Define_SL_BreakEvenStop(BreakEvenProfitPips = 250, 0.8);  ///---fixed stoploss //--after profit 2.50 $ half keeper
                              Define_SL_Trailing_By_MinProfit(2, TrailSL.Stops.Curr_Pip = 100, TrailSL.ProfitMin.MinimumProfit_Pip = 200, TrailTP.Stops.Curr_Pip = 100, TrailTP.ProfitMin.MinimumProfit_Pip = 300); //
                    }
                    if(_OrderCom.Profit > 5)
                    {         Define_SL_BreakEvenStop(BreakEvenProfitPips = 250, 1.3);  ///---fixed stoploss //--after profit 2.50 $ half keeper
                              Define_SL_Trailing_By_MinProfit(3, TrailSL.Stops.Curr_Pip = 75, TrailSL.ProfitMin.MinimumProfit_Pip = 300, TrailTP.Stops.Curr_Pip = 75, TrailTP.ProfitMin.MinimumProfit_Pip = 400); //
                    }
                    if(_OrderCom.Profit > 7)
                    {         Define_SL_BreakEvenStop(BreakEvenProfitPips = 250, 0.4);   ///---fixed stoploss //--after profit 2.50 $ half keeper
                              Define_SL_Trailing_By_MinProfit(3, TrailSL.Stops.Curr_Pip = 50, TrailSL.ProfitMin.MinimumProfit_Pip = 400, TrailTP.Stops.Curr_Pip = 50, TrailTP.ProfitMin.MinimumProfit_Pip = 500); //
                    }//
          }
          //--------------------------------------------------------------------------------------------------------
          //Send OrderModify
          Set_Modify__By_Cross_StartPrice__Else(); //---if cross modifiyed
          //--------------------------------------------------------------------------------------------------------
          ct_Drive.TDD.ct_Modify.Trails.TrailSL.Stops.Curr_Pip = ct_Drive.TDD.ct_Modify.Trails.TrailSL.Stops.Curr_Pip_temp;
          //--------------------------------------------------------------------------------------------------------
          return result;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Stm_Trails::HandelOrders()    // handel orders
{         Get_OrderCom();               //CurrectOrder Info
          Set_OrderModify();            //---OrderModify()
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Stm_Trails::Cheacker()
{         //--Cheak is selected
          {         //**
                    //Alert("_OrderCom.Type : ", _OrderCom.Type, " _OrderCom.TicketNum : ", _OrderCom.TicketNum, " _OrderCom.Totals : ", _OrderCom.Totals,"   _OrderCom.Profit: ",_OrderCom.Profit);
                    Is_MagicNumber         = _OrderCom.MagicNumber ==  ct_Drive.TDD.ct_Bank.MagicNumber || _OrderCom.MagicNumber == 20131111;
                    Is_Symbol              = _OrderCom.SymbolCom   == StSymbol.Current;
                    //if(_OrderCom.Type > 1); || _OrderCom.Type > 1
                    if(!Is_MagicNumber || !Is_Symbol ) return false; //
          }
          //
          return true; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Stm_Trails::Select_Trail_Price(bool b)
{         Temp_Base_Trail_Price = 0;
          if(b)
          {         Temp_Base_Trail_Price =  _OrderCom.OpenPrice ;//
                    if(_OrderCom.Type == OP_SELL) {   Temp_Base_Trail_Price =  MarketInfo(StSymbol.Current, MODE_ASK); }//
                    if(_OrderCom.Type == OP_BUY)  {   Temp_Base_Trail_Price =  MarketInfo(StSymbol.Current, MODE_BID); }//
          }
          //
          else
          {         if(_OrderCom.Type == OP_SELL) {   Temp_Base_Trail_Price =  High[1]; } //
                    if(_OrderCom.Type == OP_BUY)  {   Temp_Base_Trail_Price =  Low[1];  } //
          } //
}
//+------------------------------------------------------------------+
//|                                                                  |( TrailingStop_Pip / 2   _OrderCom.Lots * 100 * 50 * ct_Drive.TDD.ct_Market_Symbol.POINT_PIP
//+------------------------------------------------------------------+
void Stm_Trails::Define_SL_Trailing_By_MinProfit(uchar minMode, int sl_curr_Pip, int sl_MinimumProfit_Pips, int tp_curr_Pip, int tp_MinimumProfit_Pips) //--even sl before start price
{         //--- Alert("Stops: ", Stops, "  SL_MinimumProfit:", SL_MinimumProfit);  need pannewl top change
          //----------------------------------------------------------------------------------------------------------------------------------
          //----------------------------------------------------------------------------------------------------------------------------------
          //Define SL how to trailing
          {
                    {         //******Step step SL MAX
                              TrailSL.Stops.PriceCurrent                                 = _OrderCom.StopLoss;
                              TrailSL.Stops.Price_MaxSell                                = Ask + ( sl_curr_Pip * ct_Drive.TDD.ct_Market_Symbol.POINT_PIP);                          //              Bid for Buy    ASK for Sell
                              TrailSL.Stops.Price_MaxBUY                                 = Bid - ( sl_curr_Pip * ct_Drive.TDD.ct_Market_Symbol.POINT_PIP);                          //              Bid for Buy    ASK for Sell
                              TrailSL.Stops.Is_PriceCurrent_Grater_PriceMaxSELL          = (TrailSL.Stops.PriceCurrent > TrailSL.Stops.Price_MaxSell) || (TrailSL.Stops.PriceCurrent == 0) ;      // = BID;       Bid for Buy    ASK for Sell
                              TrailSL.Stops.Is_PriceCurrent_Lower_PriceMaxBUY            = (TrailSL.Stops.PriceCurrent < TrailSL.Stops.Price_MaxBUY);                                    // = BID;       Bid for Buy    ASK for Sell
                    }
                    //----------------------------------------------------------------------------------------------------------------------------------
                    {         //******Confirmed minimal profit step SL ////minprofit guvenligi
                              TrailSL.ProfitMin.diff_PipsProfit_SellCurrent             = _OrderCom.OpenPrice - Ask; //--sell profit pure
                              TrailSL.ProfitMin.diff_PipsProfit_BuyCurrent              = Bid - _OrderCom.OpenPrice; //--buy profit pure
                              TrailSL.ProfitMin.MinProfit                               = (sl_MinimumProfit_Pips * 1 * ct_Drive.TDD.ct_Market_Symbol.POINT_PIP); //--estimated Sell minimum profit
                              TrailSL.ProfitMin.MinProfit_1                             = (sl_MinimumProfit_Pips * 2 * ct_Drive.TDD.ct_Market_Symbol.POINT_PIP);
                              TrailSL.ProfitMin.MinProfit_2                             = (sl_MinimumProfit_Pips * 3 * ct_Drive.TDD.ct_Market_Symbol.POINT_PIP);
                              TrailSL.ProfitMin.MinProfit_3                             = (sl_MinimumProfit_Pips * 4 * ct_Drive.TDD.ct_Market_Symbol.POINT_PIP);
                              //--------------------------------------------------------------------------------------------------
                              if(minMode == 0)
                              {         TrailSL.ProfitMin.Is_Current_Grater_MinProfit_SELL        = TrailSL.ProfitMin.diff_PipsProfit_SellCurrent >= TrailSL.ProfitMin.MinProfit; //--get minimum then step step inc
                                        TrailSL.ProfitMin.Is_Current_Grater_MinProfit_BUY         = TrailSL.ProfitMin.diff_PipsProfit_BuyCurrent  >= TrailSL.ProfitMin.MinProfit;  //--get minimum then step step inc
                              }
                              //--------------------------------------------------------------------------------------------------
                              if(minMode == 1)
                              {         TrailSL.ProfitMin.Is_Current_Grater_MinProfit_SELL        = TrailSL.ProfitMin.diff_PipsProfit_SellCurrent >= TrailSL.ProfitMin.MinProfit_1; //--get minimum then step step inc
                                        TrailSL.ProfitMin.Is_Current_Grater_MinProfit_BUY         = TrailSL.ProfitMin.diff_PipsProfit_BuyCurrent  >= TrailSL.ProfitMin.MinProfit_1;  //--get minimum then step step inc
                              }
                              if(minMode == 2)
                              {         TrailSL.ProfitMin.Is_Current_Grater_MinProfit_SELL        = TrailSL.ProfitMin.diff_PipsProfit_SellCurrent >= TrailSL.ProfitMin.MinProfit_2; //--get minimum then step step inc
                                        TrailSL.ProfitMin.Is_Current_Grater_MinProfit_BUY         = TrailSL.ProfitMin.diff_PipsProfit_BuyCurrent  >= TrailSL.ProfitMin.MinProfit_2;  //--get minimum then step step inc
                              }
                              if(minMode == 3)
                              {         TrailSL.ProfitMin.Is_Current_Grater_MinProfit_SELL        = TrailSL.ProfitMin.diff_PipsProfit_SellCurrent >= TrailSL.ProfitMin.MinProfit_3; //--get minimum then step step inc
                                        TrailSL.ProfitMin.Is_Current_Grater_MinProfit_BUY         = TrailSL.ProfitMin.diff_PipsProfit_BuyCurrent  >= TrailSL.ProfitMin.MinProfit_3;  //--get minimum then step step inc
                              }
                              //--------------------------------------------------------------------------------------------------
                    }
                    //----------------------------------------------------------------------------------------------------------------------------------
                    {         //*****StopLoss
                              //---***Confirmed sl >>> Goal is keep sl near open price until inssure trade
                              //-------****trial sl >>> Goal is keep sl near Ask-Bid price until inssure trade
                              {         if((_OrderCom.Type == OP_SELL) && TrailSL.Stops.Is_PriceCurrent_Grater_PriceMaxSELL && TrailSL.ProfitMin.Is_Current_Grater_MinProfit_SELL) {_OrderModify.StopLoss = TrailSL.Stops.Price_MaxSell; } //-- Is_Order_Trailed_Inver: falseerror:invalid stops Alert("PriceStopLossMax_SELL: ", PriceStopLossMax_SELL);
                                        if((_OrderCom.Type == OP_BUY)  && TrailSL.Stops.Is_PriceCurrent_Lower_PriceMaxBUY   && TrailSL.ProfitMin.Is_Current_Grater_MinProfit_BUY)  {_OrderModify.StopLoss = TrailSL.Stops.Price_MaxBUY ; } //--Alert("PriceStopLossMax_BUY: ", PriceStopLossMax_BUY);
                                        _OrderModify.StopLoss = NormalizeDouble(_OrderModify.StopLoss, Digits());//
                              }//
                    }//
          }
          //----------------------------------------------------------------------------------------------------------------------------------
          //----------------------------------------------------------------------------------------------------------------------------------
          //Define TP how to trailing
          {         //----------------------------------------------------------------------------------------------------------------------------------
                    {         //******Step step TP MAX
                              TrailTP.Stops.PriceCurrent                                 = _OrderCom.TakeProfit;
                              TrailTP.Stops.Price_MaxSell                                = Ask - tp_curr_Pip * ct_Drive.TDD.ct_Market_Symbol.POINT_PIP  ;; //
                              TrailTP.Stops.Price_MaxBUY                                 = Bid + tp_curr_Pip * ct_Drive.TDD.ct_Market_Symbol.POINT_PIP  ;; //
                              TrailTP.Stops.Is_PriceCurrent_Grater_PriceMaxSELL          = (TrailTP.Stops.PriceCurrent > TrailTP.Stops.Price_MaxSell) || (TrailTP.Stops.PriceCurrent == 0) ;  // = BID; for Buy    ASK for Sell
                              TrailTP.Stops.Is_PriceCurrent_Lower_PriceMaxBUY            = (TrailTP.Stops.PriceCurrent < TrailTP.Stops.Price_MaxBUY);                                  // = BID; for Buy    ASK for Sell
                    }
                    //----------------------------------------------------------------------------------------------------------------------------------
                    {         //******Confirmed minimal profit step tp ////minprofit guvenligi
                              TrailTP.ProfitMin.diff_PipsProfit_SellCurrent                               = _OrderCom.OpenPrice - Ask; //--sell profit pure
                              TrailTP.ProfitMin.diff_PipsProfit_BuyCurrent                                = Bid - _OrderCom.OpenPrice; //--buy profit pure
                              TrailTP.ProfitMin.MinProfit                                                 = tp_MinimumProfit_Pips * 1 * ct_Drive.TDD.ct_Market_Symbol.POINT_PIP; //--estimated Sell minimum profit
                              TrailTP.ProfitMin.MinProfit_1                                               = tp_MinimumProfit_Pips * 2 * ct_Drive.TDD.ct_Market_Symbol.POINT_PIP; //--estimated Buy minimum profit
                              TrailTP.ProfitMin.MinProfit_2                                               = tp_MinimumProfit_Pips * 3 * ct_Drive.TDD.ct_Market_Symbol.POINT_PIP;
                              TrailTP.ProfitMin.MinProfit_3                                               = tp_MinimumProfit_Pips * 4 * ct_Drive.TDD.ct_Market_Symbol.POINT_PIP;
                              //--------------------------------------------------------------------------------------------------
                              if(minMode == 0)
                              {         TrailTP.ProfitMin.Is_Current_Grater_MinProfit_SELL        = TrailTP.ProfitMin.diff_PipsProfit_SellCurrent >= TrailTP.ProfitMin.MinProfit; //--get minimum then step step inc
                                        TrailTP.ProfitMin.Is_Current_Grater_MinProfit_BUY         = TrailTP.ProfitMin.diff_PipsProfit_BuyCurrent  >= TrailTP.ProfitMin.MinProfit;  //--get minimum then step step inc
                              }
                              if(minMode == 1)
                              {         TrailTP.ProfitMin.Is_Current_Grater_MinProfit_SELL        = TrailTP.ProfitMin.diff_PipsProfit_SellCurrent >= TrailTP.ProfitMin.MinProfit_1; //--get minimum then step step inc
                                        TrailTP.ProfitMin.Is_Current_Grater_MinProfit_BUY         = TrailTP.ProfitMin.diff_PipsProfit_BuyCurrent  >= TrailTP.ProfitMin.MinProfit_1;  //--get minimum then step step inc
                              }//
                              if(minMode == 2)
                              {         TrailTP.ProfitMin.Is_Current_Grater_MinProfit_SELL        = TrailTP.ProfitMin.diff_PipsProfit_SellCurrent >= TrailTP.ProfitMin.MinProfit_2; //--get minimum then step step inc
                                        TrailTP.ProfitMin.Is_Current_Grater_MinProfit_BUY         = TrailTP.ProfitMin.diff_PipsProfit_BuyCurrent  >= TrailTP.ProfitMin.MinProfit_2;  //--get minimum then step step inc
                              }//
                              if(minMode == 3)
                              {         TrailTP.ProfitMin.Is_Current_Grater_MinProfit_SELL        = TrailTP.ProfitMin.diff_PipsProfit_SellCurrent >= TrailTP.ProfitMin.MinProfit_3; //--get minimum then step step inc
                                        TrailTP.ProfitMin.Is_Current_Grater_MinProfit_BUY         = TrailTP.ProfitMin.diff_PipsProfit_BuyCurrent  >= TrailTP.ProfitMin.MinProfit_3;  //--get minimum then step step inc
                              }//
                              //--------------------------------------------------------------------------------------------------
                    }
                    //----------------------------------------------------------------------------------------------------------------------------------
                    //*****TakeProfit
                    {         if((_OrderCom.Type == OP_SELL) && TrailTP.Stops.Is_PriceCurrent_Grater_PriceMaxSELL && TrailTP.ProfitMin.Is_Current_Grater_MinProfit_SELL) {_OrderModify.TakeProfit = TrailTP.Stops.Price_MaxSell;}; //ASK     _OrderCom.TakeProfit
                              if((_OrderCom.Type == OP_BUY)  && TrailTP.Stops.Is_PriceCurrent_Lower_PriceMaxBUY   && TrailTP.ProfitMin.Is_Current_Grater_MinProfit_BUY)  {_OrderModify.TakeProfit = TrailTP.Stops.Price_MaxBUY;}; //BID        _OrderCom.TakeProfit
                              _OrderModify.TakeProfit = NormalizeDouble(_OrderModify.TakeProfit, Digits());//
                    }//
                    //*****/over Crossed_StartPrice
                    //--set_StopLoss_Crossed_StartPrice(200);//over pip
          }
          //----------------------------------------------------------------------------------------------------------------------------------
          Calc_Profit_Real_Amount();
          //---CheackCross_Start();
          Calc_RealProfit_ByLot(AccountLeverage());
          //========================================================KeyManager
          CheackCurrentSL_Toched();
          //===================================================// Modify Stop
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Stm_Trails::Define_SL_BreakEvenStop(int f_BreakEvenProfitPips, double factor)///when open price and sl price isnt same and diff Profit is grater than min profit amount..
{         //Define SL how to BreakEvenStop
          double diff_PipsProfit_SellCurrent                            = _OrderCom.OpenPrice - Ask; //--sell profit pure
          double diff_PipsProfit_BuyCurrent                             = Bid - _OrderCom.OpenPrice; //--buy profit pure
          double SL_MinProfitAmount                                     = f_BreakEvenProfitPips * ct_Drive.TDD.ct_Market_Symbol.POINT_PIP; //--estimated Sell minimum profit
          //----------------------------------------------------------------------------------------------------------------------------------
          bool IsBasic_SELL_SL_MinProfitCurrent_Grater_SL               = (diff_PipsProfit_SellCurrent >= SL_MinProfitAmount) && _OrderCom.OpenPrice != _OrderCom.StopLoss; //--get minimum then step step inc
          bool IsBasic_BUY_SL_MinProfitCurrent_Grater_SL                = (diff_PipsProfit_BuyCurrent  >= SL_MinProfitAmount) && _OrderCom.OpenPrice != _OrderCom.StopLoss;  //--get minimum then step step inc
          //----------------------------------------------------------------------------------------------------------------------------------
          {         //*****StopLoss
                    {         if((_OrderCom.Type == OP_SELL) && IsBasic_SELL_SL_MinProfitCurrent_Grater_SL ) { _OrderModify.StopLoss = _OrderCom.OpenPrice - (f_BreakEvenProfitPips / factor) * Point();} ///SET SL ON OPEN PRICE OF ORDER
                              if((_OrderCom.Type == OP_BUY)  && IsBasic_BUY_SL_MinProfitCurrent_Grater_SL )  { _OrderModify.StopLoss = _OrderCom.OpenPrice + (f_BreakEvenProfitPips / factor) * Point();} ///SET SL ON OPEN PRICE OF ORDER
                              _OrderModify.StopLoss                           = NormalizeDouble(_OrderModify.StopLoss, Digits());//
                    }
                    //*****TakeProfit
                    {         if(_OrderCom.Type == OP_SELL)      _OrderModify.TakeProfit     = _OrderCom.TakeProfit; //ASK
                              if(_OrderCom.Type == OP_BUY)       _OrderModify.TakeProfit     = _OrderCom.TakeProfit; //BID
                              _OrderModify.TakeProfit            = NormalizeDouble(_OrderModify.TakeProfit, Digits());//
                    }//
                    //*****/over Crossed_StartPrice
                    //--set_StopLoss_Crossed_StartPrice(200);//over pip
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Stm_Trails::CheackCross_Start()
{         if(_OrderCom.Type == OP_BUY)  {Is_Cross_StartPrice = (_OrderCom.OpenPrice <  _OrderCom.StopLoss);}
          if(_OrderCom.Type == OP_SELL) {Is_Cross_StartPrice = (_OrderCom.OpenPrice >  _OrderCom.StopLoss);} //
}
//+------------------------------------------------------------------+TrailingStop_Pip / div
//|                                                                  |
//+------------------------------------------------------------------+
void Stm_Trails::set_StopLoss_Crossed_StartPrice(int div)
{         if(_OrderCom.Type == OP_SELL)      _OrderModify.StopLoss_Crossed_v_StartPrice           = _OrderModify.OpenPrice - (div * ct_Drive.TDD.ct_Market_Symbol.POINT_PIP); //Bid    //--make little diff (2$)      //---ct_Drive.TDD.ct_Market_Symbol.Mql.Symbol_SPREAD +
          if(_OrderCom.Type == OP_BUY)       _OrderModify.StopLoss_Crossed_v_StartPrice           = _OrderModify.OpenPrice + (div * ct_Drive.TDD.ct_Market_Symbol.POINT_PIP); //Ask    //--make little diff (2&)  //--ct_Drive.TDD.ct_Market_Symbol.Mql.Symbol_SPREAD+
          _OrderModify.StopLoss_Crossed_v_StartPrice                               = NormalizeDouble(_OrderModify.StopLoss_Crossed_v_StartPrice, Digits());//
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Stm_Trails::Calc_Profit_Real_Amount()
{         double val = 0;
          if(_OrderCom.Type == OP_SELL)      val = (_OrderCom.OpenPrice - MarketInfo(StSymbol.Current, MODE_ASK) ); // Larger distance     bool  Bid - OrderOpenPrice()
          if(_OrderCom.Type == OP_BUY)       val = (MarketInfo(StSymbol.Current, MODE_BID) - _OrderCom.OpenPrice); // Larger distance bool  OrderOpenPrice() - Ask
          return  NormalizeDouble(val, Digits());//
          //Alert("_OrderCom.Type: ", _OrderCom.Type, "---_OrderCom.Type == OP_BUY: ", _OrderCom.Type == OP_BUY, "----_OrderCom.Type == OP_SELL: ", _OrderCom.Type == OP_SELL, "----Profit_Real_Amount:", Profit_Real_Amount);;
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Stm_Trails::Calc_RealProfit_ByLot(int leverage)///||OrderProfit();
{         double val = 0;
          if(_OrderCom.Type == OP_SELL) val = (_OrderCom.Lots * ( _OrderCom.OpenPrice - Ask ) * AccountLeverage());
          if(_OrderCom.Type == OP_BUY)  val = (_OrderCom.Lots * ( Bid - _OrderCom.OpenPrice) * AccountLeverage()); //   (_OrderCom.Lots * ( Bid - _OrderCom.OpenPrice)/Digit()) //--other symbols
          return  NormalizeDouble(val, Digits());//
          //Alert("_OrderCom.Type: ", _OrderCom.Type, "    RealProfit $: ", RealProfit, "...._OrderCom.Lots: ", _OrderCom.Lots, "...._OrderCom.OpenPrice: ", _OrderCom.OpenPrice); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Stm_Trails::CheackCurrentSL_Toched()
{         if(_OrderCom.Type == OP_BUY)       { Is_CurrentSL_Toched    =   _OrderCom.StopLoss            <  _OrderModify.StopLoss;}
          if(_OrderCom.Type == OP_SELL)      { Is_CurrentSL_Toched    =   _OrderCom.StopLoss            >  _OrderModify.StopLoss;}//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Stm_Trails::Set_Modify__By_Cross_StartPrice__Else()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Modify Error", __LINE__, __FUNCTION__); //
          if(true)
          {         if(Is_Cross_StartPrice)
                    {         //---
                              Is_Order_Trailed_Over = OrderModify(_OrderModify.TicketNum, _OrderModify.OpenPrice, _OrderModify.StopLoss_Crossed_v_StartPrice, _OrderModify.TakeProfit, _OrderModify.Expiration, _OrderModify.Color);
                              //---
                    }//
                    else
                    {         //
                              Is_Order_Trailed_Inver = OrderModify(_OrderModify.TicketNum, _OrderModify.OpenPrice, _OrderModify.StopLoss, _OrderModify.TakeProfit, _OrderModify.Expiration, _OrderModify.Color);
                              //---
                    }//
          }
          if(_OrderModify.StopLoss == _OrderModify.TakeProfit)
          {         Alert("_OrderModify.StopLoss: ", _OrderModify.StopLoss, "_OrderModify.TakeProfit: ", _OrderModify.TakeProfit, "      Is_Order_Trailed_Inver: ", Is_Order_Trailed_Inver, "   error:", ErrorDescription(_LastError));}
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Modify Error", __LINE__, __FUNCTION__); //
          //
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Stm_Trails::Get_OrderCom()
{         _OrderCom.MagicNumber         = OrderMagicNumber();
          _OrderCom.SymbolCom           = OrderSymbol();
          _OrderCom.Type                = OrderType();
          _OrderCom.TicketNum           = OrderTicket();
          _OrderCom.OpenPrice           = OrderOpenPrice();
          _OrderCom.StopLoss            = OrderStopLoss();       _OrderCom.StopLoss = NormalizeDouble(_OrderCom.StopLoss, Digits());
          _OrderCom.TakeProfit          = OrderTakeProfit();
          _OrderCom.Expiration          = OrderExpiration();;
          _OrderCom.Lots                = OrderLots();
          _OrderCom.Color               = 0;
          _OrderCom.Totals              = OrdersTotal();
          _OrderCom.Profit              = OrderProfit();//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Stm_Trails::Set_OrderModify()
{         _OrderModify.TicketNum       = _OrderCom.TicketNum;
          _OrderModify.OpenPrice       = _OrderCom.OpenPrice;
          _OrderModify.StopLoss        = _OrderCom.StopLoss;  //-- +- 30 * Point
          _OrderModify.TakeProfit      = _OrderCom.TakeProfit;
          _OrderModify.Expiration      = _OrderCom.Expiration;
          _OrderModify.Color           = Yellow;
          _OrderModify.Totals          = _OrderCom.Totals;;
          _OrderModify.Profit          = _OrderCom.Profit;//
}



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Ct_Modify
{         /*
          *bool  OrderModify(
          int        ticket,      // ticket
          double     price,       // price
          double     stoploss,    // stop loss
          double     takeprofit,  // take profit
          datetime   expiration,  // expiration
          color      arrow_color  // color
          );
          *
          *(int ticket, double price, double stoploss, double takeprofit, datetime expiration, color arrow_color)
          *
          *
          */
private:
//================================================================================IS/SELECT/ALIVE/Modifications///
public:
          void          Ct_Modify();
          void          ~Ct_Modify() {};
          bool          Update(bool b, bool IsOnTick);
          bool          UPDATED;


          //---------------------------------------------------------
          bool          Is_Order_Modified;
          //>>ct_Drive.TDD.ct_Ticket.Is_Ticket()>>ct_Drive.TDD.ct_Ticket.Is_SELECT_BY_POS_MODE_TRADES>>ct_Drive.TDD.ct_Ticket.Is_Alive()>>Modifications( Obj_Ticket, Obj_TicketList, Int_TicketList, Int_Ticket);>>
          //>>ct_Drive.TDD.ct_Ticket.Is_TrailStop>>
//
          _ORDER_       OrderModifying;
//
          bool          Modifer(int __Type__, bool Is_Ok);
//
          void          Modifing(bool IsRun);
          bool          Modifications_By_Obj_Obj_Array( Ct_Ticket &TicketObjCom, Ct_Ticket &TicketObjArrayCom[], int &TicketArrayCom[], int TicketCom = -1);  //whenCall van set NULL
          bool          Modifications(int SingleTicketCom);///or Pos
          bool          Modifications_By_Array(int &MultiTicketCom[]);
          bool          Modifications_By_Obj(Ct_Ticket &ObjTicketCom);
          bool          Modifications_By_Obj_Array(Ct_Ticket &ObjTicketCom[]);
          bool          Modifications_AnyTicket(bool AnyOrder = false);
          bool          MODIFICATED;


          int           OrderModifiedCount;//
//
          bool          TrailType(int ModifyTicket_TypeIN, int TicketIN);//
          bool          TrailedDone;
          //-----------------------------------------------------------------
          Stm_Trails    Trails;
          int           TrailStop(int TrailStopCom = 10);

          bool          TrailingPending();
          bool          TrailingMarket();
          //****************************
          bool          TrailingTP(int __Type__, double Takeprofit);
          bool          TrailingOP(int __Type__, double Price);
          bool          TrailingEX(int __Type__, datetime Expiration);
          bool          TrailingAR(int __Type__, color ArrowColor);
          //---------------------------------------------------------
//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Ct_Modify::Ct_Modify()
{         RunCallFunction++;//=======================================
//--Alert("Ct_Modify::Ct_Modify()");
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error",  __LINE__, __FUNCTION__); //|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Modify::Update(bool b, bool IsOnTick)
{         if(!b)  { return UPDATED = true; }
          UPDATED = false;
          Trails.Update();//--------------------------------where inited update data
//---empty
          //Modifing(IsRun);//
          if(ct_Drive.TDD.ct_Ticket._Active.Is_Ticket())
          {         for(int k = 0; k < OrdersTotal() ; k++)
                    {         if(false)
                              {         ct_Drive.TDD.ct_Ticket._Check.Is_SELECT_BY_POS_MODE_TRADES = ct_Drive.TDD.ct_Ticket.SelectTicket(k, SELECT_BY_POS, MODE_TRADES); //Gone Pos mode search...select pose zero...mean can get ticket..
                                        //---
                                        //---Alert("On modifier");
                                        if(ct_Drive.TDD.ct_Ticket._Check.Is_Alive())
                                        {         //Alert("On modifier");//
                                                  Is_Order_Modified = Modifications_By_Obj_Obj_Array( Obj_Ticket, Obj_TicketList, Int_TicketList, Int_Ticket);
                                                  //
                                        } //
                              }//
                              //*** main
                              //#1 Select ct_Ticket
                              //#2 Do Action
                              {         ct_Drive.TDD.ct_Ticket.SelectTicket(k, SELECT_BY_POS, MODE_TRADES);
                                        Is_Order_Modified = Trails.TrailingSL_TP(IsOnTick); //
                              } //
                    } //
          } //
          //----Alert("On modifier");
          UPDATED = true;
          if(!this.UPDATED)   {Alert("ct_ModifyUPDATED: ", this.UPDATED);}
          return UPDATED;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ct_Modify::Modifing(bool IsRun)
{         if(IsRun)
          {         Modifer(MofieTypeALL,                 TRADER_Panel_DATA.IsAuto_EndAll);
                    //---
                    Modifer(MofieTypeALL,                 OrderModifying.Is_Orders);
                    Modifer(MofieTypeMarketAll,           OrderModifying.Is_Markets);
                    Modifer(MofieTypeSellMarket,          OrderModifying.Is_MarketsSell);
                    Modifer(MofieTypeBuyMarket,           OrderModifying.Is_MarketsBuy);
                    Modifer(MofieTypePendingAll,          OrderModifying.Is_Pendings);
                    Modifer(MofieTypePending_SellLimit,   OrderModifying.Is_PendingsSellLimit);
                    Modifer(MofieTypePending_SellStop,    OrderModifying.Is_PendingsSellStop);
                    Modifer(MofieTypePending_BuyLimit,    OrderModifying.Is_PendingsBuyLimit);
                    Modifer(MofieTypePending_BuyStop,     OrderModifying.Is_PendingsBuyStop); //
          } //
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Modify::Modifications_By_Obj_Obj_Array( Ct_Ticket &TicketObjCom, Ct_Ticket &TicketObjArrayCom[], int &TicketArrayCom[], int TicketCom = -1)
{         //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Modify Error",  __LINE__, __FUNCTION__); // Alert( "-Line:",__LINE__, "===", OP_BUY);   ////
//============================//============================
//00//prpose of function????>>>>>[Modifications by model is true]
//00//Logic of function???  >>>>>[Get tickets] , [cheak Selection valure type] ,[pack tickets], [cheak global valuse],[Modifications by model is true]
          bool result = false;
          if(!ct_Drive.TDD.ct_Ticket._Modifier.Is_TrailStop) return false;
//============================================================
//---Must Filled By TicketNumber Every One in Start//Must Selectd By TicketNumber Every One//
          bool Selected_TicketObjArrayCom       = ct_Drive.TDD.ct_Ticket.SelectTicket_By_Obj_Array(TicketObjArrayCom, SELECT_BY_TICKET, MODE_TRADES); if(Selected_TicketObjArrayCom)Alert("TicketObjArrayCom[0].Curr_OpenTime: ", (string)TicketObjArrayCom[0]._Info.OpenTime); //
          bool Selected_TicketObjCom            = ct_Drive.TDD.ct_Ticket.SelectTicket_By_Obj(TicketObjCom,      SELECT_BY_TICKET, MODE_TRADES);
          bool Selected_TicketArrayCom          = ct_Drive.TDD.ct_Ticket.SelectTicket_By_Array(TicketArrayCom,    SELECT_BY_TICKET, MODE_TRADES);
          bool Selected_TicketCom               = ct_Drive.TDD.ct_Ticket.SelectTicket(TicketCom,         SELECT_BY_TICKET, MODE_TRADES);
//===========================================================
          if(true)
          {         Ct_Ticket TicketObjComNULL; //Ct_Ticket TicketObjArrayComNULL[];??>>structures or classes containing objects are not allowed
                    //
                    if(!Selected_TicketObjArrayCom)       { TicketObjCom.TicketObjArrayReset(TicketObjArrayCom);};//           { ArrayCopy(TicketObjArrayCom, TicketObjArrayComNULL, 0, 0, WHOLE_ARRAY);};//'TicketObjArrayCom' - structures or classes containing objects are not allowed
                    if(!Selected_TicketObjCom)            { TicketObjCom = TicketObjComNULL; TicketObjCom._Info.ct_Ticket = NULL;};
                    //
                    if(!Selected_TicketArrayCom)          { TicketObjCom.Ticket_To_TicketObj(TicketArrayCom, TicketObjArrayCom, SELECT_BY_TICKET, MODE_TRADES);};
                    if(!Selected_TicketCom)               { TicketObjCom.Ticket_To_TicketObj_Single(TicketCom, TicketObjCom, SELECT_BY_TICKET, MODE_TRADES);}; //
          }
//===========================================================
          if ((ct_Drive.TDD.ct_Ticket.Counter._TotalAll > 0) && !C_STATICSUN::KeySuperviser && ct_Drive.TDD.ct_Market_Symbol.Is_Running && TRADER_Panel_DATA.IsAuto_OrdersModifications )///cheak global valuse
          {         //============================================================
                    if(Selected_TicketObjArrayCom       && TicketObjArrayCom[0]._Info.ct_Ticket > 0)       {return Modifications_By_Obj_Array(TicketObjArrayCom);}      //
                    if(Selected_TicketObjCom            && TicketObjCom._Info.ct_Ticket > 0)               {return Modifications_By_Obj(TicketObjCom);}           //
                    if(Selected_TicketArrayCom          && TicketArrayCom[0] > 0)                       {return Modifications_By_Array(TicketArrayCom);}         // ArraySize(TicketPackCom) > -1
                    if(Selected_TicketCom               && TicketCom > 0)                               {return Modifications(TicketCom);}              //
                    if(ct_Drive.TDD.ct_Ticket._Active.Is_TICKET)                                                        {return Modifications(ct_Drive.TDD.ct_Ticket._Active.Is_TICKET);}       //
                    //============================================================
          } //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Modify Error", __LINE__, __FUNCTION__); //|
//=========================================================|
          return false; //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Modify::Modifications_AnyTicket(bool AnyTicket = false)//BY_PosIndexInPOOL
{         int TotalOrders = OrdersTotal();//-1;
          bool Result = false; bool ResultArray[];   ResultSTR ResultSelect[];
          bool ResultArraySizeOk        = ArrayResize(ResultArray, TotalOrders) > -1; if(!ResultArraySizeOk) return false; ////
          bool ResultSelectArraySizeOk  = ArrayResize(ResultSelect, TotalOrders) > -1; if(!ResultSelectArraySizeOk) return false; ////
//============================================================================================
          /*....*/ int indexPos = 0; bool indexPosOk = false; //if(indexPosOk)
          for(indexPos; TotalOrders - 1 >= indexPos; indexPos++)
          {         bool Selected_PosPool = indexPosOk = ct_Drive.TDD.ct_Ticket.SelectTicket(indexPos, SELECT_BY_POS, MODE_TRADES) > 0;//
                    if(indexPosOk)ResultSelect[indexPos].result = Modifications(OrderTicket()); //
          }//
//============================================================================================Catch results filling ResultArray
//for(int i = 0 ; i < TotalOrders - 1 ; i++) { ResultSelect[i].index = i; ResultSelect[i].result = ResultArray[i] = Result = true;/*....*/ }
//============================================================================================Cheack Results
          for(int i = 0 ; i < TotalOrders - 1 ; i++) { if(!ResultArray[i]) {Result = false;}   if(!ResultSelect[i].result) {ResultSelect[0].countFalse++; } }
//============================================================================================
          if(!ResultSelect[0].countFalse > 0) {Result = false;}
          else {Result = true;}
//============================================================================================
          return Result;  //has no mode[in]  ct_Order index or order ticket depending on the second parameter.
//============================================================================================
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Modify::Modifications(int SingleTicketCom)//>>.
{         MODIFICATED = false; bool result = false; Ct_Ticket TicketObj;
//============================================================================================Get
          if(TicketObj.GetFiledsStatus(SingleTicketCom, TicketObj, SELECT_BY_TICKET, MODE_TRADES) && TicketObj._Check.Is_Ticket_Alive) ///selext any type !0
          {         //========================================================
                    TrailType(TicketObj._Info.Type, TicketObj._Info.MagicNumber); ////
                    return MODIFICATED = result = TrailedDone; //
                    //========================================================
          } //
          return MODIFICATED = result; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Modify::Modifications_By_Array(int &MultiTicketCom[])
{         bool result = false;
          int  SizeMultiTicketCom = ArraySize(MultiTicketCom); //
          if(SizeMultiTicketCom < 0)return false;//No Any ticket
          else { for(int i = 0 ; SizeMultiTicketCom - 1 > i;  i++ ) {Modifications(MultiTicketCom[i]); } } //Multi ct_Ticket
          return true; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Modify::Modifications_By_Obj(Ct_Ticket &ObjTicketCom)
{         return Modifications(ObjTicketCom._Info.ct_Ticket);}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Modify::Modifications_By_Obj_Array(Ct_Ticket &ObjTicketCom[])
{         bool result = false;
          int SizeObjTicketCom = ArraySize(ObjTicketCom); //The function returns the number of elements of a selected array.
          if(SizeObjTicketCom < 1)return false; //No ObjTicketCom
          else
          {         /////multi ObjTicketCom
                    for(int i = 0 ; SizeObjTicketCom - 1 > i;  i++ ) {Modifications_By_Obj(ObjTicketCom[i]); } //5>>0,1,2,3,4
          }//
          return true; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Modify::TrailType(int ModifyTicket_TypeIN, int TicketIN)
{         bool result = false; //
          string resultDesc = __FUNCSIG__; //
          switch(ModifyTicket_TypeIN)//
          {         //  case OP_SELL:       {resultDesc = "SellMarket_BY_TICKET"; result = TrailingSL_TP();} break; //wrong} //
                              //  case OP_BUY:        {resultDesc = "BuyMarket_BY_TICKET";  result = TrailingSL_TP();} break; //
                              //  //////======================
                              //  case OP_SELLLIMIT:  {resultDesc = "SellLimit_BY_TICKET";  result = TrailingSL_TP();} break; //
                              //  case OP_SELLSTOP:   {resultDesc = "SellStop_BY_TICKET";   result = TrailingSL_TP();} break; //
                              //  //////======================
                              //  case OP_BUYLIMIT:   {resultDesc = "BuyLimit_BY_TICKET";   result = TrailingSL_TP();} break; //
                              //  case OP_BUYSTOP:    {resultDesc = "BuyStop_BY_TICKET";    result = TrailingSL_TP();} break; //
                              //  default: {Alert( "-Line:", __LINE__, "=default==");} //check Number Of Live ct_Order has  Live ct_Order??
          }//
//===================================================================
//===================================================================
          if(!result) { ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Modify Error-" + resultDesc + " Modify failed:",  __LINE__, __FUNCTION__);} //
//============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Modify Error", __LINE__, __FUNCTION__); //
//============================//============================
          return TrailedDone = result; //
}//
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<//
//+------------------------------------------------------------------+
//|                      Buy Trailing Stop                           |36
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int Ct_Modify::TrailStop(int TrailStopCom = 10)
{         for(int i = 1; i <= OrdersTotal(); i++)                       // Cycle searching in orders
          {         if (OrderSelect(i - 1, SELECT_BY_POS) == true)      // If the next is available
                    {         //=======================================================================
                              Ct_Ticket ObjTicketModify; ObjTicketModify._Modifier.TrailStopInp = TrailStopCom;
                              bool Is_TicketToObjct = ObjTicketModify.Ticket_To_TicketObj_Single(OrderTicket(), ObjTicketModify, SELECT_BY_TICKET, MODE_TRADES);
                              if(!ObjTicketModify._Check.Is_ExactSymbol || ObjTicketModify._Check.Is_Pending)continue; // The order is not "ours".ArePending //At the next iteration
                              //======================================================================= 3 --
                              while(true)                               // Modification cycle
                              {         //------------------------------------------------------------------- 4 --
                                        if (ObjTicketModify._Modifier.Is_Modifybles == false)break;     // If it is not modified   // Exit 'while'
                                        //------------------------------------------------------------------- 5 --
                                        bool Ans = OrderModify(ObjTicketModify._Info.ct_Ticket, ObjTicketModify._Info.OpenPrice, ObjTicketModify._New.StopLoss, ObjTicketModify._Info.TakeProfit, ObjTicketModify._Info.Expiration, ObjTicketModify._Info.ArrowColor); //Modify it!
                                        //Alert ("Modification ", Text, Ticket_, ". Awaiting response..");
                                        //------------------------------------------------------------------- 6 --
                                        if (Ans == true)  { Alert ("ct_Order ", ObjTicketModify._Info.Text, ObjTicketModify._Info.ct_Ticket, " is modified:)"); break;} // Got it! :) // From modification cycle.
                                        //------------------------------------------------------------------- 7 --
                                        int Error = GetLastError();         // Failed :(
                                        switch(Error)                       // Overcomable errors
                                        {         case 130: Alert("Wrong stops. Retrying.");                    ct_Series_Base.RefreshRate();                            continue;  // Update data // At the next iteration
                                                  case 136: Alert("No prices. Waiting for a new tick..");       while(ct_Series_Base.RefreshRate() == false) {Sleep(1);}  continue; // To the new tick// Cycle delay  // At the next iteration
                                                  case 146: Alert("Trading subsystem is busy. Retrying ");      Sleep(500); ct_Series_Base.RefreshRate();                 continue; // Simple solution// Update data// At the next iteration
                                                  case 2  : Alert("Common error.");                             break;  // Critical errors // Exit 'switch'
                                                  case 5  : Alert("Old version of the client terminal.");       break;  // Exit 'switch'
                                                  case 64 : Alert("Account is blocked.");                       break;  // Exit 'switch'
                                                  case 133: Alert("Trading is prohibited");                     break;  // Exit 'switch'
                                                  default : Alert("Occurred error ", Error);                    //Other errors
                                        } break;// From modification cycle
                              }// End of modification cycle
                              //---------------------------------------------------------------------- 8 --
                    }// End of order analysis
          }// End of order search
//------------------------------------------------------------------------------- 9 --
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return 0;                                      // Exit start()
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Modify::Modifer(int __Type__, bool Is_Ok)
{
//
//
//
          return true;//
}
//+------------------------------------------------------------------+
//|             Class MyRoboTrader     BEGIN                         |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
