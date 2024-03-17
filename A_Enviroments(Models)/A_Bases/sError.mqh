//+------------------------------------------------------------------+
//|                                                      C_ERROR.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\stdlib.mqh>                                                      ///OKEY 001 ///gone Global scoping //#NOERRORRING

////////=======================================================
#define Waite 1000
string resultX = "Running " ;
///////========================================================
//+------------------------------------------------------------------+
//|             Class inform     BEGIN-END                           |
//+------------------------------------------------------------------+
class C_ERROR
{
private:
          ///int        C_ERROR::erorrCounting;/// = 0; no static
          string        LastFuncRun;
          string        runFuncList3[];//when static it goen -1///
          int           SizeFuncList3;
          //static string runFuncList2[];///need to acceee by ::

          //----
          void        _Find_Error_Desc_();
public:
          int           ErrorInterval;///waiting to runnby scound
          //-----------------------------------------------------------------
          int           __Line__;      //= -1,
          string        __Func__;      //= "NoneFunc",
          int           __ERROR__;     //= -1,
          uint          __Waiting__;   /// = 0,
          string        __Desc__;      /// = "Soz",
          int           __Count__;
          //-----------------------------------------------------------------
          void          C_ERROR();
          void          ~C_ERROR();

          void          SuperviserX(const int __ERROR__ = -1, const string __Desc__ = "Soz", const int __line__ = -1, const string __Func__ = "NoneFunc", uint __Waiting__ = 0);
          void          Handle_Exception(); //Handle_Exception:
          //-----------------------------------------------------------------some
          int           Alerter(const int x);
          bool          Alerter(const string x, const int LineCOM = 0, const string FuncCOM = "NoFuncYet");
          void          AlerterX(const string SozText = "Soz", const int Sozline = -1, const string SozFunc = "NoneFunc", const int SozErrorNum = 0  ); //when call__FUNCTION__ //
          void          PrinterX(const string SozText = "Soz", const int Sozline = -1, const string SozFunc = "NoneFunc", const string SozError = "None", const int SozErrorNum = 0  );
          void          LogerXS();
          void          Printer();//////////////////////////when parameter deferent its error that its defined... check parameters
/// if(GetLastError() == ERR_OBJECT_DOES_NOT_EXIST) Alert( ">>SozlineCOM: ", Sozline, ">>SozFuncCOM: ", SozFunc);
          bool          SuperviserStatic(bool KeyCom = false, string FuncCOM = "FuncCOM", string SozCOM = "-ObjectsTotal: " );///+ (string)ObjectsTotal()
          void          ErMaster();
          void           __SET__LIST__FUNCTION__CALL__(string SozFunc ); //

          void          __ERROR__OBJ__();
          void          __SOME__Formuls__();
          //---
          string        getBy_Terminal_Trade(string Result);//
          void          getDesc(int e, string & Result );
          //
};
//string C_ERROR::runFuncList2[] = "";
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_ERROR::C_ERROR()
{         //Alert("C_ERROR::C_ERROR()");
//---SuperviserX(_LastError, "-C_ERROR-Error",  __LINE__, __FUNCTION__); //|
          RunCallFunction++;//=========================================================|
          SizeFuncList3 = ArrayResize(runFuncList3, 5000); //if(SizeFuncList>);
//--- for(int j = 0 ; j <= SizeFuncList3 - 1; j++) { runFuncList3[j] = "--Free--"; };//
//
//---SuperviserX(_LastError, "-C_ERROR-Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          if(false)Print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
          if(false)Print("       On Init StartCalling-C_ERROR-Go>" + (string)RunCallFunction + "<========" + (string)TimeLocal() + "====" + "erorrCounting:" + (string)__Count__ + "=========");
          if(false)Alert("     On Init StartCalling-C_ERROR-Go>" + (string)RunCallFunction + "<========" + (string)TimeLocal() + "====" + "erorrCounting:" + (string)__Count__ + "========="); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_ERROR::~C_ERROR()
{         //=========================================================|
          if(Capitan_DeinitErrorCatching)SuperviserX(_LastError, "-C_ERROR-Error",  __LINE__, __FUNCTION__); //|
          if(false)Print("       OnDeInit        ENDCalling-C_ERROR-Go>" + (string)RunCallFunction + "   " + (string)TimeLocal() + "     " + "erorrCounting:" + (string)__Count__ + "        ");
          if(false)Alert("       OnDeInit        ENDCalling-C_ERROR-Go>" + (string)RunCallFunction + "   " + (string)TimeLocal() + "     " + "erorrCounting:" + (string)__Count__ + "        "); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_ERROR::SuperviserX(const int __error__ = -1, const string __desc__ = "Soz", const int __line__ = -1, const string __func__ = "NoneFunc", uint __waiting__ = 0)
{         //---
          //
          if(IsTesterDebug) {Print("__DEBUG__TESTER__uper", __func__, " ", __line__);}
          //
          bool IsBasic_Any_Error = __error__ > 0 && __error__ != 0 && __error__ != 4000;
          if(IsBasic_Any_Error)
          {         __Line__      = __line__;
                    __Func__      = __func__;
                    __ERROR__     = __error__;
                    __Waiting__   = __waiting__;
                    __Desc__      = __desc__;
                    __Count__    += 1;
                    ResetLastError();//
          }
          //---
          bool result = false;
          if(false)
          {         if(Vg_IsBasic_UNINITED)          return;
                    if(Capitan_KeyBreakeErrorTest)   return;
                    if(Capitan_ON_error_lastFuncRun) Alert(">>>>SozFunc:(", __Func__, ")>>>>>Sozline:(", __line__, ")"); //
          }
          //---
          //if(IsTesting()) return ;
          if(false && IsBasic_Any_Error) {  _Find_Error_Desc_(); return;}
          //---
          //---ErMaster();
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_ERROR::ErMaster()
{         //---
          {         if(false)          //
                    {         //DoubleToStr(GetLastError(), 0)
                              bool IsErrorCode_1    = (__ERROR__ == 1);
                              bool IsErrorCode_132  = (__ERROR__ == 132);
                              bool IsErrorCode_133  = (__ERROR__ == 133);
                              bool IsErrorCode_137  = (__ERROR__ == 137);
                              bool IsErrorCode_4108 = (__ERROR__ == 4108);
                              bool IsErrorCode_4109 = (__ERROR__ == 4109);
                              //     if( IsErrorCode_1 || IsErrorCode_132 || IsErrorCode_133 || IsErrorCode_137 || IsErrorCode_4108 || IsErrorCode_4109) { Print("ErrorX: ",  _Find_Error_Desc_() + " || " + "ExpertComments" + ": error open pending "); } //
                              //
                    } //
          }//
//----[---listing function call---]---
// __SET__LIST__FUNCTION__CALL__(SozFunc);
// __ERROR__OBJ__();
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_ERROR::_Find_Error_Desc_()
{         //---
          Handle_Exception();
          //---getBy_Terminal_Trade();
          //---
}

//+------------------------------------------------------------------+
//|                                        Function to handle errors |
//|                                                                  |
//+------------------------------------------------------------------+
void C_ERROR::Handle_Exception()
{         //---
          if(__ERROR__ == 4073 || __ERROR__ == 4066) {ResetLastError(); return;} //ERR_NO_HISTORY_DATA_4073  ERR_HISTORY_WILL_UPDATED_4066
          //---------------------------------------------------------------------------------------------------------------------------------
          string result = "";     string Result = "";
          getDesc(__ERROR__, Result);
          //---[---Define Trading Runtime---]
          if(__ERROR__ != 0 && __ERROR__ != 4000)//ERR_NO_MQLERROR//ERR_NO_ERROR
          {         //---
                    if(__ERROR__ >= 1 && __ERROR__ <= 150)              {result += " Trading Error: " ;}
                    else if(__ERROR__ >= 4001 && __ERROR__ <= 5203)     {result += " Runtime Error: " ;}
                    {         result +=   (string)__ERROR__ + "       (" + ErrorDescription(__ERROR__) + ")     Result: " + Result + ")         Line: " + (string)__Line__  + "         Func: " + __Func__ + "              (" +  __Desc__ + ")"; } //
          }
          //---[---Extern Alert---]
          if (result != "")     { Print( result );  Sleep(__Waiting__); Sleep(Waite); resultX = result;} //
          //---[---showing---]
          if(false)
          {         if(resultX != "Running >>>" && !(result != "" && __ERROR__ > 0)) for(string i = "" ; i < "..."; i += ".") {resultX += ">"; break;}
                    else if( !(result != "" && __ERROR__ > 0))                                                                {resultX  = "Running ";}
                    //resultX != "Running..."? {for(string i = "" ; i < "..."; i += ".") {resultX += "."; break;} }: resultX = "Running";
                    string _Find_Error_Desc_Labe = ("_Find_Error_Desc_ ->: (" + ErrorDescription(_LastError) + ")_(" + (string)__Count__ + ")_" + resultX);
                    __SOME__Formuls__(); //
          }
          return; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_ERROR::Alerter(const string xSoz, const int LineCOM = 0, const string FuncCOM = "NoFuncYet")
{         Alert(xSoz + " >>+_LastError: " + (string)_LastError + "--<<<<Line: ", LineCOM, "--<<<<Func: ", FuncCOM);   return true;     } //return 0;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int C_ERROR::Alerter(const int x)
{         //============================//============================
          SuperviserX(_LastError, "-C_ERROR-Error",  __LINE__, __FUNCTION__); //
//============================//============================
          switch (x)
          {         case 5: Print((string)x + "  Start_Best_Buying() Done ");
                              ///Sleep(5000);
                              break;
                    case 2: Print((string)x + "BuyMarketCloserX(); Deleting_Buy_Pending(); Done ");
                              //Sleep(5000);
                              break; //
          }
//============================//============================
          SuperviserX(_LastError, "-C_ERROR-Error",  __LINE__, __FUNCTION__); //
//============================//============================
          return 0;
//== 1  ? Alerter(5) : Alerter(2);
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_ERROR::AlerterX(const string SozText = "Soz", const int Sozline = -1, const string SozFunc = "NoneFunc", const int SozErrorNum = 0  ) //when call__FUNCTION__ //
{         Alert( SozText, Sozline, SozFunc, SozErrorNum);
//////////boshA
//{         safeerror = _LastError; a1.AlerterX("Creation Failed ", __LINE__, __FUNCTION__, safeerror) ;
//                    if(ObjectFind(ChartID(), StartTime) < 0) a1.AlerterX("Creation Failed  ", __LINE__, __FUNCTION__, safeerror) ; //
//          }
};
//==================================//==================================const int Sozline = __LINE__
void C_ERROR::PrinterX(const string SozText = "Soz", const int Sozline = -1, const string SozFunc = "NoneFunc", const string SozError = "None", const int SozErrorNum = 0  )
{         //
          if(_LastError != 0 && _LastError != 4000 && true)
          {         Alert(ErrorDescription(_LastError) + "-", _LastError, "-", "-Line:", __LINE__, "-", __FUNCTION__); } //
//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_ERROR::Printer()
{         SuperviserX(_LastError, "-C_ERROR-Error",  __LINE__, __FUNCTION__); //|
          string s1 = StringConcatenate(" Start time is :", TimeToString(TimeCurrent()));
          string s2 =  "Start Cart Ruller-0002--INITIALING_Time: " + TimeToString(TimeCurrent(), TIME_DATE | TIME_MINUTES | TIME_SECONDS); //
          SuperviserX(_LastError, "-C_ERROR-Error",  __LINE__, __FUNCTION__); //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_ERROR::LogerXS()
{         SuperviserX(_LastError, "-C_ERROR-Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
//if((ct_Drive.CountSellTotal > 0) && OrderSelect(!0, SELECT_BY_POS))
//{         // Alert( OrderSelect(!0, SELECT_BY_POS), "--", OrderTicket(), "--",__LINE__);
//          bool Key_sells = (OrderType() == (OP_SELL || OP_SELLLIMIT || OP_SELLSTOP));
//          //if(Key_1) {Alert(a1.FastMA) ; Sleep(20000);}
//          //else {Alert(a1.FastMA); Sleep(20000);} //
//          //
//          return; }
//============================//============================
          SuperviserX(_LastError, "-C_ERROR-Error",  __LINE__, __FUNCTION__); //
//============================//============================
//if((ct_Drive.CountBuyTotal > 0) && OrderSelect(!0, SELECT_BY_POS))
//{         // Alert( OrderSelect(!0, SELECT_BY_POS), "--", OrderTicket(), "--",__LINE__);
//          bool Key_sells = (OrderType() == (OP_BUY || OP_BUYLIMIT || OP_BUYSTOP));
//          //if(Key_1) {Alert(a1.FastMA) ; Sleep(20000);}
//          //else {Alert(a1.FastMA); Sleep(20000);} //
//          return;  //
//}
          SuperviserX(_LastError, "-C_ERROR-Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return;//
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool    C_ERROR::SuperviserStatic(bool KeyCom = false, string FuncCOM = "FuncCOM", string SozCOM = "-ObjectsTotal: " )///+ (string)ObjectsTotal()
{         //________________________________________________________Xerorr.SuperviserX(_LastError, "-C_STATICSUN- Error",  __LINE__, __FUNCTION__); //|
//Stack overflow in 'C:\Users\mito\AppData\Roaming\MetaQuotes\Terminal\63603D13555081059CD774AC70BBC63B\MQL4\Experts\00Pourya 2021 Experts\Worlds Watcher V06-build FC-2021-04-10.ex4'
//=========================================================|
///KeyCom=StaticKeysController::ClassObjects
///---off---if(KeyCom || C_STATICSUN::ClassObjects) Alert(FuncCOM, SozCOM);
//"ConductorController::~ConductorController()", InformStatic::ObjectsTotalstatic = "-ObjectsTotal: " + (string)ObjectsTotal()
//-C_STATICSUN-::DeleteAnaliseAllObjectName(SuperKeyAnaliseAllObject);
// ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_STATICSUN- Error",  __LINE__, __FUNCTION__); //|
//==============================================================================================================>>>>>>
          if(GetLastError() == ERR_NO_OBJECT_NAME) Alert( "ERR_NO_OBJECT_NAME", ">>SozlineCOM: ", "Sozline", ">>SozFuncCOM: ", FuncCOM);
          if(_LastError != 0 && _LastError != 4000 && true)
          {         Alert("X-SuperviserX--", ErrorDescription(_LastError) + "-", _LastError, "-", "-Line:", __LINE__, "-", __FUNCTION__, ">>SozlineCOM: ", "Sozline", ">>SozFuncCOM: ", FuncCOM); } //
//16 << LastFuncRun>>Runtime Error >>> > (-ChartController Error) | (no object name) | (4204) | Result->ERR_NO_OBJECT_NAME) | Line->933 | Func->ChartController::~ChartController
//=========================================================|
          return true; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_ERROR::__SET__LIST__FUNCTION__CALL__(string SozFunc )
{         //----[---listing function call---]---
          if(false)
          {         /// if(Error == 0)      return(false);
                    //SozFunc += ">>";
                    static string SafeFuncName = SozFunc;
                    static string SafeFuncName2 ;
                    if(SozFunc == SafeFuncName) SafeFuncName  = SafeFuncName + ">>" + SozFunc;
                    //else if(SozFunc !=SafeFuncName )SafeFuncName = SozFunc;
                    static int runKey = 1;
                    static int runKeyInitFor = 1;
                    static int runKeyNum = 1;
                    static string runFuncList[]; int SizeFuncList; SizeFuncList = ArrayResize(runFuncList, 5000); //if(SizeFuncList>);
                    string runFuncList2[1000];//when static it goen -1///
                    SizeFuncList = ArrayResize(runFuncList2, 5000); //if(SizeFuncList>);
                    if(runKeyInitFor && 0)
                    {         for(int j = 0 ; j <= SizeFuncList - 1; j++) { runFuncList2[j] = "--Free--"; }; runKeyInitFor = 0;}
                    //================
                    static int i = 1;
                    if(SizeFuncList3 <= 5000 && false )
                    {         if(i > 0 && i < 5000) Alert("i: ", i, "--SizeFuncList3: ", SizeFuncList3);
                              //  if(i != 0) Alert( "-previouslyRunFunc -",runFuncList2[SizeFuncList - 1] ); //
                              if(i != 0) runFuncList3[i]  = SozFunc + ">>**>>" + runFuncList3[i - 1] ; if(i < 5000)i++; else i = 1;///fill corect status// SozFunc + "**" +
                              if(i > 1 && i < 5000) Alert( " //previouslyRunFunc-: ", runFuncList3[i - 1] ); ////print out correct status
                    }
                    if(false)
                    {         if(runKey)
                              {         ///fillll array
                                        //for(i ; i < SizeFuncList; ++i) { runFuncList[i] = SozFunc; break;    };
                                        if(i != 0)
                                                  LastFuncRun = runFuncList[i - 1] + (string)++runKeyNum;
                                        runKey = 0; }
                              else
                              {         ///fillll array
                                        //for(i ; i < SizeFuncList; ++i) { runFuncList[i] = SozFunc; break;     };
                                        if(i != 0)
                                                  LastFuncRun = runFuncList[i - 1] + (string)++runKeyNum;
                                        runKey = 1; } //
                    }//
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_ERROR::__ERROR__OBJ__()
{         if(false)
          {         //---off---if(GetLastError() == ERR_NO_OBJECT_NAME)            { Alert( "ERR_NO_OBJECT_NAME", ">>SozlineCOM: ", Sozline, ">>SozFuncCOM: ", SozFunc);}
                    //---off---if(_LastError != 0 && _LastError != 4000 )          { Alert("X-SuperviserX--", ErrorDescription(_LastError) + "-", _LastError, "-", "-Line:", __LINE__, "-", __FUNCTION__, ">>SozlineCOM: ", Sozline, ">>SozFuncCOM: ", SozFunc); } //
                    //---off---if(GetLastError() == ERR_OBJECT_DOES_NOT_EXIST)     { Alert( "ERR_OBJECT_DOES_NOT_EXIST", ">>SozlineCOM: ", Sozline, ">>SozFuncCOM: ", SozFunc);}
                    //---off---if(_LastError != 0 && _LastError != 4000 )
                    //---off---{         Alert("X-SuperviserX--", ErrorDescription(_LastError) + "-", _LastError, "-",
                    //---off---                "-Line:", __LINE__, "-", __FUNCTION__,
                    //---off---                ">>SozlineCOM: ", Sozline,
                    //---off---                ">>SozFuncCOM: ", SozFunc); //
                    //---off---}//
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_ERROR::__SOME__Formuls__()
{         if(true)
          {         static double rund;
                    if(rund < 0)  rund = 0.001;
                    if(rund > 5)   rund = 0.001;
                    double FormulaX =  ( 2 * rund * rund * rund + 3 * rund * rund + 2 * rund + 3) * 0.01; //Alert(FormulaX);
                    double AngleX = rund++;// = (int)Formula++;
                    if(0)
                    {         if(ObjectFind(0, "_Find_Error_Desc_") >= 0)
                                        //  if (Tools.UseLabel.Name() == "_Find_Error_Desc_" ) //Tools.UseLabel.Name("_Find_Error_Desc_") ;
                                        for(int x = 0; x < 1; x++)
                                        {         //Tools.UseLabel.Angle(AngleX);  Sleep(10); //
                                        }//
                    }//
          } //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string C_ERROR::getBy_Terminal_Trade(string Result)
{         if(false)
          {         //---[---Terminal---]
                    if(__ERROR__ > 150 && __ERROR__ != 0 && __ERROR__ != 4000)
                    {         Result = "Terminal:-> " + "(" +  __Desc__  + ")|(" + ErrorDescription(__ERROR__) + ")|(" + (string)__ERROR__ + ")|Line->" + (string)__Line__  + "|Func->" + __Func__;}
                    //---[---Trade---]
                    if(__ERROR__ < 151 && __ERROR__ > 0 )        //
                    {         int _ErrorCheck;
                              string _ErrorComment;
                              switch(__ERROR__)
                              {         //
                                        case 1:   _ErrorComment = "ERR_NO_RESULT";                        Print("ErrorTrade: ", _ErrorCheck, " ErrorNumber: ", _LastError, "ErrorDescr: ", _ErrorComment); break;
                                        case 2:   _ErrorComment = "ERR_COMMON_ERROR";                     Print("ErrorTrade: ", _ErrorCheck, " ErrorNumber: ", _LastError, "ErrorDescr: ", _ErrorComment); break;
                                        case 3:   _ErrorComment = "ERR_INVALID_TRADE_PARAMETERS";         Print("ErrorTrade: ", _ErrorCheck, " ErrorNumber: ", _LastError, "ErrorDescr: ", _ErrorComment); break;
                                        case 4:   _ErrorComment = "ERR_SERVER_BUSY";                      Print("ErrorTrade: ", _ErrorCheck, " ErrorNumber: ", _LastError, "ErrorDescr: ", _ErrorComment); break;
                                        case 5:   _ErrorComment = "ERR_OLD_VERSION";                      Print("ErrorTrade: ", _ErrorCheck, " ErrorNumber: ", _LastError, "ErrorDescr: ", _ErrorComment); break;
                                        case 6:   _ErrorComment = "ERR_NO_CONNECTION";                    Print("ErrorTrade: ", _ErrorCheck, " ErrorNumber: ", _LastError, "ErrorDescr: ", _ErrorComment); break;
                                        case 7:   _ErrorComment = "ERR_NOT_ENOUGH_RIGHTS";                Print("ErrorTrade: ", _ErrorCheck, " ErrorNumber: ", _LastError, "ErrorDescr: ", _ErrorComment); break;
                                        case 8:   _ErrorComment = "ERR_TOO_FREQUENT_REQUESTS";            Print("ErrorTrade: ", _ErrorCheck, " ErrorNumber: ", _LastError, "ErrorDescr: ", _ErrorComment); break;
                                        case 9:   _ErrorComment = "ERR_MALFUNCTIONAL_TRADE";              Print("ErrorTrade: ", _ErrorCheck, " ErrorNumber: ", _LastError, "ErrorDescr: ", _ErrorComment); break;
                                        case 64:  _ErrorComment = "ERR_ACCOUNT_DISABLED";                 Print("ErrorTrade: ", _ErrorCheck, " ErrorNumber: ", _LastError, "ErrorDescr: ", _ErrorComment); break;
                                        case 65:  _ErrorComment = "ERR_INVALID_ACCOUNT";                  Print("ErrorTrade: ", _ErrorCheck, " ErrorNumber: ", _LastError, "ErrorDescr: ", _ErrorComment); break;
                                        case 128: _ErrorComment = "ERR_TRADE_TIMEOUT";                    Print("ErrorTrade: ", _ErrorCheck, " ErrorNumber: ", _LastError, "ErrorDescr: ", _ErrorComment); break;
                                        case 129: _ErrorComment = "ERR_INVALID_PRICE";                    Print("ErrorTrade: ", _ErrorCheck, " ErrorNumber: ", _LastError, "ErrorDescr: ", _ErrorComment); break;
                                        case 130: _ErrorComment = "ERR_INVALID_STOPS";                    Print("ErrorTrade: ", _ErrorCheck, " ErrorNumber: ", _LastError, "ErrorDescr: ", _ErrorComment); break;
                                        case 131: _ErrorComment = "ERR_INVALID_TRADE_VOLUME";             Print("ErrorTrade: ", _ErrorCheck, " ErrorNumber: ", _LastError, "ErrorDescr: ", _ErrorComment); break;
                                        case 132: _ErrorComment = "ERR_MARKET_CLOSED";                    Print("ErrorTrade: ", _ErrorCheck, " ErrorNumber: ", _LastError, "ErrorDescr: ", _ErrorComment); break;
                                        case 133: _ErrorComment = "ERR_TRADE_DISABLED";                   Print("ErrorTrade: ", _ErrorCheck, " ErrorNumber: ", _LastError, "ErrorDescr: ", _ErrorComment); break;
                                        case 134: _ErrorComment = "ERR_NOT_ENOUGH_MONEY";                 Print("ErrorTrade: ", _ErrorCheck, " ErrorNumber: ", _LastError, "ErrorDescr: ", _ErrorComment); break;
                                        case 135: _ErrorComment = "ERR_PRICE_CHANGED";                    Print("ErrorTrade: ", _ErrorCheck, " ErrorNumber: ", _LastError, "ErrorDescr: ", _ErrorComment); break;
                                        case 136: _ErrorComment = "ERR_OFF_QUOTES";                       Print("ErrorTrade: ", _ErrorCheck, " ErrorNumber: ", _LastError, "ErrorDescr: ", _ErrorComment); break;
                                        case 137: _ErrorComment = "ERR_BROKER_BUSY";                      Print("ErrorTrade: ", _ErrorCheck, " ErrorNumber: ", _LastError, "ErrorDescr: ", _ErrorComment); break;
                                        case 138: _ErrorComment = "ERR_REQUOTE";                          Print("ErrorTrade: ", _ErrorCheck, " ErrorNumber: ", _LastError, "ErrorDescr: ", _ErrorComment); break;
                                        case 139: _ErrorComment = "ERR_ORDER_LOCKED";                     Print("ErrorTrade: ", _ErrorCheck, " ErrorNumber: ", _LastError, "ErrorDescr: ", _ErrorComment); break;
                                        case 140: _ErrorComment = "ERR_LONG_POSITIONS_ONLY_ALLOWED";      Print("ErrorTrade: ", _ErrorCheck, " ErrorNumber: ", _LastError, "ErrorDescr: ", _ErrorComment + " (TESTER PROBLEM, ALLOW SHORT POSITIONS)"); break;
                                        case 141: _ErrorComment = "ERR_TOO_MANY_REQUESTS";                Print("ErrorTrade: ", _ErrorCheck, " ErrorNumber: ", _LastError, "ErrorDescr: ", _ErrorComment); break;
                                        case 145: _ErrorComment = "ERR_TRADE_MODIFY_DENIED";              Print("ErrorTrade: ", _ErrorCheck, " ErrorNumber: ", _LastError, "ErrorDescr: ", _ErrorComment); break;
                                        case 146: _ErrorComment = "ERR_TRADE_CONTEXT_BUSY";               Print("ErrorTrade: ", _ErrorCheck, " ErrorNumber: ", _LastError, "ErrorDescr: ", _ErrorComment); break;
                                        case 147: _ErrorComment = "ERR_TRADE_EXPIRATION_DENIED";          Print("ErrorTrade: ", _ErrorCheck, " ErrorNumber: ", _LastError, "ErrorDescr: ", _ErrorComment); break;
                                        case 148: _ErrorComment = "ERR_TRADE_TOO_MANY_ORDERS";            Print("ErrorTrade: ", _ErrorCheck, " ErrorNumber: ", _LastError, "ErrorDescr: ", _ErrorComment); break;
                                        case 149: _ErrorComment = "ERR_TRADE_HEDGE_PROHIBITED";           Print("ErrorTrade: ", _ErrorCheck, " ErrorNumber: ", _LastError, "ErrorDescr: ", _ErrorComment); break;
                                        case 150: _ErrorComment = "ERR_TRADE_PROHIBITED_BY_FIFO";         Print("ErrorTrade: ", _ErrorCheck, " ErrorNumber: ", _LastError, "ErrorDescr: ", _ErrorComment); break;
                                        default:  _ErrorComment = "SWITCH_ERROR - CodeError";             Print("ErrorTrade: ", _ErrorCheck, " ErrorNumber: ", _LastError, "ErrorDescr: ", _ErrorComment); break;//
                              } return("Server:" + _ErrorComment); //
                    }  //
          }///
          return "";//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_ERROR::getDesc(int e, string & Result )
{         switch(__ERROR__) //case 0: ERR_NO_ERROR
          {         case 1    : Result += "ERR_NO_RESULT";                       break; // ERR_NO_RESULT
                    case 2    : Result += "ERR_COMMON_ERROR";                    break; // ERR_COMMON_ERROR
                    case 3    : Result += "ERR_INVALID_TRADE_PARAMETERS";        break; // ERR_INVALID_TRADE_PARAMETERS
                    case 4    : Result += "ERR_SERVER_BUSY";                     break; // ERR_SERVER_BUSY
                    case 5    : Result += "ERR_OLD_VERSION";                     break; // ERR_OLD_VERSION
                    case 6    : Result += "ERR_NO_CONNECTION";                   break; // ERR_NO_CONNECTION
                    case 7    : Result += "ERR_NOT_ENOUGH_RIGHTS";               break; // ERR_NOT_ENOUGH_RIGHTS
                    case 8    : Result += "ERR_TOO_FREQUENT_REQUESTS";           break; // ERR_TOO_FREQUENT_REQUESTS
                    case 9    : Result += "ERR_MALFUNCTIONAL_TRADE";             break; // ERR_MALFUNCTIONAL_TRADE
                    case 64   : Result += "ERR_ACCOUNT_DISABLED";                break; // ExpertRemove(); // ERR_ACCOUNT_DISABLED
                    case 65   : Result += "ERR_INVALID_ACCOUNT";                 break; // Wrong_Account(); // ERR_INVALID_ACCOUNT
                    case 128  : Result += "ERR_TRADE_TIMEOUT";                   break; // ERR_TRADE_TIMEOUT
                    case 129  : Result += "ERR_INVALID_PRICE";                   break; // ERR_INVALID_PRICE
                    case 130  : Result += "ERR_INVALID_STOPS";                   break; // ERR_INVALID_STOPS
                    case 131  : Result += "ERR_INVALID_TRADE_VOLUME";            break; // ERR_INVALID_TRADE_VOLUME
                    case 132  : Result += "ERR_MARKET_CLOSED";                   break; // ExpertRemove(); // ERR_MARKET_CLOSED
                    case 133  : Result += "ERR_TRADE_DISABLED";                  break; // ERR_TRADE_DISABLED
                    case 134  : Result += "ERR_NOT_ENOUGH_MONEY";                break; // ERR_NOT_ENOUGH_MONEY
                    case 135  : Result += "ERR_PRICE_CHANGED";                   break; // ERR_PRICE_CHANGED
                    case 136  : Result += "ERR_OFF_QUOTES";                      break; // ERR_OFF_QUOTES
                    case 137  : Result += "ERR_BROKER_BUSY";                     break; // ERR_BROKER_BUSY
                    case 138  : Result += "ERR_REQUOTE";                         break; // ERR_REQUOTE
                    case 139  : Result += "ERR_ORDER_LOCKED";                    break; // ERR_ORDER_LOCKED
                    case 140  : Result += "ERR_LONG_POSITIONS_ONLY_ALLOWED";     break; // ERR_LONG_POSITIONS_ONLY_ALLOWED
                    case 141  : Result += "ERR_TOO_MANY_REQUESTS";               break; // ERR_TOO_MANY_REQUESTS
                    case 145  : Result += "ERR_TRADE_MODIFY_DENIED";             break; // ERR_TRADE_MODIFY_DENIED
                    case 146  : Result += "ERR_TRADE_CONTEXT_BUSY";              break; // ERR_TRADE_CONTEXT_BUSY
                    case 147  : Result += "ERR_TRADE_EXPIRATION_DENIED";         break; // ERR_TRADE_EXPIRATION_DENIED
                    case 148  : Result += "ERR_TRADE_TOO_MANY_ORDERS";           break; // ERR_TRADE_TOO_MANY_ORDERS
                    case 149  : Result += "ERR_TRADE_HEDGE_PROHIBITED";          break; // ERR_TRADE_HEDGE_PROHIBITED
                    case 150  : Result += "ERR_TRADE_PROHIBITED_BY_FIFO";        break; // ERR_TRADE_PROHIBITED_BY_FIFO
                    case 4000 : Result += "ERR_NO_MQLERROR";                     break; // ERR_NO_MQLERROR
                    case 4001 : Result += "ERR_WRONG_FUNCTION_POINTER";          break; // ERR_WRONG_FUNCTION_POINTER
                    case 4002 : Result += "ERR_ARRAY_INDEX_OUT_OF_RANGE";        break; // ERR_ARRAY_INDEX_OUT_OF_RANGE
                    case 4003 : Result += "ERR_NO_MEMORY_FOR_CALL_STACK";        break; // ERR_NO_MEMORY_FOR_CALL_STACK
                    case 4004 : Result += "ERR_RECURSIVE_STACK_OVERFLOW";        break; // ERR_RECURSIVE_STACK_OVERFLOW
                    case 4005 : Result += "ERR_NOT_ENOUGH_STACK_FOR_PARAM";      break; // ERR_NOT_ENOUGH_STACK_FOR_PARAM
                    case 4006 : Result += "ERR_NO_MEMORY_FOR_PARAM_STRING";      break; // ERR_NO_MEMORY_FOR_PARAM_STRING
                    case 4007 : Result += "ERR_NO_MEMORY_FOR_TEMP_STRING";       break; // ERR_NO_MEMORY_FOR_TEMP_STRING
                    case 4008 : Result += "ERR_NOT_INITIALIZED_STRING";          break; // ERR_NOT_INITIALIZED_STRING
                    case 4009 : Result += "ERR_NOT_INITIALIZED_ARRAYSTRING";     break; // ERR_NOT_INITIALIZED_ARRAYSTRING
                    case 4010 : Result += "ERR_NO_MEMORY_FOR_ARRAYSTRING";       break; // ERR_NO_MEMORY_FOR_ARRAYSTRING
                    case 4011 : Result += "ERR_TOO_LONG_STRING";                 break; // ERR_TOO_LONG_STRING
                    case 4012 : Result += "ERR_REMAINDER_FROM_ZERO_DIVIDE";      break; // ERR_REMAINDER_FROM_ZERO_DIVIDE
                    case 4013 : Result += "ERR_ZERO_DIVIDE";                     break; // ERR_ZERO_DIVIDE
                    case 4014 : Result += "ERR_UNKNOWN_COMMAND";                 break; // ERR_UNKNOWN_COMMAND
                    case 4015 : Result += "ERR_WRONG_JUMP";                      break; // ERR_WRONG_JUMP
                    case 4016 : Result += "ERR_NOT_INITIALIZED_ARRAY";           break; // ERR_NOT_INITIALIZED_ARRAY
                    case 4017 : Result += "ERR_DLL_CALLS_NOT_ALLOWED";           break; // ERR_DLL_CALLS_NOT_ALLOWED
                    case 4018 : Result += "ERR_CANNOT_LOAD_LIBRARY";             break; // ERR_CANNOT_LOAD_LIBRARY
                    case 4019 : Result += "ERR_CANNOT_CALL_FUNCTION";            break; // ERR_CANNOT_CALL_FUNCTION
                    case 4020 : Result += "ERR_EXTERNAL_CALLS_NOT_ALLOWED";      break; // ERR_EXTERNAL_CALLS_NOT_ALLOWED
                    case 4021 : Result += "ERR_NO_MEMORY_FOR_RETURNED_STR";      break; // ERR_NO_MEMORY_FOR_RETURNED_STR
                    case 4022 : Result += "ERR_SYSTEM_BUSY";                     break; // ERR_SYSTEM_BUSY
                    case 4023 : Result += "ERR_DLLFUNC_CRITICALERROR";           break; // ERR_DLLFUNC_CRITICALERROR
                    case 4024 : Result += "ERR_INTERNAL_ERROR";                  break; // ERR_INTERNAL_ERROR
                    case 4025 : Result += "ERR_OUT_OF_MEMORY";                   break; // ERR_OUT_OF_MEMORY
                    case 4026 : Result += "ERR_INVALID_POINTER";                 break; // ERR_INVALID_POINTER
                    case 4027 : Result += "ERR_FORMAT_TOO_MANY_FORMATTERS";      break; // ERR_FORMAT_TOO_MANY_FORMATTERS
                    case 4028 : Result += "ERR_FORMAT_TOO_MANY_PARAMETERS";      break; // ERR_FORMAT_TOO_MANY_PARAMETERS
                    case 4029 : Result += "ERR_ARRAY_INVALID";                   break; // ERR_ARRAY_INVALID
                    case 4030 : Result += "ERR_CHART_NOREPLY";                   break; // ERR_CHART_NOREPLY
                    case 4050 : Result += "ERR_INVALID_FUNCTION_PARAMSCNT";      break; // ERR_INVALID_FUNCTION_PARAMSCNT
                    case 4051 : Result += "ERR_INVALID_FUNCTION_PARAMVALUE";     break; // ERR_INVALID_FUNCTION_PARAMVALUE
                    case 4052 : Result += "ERR_STRING_FUNCTION_INTERNAL";        break; // ERR_STRING_FUNCTION_INTERNAL
                    case 4053 : Result += "ERR_SOME_ARRAY_ERROR";                break; // ERR_SOME_ARRAY_ERROR
                    case 4054 : Result += "ERR_INCORRECT_SERIESARRAY_USING";     break; // ERR_INCORRECT_SERIESARRAY_USING
                    case 4055 : Result += "ERR_CUSTOM_INDICATOR_ERROR";          break; // ERR_CUSTOM_INDICATOR_ERROR
                    case 4056 : Result += "ERR_INCOMPATIBLE_ARRAYS";             break; // ERR_INCOMPATIBLE_ARRAYS
                    case 4057 : Result += "ERR_GLOBAL_VARIABLES_PROCESSING";     break; // ERR_GLOBAL_VARIABLES_PROCESSING
                    case 4058 : Result += "ERR_GLOBAL_VARIABLE_NOT_FOUND";       break; // ERR_GLOBAL_VARIABLE_NOT_FOUND
                    case 4059 : Result += "ERR_FUNC_NOT_ALLOWED_IN_TESTING";     break; // ERR_FUNC_NOT_ALLOWED_IN_TESTING
                    case 4060 : Result += "ERR_FUNCTION_NOT_CONFIRMED";          break; // ERR_FUNCTION_NOT_CONFIRMED
                    case 4061 : Result += "ERR_SEND_MAIL_ERROR";                 break; // ERR_SEND_MAIL_ERROR
                    case 4062 : Result += "ERR_STRING_PARAMETER_EXPECTED";       break; // ERR_STRING_PARAMETER_EXPECTED
                    case 4063 : Result += "ERR_INTEGER_PARAMETER_EXPECTED";      break; // ERR_INTEGER_PARAMETER_EXPECTED
                    case 4064 : Result += "ERR_DOUBLE_PARAMETER_EXPECTED";       break; // ERR_DOUBLE_PARAMETER_EXPECTED
                    case 4065 : Result += "ERR_ARRAY_AS_PARAMETER_EXPECTED";     break; // ERR_ARRAY_AS_PARAMETER_EXPECTED
                    case 4066 : Result += "ERR_HISTORY_WILL_UPDATED";            break; // ERR_HISTORY_WILL_UPDATED
                    case 4067 : Result += "ERR_TRADE_ERROR";                     break; // ERR_TRADE_ERROR
                    case 4068 : Result += "ERR_RESOURCE_NOT_FOUND";              break; // ERR_RESOURCE_NOT_FOUND
                    case 4069 : Result += "ERR_RESOURCE_NOT_SUPPORTED";          break; // ERR_RESOURCE_NOT_SUPPORTED
                    case 4070 : Result += "ERR_RESOURCE_DUPLICATED";             break; // ERR_RESOURCE_DUPLICATED
                    case 4071 : Result += "ERR_INDICATOR_CANNOT_INIT";           break; // ERR_INDICATOR_CANNOT_INIT
                    case 4072 : Result += "ERR_INDICATOR_CANNOT_LOAD";           break; // ERR_INDICATOR_CANNOT_LOAD
                    case 4073 : Result += "ERR_NO_HISTORY_DATA";                 break; // ERR_NO_HISTORY_DATA
                    case 4074 : Result += "ERR_NO_MEMORY_FOR_HISTORY";           break; // ERR_NO_MEMORY_FOR_HISTORY
                    case 4075 : Result += "ERR_NO_MEMORY_FOR_INDICATOR";         break; // ERR_NO_MEMORY_FOR_INDICATOR
                    case 4099 : Result += "ERR_END_OF_FILE";                     break; // ERR_END_OF_FILE
                    case 4100 : Result += "ERR_SOME_FILE_ERROR";                 break; // ERR_SOME_FILE_ERROR
                    case 4101 : Result += "ERR_WRONG_FILE_NAME";                 break; // ERR_WRONG_FILE_NAME
                    case 4102 : Result += "ERR_TOO_MANY_OPENED_FILES";           break; // ERR_TOO_MANY_OPENED_FILES
                    case 4103 : Result += "ERR_CANNOT_OPEN_FILE";                break; // ERR_CANNOT_OPEN_FILE
                    case 4104 : Result += "ERR_INCOMPATIBLE_FILEACCESS";         break; // ERR_INCOMPATIBLE_FILEACCESS
                    case 4105 : Result += "ERR_NO_ORDER_SELECTED";               break; // ERR_NO_ORDER_SELECTED
                    case 4106 : Result += "ERR_UNKNOWN_SYMBOL";                  break; // ERR_UNKNOWN_SYMBOL
                    case 4107 : Result += "ERR_INVALID_PRICE_PARAM";             break; // ERR_INVALID_PRICE_PARAM
                    case 4108 : Result += "ERR_INVALID_TICKET";                  break; // ERR_INVALID_TICKET
                    case 4109 : Result += "ERR_TRADE_NOT_ALLOWED";               break; // ERR_TRADE_NOT_ALLOWED
                    case 4110 : Result += "ERR_LONGS_NOT_ALLOWED";               break; // ERR_LONGS_NOT_ALLOWED
                    case 4111 : Result += "ERR_SHORTS_NOT_ALLOWED";              break; // ERR_SHORTS_NOT_ALLOWED
                    case 4112 : Result += "ERR_TRADE_EXPERT_DISABLED_BY_SERVER"; break; // ERR_TRADE_EXPERT_DISABLED_BY_SERVER
                    case 4200 : Result += "ERR_OBJECT_ALREADY_EXISTS";           break; // ERR_OBJECT_ALREADY_EXISTS
                    case 4201 : Result += "ERR_UNKNOWN_OBJECT_PROPERTY";         break; // ERR_UNKNOWN_OBJECT_PROPERTY
                    case 4202 : Result += "ERR_OBJECT_DOES_NOT_EXIST";           break; // ERR_OBJECT_DOES_NOT_EXIST
                    case 4203 : Result += "ERR_UNKNOWN_OBJECT_TYPE";             break; // ERR_UNKNOWN_OBJECT_TYPE
                    case 4204 : Result += "ERR_NO_OBJECT_NAME";                  break; // ERR_NO_OBJECT_NAME
                    case 4205 : Result += "ERR_OBJECT_COORDINATES_ERROR";        break; // ERR_OBJECT_COORDINATES_ERROR
                    case 4206 : Result += "ERR_NO_SPECIFIED_SUBWINDOW";          break; // ERR_NO_SPECIFIED_SUBWINDOW
                    case 4207 : Result += "ERR_SOME_OBJECT_ERROR";               break; // ERR_SOME_OBJECT_ERROR
                    case 4210 : Result += "ERR_CHART_PROP_INVALID";              break; // ERR_CHART_PROP_INVALID
                    case 4211 : Result += "ERR_CHART_NOT_FOUND";                 break; // ERR_CHART_NOT_FOUND
                    case 4212 : Result += "ERR_CHARTWINDOW_NOT_FOUND";           break; // ERR_CHARTWINDOW_NOT_FOUND
                    case 4213 : Result += "ERR_CHARTINDICATOR_NOT_FOUND";        break; // ERR_CHARTINDICATOR_NOT_FOUND
                    case 4220 : Result += "ERR_SYMBOL_SELECT";                   break; // ERR_SYMBOL_SELECT
                    case 4250 : Result += "ERR_NOTIFICATION_ERROR";              break; // ERR_NOTIFICATION_ERROR
                    case 4251 : Result += "ERR_NOTIFICATION_PARAMETER";          break; // ERR_NOTIFICATION_PARAMETER
                    case 4252 : Result += "ERR_NOTIFICATION_SETTINGS";           break; // ERR_NOTIFICATION_SETTINGS
                    case 4253 : Result += "ERR_NOTIFICATION_TOO_FREQUENT";       break; // ERR_NOTIFICATION_TOO_FREQUENT
                    case 4260 : Result += "ERR_FTP_NOSERVER";                    break; // ERR_FTP_NOSERVER
                    case 4261 : Result += "ERR_FTP_NOLOGIN";                     break; // ERR_FTP_NOLOGIN
                    case 4262 : Result += "ERR_FTP_CONNECT_FAILED";              break; // ERR_FTP_CONNECT_FAILED
                    case 4263 : Result += "ERR_FTP_CLOSED";                      break; // ERR_FTP_CLOSED
                    case 4264 : Result += "ERR_FTP_CHANGEDIR";                   break; // ERR_FTP_CHANGEDIR
                    case 4265 : Result += "ERR_FTP_FILE_ERROR";                  break; // ERR_FTP_FILE_ERROR
                    case 4266 : Result += "ERR_FTP_ERROR";                       break; // ERR_FTP_ERROR
                    case 5001 : Result += "ERR_FILE_TOO_MANY_OPENED";            break; // ERR_FILE_TOO_MANY_OPENED
                    case 5002 : Result += "ERR_FILE_WRONG_FILENAME";             break; // ERR_FILE_WRONG_FILENAME
                    case 5003 : Result += "ERR_FILE_TOO_LONG_FILENAME";          break; // ERR_FILE_TOO_LONG_FILENAME
                    case 5004 : Result += "ERR_FILE_CANNOT_OPEN";                break; // ERR_FILE_CANNOT_OPEN
                    case 5005 : Result += "ERR_FILE_BUFFER_ALLOCATION_ERROR";    break; // ERR_FILE_BUFFER_ALLOCATION_ERROR
                    case 5006 : Result += "ERR_FILE_CANNOT_DELETE";              break; // ERR_FILE_CANNOT_DELETE
                    case 5007 : Result += "ERR_FILE_INVALID_HANDLE";             break; // ERR_FILE_INVALID_HANDLE
                    case 5008 : Result += "ERR_FILE_WRONG_HANDLE";               break; // ERR_FILE_WRONG_HANDLE
                    case 5009 : Result += "ERR_FILE_NOT_TOWRITE";                break; // ERR_FILE_NOT_TOWRITE
                    case 5010 : Result += "ERR_FILE_NOT_TOREAD";                 break; // ERR_FILE_NOT_TOREAD
                    case 5011 : Result += "ERR_FILE_NOT_BIN";                    break; // ERR_FILE_NOT_BIN
                    case 5012 : Result += "ERR_FILE_NOT_TXT";                    break; // ERR_FILE_NOT_TXT
                    case 5013 : Result += "ERR_FILE_NOT_TXTORCSV";               break; // ERR_FILE_NOT_TXTORCSV
                    case 5014 : Result += "ERR_FILE_NOT_CSV";                    break; // ERR_FILE_NOT_CSV
                    case 5015 : Result += "ERR_FILE_READ_ERROR";                 break; // ERR_FILE_READ_ERROR
                    case 5016 : Result += "ERR_FILE_WRITE_ERROR";                break; // ERR_FILE_WRITE_ERROR
                    case 5017 : Result += "ERR_FILE_BIN_STRINGSIZE";             break; // ERR_FILE_BIN_STRINGSIZE
                    case 5018 : Result += "ERR_FILE_INCOMPATIBLE";               break; // ERR_FILE_INCOMPATIBLE
                    case 5019 : Result += "ERR_FILE_IS_DIRECTORY";               break; // ERR_FILE_IS_DIRECTORY
                    case 5020 : Result += "ERR_FILE_NOT_EXIST";                  break; // ERR_FILE_NOT_EXIST
                    case 5021 : Result += "ERR_FILE_CANNOT_REWRITE";             break; // ERR_FILE_CANNOT_REWRITE
                    case 5022 : Result += "ERR_FILE_WRONG_DIRECTORYNAME";        break; // ERR_FILE_WRONG_DIRECTORYNAME
                    case 5023 : Result += "ERR_FILE_DIRECTORY_NOT_EXIST";        break; // ERR_FILE_DIRECTORY_NOT_EXIST
                    case 5024 : Result += "ERR_FILE_NOT_DIRECTORY";              break; // ERR_FILE_NOT_DIRECTORY
                    case 5025 : Result += "ERR_FILE_CANNOT_DELETE_DIRECTORY";    break; // ERR_FILE_CANNOT_DELETE_DIRECTORY
                    case 5026 : Result += "ERR_FILE_CANNOT_CLEAN_DIRECTORY";     break; // ERR_FILE_CANNOT_CLEAN_DIRECTORY
                    case 5027 : Result += "ERR_FILE_ARRAYRESIZE_ERROR";          break; // ERR_FILE_ARRAYRESIZE_ERROR
                    case 5028 : Result += "ERR_FILE_STRINGRESIZE_ERROR";         break; // ERR_FILE_STRINGRESIZE_ERROR
                    case 5029 : Result += "ERR_FILE_STRUCT_WITH_OBJECTS";        break; // ERR_FILE_STRUCT_WITH_OBJECTS
                    case 5200 : Result += "ERR_WEBREQUEST_INVALID_ADDRESS";      break; // ERR_WEBREQUEST_INVALID_ADDRESS
                    case 5201 : Result += "ERR_WEBREQUEST_CONNECT_FAILED";       break; // ERR_WEBREQUEST_CONNECT_FAILED
                    case 5202 : Result += "ERR_WEBREQUEST_TIMEOUT";              break; // ERR_WEBREQUEST_TIMEOUT
                    case 5203 : Result += "ERR_WEBREQUEST_REQUEST_FAILED";       break; // ERR_WEBREQUEST_REQUEST_FAILED
                    default:                                                     break; //
          } //
}
//+------------------------------------------------------------------+
//|             Class inform     BEGIN-END                           |
//+------------------------------------------------------------------+
