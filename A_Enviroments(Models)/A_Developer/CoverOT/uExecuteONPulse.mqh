//+------------------------------------------------------------------+
//|                                             C_ExecuteONPulse.mqh |
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
class C_ExecuteONPulse
{
private:
//====================================================================
public:
          C_ExecuteONPulse();
          ~C_ExecuteONPulse() {};

          int           LineComCounter;
          bool          NewPulse;
          int           PulseShift;

          bool          Key_Execute_on_Pulse;
          bool          CheckOncePerPulse;
          datetime      CurrentTimePulseStamp;
          datetime      CurrentTimePulseStampArray[];
          int           CurrentTimePulseStampIndex;//

          int           LineComSafe;
          int           PulseShiftSecondsSafe;

          int           LineComSafeArray[];
          int           PulseShiftSecondsSafeArray[];


          bool          ExecuteONPulse(bool KeyCreate, int PulseShiftSeconds);
          bool          Is_Pulse;
//
};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_ExecuteONPulse::C_ExecuteONPulse()
{         //================
          CheckOncePerPulse               = true;
          CurrentTimePulseStamp           = TimeGMT() + PulseShift ;
          NewPulse                        = false;
          PulseShift                      = 10; //Secound
          //=================
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_ExecuteONPulse::ExecuteONPulse(bool KeyCreate, int PulseShiftSeconds)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "C_ExecuteONPulse  Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //# 1 (where)  Call Bye __FUNCSIG__ & __Line__
          //# 2 (what)   Come Arguments  (int PulseShiftSeconds = 10)(static int PulseShift)(static datetime CurrentTimePulseStamp)
          //# 3 (how)    Detect By __FUNCSIG__ & __Line__
          //# 4 (how)    Detect By static Value
          //# 5 (choose) By (where)
          //=========================================================|
          //# 1 (bool KeyCreate = false, int PulseShiftSeconds = 10, int LineCom = 0, bool result = false)
          //# 2 (SaveStatic) PulseShift = PulseShiftSeconds;///secound                                     //until cross point
          //# 3 (SaveStatic) (bool)CurrentTimePulseStamp <= TimeGMT()                                     //when cross point
          //# 4 (SaveStatic) CurrentTimePulseStamp = TimeGMT() + PulseShift; //////???[--=--//------=--] //when cross point// Add PulseShift to Stamp again
          //# 5 (SaveStatic) NewPulse = true; result = true;                                              //when cross point
          //# 6 (SaveStatic) #3 else NewPulse = false;                                                    //when notcross point//after relase
          //=========================================================|
          //=========================================================|
          //bool                  Key_Execute_on_Pulse;
          //bool                  CheckOncePerPulse;
          //datetime              CurrentTimePulseStamp;
          //bool                  NewPulse;
          //int                   PulseShift;
          // Execute on bar open
          static int    Counter = 0;
          bool          result  = false;
          //=========================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "C_ExecuteONPulse  Error",  __LINE__, __FUNCTION__); //|
          if(KeyCreate)
          {         //====================  CurrentTimePulseStamp[];ArrayR
                    if(CheckOncePerPulse)
                    {         PulseShift = PulseShiftSeconds;///secound//
                              if(CurrentTimePulseStamp <= TimeGMT())
                              {         //
                                        CurrentTimePulseStamp = TimeGMT() + PulseShift ; //////???[--=--//------=--]
                                        NewPulse = true; result = true; //
                                        //Alert("-----ExecuteONPulse Counter: ", Counter++, "---------------------------------------------------", CurrentTimePulseStamp, "---CurrentTimePulseStamp");//
                              }
                              //
                              else {NewPulse = false;} //
                    }
                    else {NewPulse = true; PulseShift = 0;} //
                    //====================
                    if(NewPulse == true) {result = true;}; //
          }
          //---
          //---
          //---
          if(KeyCreate && false)
          {         int LineCom = 0; 
                    ArrayResize(CurrentTimePulseStampArray, 100);
                    //=========================================================Progress by Come Line...
                    //static int LineComSafe[100];// ArrayResize(LineComSafe, 100);
                    //if(LineComSafe[LineComCounter] != LineCom)LineComSafe[++LineComCounter] = LineCom;
                    if((PulseShiftSecondsSafe != PulseShiftSeconds) && (LineCom != LineComSafe)) {LineComSafe = LineCom; PulseShiftSecondsSafe = PulseShiftSeconds; LineComCounter++;}
                    //else {}
                    Alert("PulseShiftSecondsSafe: ", PulseShiftSecondsSafe, "__LineCom: ", LineCom);
                    //=========================================================FillIndex???
                    for(int i = 0; i < 0; i++)
                    {         if((PulseShiftSecondsSafeArray[i] != PulseShiftSeconds) && (LineCom != LineComSafe ))
                              {         LineComSafeArray[i] = LineCom; PulseShiftSecondsSafeArray[i] = PulseShiftSeconds; LineComCounter++;}
                              CurrentTimePulseStampIndex = 1 ;//
                    }
                    //=========================================================
                    //=========================================================FindIndex???
                    for(int i = 0; i < 0; i++) {         if(LineCom == LineComSafe)CurrentTimePulseStampIndex = 1 ;} //
                    //====================  CurrentTimePulseStamp[];ArrayR
                    if(CheckOncePerPulse == true)
                    {         PulseShift = PulseShiftSeconds;///secound//
                              if(CurrentTimePulseStampArray[CurrentTimePulseStampIndex] <= TimeGMT())
                              {         //
                                        CurrentTimePulseStampArray[CurrentTimePulseStampIndex] = TimeGMT() + PulseShift ; //////???[--=--//------=--]
                                        NewPulse = true; result = true; //
                                        //Alert("-----ExecuteONPulse Counter: ", Counter++, "---------------------------------------------------", CurrentTimePulseStamp, "---CurrentTimePulseStamp");//
                              }
                              //
                              else {NewPulse = false;} //
                    }
                    else {NewPulse = true; PulseShift = 0;} //
                    //====================
                    if(NewPulse == true) {result = true;}; //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "C_ExecuteONPulse  Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          // if(LineCom == LineComSafe[LineComCounter])result = true;
          //=========================================================
          return result;//
}

//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|             Class C_BANK::     BEGIN                             | ///////Money Manager////////          ///////Money Manager////////
//+------------------------------------------------------------------+
