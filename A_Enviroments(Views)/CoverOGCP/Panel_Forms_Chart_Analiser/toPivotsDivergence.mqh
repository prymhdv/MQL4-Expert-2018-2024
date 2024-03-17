//+------------------------------------------------------------------+
//|                                                      C_CHART.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Data_Model.mqh>
//+------------------------------------------------------------------+
//|             Class C_TradeInfoOut                 BEGIN-END       |
//+------------------------------------------------------------------+
class C_PivotsDivergence
{

public :

          bool   PivotsDivergence(int WhichMode, bool IsKey, int indexCom = 0, string NameCom = "");

          bool          Direction_DownWard[];           //ArrayResize(Direction_DownWard,         Bars);
          datetime      Direction_DownWardTime[];       //ArrayResize(Direction_DownWardTime,     Bars);
          double        Direction_DownWardLow[];        //ArrayResize(Direction_DownWardLow,      Bars);
          //---
          bool          Direction_UpWard[];             //ArrayResize(Direction_UpWard,           Bars);
          datetime      Direction_UpWardTime[];         //ArrayResize(Direction_UpWardTime,       Bars);
          double        Direction_UpWardHigh[];         //ArrayResize(Direction_UpWardHigh,       Bars);

          //---

          int           Highest_Bar_InRange_A[];                     //ArrayResize(Highest_Bar_InRange_A, Bars);//>>>  = iHighest(NULL, 0, MODE_HIGH, index, indexFrist);
          int           Highest_Bar_InRange_B[];                     //ArrayResize(Highest_Bar_InRange_B, Bars);//>>>  = iHighest(NULL, 0, MODE_HIGH, index / 2, indexFrist);
          int           Lowest_Bar_InRange_A[];                      //ArrayResize(Lowest_Bar_InRange_A, Bars);//>>>  = iLowest(NULL, 0, MODE_LOW, index, indexFrist);
          int           Lowest_BarIn_Range_B[];                      //ArrayResize(Lowest_BarIn_Range_B, Bars);//>>>>  = iLowest(NULL, 0, MODE_LOW, index / 2, indexFrist);

          //
          int           StepValue;              // = 5;
          int           Next_Bars_Remaining;    // = 0; /// Bars - i;//remaining/remain/stay/live/.
          int           Steps_Bars_Remaining;   // = 0;//
          int           MoveIndex;              // = 0;
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_PivotsDivergence::PivotsDivergence(int WhichMode, bool IsKey, int indexCom = 0, string NameCom = "")
{         //---[----Create Resorces---]
          ________________________________________________________Xerorr.SuperviserX(_LastError, "C_CONDUCTOR Error",  __LINE__, __FUNCTION__); //|
          ArrayResize(Direction_DownWard,       Bars);
          ArrayResize(Direction_DownWardTime,   Bars);
          ArrayResize(Direction_DownWardLow,    Bars);
          //---
          ArrayResize(Direction_UpWard,         Bars);
          ArrayResize(Direction_UpWardTime,     Bars);
          ArrayResize(Direction_UpWardHigh,     Bars);
          //---
          ArrayResize(Highest_Bar_InRange_A,    Bars);        //>>>  = iHighest(NULL, 0, MODE_HIGH, index, indexFrist);
          ArrayResize(Highest_Bar_InRange_B,    Bars);        //>>>  = iHighest(NULL, 0, MODE_HIGH, index / 2, indexFrist);
          ArrayResize(Lowest_Bar_InRange_A,     Bars);        //>>>  = iLowest(NULL,  0, MODE_LOW,  index, indexFrist);
          ArrayResize(Lowest_BarIn_Range_B,     Bars);        //>>>  = iLowest(NULL,  0, MODE_LOW,  index / 2, indexFrist);
          //---[----Fill Resorces---]
          //---
          StepValue = 5;
          for(int i = 0; i < Bars; i++)//---wrong relation//never run
          {         if(ArraySize(Low) < i) {if (Low[i] < Low[i - 1])continue;} ///For out off range///
                    Direction_DownWard[i]       = true;
                    Direction_DownWardLow[i]    = Low[i];
                    Direction_DownWardTime[i]   = Time[i];//
          }
          for(int i = 0; i < Bars; i++)//---wrong relation//never run///Ruining over...Not ordering numbers..//index must one of 100-200-300.00
          {         if(ArraySize(High) < i)  {if (High[i] > High[i - 1])continue;}///For out off range/////>>>dont allowe to calculating
                    Direction_UpWard[i]         = true;//
                    Direction_UpWardHigh[i]     = High[i];
                    Direction_UpWardTime[i]     = Time[i];//
          }
          //---
          if(true)
          {         //---[----Set_ting Indexs//ExtemumPlace by indexed---]
                    //---
                    //>>.int index = Bars - 1; ///(Bars - 1) / 2;
                    int index             = indexCom; //100 ; ///(Bars - 1) / 2;
                    int indexFrist;
                    if(Direction_UpWardHigh[0] > Direction_UpWardHigh[10] || Direction_DownWardLow[10] > Direction_DownWardLow[0]) {indexFrist = index - 100;}
                    else                                                                                                           {indexFrist = (index / 100) * 1;}//???regtangel centering point
                    ///
                    MoveIndex = 0;
                    Next_Bars_Remaining = 0; /// Bars - i;//remaining/remain/stay/live/.
                    Steps_Bars_Remaining = 0;
                    //---[---loop for each one---]
                    for(int i = 1; i < Bars; i += StepValue ) //1000
                    {         //---[----Set_ting Indexs//ExtemumPlace by indexed---]Can finde zigzaging porssess...
                              //---[----ReNew Indexs//ExtemumPlace by indexed---]
                              //---
                              Next_Bars_Remaining = Bars - i;
                              int       whitchstep      = i / Bars;///E.Alerter(StepValue);
                              int       TotalStep       = 1;
                              //---
                              if(StepValue != 0) TotalStep            = Next_Bars_Remaining / StepValue;
                              if(TotalStep != 0) Steps_Bars_Remaining = (whitchstep / TotalStep);
                              //---
                              int               HelperindexMoveHead = 100;
                              int               PointToStart = i + 1;
                              static int        indexStatic = index;
                              static int        indexFristStatic = indexFrist;
                              //===========================================================
                              //---off---
                              StepValue += 5;///50;///>>>Gone One patern/// 1;//>>gone long Line for not near
                              if(StepValue > Bars)break;////Range adjusting
                              if(Steps_Bars_Remaining > PointToStart) { MoveIndex = 0;           indexFrist = PointToStart; index =  HelperindexMoveHead;  }
                              else if(index == HelperindexMoveHead)   { indexFristStatic  = indexFrist + HelperindexMoveHead + PointToStart;    indexStatic +=  HelperindexMoveHead;    }
                              else if(0)
                              {         //
                                        MoveIndex = i;
                                        index /= 100; index *= 50;
                                        MoveIndex /= 100; MoveIndex *= 50;
                                        //
                              }
                              int CounterPass = i + 20;
                              //---[----Fill Find//ExtemumPlace by indexed---]
                              Highest_Bar_InRange_A[i]  = iHighest(NULL, 0, MODE_HIGH, index  + CounterPass, indexFrist + CounterPass); //Must deffrence Point of geting place point///end Half
                              Highest_Bar_InRange_B[i]  = iHighest(NULL, 0, MODE_HIGH, index / 2 + CounterPass, indexFrist + CounterPass); //key index/2
                              ///-------------------------------------------------------------------------------------------------------
                              Lowest_Bar_InRange_A[i]  = iLowest(NULL, 0, MODE_LOW, index + CounterPass, indexFrist + CounterPass);
                              Lowest_BarIn_Range_B[i]  = iLowest(NULL, 0, MODE_LOW, index / 2 + CounterPass, indexFrist + CounterPass); //...remember the Pass//
                              //==================================================================================================Direction_UpWardHigh[Highest_Bar_InRange_A[i - 1] ///...remember the Pass
                              //---[----Draw Trend Lines//ExtemumPlace by indexed---]
                              {         Dev_Object_Pack.Lines.Trend.GDS.Set_Action_2(WhichMode, IsKey);
                                        Dev_Object_Pack.Lines.Trend.GDS.Set_Desc_1(  "HighestBarInRange7 " + NameCom + IntegerToString(i) );
                                        Dev_Object_Pack.Lines.Trend.GDS.Set_Location_4(Direction_UpWardTime[Highest_Bar_InRange_B[i]], Direction_UpWardHigh[Highest_Bar_InRange_B[i]], Direction_UpWardTime[Highest_Bar_InRange_A[i]], Direction_UpWardHigh[Highest_Bar_InRange_A[i]]);
                                        Dev_Object_Pack.Lines.Trend.GDS.Set_Color_1(clrRed);
                                        Dev_Object_Pack.Lines.Trend.GDS.Set_Tip_2(STYLE_DOT, 3,false);
                                        Dev_Object_Pack.Lines.Trend.GDS.Set_Common_6(false, 10, false, false, false, "tooltip" + "HighestBarInRange7 " + NameCom + IntegerToString(i));
                                        Dev_Object_Pack.Lines.Trend.GDS.Set_Chart_6();
                                        Dev_Object_Pack.Lines.Trend.Action(Dev_Object_Pack.Lines.Trend);//
                                        //Cat.s(   "time1: " + Direction_UpWardTime[Highest_Bar_InRange_B[i]] + "  price1: " + Direction_UpWardHigh[Highest_Bar_InRange_B[i]] + "  time2: " + Direction_UpWardTime[Highest_Bar_InRange_A[i]] + "   price2: " + Direction_UpWardHigh[Highest_Bar_InRange_A[i]]);
                                        //---  Dev_Object_Pack.Lines.Trend.Create( WhichMode, IsKey, "HighestBarInRange7" + NameCom + IntegerToString(i), "HighestBarInRange7" + NameCom + IntegerToString(i),
                                        //---  Direction_UpWardTime[Highest_Bar_InRange_B[i]], Direction_UpWardHigh[Highest_Bar_InRange_B[i]], Direction_UpWardTime[Highest_Bar_InRange_A[i]], Direction_UpWardHigh[Highest_Bar_InRange_A[i]],
                                        //---  false, 1, clrRed,  false, STYLE_DOT );
                              }
                              //---
                              {         Dev_Object_Pack.Lines.Trend.GDS.Set_Action_2(WhichMode, IsKey);
                                        Dev_Object_Pack.Lines.Trend.GDS.Set_Desc_1( "LowestBarInRange7 "  + NameCom + IntegerToString(i) );
                                        Dev_Object_Pack.Lines.Trend.GDS.Set_Location_4(Direction_DownWardTime[Lowest_BarIn_Range_B[i]], Direction_DownWardLow[Lowest_BarIn_Range_B[i]], Direction_DownWardTime[Lowest_Bar_InRange_A[i]], Direction_DownWardLow[Lowest_Bar_InRange_A[i]]);
                                        Dev_Object_Pack.Lines.Trend.GDS.Set_Color_1(clrBlue);
                                        Dev_Object_Pack.Lines.Trend.GDS.Set_Tip_2(STYLE_DOT, 3,false);
                                        Dev_Object_Pack.Lines.Trend.GDS.Set_Common_6(false, 10, false, false, false, "tooltip" + "LowestBarInRange7 " + NameCom + IntegerToString(i));
                                        Dev_Object_Pack.Lines.Trend.GDS.Set_Chart_6();
                                        Dev_Object_Pack.Lines.Trend.Action(Dev_Object_Pack.Lines.Trend);//
                                        //--- Dev_Object_Pack.Lines.Trend.Create( WhichMode, IsKey, "LowestBarInRange7"  + NameCom + IntegerToString(i), "LowestBarInRange7" + NameCom + IntegerToString(i),
                                        //---  Direction_DownWardTime[Lowest_BarIn_Range_B[i]], Direction_DownWardLow[Lowest_BarIn_Range_B[i]], Direction_DownWardTime[Lowest_Bar_InRange_A[i]], Direction_DownWardLow[Lowest_Bar_InRange_A[i]],
                                        //---  false, 1, clrBlue,  false, STYLE_DOT );
                              }
                              //==================================================================================================
                    } //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "C_STATICSUN Error",  __LINE__, __FUNCTION__); //|
          return true; ///
}
//+------------------------------------------------------------------+
//|             Class C_TradeInfoOut                 BEGIN-END       |
//+------------------------------------------------------------------+
