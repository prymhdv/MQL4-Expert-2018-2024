//+------------------------------------------------------------------+
//|                                                      C_ERROR.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\stdlib.mqh>   
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
class FunctionCall
{

          void FunctionCall::TriesCount(bool KeyPlay = false, string ComFunc = "__FUNCTION__", int ComLine = 0); //   static
          //         C_STATICSUN::TriesCount(Capitan_KeyPlaytries, SozFunc, Sozline);



};
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
void FunctionCall::TriesCount(bool KeyPlay = false, string ComFunc = "__FUNCTION__", int ComLine = 0) //   static
{
//+------------------------------------------------------------------+
//|                  Stckoverflow  FuntionCall manage                |
//|                                                                  |
//|                                                                  |
//+------------------------------------------------------------------+
          //Stack overflow in 'C:\Users\mito\AppData\Roaming\MetaQuotes\Terminal\63603D13555081059CD774AC70BBC63B\MQL4\Experts\00Pourya 2021 Experts\Worlds Watcher V06-build FC-2021-04-10.ex4'
          //=========================================================|
///ArrayInitialize(array,EMPTY_VALUE);
          int                   ReseveSize = 10;
          static int            triesTotalSafe = 0;
          static int            triesTotal = 1;
          static int            tries = 0;
          static string         ComFuncSafe = "";
          string SozFunc; int SozLine;
          //===============================================================================
          string                ComFuncSafeKeeper[] ;////>>>STATIC ARRAY NOT RESIZSED///
          int                   ComLineSafeKeeper[] ;////>>>STATIC ARRAY NOT RESIZSED///
          static string         ComFuncSafeKeeperSTATIC[] ;////>>>STATIC ARRAY NOT RESIZSED///
          static int            ComLineSafeKeeperSTATIC[] ;
          //ArrayStringXComLineSafeKeeper.AssignArray(ComFuncSafeKeeper);//no need
          if(ComFuncSafe != ComFunc)tries = 1;
          if(0)
          {         //===============================================================================
                    if(0)
                    {         if(-1 == ArrayResize(ComFuncSafeKeeper, 10, 10)) Alert("frist-Kee--1");
                              if(-1 == ArrayResize(ComLineSafeKeeper, 10, 10)) Alert("frist-Kee--1"); //
                    }
                    if(-1 == ArrayResize(ComFuncSafeKeeper, ReseveSize, 0)) Alert("frist-Kee--1");
                    if(-1 == ArrayResize(ComLineSafeKeeper, ReseveSize, 0)) Alert("frist-Kee--1");
                    //ArrayIsDynamic()
                    if(_LastError != 0 && _LastError != 4000 && true)
                    {         Alert(ErrorDescription(_LastError) + "-", _LastError, "-", "-Line:", __LINE__, "-", __FUNCTION__, ">>SozlineCOM: ", ComLine, ">>SozFuncCOM: ", ComFunc); } //
                    //===============================================================================
                    {         //ArrayStringXComFuncSafeKeeper.Add(ComFunc);///here is static scoope///
                              // ArrayIntigerXComLineSafeKeeper.Add(ComLine);///here is static scoope///
                    }
                    //===============================================================================
                    for(int i = 0; ArraySize(ComFuncSafeKeeper) > i; i++) {         ComFuncSafeKeeper[i] = "NONE"; ComFuncSafeKeeperSTATIC[i] = ComFunc;}
                    for(int i = 0; ArraySize(ComLineSafeKeeper) > i; i++) {         ComLineSafeKeeper[i] = 0;      ComLineSafeKeeperSTATIC[i] = ComLine;}
                    //===============================================================================
                    //________________________________________________________Xerorr.SuperviserX(_LastError, "-C_STATICSUN- Error",  __LINE__, __FUNCTION__); //|
                    //=========================================================|
                    static int KeeperSizseComFunc = ArrayResize(ComFuncSafeKeeper, triesTotal, ReseveSize);
                    static int KeeperSizseComLine = ArrayResize(ComLineSafeKeeper, triesTotal, ReseveSize);
                    static int steps = 0;
                    if(0)
                    {         if(KeeperSizseComFunc != ArraySize(ComFuncSafeKeeper) || KeeperSizseComLine != ArraySize(ComLineSafeKeeper))
                              {         //
                                        //KeeperSizseComFunc = 1;
                                        // ArrayFill(ComFuncSafeKeeper, steps++, 0, ComFunc);///'string' type cannot be used in ArrayFill function
                                        ArrayFill(ComLineSafeKeeper, steps++, 0, ComLine);
                                        //ArrayInitialize(ComLineSafeKeeper, steps++ );
                                        //ArrayInitialize(ComFuncSafeKeeper, steps++);//>>>not use string
                                        //
                              }//
                    }
                    int KeeperSizseComFuncSafeKeeper = ArraySize(ComFuncSafeKeeper);// - 1;
                    int KeeperSizseComLineSafeKeeper = ArraySize(ComLineSafeKeeper);
                    if(0)
                    {         if(-1 == ArrayResize(ComFuncSafeKeeper, 10, 10)) Alert("Kee--1");
                              if(-1 == ArrayResize(ComLineSafeKeeper, 10, 10)) Alert("Kee--1"); //
                    }
                    if(0)
                    {         Alert("KeeperSizseComFuncSafeKeeper: ", ArraySize(ComFuncSafeKeeper)); ///KeeperSizseComFuncSafeKeeper);
                              Alert("KeeperSizseComLineSafeKeeper: ", ArraySize(ComLineSafeKeeper)); // KeeperSizseComLineSafeKeeper);
                    }
                    if(_LastError != 0 && _LastError != 4000 && true)
                    {         Alert(ErrorDescription(_LastError) + "-", _LastError, "-", "-Line:", __LINE__, "-", __FUNCTION__, ">>SozlineCOM: ", ComLine, ">>SozFuncCOM: ", ComFunc); } //
                    int IndexOfDimension = 0;
                    int Numberofelements = ArrayRange(ComFuncSafeKeeper, IndexOfDimension); //Number of elements in a selected array dimension.
                    if(Numberofelements > 0)
                    {         Alert("Numberofelements: ", Numberofelements);
                              SozFunc = ComFuncSafeKeeper[Numberofelements - 1]; //[KeeperSizseComFuncSafeKeeper]; ///>>start from zero
                              SozLine = ComLineSafeKeeper[Numberofelements - 1]; //[KeeperSizseComLineSafeKeeper]; ///>>start from zero
                    }
                    if(_LastError != 0 && _LastError != 4000 && true)
                    {         Alert(ErrorDescription(_LastError) + "-", _LastError, "-", "-Line:", __LINE__, "-", __FUNCTION__, ">>SozlineCOM: ", ComLine, ">>SozFuncCOM: ", ComFunc); } //
                    if(KeyPlay)
                    {         Alert("tries:", tries++, "   __FUNCTION__:", ComFuncSafe = ComFunc, "----triesTotal:-", triesTotalSafe = triesTotal++, "===ComFuncSafeKeeper: ", SozFunc, "===ComLineSafeKeeper: ", SozLine); } //
          }
/////
          if(KeyPlay)
          {         Alert("tries:", tries++, "   __FUNCTION__:", ComFuncSafe = ComFunc, "----triesTotal:-", triesTotalSafe = triesTotal++  ); } //
          //________________________________________________________Xerorr.SuperviserX(_LastError, "-C_STATICSUN- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
