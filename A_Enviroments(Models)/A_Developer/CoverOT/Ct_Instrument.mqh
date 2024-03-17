//+------------------------------------------------------------------+
//|                                         Ct_Instrument_Properties.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict

//+------------------------------------------------------------------+
//|             Class Ct_Instrument_Properties     BEGIN                 |
//+------------------------------------------------------------------+
class Ct_Instrument_Properties
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//| Refreshes the symbol quotes data                                 |
//+------------------------------------------------------------------+
{
public:

          //double            GetRate(string currency1, string currency2);

          //Ct_Instrument_Properties(string symbol);
          //string            GetPropertyJson();
          string            Symbol;
          int               InstrType;
          string            Comment;
          string            PriceIn;
          string            BaseFileName;
          int               LotSize;
          int               Slippage;
          double            Spread;
          double            SwapLong;
          double            SwapShort;
          double            Commission;
          double            RateToUSD;
          double            RateToEUR;
          double            RateToGBP;
          double            RateToJPY;
          int               SwapType;
          int               CommissionType;
          int               CommissionScope;
          int               CommissionTime;
          int               DigitsX;
          double            PointX;
          double            Pip;
          bool              IsFiveDigitsX;
          double            StopLevel;
          double            TickValue;
          double            MinLot;
          double            MaxLot;
          double            LotStep;
          double            MarginRequired;
/////////////////////////////////////////
          void           Ct_Instrument_Properties(string symbol);
          void           ~Ct_Instrument_Properties();
          void           InstrumentProperties_OnStart();
          int            GetSymbolsList(string & symbolsList[]);
          void           SaveStringToFile(string filename, string text);
          string         ComposeDataSourceContent(string dataSourceName, string dataDirectory, string description, Ct_Instrument_Properties *&properties[]);
          double         GetRate(string currProfit, string currAccount);
          string         GetPropertyJson(void); //
          //
}; //
///
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Ct_Instrument_Properties::Ct_Instrument_Properties(string symbol)
{         RunCallFunction++; ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Instrument_Properties Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          this.Symbol          = symbol;
          string symbolUpper   = symbol;
          StringToUpper(symbolUpper);
          this.InstrType       = ((StringLen(symbol) == 6 && symbolUpper == symbol) ? 0 : 1);
          this.Comment         = SymbolInfoString(symbol, SYMBOL_DESCRIPTION);
          this.PriceIn         = SymbolInfoString(symbol, SYMBOL_CURRENCY_PROFIT);
          this.BaseFileName    = symbol;
          this.LotSize         = (int) MarketInfo(symbol, MODE_LOTSIZE);
          this.Slippage        = 0;
          this.PointX           = MarketInfo(symbol, MODE_POINT);
          double bid           = MarketInfo(symbol, MODE_BID);
          double ask           = MarketInfo(symbol, MODE_ASK);
          this.Spread          = (ask - bid) / this.PointX;
          this.SwapLong        = MarketInfo(symbol, MODE_SWAPLONG);
          this.SwapShort       = MarketInfo(symbol, MODE_SWAPSHORT);
          this.Commission      = 0;
          this.RateToUSD       = GetRate(this.PriceIn, "USD");
          this.RateToEUR       = GetRate(this.PriceIn, "EUR");
          this.RateToGBP       = GetRate(this.PriceIn, "GBP");
          this.RateToJPY       = GetRate(this.PriceIn, "JPY");
          this.SwapType        = 0;
          this.CommissionType  = 0;
          this.CommissionScope = 0;
          this.CommissionTime  = 1;
          this.DigitsX          = (int)MarketInfo(symbol, MODE_DIGITS);
          this.IsFiveDigitsX    = (this.DigitsX == 3 || this.DigitsX == 5);
          this.Pip             = IsFiveDigitsX ? 10 * this.PointX : this.PointX;
          this.StopLevel       = MarketInfo(symbol, MODE_STOPLEVEL);
          this.TickValue       = MarketInfo(symbol, MODE_TICKVALUE);
          this.MinLot          = MarketInfo(symbol, MODE_MINLOT);
          this.MaxLot          = MarketInfo(symbol, MODE_MAXLOT);
          this.LotStep         = MarketInfo(symbol, MODE_LOTSTEP);
          this.MarginRequired  = MarketInfo(symbol, MODE_MARGINREQUIRED);
          if(this.MarginRequired < 0.0001)
                    this.MarginRequired = bid * this.LotSize / 100;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Instrument_Properties Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Ct_Instrument_Properties::~Ct_Instrument_Properties()
{
////////
          if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Instrument_Properties Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return; ///
}
//
double Ct_Instrument_Properties::GetRate(string currProfit, string currAccount)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Instrument_Properties Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          if(currProfit == currAccount)
                    return (1);
          double rate = MarketInfo(currAccount + currProfit, MODE_BID);
          if(rate < 0.0001 || rate > 100000.0)
          {         if(currProfit == "JPY")
                              rate = 0.01;
                    else if(currAccount == "JPY")
                              rate = 100;
                    else
                              rate = 1.0; }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Instrument_Properties Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return (rate); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ct_Instrument_Properties::InstrumentProperties_OnStart()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Instrument_Properties Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          string dataSourceName = TerminalInfoString(TERMINAL_NAME);
          string path = TerminalInfoString(TERMINAL_DATA_PATH) + "\\MQL4\\Files";
          StringReplace(path, "\\", "\\\\");
          string dataDirectory = path;
          string description = "Data Source exported from " + TerminalInfoString(TERMINAL_NAME) + ", " + TerminalInfoString(TERMINAL_COMPANY);
          string symbolsList[];
          int symbols = GetSymbolsList(symbolsList);
          Ct_Instrument_Properties *properties[];/////////////////array of class
          ArrayResize(properties, symbols);
          for(int i = 0; i < symbols; i++)
                    properties[i] = new Ct_Instrument_Properties(symbolsList[i]);
          string dataSourceContent = ComposeDataSourceContent(dataSourceName, dataDirectory, description, properties);
          string fileName = "DataSource_" + dataSourceName + ".json";
          SaveStringToFile(fileName, dataSourceContent);
          string note = "Exported " + fileName + "\n" + IntegerToString(symbols) + " symbols";
          Print(note);
          Comment(note);
          for(int i = 0; i < symbols; i++)
                    delete(properties[i]); //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Instrument_Properties Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
int Ct_Instrument_Properties::GetSymbolsList(string & symbolsList[])
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Instrument_Properties Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          int symbolsTotal = SymbolsTotal(true);
          ArrayResize(symbolsList, symbolsTotal);
          int symbolIndex = 0;
          for(int i = 0; i < symbolsTotal; i++)
          {         string symbol = SymbolName(i, true);
                    if(StringLen(symbol) > 3)
                              symbolsList[symbolIndex++] = symbol; }
          ArrayResize(symbolsList, symbolIndex);
          return (symbolIndex);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Instrument_Properties Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
void Ct_Instrument_Properties::SaveStringToFile(string filename, string text)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Instrument_Properties Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          int handle = FileOpen(filename, FILE_TXT | FILE_WRITE | FILE_ANSI);
          if(handle == INVALID_HANDLE)
                    return;
          FileWriteString(handle, text);
          FileClose(handle);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Instrument_Properties Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string Ct_Instrument_Properties::ComposeDataSourceContent(string dataSourceName, string dataDirectory, string description, Ct_Instrument_Properties *&properties[])
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Instrument_Properties Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          string content = "";
          content += "{\n";
          content += "    \"DataSourceName\" : \"" + dataSourceName + "\",\n";
          content += "    \"DataDirectory\"  : \"" + dataDirectory  + "\",\n";
          content += "    \"Description\"    : \"" + description    + "\",\n";
          content += "    \"Ct_Instrument_Properties\": {\n";
          int propCount = ArraySize(properties);
          for(int i = 0; i < propCount; i++)
                    content += properties[i].GetPropertyJson() + (i < propCount - 1 ? ",\n" : "\n");
          content += "    }\n";
          content += "}";
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Instrument_Properties Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return (content); }//
string Ct_Instrument_Properties::GetPropertyJson(void)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Instrument_Properties Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          string content = "";
          content += "        \"" + this.Symbol + "\" : {\n";
          content += "            \"Symbol\"          : \"" + this.Symbol + "\",\n";
          content += "            \"InstrType\"       : " + IntegerToString(this.InstrType) + ",\n";
          content += "            \"Comment\"         : \"" + this.Comment + "\",\n";
          content += "            \"PriceIn\"         : \"" + this.PriceIn + "\",\n";
          content += "            \"BaseFileName\"    : \"" + this.BaseFileName + "\",\n";
          content += "            \"LotSize\"         : " + IntegerToString(this.LotSize) + ",\n";
          content += "            \"Slippage\"        : " + IntegerToString(this.Slippage) + ",\n";
          content += "            \"Spread\"          : " + DoubleToString(this.Spread, 2) + ",\n";
          content += "            \"SwapLong\"        : " + DoubleToString(this.SwapLong, 2) + ",\n";
          content += "            \"SwapShort\"       : " + DoubleToString(this.SwapShort, 2) + ",\n";
          content += "            \"Commission\"      : " + DoubleToString(this.Commission, 2) + ",\n";
          content += "            \"RateToUSD\"       : " + DoubleToString(this.RateToUSD, this.DigitsX) + ",\n";
          content += "            \"RateToEUR\"       : " + DoubleToString(this.RateToEUR, this.DigitsX) + ",\n";
          content += "            \"RateToGBP\"       : " + DoubleToString(this.RateToGBP, this.DigitsX) + ",\n";
          content += "            \"RateToJPY\"       : " + DoubleToString(this.RateToJPY, this.DigitsX) + ",\n";
          content += "            \"SwapType\"        : " + IntegerToString(this.SwapType) + ",\n";
          content += "            \"CommissionType\"  : " + IntegerToString(this.CommissionType) + ",\n";
          content += "            \"CommissionScope\" : " + IntegerToString(this.CommissionScope) + ",\n";
          content += "            \"CommissionTime\"  : " + IntegerToString(this.CommissionTime) + ",\n";
          content += "            \"Digits\"          : " + IntegerToString(this.DigitsX) + ",\n";
          content += "            \"Point\"           : " + DoubleToString(this.PointX, this.DigitsX) + ",\n";
          content += "            \"Pip\"             : " + DoubleToString(this.Pip, this.DigitsX) + ",\n";
          content += "            \"IsFiveDigits\"    : " + (this.IsFiveDigitsX ? "true" : "false") + ",\n";
          content += "            \"StopLevel\"       : " + DoubleToString(this.StopLevel, 2) + ",\n";
          content += "            \"TickValue\"       : " + DoubleToString(this.TickValue, 2) + ",\n";
          content += "            \"MinLot\"          : " + DoubleToString(this.MinLot, 2) + ",\n";
          content += "            \"MaxLot\"          : " + DoubleToString(this.MaxLot, 2) + ",\n";
          content += "            \"LotStep\"         : " + DoubleToString(this.LotStep, 2) + ",\n";
          content += "            \"MarginRequired\"  : " + DoubleToString(this.MarginRequired, 2) + "\n";
          content += "        }";
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Instrument_Properties Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return (content);//
}//
//+------------------------------------------------------------------+
//|             Class Ct_Instrument_Properties     BEGIN-END             |
//+------------------------------------------------------------------+
