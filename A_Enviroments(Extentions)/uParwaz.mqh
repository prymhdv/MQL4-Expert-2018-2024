//+------------------------------------------------------------------+
//|                                                       Parwaz.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict

//+------------------------------------------------------------------+
//|             Class Parwaz     BEGIN                               |
//+------------------------------------------------------------------+
class Parwaz
{
//!!!!!!!!!!!!!if not define public:... gone privet members    //
public:
//====================================================================================================================================================//
//#property copyright   "Copyright 2018-2019, kamran monkaresi"
//#property link        "https://www.mql5.com/en/users/tsgcoltd"
//#property description "This Expert Advisor is a pure scalp system."
//#property description "Run well in any pair with tight spread and low commission."
//#property description "Choice a broker with fast execution and zero stop level."
//#property strict
//====================================================================================================================================================//
          enum Mng   {Delete_Remain, Keep_Remain };
          enum Modifyenum {Modify_Both_Ways, Modify_One_Way };
//====================================================================================================================================================//
          string     OrdersSetting;
          bool       ModifyPending;
          bool       ModifyMarket;
          double     PendingOrdersDist;
          int        DelayModifyOrders;
          double     StepModifyOrders;//Step Modify
          double     OrdersStopLoss;//Stop Loss
          bool       UseTakeProfit;
          double     OrdersTakeProfit;//Take Profit
          string     AdvancedSetting;
          Mng        ManageRemainPending;
          Modifyenum TypeModifyPendings;
          string     LotSetting;
          bool       MonyManage;
          double     Risk;//Percent Risk
          double     SizeX;//Lot Size
          string     TimeFilterSets;
          bool       UseTimeFilter;
          string     TimeStartTrade;
          string     TimeStopTrade;
          string     EASetting;
          double     stopLevel;//Stop Level
          int        Slippage;
          string     OrdersIDInfo;
          int        OrdersID;
          string     SpreadSetting;
          string     MaxSpreadInfo;
          double     MaxSpread;//Maximum SpreadLimit
          string     TypeOfSpreadInfo;
          int        TypeOfSpreadUse;
          string     CommisionsSet;
          double     CommissionInPip;
          double     CommissionInCur;
          bool       GetCommissionAuto;
          string     InformationSets;
          bool       CountAvgSpread;
          bool       CountAvgExecution;
          bool       CountAvgSlippage;
          int        TimesForAverage;//Time For Average Spread
          string     DeleteObjectsSets;
          bool       DeleteObjects;
          int        DeleteMinutes;
          string     ExpertCommentsSet;
          string     ExpertComments;
          bool       BacktestingInfo;
//====================================================================================================================================================//

          string     SymbolUse;
          string     SymbolExtension;
          string     LockedInfo;
          string     SymbolTrade;
          string     BackgroundName;
          string     ShowInfoCommission;
          long       ChartColor;
          int        TotalOrders;
          int        CntBuy;
          int        CntSell;
          int        CntBuyStop;
          int        CntSellStop;
          int        TryTimes;
          int        TotalTrades;
          int        MultiplierPoint;
          int        TimeActionModify;
          int        MagicNumber;
          int        CountTickSpreadPair;
          int        CountTimesModify;
          int        CountTimesClose;
          int        CountTickSpread;
          int        TimesModify;
          int        TimesClose;
          int        i;
          int        Count;
          int        TicksGet;
          int        CountTickBuyStop;
          int        CountTickSellStop;
          int        WinTrades;
          int        LossTrades;
          int        SendMessages;
          int        TicketLastStopLoss;
          int        CountHistory;
          int        DelayForModify;
          double     StepForModify;
          double     ArraySpreadPair[100];
          double     HistoryPips;
          double     AvgSpread;
          double     AvgExecution;
          double     AvgSlippage;
          double     TotalProfitLoss;
          double     SpreadPips;
          double     DigitsPoints;
          double     LotSize;
          double     StopLevel;
          double     CheckMargin1;
          double     CheckMargin2;
          double     SumMargin;
          double     StepModify;
          double     ModeTickValue;
          double     BrokerCommission;
          double     SpreadLimit;
          double     RealCommission;
          double     GetCommissionPair;
          double     PipsLevelPending;
          double     PipsLevelLoss;
          double     PipsLevelProfit;
          double     AvrgPipsProfit;
          double     AvrgPipsLoss;
          double     AvrgDuration;
          double     LastBid;
          double     LastAsk;
          double     PriceBS;
          double     PriceSS;
          double     SL_BS;
          double     TP_BS;
          double     SL_SS;
          double     TP_SS;
          double     LastStopLoss;
          double     SlippageOrders;
          double     ArraySlippage[100];
          double     PriceBuyStop;
          double     PriceSellStop;
          datetime   Expire;
          datetime   ArrayExecution[100];
          datetime   OperationDelay;
          datetime   LastOperationDelay;
          datetime   TimeToSend;
          datetime   TimeDeleteObjects;
          bool       StopTrade;
          bool       SpreadOK;
          bool       Locked;
          bool       CallMain;
          bool       ModifyBS;
          bool       ModifySS;
          bool       TestingMode;
          bool       TimeToTrade;
          bool       NotHaveOpenOrders;
          bool       StartNewCycle;
//---------------------------------------------------------------------
          int MagicSet ;
//---------------------------------------------------------------------
          bool LockedDate ;
          datetime ExpiryDate ;
//---------------------------------------------------------------------
          bool LockedAccount ;
          int AccountNo1 ;
          int AccountNo2 ;
          int AccountNo3 ;

//====================================================================================================================================================//
          void Parwaz::setvalues();
          Parwaz::Parwaz();
          Parwaz::~Parwaz();//(const int reason)
          void Parwaz::ParwazRun();
          void Parwaz::ParwazOnTimer();
          void Parwaz::MainFunction();
          int Parwaz::CheckMargin();
          void Parwaz::OpenOrders(int TypeOfOrder);
          void Parwaz::ModifyOrders(int TypeOfOrder, double PipsDistance, int ModifyMode);
          bool Parwaz::Modify_Buy(int TypeOfOrder, double PipsDistance, int ModifyMode, bool result = false);  //Modify Buy
          bool Parwaz::Modify_Sell(int TypeOfOrder, double PipsDistance, int ModifyMode, bool result = false); //Modify Sell
          bool Parwaz::Modify_SellStop(int TypeOfOrder, double PipsDistance, int ModifyMode, bool result = false);  //Modify Sell Stop
          bool Parwaz::Modify_BuyStop(int TypeOfOrder, double PipsDistance, int ModifyMode, bool result = false);        //Modify Buy Stop
          void Parwaz::DeleteOrders(int TypeOfOrder);
          void Parwaz::CountOrders();
          void Parwaz::HistoryResults();
          void Parwaz::GetAvrgSpread(double CurrSpread);
          void Parwaz::CountAvrgExecution(datetime Latency);
          void Parwaz::CountAvrgSlippage(double Slipping);
          void Parwaz::ClearChart();
          void Parwaz::ChartBackground(string StringName, color ImageColor, int Xposition, int Yposition, int Xsize, int Ysize);
          void Parwaz::ScreenComment(int TypeComm); //
}; //lok;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Parwaz::Parwaz()
{         //
          if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
          //
          RunCallFunction++; ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          setvalues();
//---------------------------------------------------------------------
          //EventSetMillisecondTimer(10);//Set timer
//---------------------------------------------------------------------
//Reset value
          CountTimesModify = 0;
          CountTickSpreadPair = 0;
          CountTimesClose = 0;
          CountHistory = 0;
//------------------------------------------------------
//Background
          ChartColor = ChartGetInteger(0, CHART_COLOR_BACKGROUND, 0);
          BackgroundName = "Background-" + WindowExpertName();
//---
          if(ObjectFind(BackgroundName) == -1) ChartBackground(BackgroundName, (color)ChartColor, 0, 15, 300, 80);
//---------------------------------------------------------------------
//Symbol suffix and info
          if(StringLen(Symbol()) > 6) SymbolExtension = StringSubstr(Symbol(), 6, 0);
          SymbolUse = Symbol();
          ArrayInitialize(ArraySpreadPair, 0);
          ArrayInitialize(ArrayExecution, 0);
          ArrayInitialize(ArraySlippage, 0);
//---------------------------------------------------------------------
//Confirm points
          MultiplierPoint = 1;
          if(MarketInfo("EURUSD" + SymbolExtension, MODE_DIGITS) == 5) MultiplierPoint = 10;
          if((MarketInfo(SymbolUse, MODE_BID) > 999.999) && (MarketInfo("EURUSD" + SymbolExtension, MODE_DIGITS) == 5) && (MarketInfo(SymbolUse, MODE_DIGITS) == 3)) MultiplierPoint = 100;
          DigitsPoints = Point * MultiplierPoint;
//---------------------------------------------------------------------
//Commissions
          ModeTickValue = MarketInfo(SymbolUse, MODE_TICKVALUE) * MultiplierPoint;
          BrokerCommission = (CommissionInCur / MathMax(1, ModeTickValue)) + CommissionInPip;
//---------------------------------------------------------------------
//Set minimum and maximum range
          if(Risk < 1) Risk = 1;
          if(Risk > 1000) Risk = 1000;
          if(OrdersID < 0) OrdersID = 0;
          if(MaxSpread < 0) MaxSpread = 0;
          if(TypeOfSpreadUse < 1) TypeOfSpreadUse = 1;
          if(TypeOfSpreadUse > 2) TypeOfSpreadUse = 2;
          if(TimesForAverage > 100) TimesForAverage = 100;
          if(TimesForAverage < 1) TimesForAverage = 1;
//---------------------------------------------------------------------
//Confirm pips for xauusd
          if((MarketInfo(SymbolUse, MODE_BID) > 999.999) && (MarketInfo("EURUSD" + SymbolExtension, MODE_DIGITS) == 5) && (MarketInfo(SymbolUse, MODE_DIGITS) == 3)) MaxSpread *= 10;
//---------------------------------------------------------------------
//Expert ID
          MagicNumber = OrdersID;
//---
          if(OrdersID == 0)
          {         for(int cnt = 0; cnt < StringLen(SymbolUse); cnt++) MagicNumber += (StringGetChar(SymbolUse, cnt) * (cnt + 1)) + MagicSet; }
//---------------------------------------------------------------------
//Get stop level
          StopLevel = NormalizeDouble(MathMax(MarketInfo(SymbolUse, MODE_FREEZELEVEL), MarketInfo(SymbolUse, MODE_STOPLEVEL)) / MultiplierPoint, 2);
          if(stopLevel < StopLevel) StopTrade = true;
          if((IsTesting()) || (IsVisualMode())) StopTrade = false;
//---------------------------------------------------------------------
//Set distance for orders
          PipsLevelPending = PendingOrdersDist;
          PipsLevelLoss = OrdersStopLoss;
          PipsLevelProfit = OrdersTakeProfit;
//---------------------------------------------------------------------
//Confirm pips distance
          if(PipsLevelPending < StopLevel) PipsLevelPending = StopLevel;
          if(PipsLevelLoss < StopLevel) PipsLevelLoss = StopLevel;
          if(PipsLevelProfit < StopLevel) PipsLevelProfit = StopLevel;
//---------------------------------------------------------------------
//Locked check
//---Expiry
          if((TimeCurrent() >= ExpiryDate) && (LockedDate == true))
          {         Locked = true;
                    LockedInfo = StringConcatenate("Expert has expired (" + TimeToString(ExpiryDate, TIME_DATE) + ")"); }
//---Account
          if(LockedAccount == true)
          {         if((!IsDemo()) && (AccountNumber() != AccountNo1) && (AccountNumber() != AccountNo2) && (AccountNumber() != AccountNo3))
                    {         Locked = true;
                              LockedInfo = StringConcatenate("Locked version. Expert run only on specific account."); } }
//---------------------------------------------------------------------
//Sets use for backtest
          if((IsTesting()) || (IsOptimization()))
          {         TypeOfSpreadUse = 2;
                    DeleteObjects = false; }
//---------------------------------------------------------------------
//Call ontick
          if((!IsTesting()) || (!IsVisualMode()))  TypeOfSpreadUse = 0;//ParwazRun();//Parwaz::ParwazRun();
//---------------------------------------------------------------------
//Mode
          if((IsTesting()) || (IsVisualMode())) TestingMode = true;
//---------------------------------------------------------------------
          //return(INIT_SUCCEEDED);
//---------------------------------------------------------------------
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Parwaz::~Parwaz()//(const int reason)
{         if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //|
          //=========================================================|
//---------------------------------------------------------------------
//Delete pending order
          bool DeleteOrderID = false;
//---
          for(int iPos = OrdersTotal() - 1; iPos >= 0; iPos--)
          {         if(OrderSelect(iPos, SELECT_BY_POS, MODE_TRADES))
                    {         if((OrderMagicNumber() == MagicNumber) && ((OrderType() == OP_BUYSTOP) || (OrderType() == OP_SELLSTOP))) DeleteOrderID = OrderDelete(OrderTicket()); } }
//---------------------------------------------------------------------
//Print avrg duration in backtesting
          if((IsTesting()) && (BacktestingInfo == true))
          {         HistoryResults();
                    Print("<===== BACKTEST/HISTORY REPORT =====>");
                    Print("Average Duration: " + DoubleToStr(AvrgDuration, 2) + " sec || Total Trades: " + DoubleToStr(TotalTrades, 0));
                    Print("Average Profits: " + DoubleToStr(AvrgPipsProfit, 2) + " pips || Win Trades: " + DoubleToStr(WinTrades, 0));
                    Print("Average Loss: " + DoubleToStr(AvrgPipsLoss, 2) + " pips || Loss Trades: " + DoubleToStr(LossTrades, 0));
                    Print("Send Messages: " + DoubleToStr(SendMessages, 0));
                    Print("<===== BACKTEST/HISTORY REPORT =====>"); }
//---------------------------------------------------------------------
//Clear chart
          //EventKillTimer();
          C_STATICSUN::DeleteAnaliseAllObjectName(0, 0, 1, BackgroundName, __LINE__);
          //Comment("oooooo" + "ObjectDelete(BackgroundName);");
//---------------------------------------------------------------------
          if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Parwaz::setvalues()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //====================================================================================================================================================//
          OrdersSetting       = "||======== Orders Setting ========||";
          ModifyPending       = true;
          ModifyMarket        = true;
          PendingOrdersDist   = 0.0;
          DelayModifyOrders   = 7;
          StepModifyOrders    = 2.0;//Step Modify
          OrdersStopLoss      = 1.5;//Stop Loss
          UseTakeProfit       = true;
          OrdersTakeProfit    = 30.0;//Take Profit
          AdvancedSetting     = "||======== Advanced Setting ========||";
          ManageRemainPending = Keep_Remain;
          TypeModifyPendings  = Modify_One_Way;
          LotSetting          = "||======== Lot Setting ========||";
          MonyManage         = true;
          Risk          = 10.0;//Percent Risk
          SizeX       = 0.01;//Lot Size
          TimeFilterSets      = "||======== Times Setting ========||";
          UseTimeFilter       = true;
          TimeStartTrade      = "03:00:00";
          TimeStopTrade       = "22:00:00";
          EASetting           = "||======== EA Setting ========||";
          stopLevel     = 0.0;//Stop Level
          Slippage            = 0;
          OrdersIDInfo        = "0:Generate a ID per Symbol";
          OrdersID            = 0;
          SpreadSetting       = "||======== Spread Setting ========||";
          MaxSpreadInfo       = "0:Not check spread";
          MaxSpread           = 1.0;//Maximum SpreadLimit
          TypeOfSpreadInfo    = "1:Use Average, 2:Use Current";
          TypeOfSpreadUse     = 2;
          CommisionsSet       = "||======== Commissions Setting ========||";
          CommissionInPip     = 0.0;
          CommissionInCur     = 0.0;
          GetCommissionAuto   = false;
          InformationSets     = "||======== Information Setting ========||";
          CountAvgSpread      = true;
          CountAvgExecution   = true;
          CountAvgSlippage    = true;
          TimesForAverage     = 30;//Time For Average Spread
          DeleteObjectsSets   = "||======== Objects Setting ========||";
          DeleteObjects       = true;
          DeleteMinutes       = 30;
          ExpertCommentsSet   = "||======== Comments Setting ========||";
          ExpertComments      = "Parwaz";
          BacktestingInfo     = true;
//====================================================================================================================================================//
          //string SymbolUse;
          SymbolExtension = "";
          //string LockedInfo;
          //string SymbolTrade;
          //string BackgroundName;
          //string ShowInfoCommission;
          //long ChartColor;
          //int TotalOrders;
          //int CntBuy;
          //int CntSell;
          //int CntBuyStop;
          //int CntSellStop;
          //int TryTimes;
          //int TotalTrades;
          //int MultiplierPoint;
          //int TimeActionModify;
          //int MagicNumber;
          CountTickSpreadPair = 0;
          CountTimesModify = 0;
          CountTimesClose = 0;
          CountTickSpread = 0;
          TimesModify = 0;
          TimesClose = 0;
          //int i;
          //int Count;
          TicksGet = 0;
          CountTickBuyStop = 0;
          CountTickSellStop = 0;
          //int WinTrades;
          //int LossTrades;
          SendMessages = 0;
          //int TicketLastStopLoss;
          //int CountHistory;
          //int DelayForModify;
          //double StepForModify;
          //double ArraySpreadPair[100];
          HistoryPips = 0;
          //double AvgSpread;
          //double AvgExecution;
          //double AvgSlippage;
          //double TotalProfitLoss;
          //double SpreadPips;
          //double DigitsPoints;
          //double LotSize;
          //double StopLevel;
          //double CheckMargin1;
          //double CheckMargin2;
          //double SumMargin;
          //double StepModify;
          //double ModeTickValue;
          //double BrokerCommission;
          //double SpreadLimit;
          //double RealCommission;
          GetCommissionPair = 0;
          //double PipsLevelPending;
          //double PipsLevelLoss;
          //double PipsLevelProfit;
          AvrgPipsProfit = 0;
          AvrgPipsLoss = 0;
          AvrgDuration = 0;
          LastBid = 0;
          LastAsk = 0;
          //double PriceBS;
          //double PriceSS;
          //double SL_BS;
          //double TP_BS;
          //double SL_SS;
          //double TP_SS;
          //double LastStopLoss;
          //double SlippageOrders;
          //double ArraySlippage[100];
          //double PriceBuyStop;
          //double PriceSellStop;
          Expire = 0;
          OperationDelay = 0;
          LastOperationDelay = 0;
          TimeToSend = 0;
          TimeDeleteObjects = 0;
          StopTrade = false;
          //bool SpreadOK;
          Locked = false;
          CallMain = false;
          ModifyBS = false;
          ModifySS = false;
          TestingMode = false;
          //bool TimeToTrade;
          NotHaveOpenOrders = true;
          //bool StartNewCycle;
          //---------------------------------------------------------------------
          MagicSet = 333;
//---------------------------------------------------------------------
          LockedDate = false;
          ExpiryDate = D'31.12.2018';
//---------------------------------------------------------------------
          LockedAccount = false;
          AccountNo1 = 1679729;
          AccountNo2 = 123456;
          AccountNo3 = 123456;
          ///
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Parwaz::ParwazRun()
{         //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
          //ObjectsDeleteAll(0, OBJ_ARROW); // delete all horizontal lines from the 2nd subwindow
          //ObjectsDeleteAll(0, OBJ_ARROW);           // delete all objects from the 2nd subwindow
          //ObjectsDeleteAll(0, OBJ_TREND);            // delete all objects from chart.
//---------------------------------------------------------------------
//Reset values
          CallMain = true;
//---------------------------------------------------------------------
//Locked message
          if(Locked == true)
          {         Print(LockedInfo + " || Please contact at nikolaospantzos@gmail.com");
                    ScreenComment(5);
                    CallMain = false;
                    Sleep(300000);
                    return; }
//---------------------------------------------------------------------
//Stop level warning
          if(StopTrade == true)
          {         if(IsTesting()) Print("Broker Stop Level Is Too High, Expert Not Trade!!!");
                    ScreenComment(4);
                    Sleep(300000);
                    return; }
//---------------------------------------------------------------------
//In backtesting
          if((IsTesting()) || (IsOptimization()) || (IsVisualMode()))
          {         CallMain = false;
                    MainFunction(); }
//---------------------------------------------------------------------
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Parwaz::ParwazOnTimer()
{         //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
//---------------------------------------------------------------------
//In backtesting
          if((IsTesting()) || (IsOptimization()) || (IsVisualMode())) return;
//---------------------------------------------------------------------
//Call main function
          if(IsTradeAllowed() == true)
          {         if(CallMain == true) MainFunction(); }
          else
                    ScreenComment(7);
//---------------------------------------------------------------------
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Parwaz::MainFunction()
{         //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
//---------------------------------------------------------------------
//Reset value
          ModifyBS = false;
          ModifySS = false;
          SpreadOK = true;
          StartNewCycle = false;
//---------------------------------------------------------------------
//Check Diffrent price
          if((NormalizeDouble(Bid, Digits) != NormalizeDouble(LastBid, Digits)) || (NormalizeDouble(Ask, Digits) != NormalizeDouble(LastAsk, Digits)) || (IsTesting()))
          {         //---------------------------------------------------------------------
                    //Check to modify
                    if(NormalizeDouble(Ask, Digits) != NormalizeDouble(LastAsk, Digits)) ModifyBS = true;
                    if(NormalizeDouble(Bid, Digits) != NormalizeDouble(LastBid, Digits)) ModifySS = true;
                    //---------------------------------------------------------------------
                    //Get last prices
                    LastBid = NormalizeDouble(Bid, Digits);
                    LastAsk = NormalizeDouble(Ask, Digits);
                    //---------------------------------------------------------------------
                    //Errors (Market is closed, Trade is disabled) ////132//ERR_MARKET_CLOSED //Market is closed  //133//ERR_TRADE_DISABLED//Trade is disabled
                    if((GetLastError() == 132) || (GetLastError() == 133)) return;
                    //---------------------------------------------------------------------
                    //Clear chart
                    if(DeleteObjects == true) ClearChart();
                    //---------------------------------------------------------------------
                    //Check orders
                    CountOrders();
                    //---------------------------------------------------------------------
                    //Get spread
                    SpreadPips = (Ask - Bid) / DigitsPoints;
                    if(CountAvgSpread == true) GetAvrgSpread(SpreadPips);
                    if(TypeOfSpreadUse == 1) SpreadLimit = AvgSpread; //Use average
                    if(TypeOfSpreadUse == 2) SpreadLimit = SpreadPips; //Use current
                    //---------------------------------------------------------------------
                    //Set commission
                    if(GetCommissionAuto == false) RealCommission = BrokerCommission;
                    if((GetCommissionAuto == true) && (CntBuy + CntSell == 0) && (NotHaveOpenOrders == true)) {RealCommission = BrokerCommission; ShowInfoCommission = "Waiting Trades...";}
                    if((GetCommissionAuto == true) && (CntBuy + CntSell != 0)) {RealCommission = (GetCommissionPair / MathMax(1, ModeTickValue)); ShowInfoCommission = DoubleToStr(RealCommission, 2) + " (pips)"; NotHaveOpenOrders = false;}
                    //---------------------------------------------------------------------
                    //Time filter info
                    if(UseTimeFilter == true)
                    {         TimeToTrade = false;
                              //---
                              if((StringToTime(TimeStartTrade) < StringToTime(TimeStopTrade)) && ((TimeGMT() >= StringToTime(TimeStartTrade)) && (TimeGMT() < StringToTime(TimeStopTrade)))) TimeToTrade = true;
                              if((StringToTime(TimeStartTrade) > StringToTime(TimeStopTrade)) && ((TimeGMT() >= StringToTime(TimeStartTrade)) || (TimeGMT() < StringToTime(TimeStopTrade)))) TimeToTrade = true;
                              //---
                              if(TimeToTrade == false)
                              {         ScreenComment(6); } }
                    else
                              TimeToTrade = true;
                    //---------------------------------------------------------------------
                    //Spread warning
                    if((SpreadLimit + RealCommission > MaxSpread) && (MaxSpread > 0) && (TimeToTrade == true))
                    {         if(IsTesting()) Print("Spread Is Too High, Expert Not Trade!!!");
                              ScreenComment(2);
                              SpreadOK = false; }
                    else
                    {         ScreenComment(1); }
                    //---------------------------------------------------------------------
                    //Count lot size
                    if(MonyManage == true) LotSize = MathMin(MathMax((MathRound((AccountFreeMargin() * Risk / 100000) / MarketInfo(Symbol(), MODE_LOTSTEP)) * MarketInfo(Symbol(), MODE_LOTSTEP)), MarketInfo(Symbol(), MODE_MINLOT)), MarketInfo(Symbol(), MODE_MAXLOT));
                    if(MonyManage == false) LotSize = MathMin(MathMax((MathRound(SizeX / MarketInfo(Symbol(), MODE_LOTSTEP)) * MarketInfo(Symbol(), MODE_LOTSTEP)), MarketInfo(Symbol(), MODE_MINLOT)), MarketInfo(Symbol(), MODE_MAXLOT));
                    //---------------------------------------------------------------------
                    //Reset value
                    if(CntBuyStop == 0) CountTickBuyStop = 0;
                    if(CntSellStop == 0) CountTickSellStop = 0;
                    StepForModify = StepModifyOrders;
                    DelayForModify = DelayModifyOrders;
                    if((CntBuyStop == 0) && (CntSellStop == 0)) StartNewCycle = true;
                    //---------------------------------------------------------------------
                    //Operations in spread and time limit
                    if(TotalOrders > 0)
                    {         if(((SpreadLimit + RealCommission > MaxSpread) && (MaxSpread > 0)) || (TimeToTrade == false))
                              {         if(ModifyMarket == true)
                                        {         if(CntBuy > 0) ModifyOrders(OP_BUY, 0, 0);
                                                  if(CntSell > 0) ModifyOrders(OP_SELL, 0, 0); //
                                        }
                                        if(CntBuyStop > 0) DeleteOrders(OP_BUYSTOP);
                                        if(CntSellStop > 0) DeleteOrders(OP_SELLSTOP);
                                        return; //
                              }
                              //---------------------------------------------------------------------
                              //Modify market orders
                              if(ModifyMarket == true)
                              {         if(CntBuy > 0) ModifyOrders(OP_BUY, 0, 0);
                                        if(CntSell > 0) ModifyOrders(OP_SELL, 0, 0); //
                              }
                              //---------------------------------------------------------------------
                              //Manage remain order
                              if(ManageRemainPending == 0)
                              {         //---Delete orphan buystop
                                        if((CntSell > 0) && (CntBuyStop > 0))
                                        {         DeleteOrders(OP_BUYSTOP);
                                                  return; //
                                        }
                                        //---Delete orphan sellstop
                                        if((CntBuy > 0) && (CntSellStop > 0))
                                        {         DeleteOrders(OP_SELLSTOP);
                                                  return; //
                                        } //
                              }
                              //---
                              if(ManageRemainPending == 1)
                              {         //---Modify orphan buystop
                                        if((CntSell > 0) && (CntBuyStop > 0))
                                        {         StepForModify = 0;
                                                  DelayForModify = 0;
                                                  ModifyOrders(OP_BUYSTOP, PipsLevelLoss, 1);
                                                  return; //
                                        }
                                        //---Modify orphan sellstop
                                        if((CntBuy > 0) && (CntSellStop > 0))
                                        {         StepForModify = 0;
                                                  DelayForModify = 0;
                                                  ModifyOrders(OP_SELLSTOP, PipsLevelLoss, 1);
                                                  return; //
                                        } //
                              }
                              //---------------------------------------------------------------------
                              //Modify pending orders
                              if(ModifyPending == true)
                              {         if(CntBuyStop > 0) ModifyOrders(OP_BUYSTOP, PipsLevelPending, 0);
                                        if(CntSellStop > 0) ModifyOrders(OP_SELLSTOP, PipsLevelPending, 0); //
                              }
                              //---------------------------------------------------------------------
                              //Get history results
                              if(CountHistory < 3)
                              {         CountHistory++;
                                        HistoryResults(); //
                              }
                              //---------------------------------------------------------------------
                              //Return if there are two pending orders
                              if((CntBuyStop > 0) && (CntSellStop > 0)) return; //
                    }
                    //---------------------------------------------------------------------
                    //Open orders
                    if(((TotalOrders == 0) || ((CntBuyStop + CntSellStop == 1) && (CntBuy + CntSell == 0))) && (SpreadOK == true) && (TimeToTrade == true) && (CheckMargin() == 1) && (StartNewCycle == true))
                    {         if(CntBuyStop == 0) OpenOrders(OP_BUYSTOP);
                              if(CntSellStop == 0) OpenOrders(OP_SELLSTOP);
                              HistoryResults();
                              TicketLastStopLoss = 0;
                              LastStopLoss = 0;
                              if(CountAvgSlippage == true) CountAvrgSlippage(SlippageOrders); //
                    }
                    else
                    {         if((CheckMargin() == 0) && (CntBuyStop == 1)) DeleteOrders(OP_BUYSTOP);
                              if((CheckMargin() == 0) && (CntSellStop == 1)) DeleteOrders(OP_SELLSTOP); } //
          }
//---------------------------------------------------------------------
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int Parwaz::CheckMargin()
{         //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
//---------------------------------------------------------------------
          CheckMargin1 = 0;
          CheckMargin2 = 0;
          SumMargin = 0;
//---------------------------------------------------------------------
          CheckMargin1 = AccountFreeMargin() - AccountFreeMarginCheck(Symbol(), OP_BUY, LotSize);
          CheckMargin2 = AccountFreeMargin() - AccountFreeMarginCheck(Symbol(), OP_SELL, LotSize);
          SumMargin = AccountFreeMargin() - MathMax(CheckMargin1, CheckMargin2);
//---------------------------------------------------------------------
          if(SumMargin <= 0.0)
          {         if(IsTesting()) Print("Margin Account Is Too Low, Expert Not Trade!!!");
                    ScreenComment(3);
                    return(0); //
          }
//---------------------------------------------------------------------
//============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
          return(1);
//---------------------------------------------------------------------
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Parwaz::OpenOrders(int TypeOfOrder)
{         //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
//---------------------------------------------------------------------
          int TicketBuyStop = -1;
          int TicketSellStop = -1;
//---------------------------------------------------------------------
          TryTimes = 0;
          PriceBS = 0;
          PriceSS = 0;
          SL_BS = 0;
          TP_BS = 0;
          SL_SS = 0;
          TP_SS = 0;
//---------------------------------------------------------------------
//Open orders
          while(true)
          {         TryTimes++;
                    OperationDelay = 0;
                    TimeToSend = GetTickCount();
                    //---Open Buy Stop
                    if(TypeOfOrder == OP_BUYSTOP)
                    {         PriceBS = NormalizeDouble(Ask + PipsLevelPending * DigitsPoints, Digits);
                              SL_BS = NormalizeDouble(Bid + (PipsLevelPending - PipsLevelLoss) * DigitsPoints, Digits);
                              if(UseTakeProfit == true) TP_BS = NormalizeDouble(Ask + ((PipsLevelPending + PipsLevelProfit) * DigitsPoints), Digits);
                              //---
                              TicketBuyStop = OrderSend(Symbol(), OP_BUYSTOP, LotSize, PriceBS, Slippage, SL_BS, TP_BS, ExpertComments, MagicNumber, Expire, clrBlue);
                              //---
                              if(TestingMode == true) SendMessages++;
                              //---Exit loop
                              if(TicketBuyStop > 0)
                              {         OperationDelay = GetTickCount() - TimeToSend;
                                        if(OperationDelay > 0)
                                        {         LastOperationDelay = OperationDelay;
                                                  if(TicksGet < 30) TicksGet++;
                                                  if(CountAvgExecution == true) CountAvrgExecution(OperationDelay); }
                                        break; }
                              else
                              {         Print("Error: ", DoubleToStr(GetLastError(), 0) + " || " + ExpertComments + ": receives new data and try again open buy stop order");
                                        if(TryTimes >= 3) break;//
                              } //
                    }
                    //---Open Sell Stop
                    if(TypeOfOrder == OP_SELLSTOP)
                    {         PriceSS = NormalizeDouble(Bid - PipsLevelPending * DigitsPoints, Digits);
                              SL_SS = NormalizeDouble(Ask - (PipsLevelPending - PipsLevelLoss) * DigitsPoints, Digits);
                              if(UseTakeProfit == true) TP_SS = NormalizeDouble(Bid - ((PipsLevelPending + PipsLevelProfit) * DigitsPoints), Digits);
                              //---
                              TicketSellStop = OrderSend(Symbol(), OP_SELLSTOP, LotSize, PriceSS, Slippage, SL_SS, TP_SS, ExpertComments, MagicNumber, Expire, clrRed);
                              //---
                              if(TestingMode == true) SendMessages++;
                              //---Exit loop
                              if(TicketSellStop > 0)
                              {         OperationDelay = GetTickCount() - TimeToSend;
                                        if(OperationDelay > 0)
                                        {         LastOperationDelay = OperationDelay;
                                                  if(TicksGet < 30) TicksGet++;
                                                  if(CountAvgExecution == true) CountAvrgExecution(OperationDelay); //
                                        }
                                        break;//
                              }
                              else
                              {         Print("Error: ", DoubleToStr(GetLastError(), 0) + " || " + ExpertComments + ": receives new data and try again open sell stop order");
                                        if(TryTimes >= 3) break;//
                              }//
                    }
                    //
          }
//---------------------------------------------------------------------
          if((GetLastError() == 1) || (GetLastError() == 132) || (GetLastError() == 133) || (GetLastError() == 137) || (GetLastError() == 4108) || (GetLastError() == 4109))
          {         Print("Error: ", DoubleToStr(GetLastError(), 0) + " || " + ExpertComments + ": receives an error open pending order"); }
//---------------------------------------------------------------------
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Parwaz::ModifyOrders(int TypeOfOrder, double PipsDistance, int ModifyMode)
{         //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
////---------------------------------------------------------------------
//                    bool ModifyBuyStop = false;
//                    bool ModifySellStop = false;
//                    bool ModifyBuy = false;
//                    bool ModifySell = false;
//                    double TrailingBuy;
//                    double TrailingSell;
//                    double TakeProfitBuy = 0;
//                    double TakeProfitSell = 0;
////---------------------------------------------------------------------
//                    PriceBS = 0;
//                    PriceSS = 0;
//                    SL_BS = 0;
//                    TP_BS = 0;
//                    SL_SS = 0;
//                    TP_SS = 0;
////---------------------------------------------------------------------
          for(i = OrdersTotal() - 1; i >= 0; i--)
          {         if(OrderSelect(i, SELECT_BY_POS) == true)
                    {         if((OrderMagicNumber() == MagicNumber) && (OrderSymbol() == Symbol()))
                              {         //---------------------------------------------------------------------
                                        bool modbuystop = Modify_BuyStop(  TypeOfOrder,   PipsDistance,   ModifyMode)  ;       //Modify Buy Stop
                                        //---------------------------------------------------------------------
                                        bool modsellstop = Modify_SellStop(  TypeOfOrder,   PipsDistance,   ModifyMode);   //Modify Sell Stop
                                        //---------------------------------------------------------------------
                                        bool modbuy      = Modify_Buy(  TypeOfOrder,   PipsDistance,   ModifyMode);  //Modify Buy
                                        //---------------------------------------------------------------------
                                        bool modsell     = Modify_Sell(  TypeOfOrder,   PipsDistance,   ModifyMode); //Modify Sell
                                        //---------------------------------------------------------------------
                              }//
                    }//
          }
//---------------------------------------------------------------------
//============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Parwaz::Modify_Buy(int TypeOfOrder, double PipsDistance, int ModifyMode, bool result = false)  //Modify Buy
{         //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
          //---------------------------------------------------------------------
          bool ModifyBuyStop = false;
          bool ModifySellStop = false;
          bool ModifyBuy = false;
          bool ModifySell = false;
          double TrailingBuy;
          //double TrailingSell;
          double TakeProfitBuy = 0;
          double TakeProfitSell = 0;
//---------------------------------------------------------------------
          PriceBS = 0;
          PriceSS = 0;
          SL_BS = 0;
          TP_BS = 0;
          SL_SS = 0;
          TP_SS = 0;
//---------------------------------------------------------------------
          if((OrderType() == OP_BUY) && (TypeOfOrder == OP_BUY))
          {         TrailingBuy = NormalizeDouble(Bid - (PipsLevelLoss * DigitsPoints), Digits);
                    if(UseTakeProfit == true) TakeProfitBuy = NormalizeDouble(OrderTakeProfit(), Digits);
                    //---
                    if((OrderStopLoss() == 0) || ((OrderStopLoss() != 0) && (NormalizeDouble(OrderStopLoss(), Digits) < NormalizeDouble(TrailingBuy, Digits))))
                    {         TryTimes = 0;
                              while(true)
                              {         TryTimes++;
                                        OperationDelay = 0;
                                        TimeToSend = GetTickCount();
                                        //---Modify
                                        ModifyBuy = OrderModify(OrderTicket(), 0, TrailingBuy, TakeProfitBuy, 0, clrBlue);
                                        //---
                                        if(TestingMode == true) SendMessages++;
                                        if(ModifyBuy == true)
                                        {         OperationDelay = GetTickCount() - TimeToSend;
                                                  if(OperationDelay > 0)
                                                  {         LastOperationDelay = OperationDelay;
                                                            if(TicksGet < 30) TicksGet++;
                                                            if(CountAvgExecution == true) CountAvrgExecution(OperationDelay); }
                                                  break; }
                                        else
                                        {         TrailingBuy = NormalizeDouble(Bid - (PipsLevelLoss * DigitsPoints), Digits);
                                                  if(UseTakeProfit == true) TakeProfitBuy = NormalizeDouble(OrderTakeProfit(), Digits);
                                                  Print("Error: ", DoubleToStr(GetLastError(), 0) + " || " + ExpertComments + ": receives new data and try again modify buy order");
                                                  if(TryTimes >= 3) break; } }
                              //---------------------------------------------------------------------
                              if((GetLastError() == 1) || (GetLastError() == 3) || (GetLastError() == 130) || (GetLastError() == 132) || (GetLastError() == 133) || (GetLastError() == 137) || (GetLastError() == 4108) || (GetLastError() == 4109))
                              {         Print("Error: ", DoubleToStr(GetLastError(), 0) + " || " + ExpertComments + ": receives an error modify buy order"); } } //
          }
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
          return result;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Parwaz::Modify_Sell(int TypeOfOrder, double PipsDistance, int ModifyMode, bool result = false) //Modify Sell
{         //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
          //---------------------------------------------------------------------
          bool ModifyBuyStop = false;
          bool ModifySellStop = false;
          bool ModifyBuy = false;
          bool ModifySell = false;
          //double TrailingBuy;
          double TrailingSell;
          double TakeProfitBuy = 0;
          double TakeProfitSell = 0;
//---------------------------------------------------------------------
          PriceBS = 0;
          PriceSS = 0;
          SL_BS = 0;
          TP_BS = 0;
          SL_SS = 0;
          TP_SS = 0;
//---------------------------------------------------------------------
          if((OrderType() == OP_SELL) && (TypeOfOrder == OP_SELL))
          {         TrailingSell = NormalizeDouble(Ask + (PipsLevelLoss * DigitsPoints), Digits);
                    if(UseTakeProfit == true) TakeProfitSell = NormalizeDouble(OrderTakeProfit(), Digits);
                    //---
                    if((OrderStopLoss() == 0) || ((OrderStopLoss() != 0) && (NormalizeDouble(OrderStopLoss(), Digits) > NormalizeDouble(TrailingSell, Digits))))
                    {         TryTimes = 0;
                              while(true)
                              {         TryTimes++;
                                        OperationDelay = 0;
                                        TimeToSend = GetTickCount();
                                        //---Modify
                                        ModifySell = OrderModify(OrderTicket(), 0, TrailingSell, TakeProfitSell, 0, clrRed);
                                        //---
                                        if(TestingMode == true) SendMessages++;
                                        if(ModifySell == true)
                                        {         OperationDelay = GetTickCount() - TimeToSend;
                                                  if(OperationDelay > 0)
                                                  {         LastOperationDelay = OperationDelay;
                                                            if(TicksGet < 30) TicksGet++;
                                                            if(CountAvgExecution == true) CountAvrgExecution(OperationDelay); }
                                                  break; }
                                        else
                                        {         TrailingSell = NormalizeDouble(Ask + (PipsLevelLoss * DigitsPoints), Digits);
                                                  if(UseTakeProfit == true) TakeProfitSell = NormalizeDouble(OrderTakeProfit(), Digits);
                                                  Print("Error: ", DoubleToStr(GetLastError(), 0) + " || " + ExpertComments + ": receives new data and try again modify sell order");
                                                  if(TryTimes >= 3) break; } }
                              //---------------------------------------------------------------------
                              if((GetLastError() == 1) || (GetLastError() == 3) || (GetLastError() == 130) || (GetLastError() == 132) || (GetLastError() == 133) || (GetLastError() == 137) || (GetLastError() == 4108) || (GetLastError() == 4109))
                              {         Print("Error: ", DoubleToStr(GetLastError(), 0) + " || " + ExpertComments + ": receives an error modify sell order"); } } //
          }
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
          return result;   //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Parwaz::Modify_SellStop(int TypeOfOrder, double PipsDistance, int ModifyMode, bool result = false)  //Modify Sell Stop
{         //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
          //---------------------------------------------------------------------
          bool ModifyBuyStop = false;
          bool ModifySellStop = false;
          bool ModifyBuy = false;
          bool ModifySell = false;
          //double TrailingBuy;
          //double TrailingSell;
          double TakeProfitBuy = 0;
          double TakeProfitSell = 0;
//---------------------------------------------------------------------
          PriceBS = 0;
          PriceSS = 0;
          SL_BS = 0;
          TP_BS = 0;
          SL_SS = 0;
          TP_SS = 0;
//---------------------------------------------------------------------
          if((OrderType() == OP_SELLSTOP) && (TypeOfOrder == OP_SELLSTOP) && (ModifySS == true))
          {         //---Check to modify
                    CountTickSellStop++;
                    if(CountTickSellStop >= DelayForModify)
                    {         PriceSS = NormalizeDouble(Bid - (PipsDistance * DigitsPoints), Digits);
                              SL_SS = NormalizeDouble(Ask - ((PipsDistance - PipsLevelLoss) * DigitsPoints), Digits);
                              if(UseTakeProfit == true) TP_SS = NormalizeDouble(Bid - ((PipsDistance + PipsLevelProfit) * DigitsPoints), Digits);
                              //---
                              if(((((NormalizeDouble(OrderOpenPrice(), Digits) != NormalizeDouble(PriceSS, Digits)) && (TypeModifyPendings == 0) &&
                                                  ((NormalizeDouble(Bid, Digits) - NormalizeDouble(OrderOpenPrice(), Digits) <= NormalizeDouble(((PipsDistance - StepForModify)*DigitsPoints), Digits)) ||
                                                   (NormalizeDouble(Bid, Digits) - NormalizeDouble(OrderOpenPrice(), Digits) >= NormalizeDouble(((PipsDistance + StepForModify)*DigitsPoints), Digits)) ||
                                                   (StepForModify == 0))) ||
                                                  ((NormalizeDouble(OrderOpenPrice(), Digits) != NormalizeDouble(PriceSS, Digits)) && (TypeModifyPendings == 1) &&
                                                   ((NormalizeDouble(Bid, Digits) - NormalizeDouble(OrderOpenPrice(), Digits) <= NormalizeDouble(((PipsDistance - StepForModify)*DigitsPoints), Digits)) ||
                                                    ((NormalizeDouble(PriceBuyStop, Digits) - NormalizeDouble(Ask, Digits) >= NormalizeDouble(((PipsDistance + StepForModify)*DigitsPoints), Digits)) &&
                                                     (NormalizeDouble(Bid, Digits) - NormalizeDouble(OrderOpenPrice(), Digits) >= NormalizeDouble(((PipsDistance + StepForModify)*DigitsPoints), Digits))) ||
                                                    (StepForModify == 0)))) && (ModifyMode == 0)) ||
                                                  ((ModifyMode == 1) && (NormalizeDouble(Bid, Digits) - NormalizeDouble(OrderOpenPrice(), Digits) > NormalizeDouble(((PipsDistance + StepForModify)*DigitsPoints), Digits))))
                              {         TryTimes = 0;
                                        while(true)
                                        {         TryTimes++;
                                                  OperationDelay = 0;
                                                  TimeToSend = GetTickCount();
                                                  //---Modify
                                                  ModifySellStop = OrderModify(OrderTicket(), PriceSS, SL_SS, TP_SS, Expire, clrRed);
                                                  //---
                                                  if(TestingMode == true) SendMessages++;
                                                  if(ModifySellStop == true)
                                                  {         CountTickSellStop = 0;
                                                            OperationDelay = GetTickCount() - TimeToSend;
                                                            if(OperationDelay > 0)
                                                            {         LastOperationDelay = OperationDelay;
                                                                      if(TicksGet < 30) TicksGet++;
                                                                      if(CountAvgExecution == true) CountAvrgExecution(OperationDelay); }
                                                            break; }
                                                  else
                                                  {         PriceSS = NormalizeDouble(Bid - (PipsDistance * DigitsPoints), Digits);
                                                            SL_SS = NormalizeDouble(Ask - ((PipsDistance - PipsLevelLoss) * DigitsPoints), Digits);
                                                            if(UseTakeProfit == true) TP_SS = NormalizeDouble(Bid - ((PipsDistance + PipsLevelProfit) * DigitsPoints), Digits);
                                                            Print("Error: ", DoubleToStr(GetLastError(), 0) + " || " + ExpertComments + ": receives new data and try again modify sell stop order");
                                                            if(TryTimes >= 3) break; } }
                                        //---------------------------------------------------------------------
                                        if((GetLastError() == 1) || (GetLastError() == 3) || (GetLastError() == 130) || (GetLastError() == 132) || (GetLastError() == 133) || (GetLastError() == 137) || (GetLastError() == 4108) || (GetLastError() == 4109))
                                        {         Print("Error: ", DoubleToStr(GetLastError(), 0) + " || " + ExpertComments + ": receives an error modify sell stop order");//
                                        }//
                              }//
                    } //
          }
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
          return result;// //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Parwaz::Modify_BuyStop(int TypeOfOrder, double PipsDistance, int ModifyMode, bool result = false)        //Modify Buy Stop
{         //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
          //---------------------------------------------------------------------
          bool ModifyBuyStop = false;
          bool ModifySellStop = false;
          bool ModifyBuy = false;
          bool ModifySell = false;
          //double TrailingBuy;
          //double TrailingSell;
          double TakeProfitBuy = 0;
          double TakeProfitSell = 0;
//---------------------------------------------------------------------
          PriceBS = 0;
          PriceSS = 0;
          SL_BS = 0;
          TP_BS = 0;
          SL_SS = 0;
          TP_SS = 0;
//---------------------------------------------------------------------
          if((OrderType() == OP_BUYSTOP) && (TypeOfOrder == OP_BUYSTOP) && (ModifyBS == true))
          {         //---Check to modify
                    CountTickBuyStop++;
                    if(CountTickBuyStop >= DelayForModify)
                    {         PriceBS = NormalizeDouble(Ask + (PipsDistance * DigitsPoints), Digits);
                              SL_BS = NormalizeDouble(Bid + ((PipsDistance - PipsLevelLoss) * DigitsPoints), Digits);
                              if(UseTakeProfit == true) TP_BS = NormalizeDouble(Ask + ((PipsDistance + PipsLevelProfit) * DigitsPoints), Digits);
                              //---
                              if(((((NormalizeDouble(OrderOpenPrice(), Digits) != NormalizeDouble(PriceBS, Digits)) && (TypeModifyPendings == 0) &&
                                                  ((NormalizeDouble(OrderOpenPrice(), Digits) - NormalizeDouble(Ask, Digits) <= NormalizeDouble(((PipsDistance - StepForModify)*DigitsPoints), Digits)) ||
                                                   (NormalizeDouble(OrderOpenPrice(), Digits) - NormalizeDouble(Ask, Digits) >= NormalizeDouble(((PipsDistance + StepForModify)*DigitsPoints), Digits)) || (StepForModify == 0))) ||
                                                  ((NormalizeDouble(OrderOpenPrice(), Digits) != NormalizeDouble(PriceBS, Digits)) && (TypeModifyPendings == 1) &&
                                                   ((NormalizeDouble(OrderOpenPrice(), Digits) - NormalizeDouble(Ask, Digits) <= NormalizeDouble(((PipsDistance - StepForModify)*DigitsPoints), Digits)) ||
                                                    ((NormalizeDouble(Bid, Digits) - NormalizeDouble(PriceSellStop, Digits) >= NormalizeDouble(((PipsDistance + StepForModify)*DigitsPoints), Digits)) &&
                                                     (NormalizeDouble(OrderOpenPrice(), Digits) - NormalizeDouble(Ask, Digits) >= NormalizeDouble(((PipsDistance + StepForModify)*DigitsPoints), Digits))) ||
                                                    (StepForModify == 0)))) && (ModifyMode == 0)) ||
                                                  ((ModifyMode == 1) && (NormalizeDouble(OrderOpenPrice(), Digits) - NormalizeDouble(Ask, Digits) > NormalizeDouble(((PipsDistance + StepForModify)*DigitsPoints), Digits))))
                              {         TryTimes = 0;
                                        while(true)
                                        {         TryTimes++;
                                                  OperationDelay = 0;
                                                  TimeToSend = GetTickCount();
                                                  //---Modify
                                                  ModifyBuyStop = OrderModify(OrderTicket(), PriceBS, SL_BS, TP_BS, Expire, clrBlue);
                                                  //---
                                                  if(TestingMode == true) SendMessages++;
                                                  //---
                                                  if(ModifyBuyStop == true)
                                                  {         CountTickBuyStop = 0;
                                                            OperationDelay = GetTickCount() - TimeToSend;
                                                            if(OperationDelay > 0)
                                                            {         LastOperationDelay = OperationDelay;
                                                                      if(TicksGet < 30) TicksGet++;
                                                                      if(CountAvgExecution == true) CountAvrgExecution(OperationDelay);//
                                                            }
                                                            break; }
                                                  else
                                                  {         PriceBS = NormalizeDouble(Ask + (PipsDistance * DigitsPoints), Digits);
                                                            SL_BS = NormalizeDouble(Bid + ((PipsDistance - PipsLevelLoss) * DigitsPoints), Digits);
                                                            if(UseTakeProfit == true) TP_BS = NormalizeDouble(Ask + ((PipsDistance + PipsLevelProfit) * DigitsPoints), Digits);
                                                            Print("Error: ", DoubleToStr(GetLastError(), 0) + " || " + ExpertComments + ": receives new data and try again modify buy stop order");
                                                            if(TryTimes >= 3) break;//
                                                  } //
                                        }
                                        //---------------------------------------------------------------------
                                        if((GetLastError() == 1) || (GetLastError() == 3) || (GetLastError() == 130) || (GetLastError() == 132) || (GetLastError() == 133) || (GetLastError() == 137) || (GetLastError() == 4108) || (GetLastError() == 4109))
                                        {         Print("Error: ", DoubleToStr(GetLastError(), 0) + " || " + ExpertComments + ": receives an error modify buy stop order"); //
                                        } //
                              } //
                    } //
          }//
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
          return result;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Parwaz::DeleteOrders(int TypeOfOrder)
{         //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
//---------------------------------------------------------------------
          bool DeleteOrders = false;
//---------------------------------------------------------------------
//Delete pending orders
          for(i = OrdersTotal() - 1; i >= 0; i--)
          {         if(OrderSelect(i, SELECT_BY_POS) == true)
                    {         if((OrderMagicNumber() == MagicNumber) && (OrderSymbol() == Symbol()) && (OrderType() == TypeOfOrder))
                              {         TryTimes = 0;
                                        while(true)
                                        {         TryTimes++;
                                                  OperationDelay = 0;
                                                  DeleteOrders = false;
                                                  TimeToSend = GetTickCount();
                                                  //---
                                                  DeleteOrders = OrderDelete(OrderTicket(), clrNONE);
                                                  //---
                                                  if(TestingMode == true) SendMessages++;
                                                  if(DeleteOrders == true)
                                                  {         OperationDelay = GetTickCount() - TimeToSend;
                                                            if(OperationDelay > 0)
                                                            {         LastOperationDelay = OperationDelay;
                                                                      if(TicksGet < 30) TicksGet++;
                                                                      if(CountAvgExecution == true) CountAvrgExecution(OperationDelay); }
                                                            break; //
                                                  }
                                                  else
                                                  {         Print("Error: ", DoubleToStr(GetLastError(), 0) + " || " + ExpertComments + ": receives new data and try again delete buy stop order");
                                                            if(TryTimes >= 3) break; //
                                                  }//
                                        }
                                        //---------------------------------------------------------------------
                                        //Print errors
                                        if((GetLastError() == 1) || (GetLastError() == 3) || (GetLastError() == 130) || (GetLastError() == 132) || (GetLastError() == 133) || (GetLastError() == 137) || (GetLastError() == 4108) || (GetLastError() == 4109))
                                        {         Print("Error: ", DoubleToStr(GetLastError(), 0) + " || " + ExpertComments + ": receives an error delete order"); } } } }
//---------------------------------------------------------------------
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Parwaz::CountOrders()
{         //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
//---------------------------------------------------------------------
          TotalOrders = 0;
          CntBuy = 0;
          CntSell = 0;
          CntBuyStop = 0;
          CntSellStop = 0;
          PriceBuyStop = 0;
          PriceSellStop = 0;
//---------------------------------------------------------------------
          if(OrdersTotal() > 0)
          {         for(i = OrdersTotal() - 1; i >= 0; i--)
                    {         if(OrderSelect(i, SELECT_BY_POS) == true)
                              {         if((OrderMagicNumber() == MagicNumber) && (OrderSymbol() == Symbol()))
                                        {         TotalOrders++;
                                                  TicketLastStopLoss = OrderTicket();
                                                  LastStopLoss = NormalizeDouble(OrderStopLoss(), Digits);
                                                  if(OrderType() == OP_BUY) CntBuy++;
                                                  if(OrderType() == OP_SELL) CntSell++;
                                                  if(OrderType() == OP_BUYSTOP) {CntBuyStop++; PriceBuyStop = NormalizeDouble(OrderOpenPrice(), Digits);}
                                                  if(OrderType() == OP_SELLSTOP) {CntSellStop++; PriceSellStop = NormalizeDouble(OrderOpenPrice(), Digits);}
                                                  if(((OrderType() == OP_BUY) || (OrderType() == OP_SELL)) && (GetCommissionPair == 0)) GetCommissionPair = MathAbs(OrderCommission() / OrderLots());//
                                        }//
                              }//
                    } //
          }
//---------------------------------------------------------------------
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Parwaz::HistoryResults()
{         //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
//---------------------------------------------------------------------
          TotalTrades = 0;
          TotalProfitLoss = 0;
          HistoryPips = 0;
          AvrgDuration = 0;
          AvrgPipsProfit = 0;
          AvrgPipsLoss = 0;
          WinTrades = 0;
          LossTrades = 0;
          SlippageOrders = 0;
//---------------------------------------------------------------------
          if(OrdersHistoryTotal() > 0)
          {         for(i = 0; i < OrdersHistoryTotal(); i++)
                    {         if(OrderSelect(i, SELECT_BY_POS, MODE_HISTORY) == false) continue;
                              if(OrderSelect(i, SELECT_BY_POS, MODE_HISTORY))
                              {         if((OrderMagicNumber() != MagicNumber) || (OrderSymbol() != Symbol())) continue;
                                        if((OrderMagicNumber() == MagicNumber) && (OrderSymbol() == Symbol()))
                                        {         if((OrderType() == OP_BUY) || (OrderType() == OP_SELL))
                                                  {         TotalTrades++;
                                                            if(TestingMode == true)
                                                            {         if(!((TimeDayOfWeek(OrderOpenTime()) == 5) && (TimeDayOfWeek(OrderCloseTime()) == 1))) AvrgDuration += TimeSeconds(OrderCloseTime() - OrderOpenTime()); }
                                                            TotalProfitLoss += OrderProfit() + OrderCommission() + OrderSwap();
                                                            if(OrderType() == OP_BUY)
                                                            {         if(OrderTicket() == TicketLastStopLoss) SlippageOrders = (OrderClosePrice() - LastStopLoss) / DigitsPoints;
                                                                      HistoryPips += (OrderClosePrice() - OrderOpenPrice()) / DigitsPoints;
                                                                      if(TestingMode == true)
                                                                      {         if(OrderClosePrice() > OrderOpenPrice()) {AvrgPipsProfit += (OrderClosePrice() - OrderOpenPrice()) / DigitsPoints; WinTrades++;}
                                                                                if(OrderClosePrice() < OrderOpenPrice()) {AvrgPipsLoss += (OrderClosePrice() - OrderOpenPrice()) / DigitsPoints; LossTrades++;} } }
                                                            if(OrderType() == OP_SELL)
                                                            {         if(OrderTicket() == TicketLastStopLoss) SlippageOrders = (LastStopLoss - OrderClosePrice()) / DigitsPoints;
                                                                      HistoryPips += (OrderOpenPrice() - OrderClosePrice()) / DigitsPoints;
                                                                      if(TestingMode == true)
                                                                      {         if(OrderClosePrice() < OrderOpenPrice()) {AvrgPipsProfit += (OrderOpenPrice() - OrderClosePrice()) / DigitsPoints; WinTrades++;}
                                                                                if(OrderClosePrice() > OrderOpenPrice()) {AvrgPipsLoss += (OrderOpenPrice() - OrderClosePrice()) / DigitsPoints; LossTrades++;} } } } } } } }
//---------------------------------------------------------------------
//Get average values
          if(TestingMode == true)
          {         if(TotalTrades > 0) AvrgDuration /= TotalTrades;
                    if(WinTrades > 0) AvrgPipsProfit /= WinTrades;
                    if(LossTrades > 0) AvrgPipsLoss /= LossTrades; }
//---------------------------------------------------------------------
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Parwaz::GetAvrgSpread(double CurrSpread)
{         //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
//---------------------------------------------------------------------
          double SumSpread = 0;
          int LoopCount = TimesForAverage - 1;
          AvgSpread = 0;
//---------------------------------------------------------------------
          if(CountTickSpreadPair < TimesForAverage) CountTickSpreadPair++;
          CountTickSpread = CountTickSpreadPair;
          ArrayCopy(ArraySpreadPair, ArraySpreadPair, 0, 1, TimesForAverage - 1);
          ArraySpreadPair[TimesForAverage - 1] = CurrSpread;
//---------------------------------------------------------------------
          for(Count = 0; Count < CountTickSpreadPair; Count++)
          {         SumSpread += ArraySpreadPair[LoopCount];
                    LoopCount--; }
//---------------------------------------------------------------------
          if(CountTickSpread > 0) AvgSpread = NormalizeDouble(SumSpread / CountTickSpread, 2);
//---------------------------------------------------------------------
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Parwaz::CountAvrgExecution(datetime Latency)
{         //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
//---------------------------------------------------------------------
          datetime SumExecution = 0;
          int LoopCount = TimesForAverage - 1;
          AvgExecution = 0;
//---------------------------------------------------------------------
          if(CountTimesModify < TimesForAverage) CountTimesModify++;
          TimesModify = CountTimesModify;
//---------------------------------------------------------------------
          ArrayCopy(ArrayExecution, ArrayExecution, 0, 1, TimesForAverage - 1);
          ArrayExecution[TimesForAverage - 1] = Latency;
//---------------------------------------------------------------------
          for(Count = 0; Count < CountTimesModify; Count++)
          {         SumExecution += ArrayExecution[LoopCount];
                    LoopCount--; }
//---------------------------------------------------------------------
          if(TimesModify > 0) AvgExecution = NormalizeDouble(SumExecution / TimesModify, 2);
//---------------------------------------------------------------------
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Parwaz::CountAvrgSlippage(double Slipping)
{         //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
//---------------------------------------------------------------------
          double SumSlippage = 0;
          int LoopCount = TimesForAverage - 1;
          AvgSlippage = 0;
//---------------------------------------------------------------------
          if(CountTimesClose < TimesForAverage) CountTimesClose++;
          TimesClose = CountTimesClose;
//---------------------------------------------------------------------
          ArrayCopy(ArraySlippage, ArraySlippage, 0, 1, TimesForAverage - 1);
          ArraySlippage[TimesForAverage - 1] = Slipping;
//---------------------------------------------------------------------
          for(Count = 0; Count < CountTimesClose; Count++)
          {         SumSlippage += ArraySlippage[LoopCount];
                    LoopCount--; }
//---------------------------------------------------------------------
          if(TimesClose > 0) AvgSlippage = NormalizeDouble(SumSlippage / TimesClose, 2);
//---------------------------------------------------------------------
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Parwaz::ClearChart()
{         //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
//---------------------------------------------------------------------
          //if(TimeCurrent() - TimeDeleteObjects >= DeleteMinutes * 60)
          //{         for(i = ObjectsTotal() - 1; i >= 0; i--)
          //          {         if(ObjectName(i) != BackgroundName) StaticFunctions::DeleteObject(nameC3, __LINE__);
          //
          //                    TimeDeleteObjects = TimeCurrent(); //
          //          }//
          //}
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Parwaz::ChartBackground(string StringName, color ImageColor, int Xposition, int Yposition, int Xsize, int Ysize)
{         //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
//---------------------------------------------------------------------
          if(ObjectFind(0, StringName) < 0) //== -1
                    if(!ObjectCreate(0, StringName, OBJ_RECTANGLE_LABEL, 0, 0, 0, 0, 0))Alert("Not Object Create" + (string)__LINE__);
          if(ObjectFind(0, StringName) >= 0 )
          {         ObjectSetInteger(0, StringName, OBJPROP_XDISTANCE, Xposition);
                    ObjectSetInteger(0, StringName, OBJPROP_YDISTANCE, Yposition);
                    ObjectSetInteger(0, StringName, OBJPROP_XSIZE, Xsize);
                    ObjectSetInteger(0, StringName, OBJPROP_YSIZE, Ysize);
                    ObjectSetInteger(0, StringName, OBJPROP_BGCOLOR, Purple);
                    ObjectSetInteger(0, StringName, OBJPROP_BORDER_TYPE, BORDER_FLAT);
                    ObjectSetInteger(0, StringName, OBJPROP_BORDER_COLOR, Purple);
                    ObjectSetInteger(0, StringName, OBJPROP_BACK, false);
                    ObjectSetInteger(0, StringName, OBJPROP_SELECTABLE, false);
                    ObjectSetInteger(0, StringName, OBJPROP_SELECTED, false);
                    ObjectSetInteger(0, StringName, OBJPROP_HIDDEN, false);
                    ObjectSetInteger(0, StringName, OBJPROP_ZORDER, 0);//
          } //
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Parwaz::ScreenComment(int TypeComm)
{         //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
//---------------------------------------------------------------------
//Strings
          string LastLine1;
          string LastLine2;
          double ShowAvgSpread;
          double ShowAvgExecution;
          double ShowAvgSlippage;
//---------------------------------------------------------------------
//---Normal
          if(TypeComm == 1)
          {         LastLine1 = "Total Trades : " + DoubleToStr(TotalTrades, 0);
                    LastLine2 = "Total win and lose  :  " + DoubleToStr(TotalProfitLoss, 2); }
//---Spread
          if(TypeComm == 2)
          {         LastLine1 = "  Spread is too high";
                    LastLine2 = "  Expert Stopped To Trade"; }
//---Margin
          if(TypeComm == 3)
          {         LastLine1 = "Account Free Margin Is Too Low!!!";
                    LastLine2 = "  Expert Stopped To Trade!!!"; }
//---Stop level
          if(TypeComm == 4)
          {         LastLine1 = "    Broker Stop Level is Too High!!!";
                    LastLine2 = "      Expert Stopped To Trade!!!"; }
//---Locked
          if(TypeComm == 5)
          {         LastLine1 = LockedInfo;
                    LastLine2 = "    Parwaz "; }
//---Time
          if(TypeComm == 6)
          {         LastLine1 = "    Out Of Session Market!!!";
                    LastLine2 = "     Expert Stopped To Trade!!!"; }
//---Auto trading
          if(TypeComm == 7)
          {         LastLine1 = "    Please Turn On 'Auto Trading'";
                    LastLine2 = "      Expert wait To Trade!!!"; }
//---------------------------------------------------------------------
//Set averages value
          if(CountAvgSpread == false) ShowAvgSpread = 0; else ShowAvgSpread = AvgSpread + RealCommission;
          if(CountAvgExecution == false) ShowAvgExecution = 0; else ShowAvgExecution = AvgExecution;
          if(CountAvgSlippage == false) ShowAvgSlippage = 0; else ShowAvgSlippage = AvgSlippage;
//---------------------------------------------------------------------
//Screen info and comments
//=============================================================================+++>>>>
          if(ObjectFind(ChartData_ChartInfo.ID, "percent profit in sum  =  ") < 0)
                    if(!ObjectCreate("percent profit in sum  =  ", OBJ_LABEL, 0, 0, 0))Alert("Not Object Create" + (string)__LINE__);
          if(ObjectFind(ChartData_ChartInfo.ID, "percent profit in sum  =  ") >= 0)
          {         ObjectSet("percent profit in sum  =  ", OBJPROP_CORNER, 0);
                    ObjectSet("percent profit in sum  =  ", OBJPROP_XDISTANCE, 0);
                    ObjectSet("percent profit in sum  =  ", OBJPROP_YDISTANCE, 20);
                    ObjectSetText("percent profit in sum  =  ", "   Parwaz ", 18, "Rockwell Extra", Pink );
                    //
          }
//=============================================================================+++>>>>
          if(ObjectFind(ChartData_ChartInfo.ID, "LastLine1") < 0)
                    if(!ObjectCreate("LastLine1", OBJ_LABEL, 0, 0, 0))Alert("Not Object Create" + (string)__LINE__);
          if(ObjectFind(ChartData_ChartInfo.ID, "LastLine1") >= 0)
          {         ObjectSet("LastLine1", OBJPROP_CORNER, 0);
                    ObjectSet("LastLine1", OBJPROP_XDISTANCE, 10);
                    ObjectSet("LastLine1", OBJPROP_YDISTANCE, 55);
                    ObjectSetText("LastLine1", LastLine1, 12, "Tohoma", White );//
          }
//=============================================================================+++>>>>
//=============================================================================+++>>>>
          if(ObjectFind(ChartData_ChartInfo.ID, "LastLine2") < 0)
                    if(!ObjectCreate("LastLine2", OBJ_LABEL, 0, 0, 0))Alert("Not Object Create" + (string)__LINE__);
          if(ObjectFind(ChartData_ChartInfo.ID, "LastLine2") >= 0)
          {         ObjectSet("LastLine2", OBJPROP_CORNER, 0);
                    ObjectSet("LastLine2", OBJPROP_XDISTANCE, 10);
                    ObjectSet("LastLine2", OBJPROP_YDISTANCE, 70);
                    ObjectSetText("LastLine2", LastLine2, 12, "Tohoma", White );//
          }
//=============================================================================+++>>>>
          //Comment("oooo"
          //        + "\n"
          //        + "\n"
          //        + "\n"
          //        + "\n"
          //        + "\n"
          //        + "\n"
          //        + "\nSpread/Avrg     :  " + DoubleToStr(SpreadPips, 2) + " / " + DoubleToStr(ShowAvgSpread, 2) + " (pips)"
          //        + "\n"
          //        + "\n"
          //        + "\n"
          //        + "\n"
          //        + "\n"
          //        + "\n"
          //        + "\n");
//---------------------------------------------------------------------*/
//============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Parwaz",  __LINE__, __FUNCTION__); //
          //============================//============================
          return;//
}
//+------------------------------------------------------------------+
//|             Class Parwaz     BEGIN-END                           |
//+------------------------------------------------------------------+
