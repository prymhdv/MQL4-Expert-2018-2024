//+------------------------------------------------------------------+
//|                                                 C_UTILITIES .mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|     Module ~~ GUI ~~ Panels Complete                             |
//+------------------------------------------------------------------+
class C_GraphicalUTILITIES
{
public:   //---constructor is privet not to get varible of class
          void        C_GraphicalUTILITIES() {   };
          void       ~C_GraphicalUTILITIES() {   };
          //------------------------------------------------------------
          bool        Update();
          bool        UPDATED;
          //------------------------------------------------------------
          void        texter(int WhichMode, bool IsKey, string X = "LabelPeriodSeptorX#"); //For show the charakters o fonts

          //------------------------------------------------------------
          int   FindPeak(int WhichMode, int count, int startBar);
          int   FindNextPeak(int WhichMode, int count, int startBar);
          bool  FindPeakRun(int shoulder = 5);
          //------------------------------------------------------------


};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_GraphicalUTILITIES::Update()
{         UPDATED = false;
          if(0)texter(true, false) ; //
//==========================================================
// SYS Timer Cheackup Start C_WINUSER32 App Enviroments<<<<|
//==========================================================
//
          UPDATED = true;
//
//==========================================================
// SYS Timer Cheackup End C_WINUSER32 App Enviroments<<<<<<|
//==========================================================
          if(!this.UPDATED)       {Alert("GraphicalUtilities.UPDATED: ", this.UPDATED);}
          return UPDATED;//
}
//+------------------------------------------------------------------+
//|                                                                  | Is_Create,Is_Move,
//+------------------------------------------------------------------+
void C_GraphicalUTILITIES::texter(int WhichMode, bool IsKey, string X = "LabelPeriodSeptorX#") //For show the charakters o fonts
{         //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-TechnicalController Error",  __LINE__, __FUNCTION__); //
//============================//============================
          for (int o = 0; o < 4; o++)
                    if(ObjectFind(0, "LabelPeriodSeptorX#" + IntegerToString(o)) < 0)
                    {         string Gu = "\xE0";   ///
//                              string Vu = IntegerToString(o);
//                              // string H = StringAdd(Gu, Vu);
                              string GuXc = StringFormat("/x%x", o);
//                                GuX = StringConcatenate("\xE", GuXc);
                              string GuX = IntegerToHexString(o);
                              //================================================================================================================================================
                              Dev_Object_Pack.Texts.Label.GDS.Set_Action_2(WhichMode, IsKey);
                              Dev_Object_Pack.Texts.Label.GDS.Set_Desc_4("LabelPeriodSeptorX#" + IntegerToString(o), "\x59160", "Segoe MDL2 Assets", 40);
                              Dev_Object_Pack.Texts.Label.GDS.Set_Location_5((int)(574.6), (int) (201.6), 0, CORNER_RIGHT_LOWER, ANCHOR_CENTER);
                              Dev_Object_Pack.Texts.Label.GDS.Set_Color_1(clrWhite);
                              Dev_Object_Pack.Texts.Label.GDS.Set_Common_6(true, 10, false, false, false, "BTN_PanelV");
                              Dev_Object_Pack.Texts.Label.GDS.Set_Chart_6();
                              Dev_Object_Pack.Texts.Label.Action(Dev_Object_Pack.Texts.Label);
                              //----LabelX.Action(LabelX);
                              //================================================================================================================================================
                              //================================================================================================================================================
                              //Dev_Object_Pack.Texts.Label.Create(Is_Create, Is_Move, "LabelPeriodSeptorX#" + IntegerToString(o), "\x59160",   (int)(574.6), (int) (201.6),     CORNER_RIGHT_LOWER, ANCHOR_CENTER, true, clrWhite, 0, 40, "Segoe MDL2 Assets"); //
                              //
                    }//
//============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-TechnicalController Error",  __LINE__, __FUNCTION__); //
//============================//============================
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_GraphicalUTILITIES::FindPeakRun(int shoulder = 5)
{         //int shoulder = 5;
          int bar1;
          int bar2;//
          datetime bar2Time1;
          double   bar2High1;
          datetime bar1Time2;
          double   bar1High2;
          double bar2Low1;
          double bar1Low2;
//----
          {         bar1                  = FindPeak(MODE_HIGH, shoulder, 0); //
                    bar2                  = FindPeak(MODE_HIGH, shoulder, bar1 + 1); //
                    bar2Time1     =  iTime(Symbol(), Period(), bar2);
                    bar2High1      = iHigh(Symbol(), Period(), bar2);
                    bar1Time2     =  iTime(Symbol(), Period(), bar1);
                    bar1High2      = iHigh(Symbol(), Period(), bar1);
                    //-------
                    ObjectDelete(0, "upper");
                    ObjectCreate(0, "upper", OBJ_TREND, 0, bar2Time1, bar2High1, bar1Time2, bar1High2);
                    ObjectSetInteger(0, "upper", OBJPROP_COLOR, clrBlue); //
                    ObjectSetInteger(0, "upper", OBJPROP_WIDTH, 3); //
                    ObjectSetInteger(0, "upper", OBJPROP_RAY, true); //
          }//
          {         bar1                  = FindPeak(MODE_LOW, shoulder, 0); //
                    bar2                  = FindPeak(MODE_LOW, shoulder, bar1 + 1); //
                    bar2Time1     =  iTime(Symbol(), Period(), bar2);
                    bar2Low1      = iLow(Symbol(), Period(), bar2);
                    bar1Time2     =  iTime(Symbol(), Period(), bar1);
                    bar1Low2      = iLow(Symbol(), Period(), bar1);
                    //-------
                    ObjectDelete(0, "lower");
                    ObjectCreate(0, "lower", OBJ_TREND, 0, bar2Time1, bar2Low1, bar1Time2, bar1Low2);
                    ObjectSetInteger(0, "lower", OBJPROP_COLOR, clrBlue); //
                    ObjectSetInteger(0, "lower", OBJPROP_WIDTH, 3); //
                    ObjectSetInteger(0, "lower", OBJPROP_RAY, true); //
          }//
//
          return true;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int C_GraphicalUTILITIES::FindNextPeak(int WhichMode, int count, int startBar)
{         if(startBar < 0)
          {         count           += startBar;
                    startBar        = 0; //
          } ///
//
          int Result = 0;
          int iHighestPeack = iHighest(Symbol(), Period(), (ENUM_SERIESMODE)WhichMode, count, startBar);
          int iLowestPeack  = iLowest(Symbol(), Period(), (ENUM_SERIESMODE)WhichMode, count, startBar);
          (WhichMode == MODE_HIGH) ? Result = iHighestPeack : Result = iLowestPeack;
//-------------------------
          return(Result);//
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int C_GraphicalUTILITIES::FindPeak(int WhichMode, int count, int startBar)
{         if( (WhichMode != MODE_HIGH) &&  (WhichMode != MODE_LOW))return(-1);//
//
//
          int Result            = 0;
          int currentBar        = startBar;//
          int newCount          = count * 2 + 1; //
          int newStartBar       = currentBar - count; //
          int foundBar          = FindNextPeak(WhichMode, newCount, newStartBar); //
          while(foundBar != currentBar)
          {         int nextcurentBar   = currentBar + 1;
                    currentBar           = FindNextPeak(WhichMode, count, nextcurentBar); //
                    newStartBar         = currentBar - count; //
                    foundBar            = FindNextPeak(WhichMode, newCount, newStartBar); //
          }
          return(currentBar); //
}
//+------------------------------------------------------------------+
//|     Module ~~ GUI ~~ Panels Complete                             |
//+------------------------------------------------------------------+
