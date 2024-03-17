//+------------------------------------------------------------------+
//|                                                       Ss_MqlCheckupClient.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|             Class Checkup client terminal    BEGIN-END           |
//+------------------------------------------------------------------+
class Ss_MqlCheckupClient
{         /*
          MQL4 Reference / Checkup -- State Checking
          Functions that return parameters of the current state of the client terminal
          Function              Action
          //===============================================================================================================================================
          int           GetLastError();                                                 GetLastError          Returns the last error
          bool          IsStopped();                                                    IsStopped             Returns true, if an mql4 program has been commanded to stop its operation
          int           UninitializeReason();                                           UninitializeReason    Returns the code of the reason for deinitialization
          int           MQLInfoInteger(int property_id);                                MQLInfoInteger        Returns an integer value of a corresponding property of a running mql4 program
          string        MQLInfoString(int property_id);                                 MQLInfoString         Returns a string value of a corresponding property of a running mql4 program
          void          MQLSetInteger(int property_id, int property_value_to_set);      MQLSetInteger         Sets the value of the MQL_CODEPAGE property in an MQL4 program environment
          TerminalInfoInteger   Returns an integer value of a corresponding property of a running mql4 program
          TerminalInfoDouble    Returns a double value of a corresponding property of a running mql4 program
          TerminalInfoString    Returns a string value of a corresponding property of a running mql4 program
          //===============================================================================================================================================
          Symbol                Returns the name of a symbol of the current chart
          Period                Returns the current chart timeframe
          Digits                Returns the number of decimal digits determining the accuracy of the price value of the current chart symbol
          Point                 Returns the point size of the current symbol in the quote currency
          IsConnected           Checks connection between client terminal and server
          IsDemo                Checks if the Expert Advisor runs on a demo account
          IsDllsAllowed         Checks if the DLL function call is allowed for the Expert Advisor
          IsExpertEnabled       Checks if Expert Advisors are enabled for running
          IsLibrariesAllowed    Checks if the Expert Advisor can call library function
          IsOptimization        Checks if Expert Advisor runs in the Strategy Tester optimization mode
          IsTesting             Checks if the Expert Advisor runs in the testing mode
          IsTradeAllowed        Checks if the Expert Advisor is allowed to trade and trading context is not busy
          IsTradeContextBusy    Returns the information about trade context
          IsVisualMode          Checks if the Expert Advisor is tested in visual mode
          TerminalCompany       Returns the name of company owning the client terminal
          TerminalName          Returns client terminal name
          TerminalPath          Returns the directory, from which the client terminal was launched
          //===============================================================================================================================================
          */
private:

public:
          void           Ss_MqlCheckupClient::Ss_MqlCheckupClient() {};
          void           Ss_MqlCheckupClient::~Ss_MqlCheckupClient() {};
          bool           Ss_MqlCheckupClient::Update();//
          bool           Ss_MqlCheckupClient::UPDATED;//



};
//+------------------------------------------------------------------+
//|             Class Checkup client terminal    BEGIN-END           |
//+------------------------------------------------------------------+
