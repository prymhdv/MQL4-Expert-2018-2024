
struct St_PositionData_Swap
{         //--------------
          string
          OutputSwapsType,
          OutputSwapsDailyLongLot,
          OutputSwapsDailyShortLot,
          OutputSwapsDailyLongPS,
          OutputSwapsDailyShortPS,
          OutputSwapsYearlyLongLot,
          OutputSwapsYearlyShortLot,
          OutputSwapsYearlyLongPS,
          OutputSwapsYearlyShortPS,
          OutputSwapsCurrencyDailyLot,
          OutputSwapsCurrencyDailyPS,
          OutputSwapsCurrencyYearlyLot,
          OutputSwapsCurrencyYearlyPS; //
          //--------------
          string        SwapsTripleDay,
                        SwapConversionSymbol;
          //--------------
          string        ReferenceSymbol,
                        AdditionalReferenceSymbol;
          //--------------
          bool          ReferenceSymbolMode,
                        AdditionalReferenceSymbolMode;//
          //--------------
          int           ProfitCalcMode;
          //--------------
}; St_PositionData_Swap PositionData_Swap;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct St_PositionData
{         //--------------
          string        OutputPipValue;
          double        OutputPositionSize;
          double        OutputMaxPositionSize;
          //
          bool          SubtractPositions;
          bool          SubtractPendingOrders;
          //
          double        ArrayPositionSize[]; // PS for each trade with multiple TPs.
          //--------------
}; St_PositionData PositionData;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct St_PositionData_Symbol
{         //--------------
          double        UnitCost_reward; ///--- UnitCost = MarketInfo(Symbol(), MODE_TICKVALUE); // Futures or Forex.
          double        StopOut;// = 0;       StopOut = 0;                                 // Broker stoput percentage
          bool          IsStopOut;
          //--------------
}; St_PositionData_Symbol PositionData_Symbol;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct St_PositionData_Portfolio
{         //--------------
          double        LossMoney;      //= 0;
          double        RewardMoney;    //= 0;
          //--------------
}; St_PositionData_Portfolio PositionData_Portfolio;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct St_PositionData_Margin
{         //--------------
          double        PositionMargin,
                        UsedMargin,
                        FutureMargin,
                        MarginFree;                             // = 0; // Free margin in percentage ;
          //--------------
          double        PreHedgingPositionMargin,
                        OriginalPreHedgingPositionMargin;       // = 0; // For calculating symbol leverage when we apply some CustomLeverage.
          //--------------
}; St_PositionData_Margin PositionData_Margin;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct St_PositionData_Leverage
{         int           Leverage_Custom;//Leverage;// = 0;
          double        Leverage_Symbol;//Leverage;// = 1;
          //
}; St_PositionData_Leverage PositionData_Leverage;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct St_PositionData_RiskReward
{         //--------------------------------------------------------
          double        MainOutputReward;
          double        AdditionalOutputReward[];
          //--------------------------------------------------------
          string        InputRR, OutputRR;
          string        MainOutputRR;
          string        AdditionalOutputRR[];
          //--------------------------------------------------------
          string        InputReward;
          double        OutputReward;
          //--------------------------------------------------------
          string        PLM,
                        CPR,
                        PRM,
                        CPRew,
                        PPMR,
                        PPR,
                        PPMRew,
                        PPRew,
                        CPL,
                        PPL;
          //--------------------------------------------------------
          double        OutputRiskMoney;
          //--------------------------------------------------------
          double        DisplayRisk, RiskMoney;
          //--------------------------------------------------------
};      St_PositionData_RiskReward PositionData_RiskReward;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct St_DevSymbol
{         string                Inp;            //Whois to Input
          string                Current;        //Whois to Selected   //--reffencial DevSymbol.Current //--- StSymbol.Current
          //---Some extention
          //
          int                   SymbolsTotalCount;
          int                   SymbolsTotalOn;
          int                   SymbolsTotalOff;
          int                   SymbolsList[];
          //--end
}; St_DevSymbol StSymbol;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
#define FOREX_SYMBOLS_ONLY 0
#define NONFOREX_SYMBOLS_ONLY 1

