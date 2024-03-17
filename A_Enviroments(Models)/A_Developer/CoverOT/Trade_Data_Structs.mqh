//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOT\Trade_Data_Enum.mqh> 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

struct Settings
{         ENUM_ENTRY_TYPE       EntryType;
          double                EntryLevel;
          double                StopLossLevel,       TakeProfitLevel,        Risk,   MoneyRisk,      CommissionPerLot;
          bool                  UseMoneyInsteadOfPercentage;
          bool                  RiskFromPositionSize;
          double                PositionSize; // Used only when RiskFromPositionSize == true.
          ENUM_ACCOUNT_BUTTON   AccountButton;
          double                CustomBalance;
          bool                  DeleteLines,         CountPendingOrders,     IgnoreOrdersWithoutStopLoss,    IgnoreOtherSymbols,     HideAccSize,    ShowLines;
          ENUM_TABS             SelectedTab;
          int                   CustomLeverage;
          int                   MagicNumber;
          string                ScriptCommentary;
          bool                  DisableTradingWhenLinesAreHidden;
          double                ScriptTP[];
          int                   ScriptTPShare[];
          int                   MaxSlippage,         MaxSpread,              MaxEntrySLDistance,             MinEntrySLDistance;
          double                MaxPositionSize;
          // For SL/TP distance modes:
          int                   StopLoss;
          int                   TakeProfit;
          // Only for SL distance mode:
          ENUM_TRADE_DIRECTION  TradeDirection;
          // For script only:
          bool                  SubtractPositions,   SubtractPendingOrders;
          // For ATR:
          int                   ATRPeriod;
          double                ATRMultiplierSL,     ATRMultiplierTP;
          ENUM_TIMEFRAMES       ATRTimeframe;
          bool                  WasSelectedEntryLine,  WasSelectedStopLossLine, WasSelectedTakeProfitLine,  WasSelectedAdditionalTakeProfitLine[];
          bool                  DoNotApplyStopLoss,  DoNotApplyTakeProfit;
          bool                  AskForConfirmation,  IsPanelMinimized,  TPLockedOnSL; //
} sets;
///---------trade objects structs ....--------------------
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct _ORDER_
{         ////#include <.RTL_Prymhdv\QuartsExperts\CoverOT\_ORDER_.mqh>
//===============================================================================================================
          bool           Is_Orders;       //---all               ///-----  OrderPutting;  OrderModifying;   OrderEnding; by making var
          bool           Is_OrdersDone;
//
          bool           Is_OrdersSell,                  Is_OrdersBuy;
          bool           Is_OrdersSellDone,              Is_OrdersBuyDone;
//===============================================================================================================
          bool           Is_Markets;      //---Markets
          bool           Is_MarketsDone;
//
          bool           Is_MarketsBuy,                  Is_MarketsSell;        //---BuyMarket SellMarket
          bool           Is_MarketsBuyDone,              Is_MarketsSellDone;
//===============================================================================================================
          bool           Is_Pendings;
          bool           Is_PendingsDone;
//
          bool           Is_PendingsBuy,                 Is_PendingsSell;
          bool           Is_PendingsBuyDone,             Is_PendingsSellDone;
//
          bool           Is_PendingsBuyLimit,            Is_PendingsBuyStop;        //---BuyLimit BuyStop
          bool           Is_PendingsBuyLimitDone,        Is_PendingsBuyStopDone;
//
          bool           Is_PendingsSellLimit,           Is_PendingsSellStop;
          bool           Is_PendingsSellLimitDone,       Is_PendingsSellStopDone;

//===============================================================================================================
};
struct St_Size
{
//=============================================Lot Data (Money Change Data)
          double        INP;
          double        Curr_Lots;
          double        FixedPutLots;
          //-------------------------------------
          string        ManualPutLotsDesc;//
          string        DynamicPutLotsDesc;
          bool          IsDynamicPutLots;//
          bool          IsManualPutLots;//
//=============================================
          bool          IsPutLotsValid;//     =PutLotsO >= Symbol_MinLot && PutLotsO <= ct_Market_Symbol.MqlMarketSymbol.Market_MAXLOT
//=============================================
};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct Std_Global
{         void Std_Global();
          color                 COLOR_SELL ;
          color                 COLOR_BUY ;
          color                 COLOR_CLOSE ; //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Std_Global::Std_Global()
{         COLOR_SELL    = C'225,68,29';
          COLOR_BUY     = C'3,95,172';
          COLOR_CLOSE   = C'3,95,172';
//
}
Std_Global              std_Global;

