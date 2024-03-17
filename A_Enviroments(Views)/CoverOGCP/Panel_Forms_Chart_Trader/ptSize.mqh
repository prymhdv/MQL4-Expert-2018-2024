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
class C_Size_Pad : public Ct_Size
{
public:
          bool          Test_GetSize(int WhichMode, bool IsKey);
          bool          Update();//checking & Set_ting Lots
          bool          UPDATED; //
};
//+------------------------------------------------------------------+
//|             Class C_CHART::BEGIN                                 |
//+------------------------------------------------------------------+
bool C_Size_Pad::Update()//checking & Set_ting Lots
{         UPDATED = false;
          if(false)Test_GetSize(MODE_CREATE, true);
          return UPDATED = true; //
} //
bool  C_Size_Pad::Test_GetSize(int WhichMode, bool IsKey)
{         double        lotSizeOne, lotSizeTwo, lotSizeThree, lotSizeFour, lotSizeFive;
          double        _TICKVALUE, _TICKSIZE, _point, _PipPoint, _PipValue, PipAmountPerOneLot;
          double        entry                   = 1800 ;
          int           SL                      = 400;
          double        maxRiskDollars          = 500 ;
          string        currSymbol              = NULL;
          int           EquityPercent           = 20;
          double        FixedLotSize            = 0.01;
          double        stopDist, stopPips, slDollars;
          stopDist              = MathAbs(entry - SL);                                  //>>> 1600
          stopPips              = stopDist / Point;                                     //>>> 160,000
          _TICKVALUE            = MarketInfo(Symbol(), MODE_TICKVALUE);
          _TICKSIZE             = SymbolInfoDouble(Symbol(), SYMBOL_TRADE_TICK_SIZE);//MarketInfo(Symbol(), MODE_TICKSIZE); ///in CFD (_TICKSIZE*.01)
          _PipPoint             = _point = _Point; if((_Digits == 3) || (_Digits == 5)) {         _PipPoint *= 10; } // Broker digits
          _PipValue             = (((SymbolInfoDouble(Symbol(), SYMBOL_TRADE_TICK_VALUE)) * _point) / (SymbolInfoDouble(Symbol(), SYMBOL_TRADE_TICK_SIZE)));
          slDollars             = stopPips * _TICKVALUE;///<<<<<<<<<< use Multipy       //>>> 16,000
          string SymbolBASE     = SymbolInfoString(Symbol(), SYMBOL_CURRENCY_BASE);
          string SymbolPROFIT   = SymbolInfoString(Symbol(), SYMBOL_CURRENCY_PROFIT);
          string SymbolDESC     = SymbolInfoString(Symbol(), SYMBOL_DESCRIPTION);
          double SymbolTypeValu = MarketInfo(Symbol(), MODE_PROFITCALCMODE); //     Profit calculation mode. 0 - Forex; 1 - CFD; 2 - Futures
          //============================================================
          PipAmountPerOneLot    = _TICKVALUE * 10;
          bool BaseCurrency_            = true; /// "XXX/USD""
          if(BaseCurrency_)PipAmountPerOneLot = 10;
          //============================================================
          lotSizeOne    = XVerifyLotSize(XCalcLotSize(true, EquityPercent, SL, FixedLotSize));
          //==============================
          lotSizeTwo    = LotsBasedOnSL(  entry, SL, maxRiskDollars);//LotsBasedOnSL(1800, 200, 500);
          //==============================
          lotSizeThree  = CalcRiskLots__FixedRiskPoints_RiskAmount( currSymbol, SL, maxRiskDollars);
          //==============================
          lotSizeFour   = CalcRiskLots__FixedRiskPoints_RiskAmount2( currSymbol, SL, maxRiskDollars);
          //===============================
          lotSizeFive   = CalcRiskLots__PipAmount( SL, maxRiskDollars);
          double PositionSizeUnitsAmount = 100000 * lotSizeFive;
          //===============================
          string CommentX = StringFormat("\n=======<<--Comment Symbol Lots-->>======="
                                         "\n SYMBOL: (%s)  SymbolDESC: (%s)    AccountLeverage: (%i) "
                                         "\n SymbolBASE: (%s) SymbolPROFIT: (%s)  "
                                         "\n AccountCurrency: ( %s )  SymbolType: (%s) "
                                         "\n TICKVALUE: (%.6f) "
                                         "\n TICKSIZE: (%.6f) "
                                         "\n Point: (%.6f) "
                                         "\n Pippoint: (%.6f) "
                                         "\n PipValue: (%.2f)  "
                                         "\n PipAmountPerOneLot: (%.2f$)  "
                                         "\n stopDist: (%.2f)  "
                                         "\n stopPips: (%.2f)  "
                                         "\n slDollars: (%.2f)  "
                                         "\n maxRiskDollars: (%.2f) "
                                         "\n entry: (%.2f) "
                                         "\n EquityPercent: (%.0f) "
                                         "\n SL: (%.0f) "
                                         "\n FixedLotSize: (%.2f) "
                                         "\n========================================="
                                         "\n lotSizeOne: (%.2f)      >>> = XVerifyLotSize(XCalcLotSize(true, 20, SL, 0.01));   "
                                         "\n lotSizeTwo: (%.2f)      >>> = LotsBasedOnSL(  entry, SL, maxRiskDollars);         "
                                         "\n lotSizeThree: (%.2f)    >>> = CalcRiskLots__FixedRiskPoints_RiskAmount( currSymbol, SL, maxRiskDollars);   "
                                         "\n lotSizeFour: (%.2f)     >>> = CalcRiskLots__FixedRiskPoints_RiskAmount2( currSymbol, SL, maxRiskDollars);  "
                                         "\n lotSizeFive: (%.2f)     >>> = CalcRiskLots__PipAmount( SL, maxRiskDollars);  "
                                         "\n PositionSizeUnitsAmount : (%.2f$) "
                                         "\n=========================================",
                                         Symbol(), SymbolDESC, AccountLeverage(), SymbolBASE, SymbolPROFIT, ct_Drive.TDD.ct_Account.CurrencyDesc, ct_Drive.TDD.ct_Market_Symbol.SymbolTypeDesc(), _TICKVALUE, _TICKSIZE, _point, _PipPoint, _PipValue, PipAmountPerOneLot, stopDist, stopPips, slDollars, maxRiskDollars, entry, EquityPercent, SL, FixedLotSize,
                                         lotSizeOne, lotSizeTwo, lotSizeThree, lotSizeFour, lotSizeFive, PositionSizeUnitsAmount
                                        );
          //do {Comment(CommentX);} //while(false);
          if(KeyRun)
          {         Comment(CommentX); KeyRun = false; RightMenu._Show(MODE_CREATE, false, 0, 10);
                    //LotsBasedOnSL(1800, 200, 500);>>>1800-200=1600>> 1600/0.01=160,000>>>160,000*0.1 =16,000 >> 16,000/500 = 0.03125 Lot
                    //Alert(" TickSize: ", _TICKSIZE, " TickValue: ", _TICKVALUE, " EquityPercent: ", EquityPercent, " SL: ", SL, " FixedLotSize: ", FixedLotSize, " maxRiskDollars: ", maxRiskDollars);
                    //Horizontal01.Create( true, false, "LineVSL", "LineVSL", Close[0] - (SL * PipPointGlobla(NULL)), 1, 1, clrYellow, false ); // LineV
                    {         Dev_Object_Pack.Lines.HorizontalX.GDS.Set_Action_2(WhichMode, IsKey);
                              Dev_Object_Pack.Lines.HorizontalX.GDS.Set_Desc_1("LineVSL");
                              Dev_Object_Pack.Lines.HorizontalX.GDS.Set_Color_1(clrYellow);
                              Dev_Object_Pack.Lines.HorizontalX.GDS.Set_Chart_6();
                              Dev_Object_Pack.Lines.HorizontalX.GDS.Set_Location_1(Close[0] - (int)(SL * PipPointGlobla(NULL)));
                              Dev_Object_Pack.Lines.HorizontalX.GDS.Set_Tip_2(STYLE_DOT, 1);
                              Dev_Object_Pack.Lines.HorizontalX.GDS.Set_Common_6(false, 10, false, false, false, "tooltip-LineVSL");
                              Dev_Object_Pack.Lines.HorizontalX.Action(Dev_Object_Pack.Lines.HorizontalX); //
                    } //
          }
          //===============================
          return true;//
}
//+------------------------------------------------------------------+
