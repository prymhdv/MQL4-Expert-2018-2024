//+------------------------------------------------------------------+
//|                                                   Ct_RiskReward.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|             Class C_BANK::     BEGIN                             | ///////Money Manager////////          ///////Money Manager////////
//+------------------------------------------------------------------+
class Ct_RiskReward
{         /*
          =============================
          Fixed Percent of your Account Balance
          (StopLoss Size * Pip values)  = (Account Balance * Risk%)
          200 * 10$  = 2000$ * 0.02 {
                                  >>>  2000 = (200 * 10 )/0.02  ///>>>Money $Amount
                                  >>>  200  = (2000 *0.02)/10   ///>>>Pip Count
                                  >>>  10   = (2000 *0.02)/200  ///>>>Pip Values per $Amount
                                  >>>  0.02 = (200 * 10 )/2000  ///>>>RiskRatio
                                  }
          //==========================
          Risk Profiles
          Ultra Conservative    < 1%
          Conservative          > 1%  && < 2%
          Moderate              3%
          Aggressive            > 4%  && < 5%
          Ultra Aggressive      > 5%
          //==========================
          The Money Management Formula
          Lot Size =  (Account Balance * Risk%) / (StopLoss Size * Pip values)
          0.06     =  (2000$           * 0.02)  / ( 200          * 10$ ){
                                                                        >>>  2000 = (0.06 *(200 * 10 )) / 0.02          ///>>>Money $Amount
                                                                        >>>  200  = (2000 *0.02)/10                     ///>>>Pip Count
                                                                        >>>  10   = (2000 *0.02)/200                    ///>>>Pip Values per $Amount
                                                                        >>>  0.02 = (200 * 10 )/2000                    ///>>>RiskRatio
                                                                        >>>  0.02 = (200 * 10 )/2000                    ///>>>RiskRatio
                                                                        }
          //==========================
          (1/ Lot Size)              = ( StopLoss Size * Pip values)/ (Account Balance * Risk%)
          (Lot Size)                 = ( Account Balance * Risk%)   / (StopLoss Size * Pip values)
          Account Balance * Risk%    = ( Lot Size * (StopLoss Size * Pip values))
          Account Balance            = ( Lot Size * (StopLoss Size * Pip values))/* Risk%
          Risk%                      = ( Lot Size * (StopLoss Size * Pip values))/* Account Balance
          StopLoss Size * Pip values = ( Account Balance * Risk%)/Lot Size
          Pip values                 = (( Account Balance * Risk%)/Lot Size )/StopLoss Size
          StopLoss Size              = (( Account Balance * Risk%)/Lot Size )/Pip values
          //==========================


          */
private:

public:
          void           Ct_RiskReward();
          void           ~Ct_RiskReward() {};
          bool           Update();
          //===============================================================
          double         OneLotAsDollar; //=100,000$>>>(6501.95$)>>(0.0650195Lot)>>>>(5000$)>>(0.05Lot)
          //===============================================================TradeSizePerDollar=(Balanced*RiskRatio*1000)/(StopLossSUnitPip*PipValuePerLot)====
          double         TradeSizePerDollar;
          double         TradeSizePerLots; /// TradeSizePerLots = TradeSizePerDollar/100000
          double         StopLossSUnitPip;
          double         PipValuePerLot;
          double         RiskRatio;
          double         Balanced;
          //===============================================================MoneyUsge Data       EquityPercent==RiskPercent//no need EquityPercent//UseEquityAmount//
          double         RiskedSizeDollar;
          double         RiskedSizeLot;
          double         RiskedCashAmount;//  = -1;//
          double         RiskCashPercent; ///risk amount off all Equity/
          double         RiskCashPercentDecimal; ///risk amount off all Equity/
          double         Inp_RiskedCashAmount; ///risk amount off all Equity/EquityAmount
          double         Inp_RiskedCashPercent; ///risk amount off all Equity/
          //================================================================
          double         RiskAmount; ///risk amount off all Equity/
          double         RiskPercent; ///risk amount off all Equity/
          double         RiskPercentFixed; ///risk amount off all Equity/
          double         RiskAmountFixed; ///risk amount off all Equity/
          double         RiskOne, RiskTwo, RiskThere;
          double         RiskPercentTen, RiskPercentTwenty, RiskPercentThirty;
          double         RiskBandPip;
          //================================================================
          //double        Ct_RiskReward::RiskRates[] {1, 2, 3, 5, 10, 25, 50, 75, 80, 90, 100 }; must in global area or init in other function.
          //double        Ct_RiskReward::RiskProfitToBackLoss[] {1.01, 2.05, 3.10, 5.30, 11.11, 33.33, 100, 300, 400, 900, 1000 };
          //double        Ct_RiskReward::RiskTradeCountToloseFiftyRemain[] {69, 35, 23, 14, 7, 3, 2, 1, 1, 1, 1 };
          //double        Ct_RiskReward::RiskTradeCountToloseTenthRemain[] {230, 114, 76, 45, 22, 9, 4, 2, 2, 2, 1 };
          //================================================================
          double         RewardAmount;//
          double         RewardPercent;//
          double         RewardPerRiskRatio;//
          double         RewardOne, RewardTwo, RewardThere;
          double         RewardPercentTen, RewardPercentTwenty, RewardPercentThirty;
          double         RewardBandPip;
          //================================================================
          bool           GetRisk();//
          void           ReCalculateWrongRisk();
          //================================================================
          bool           HaveRiskMoney() {return (RiskedCashAmount > 0);};
          bool           HaveRiskSize()  {return (RiskedSizeLot > 0);};
          //================================================================

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Ct_RiskReward::Ct_RiskReward()
{         RunCallFunction++; ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_RiskReward Error",  __LINE__, __FUNCTION__); //
          RiskPercentFixed  = 1;
          RiskAmountFixed   = 10;//
          //=============================================================================
          RewardOne = 1; RewardTwo = 2; RewardThere = 3;
          RewardPercentTen = 0.1;  RewardPercentTwenty = 0.2;  RewardPercentThirty = 0.3;
          RewardBandPip = 10 * PipPointGlobla(StSymbol.Current);
          //=============================================================================
          RiskOne = 1; RiskTwo = 2; RiskThere = 3;
          RiskPercentTen = 0.1;  RiskPercentTwenty = 0.2;  RiskPercentThirty = 0.3;
          RiskBandPip = 10 * PipPointGlobla(StSymbol.Current);
          //=============================================================================
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool          Ct_RiskReward::Update()
{
//=========
//=========
          return true;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_RiskReward::GetRisk()
{         //checking & Setting Risk
          {         //---------------------------------------------------------------------------------------------------------------------------------------
                    //-- "S_EDIT " + "Set Equity$.."
                    if(ObjectFind(0, "S_EDIT " + "Set Equity$..") >= 0)
                    {         if(Utilities.StringLieraled("S_EDIT " + "Set Equity$.." )) { ObjectSetString(0, "S_EDIT " + "Set Equity$..", OBJPROP_TEXT, "Set Equity$.."); }
                              //
                              if(ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_EquityAmount_Ok)
                              {         ct_Drive.TDD.ct_Account.Account_Data.EquityInp = Utilities.DescToDouble("S_EDIT " + "Set Equity$..");
                                        //
                                        if ( ct_Drive.TDD.ct_Account.Account_Data.EquityInp > 999999999)
                                        {         ct_Drive.TDD.ct_Account.Account_Data.EquityInp =  ct_Drive.TDD.ct_Account.Account_Data.EquityFixed;
                                                  ObjectSetString(0, "S_EDIT " + "Set Equity$..", OBJPROP_TEXT, "Set Equity$.."); //
                                        } //
                              } //
                    }
                    //---------------------------------------------------------------------------------------------------------------------------------------
                    if(ObjectFind(0, "S_EDIT " + "Set Risk%..") >= 0)
                    {         if(Utilities.StringLieraled("S_EDIT " + "Set Risk%.." )) {ObjectSetString(0, "S_EDIT " + "Set Risk%..", OBJPROP_TEXT, "Set Risk%.."); }
                              if(ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_RiskPercent_Ok) {Inp_RiskedCashPercent = Utilities.DescToDouble("S_EDIT " + "Set Risk%.."); } //
                    }//
                    //---------------------------------------------------------------------------------------------------------------------------------------
                    if(ObjectFind(0, "S_EDIT " + "Set Risk$..") >= 0)
                    {         if(Utilities.StringLieraled("S_EDIT " + "Set Risk$.." )) {ObjectSetString(0, "S_EDIT " + "Set Risk$..", OBJPROP_TEXT, "Set Risk$.."); }
                              if(ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_RiskAmount_Ok) {Inp_RiskedCashAmount = Utilities.DescToDouble("S_EDIT " + "Set Risk$.."); } //
                    }//
          }///
          //---------------------------------------------------Assignment Equity 
          {         if( ct_Drive.TDD.ct_Account.Account_Data.EquityInp > 0 &&  ct_Drive.TDD.ct_Account.Account_Data.EquityInp < 999999999) { ct_Drive.TDD.ct_Account.Account_Data.EquityAmount  =  ct_Drive.TDD.ct_Account.Account_Data.EquityInp;}
                    else                                                                                                                   { ct_Drive.TDD.ct_Account.Account_Data.EquityInp  = 0; ct_Drive.TDD.ct_Account.Account_Data.EquityAmount =  ct_Drive.TDD.ct_Account._Mql_.Equity;}; //
                    //==========================================================================
                    if(Inp_RiskedCashPercent > -1) {         RiskCashPercent = Inp_RiskedCashPercent; }
                    else                           {         RiskCashPercent = RiskPercentFixed; Inp_RiskedCashPercent      = -1;}; //
                    //==========================================================================
                    if(Inp_RiskedCashAmount > -1)  {         RiskedCashAmount = Inp_RiskedCashAmount; }
                    else                           {         RiskedCashAmount = RiskAmountFixed; Inp_RiskedCashAmount = -1;}; //its update in lot update
                    //==========================================================================
          }//
          //---------------------------------------------------
          //UseEquityPercent                = 0;//
          //UseEquityAmount                 = PutLots * Bid; //RiskAmount;//PutLots*   //0.00010;
          //---------------------------------------------------------------
          //RiskPercent                     = 0;//errorr// must of to get value from edite
          //RiskAmount                      = 0.001;//for unwanted digits
          return true;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ct_RiskReward::ReCalculateWrongRisk()// Re-calculate a new Risk if the current one is too low or too high
{
//=====================
//--------------------------
          string       Configuration    = "==== Configuration ====";
          bool         ReverseTrade     = false; // If TRUE, then trade in opposite direction
          int          Magic            = -1;     // If set to a number less than 0 it will calculate MagicNumber automatically
          string       OrderCmt         = "XMT-Scalper 2.46"; // Trade comments that appears in the Trade and Account History tab
          bool         ECN_Mode         = false;  // True for brokers that don't accept SL and TP to be sent at the same time as the order
          bool         Debug            = false;  // Print huge log files with info, only for debugging purposes
          bool         Verbose          = false;  // Additional information printed in the chart
//-----------------------------
          double G_balance = 0;                   // Balance for this EA
          double Array_spread[30];      // Store spreads for the last 30 tics
          double LotSize = 0;                               // Lotsize
          double Highest = 0;                                // LotSize indicator value
          double Lowest = 0;                                             // Lowest indicator value
          double StopLevel = 0;                               // Broker StopLevel
          double StopOut = 0;                                  // Broker stoput percentage
          double LotStep = 0;                                  // Broker LotStep
          double Avg_tickspermin = 0;                // Used for simulation of latency during backtests
          double MarginFree = 0;         // Free margin in percentage
          //--------------------------------------------
          int LotBase;                                                // Amount of money in base currency for 1 lot
          LotBase = (int)MarketInfo ( Symbol(), MODE_LOTSIZE ); //
          double       StopLoss                                                    = 60;     // StopLoss from as many points. Default 60 (= 6 pips)
          double       TakeProfit                                                            = 100; // TakeProfit from as many points. Default 100 (= 10 pip)
          double       AddPriceGap                                                 = 0; // Additional price gap in points added to SL and TP in order to avoid Error 130
          double       TrailingStart                                               = 20;     // Start trailing profit from as so many points.
          //---------------------------------------------
//=======================
          string textstring;
          double availablemoney;
          double maxlot;
          double minlot;
          double maxrisk;
          double minrisk;
          // Get available amount of money as Equity
          availablemoney = AccountEquity();
          // Maximum allowed Lot by the broker according to Equity
          maxlot = MathFloor ( availablemoney / MarginForOneLot / LotStep ) * LotStep;
          // Maximum allowed Risk by the broker according to maximul allowed Lot and Equity
          maxrisk = MathFloor ( maxlot * ( StopLevel + StopLoss ) / availablemoney * 100 / 0.1 ) * 0.1;
          // Minimum allowed Lot by the broker
          minlot = MinLots;
          // Minimum allowed Risk by the broker according to minlots_broker
          minrisk = MathRound ( minlot * StopLoss / availablemoney * 100 / 0.1 ) * 0.1;
          // Empty textstring
          textstring = "";
          if ( MoneyManagement == TRUE )
          {         // If Risk% is greater than the maximum risklevel the broker accept, then adjust Risk accordingly and print out changes
                    if ( Risk > maxrisk )
                    {         textstring = textstring + "Note: Risk has manually been set to " + DoubleToStr ( Risk, 1 ) + " but cannot be higher than " + DoubleToStr ( maxrisk, 1 ) + " according to ";
                              textstring = textstring + "the broker, StopLoss and Equity. It has now been adjusted accordingly to " + DoubleToStr ( maxrisk, 1 ) + "%";
                              Risk = maxrisk;
                              Utilities.PrintAndComment ( textstring ); }
                    // If Risk% is less than the minimum risklevel the broker accept, then adjust Risk accordingly and print out changes
                    if (Risk < minrisk)
                    {         textstring = textstring + "Note: Risk has manually been set to " + DoubleToStr ( Risk, 1 ) + " but cannot be lower than " + DoubleToStr ( minrisk, 1 ) + " according to ";
                              textstring = textstring + "the broker, StopLoss, AddPriceGap and Equity. It has now been adjusted accordingly to " + DoubleToStr ( minrisk, 1 ) + "%";
                              Risk = minrisk;
                              Utilities.PrintAndComment ( textstring ); } }
          // Don't use MoneyManagement, use fixed manual LotSize
          else // MoneyManagement == false
          {         // Check and if necessary adjust manual LotSize to external limits
                    if ( ManualLotsize < MinLots )
                    {         textstring = "Manual LotSize " + DoubleToStr ( ManualLotsize, 2 ) + " cannot be less than " + DoubleToStr ( MinLots, 2 ) + ". It has now been adjusted to " + DoubleToStr ( MinLots, 2);
                              ManualLotsize = MinLots;
                              Utilities.PrintAndComment ( textstring ); }
                    if ( ManualLotsize > MaxLots )
                    {         textstring = "Manual LotSize " + DoubleToStr ( ManualLotsize, 2 ) + " cannot be greater than " + DoubleToStr ( MaxLots, 2 ) + ". It has now been adjusted to " + DoubleToStr ( MinLots, 2 );
                              ManualLotsize = MaxLots;
                              Utilities.PrintAndComment ( textstring ); }
                    // Check to see that manual LotSize does not exceeds maximum allowed LotSize
                    if ( ManualLotsize > maxlot )
                    {         textstring = "Manual LotSize " + DoubleToStr ( ManualLotsize, 2 ) + " cannot be greater than maximum allowed LotSize. It has now been adjusted to " + DoubleToStr ( maxlot, 2 );
                              ManualLotsize = maxlot;
                              Utilities.PrintAndComment ( textstring ); }        ///
          }                   //
}

//+------------------------------------------------------------------+
//|             Class C_BANK::     BEGIN                             | ///////Money Manager////////          ///////Money Manager////////
//+------------------------------------------------------------------+
