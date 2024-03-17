
ENUM_TIMEFRAMES GetFrame(ENUM_TIMEFRAMES f, bool IsNext)
{         if(IsNext)
          {         if(f == PERIOD_M1)   { return  PERIOD_M5; }
                    if(f == PERIOD_M5)   { return  PERIOD_M15; }
                    if(f == PERIOD_M15)   { return  PERIOD_M30; }
                    if(f == PERIOD_M30)   { return  PERIOD_H1; }
                    if(f == PERIOD_H1)   { return  PERIOD_H4; }
                    if(f == PERIOD_H4)   { return  PERIOD_D1; }
                    if(f == PERIOD_D1)   { return  PERIOD_W1; }
                    if(f == PERIOD_W1)   { return  PERIOD_MN1; }
                    if(f == PERIOD_MN1)   { return  PERIOD_MN1; }//
          }
          else
          {         if(f == PERIOD_M1)   { return  PERIOD_M1; }
                    if(f == PERIOD_M5)   { return  PERIOD_M1; }
                    if(f == PERIOD_M15)   { return  PERIOD_M5; }
                    if(f == PERIOD_M30)   { return  PERIOD_M15; }
                    if(f == PERIOD_H1)   { return  PERIOD_M30; }
                    if(f == PERIOD_H4)   { return  PERIOD_H1; }
                    if(f == PERIOD_D1)   { return  PERIOD_H4; }
                    if(f == PERIOD_W1)   { return  PERIOD_D1; }
                    if(f == PERIOD_MN1)   { return  PERIOD_W1; }//
          }//
          return 0;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int GetFrameNum(ENUM_TIMEFRAMES tf)
{
          {         if(tf == PERIOD_M1)   { return  1; }
                    if(tf == PERIOD_M5)   { return  5; }
                    if(tf == PERIOD_M15)   { return  15; }
                    if(tf == PERIOD_M30)   { return  30; }
                    if(tf == PERIOD_H1)   { return  60; }
                    if(tf == PERIOD_H4)   { return  240; }
                    if(tf == PERIOD_D1)   { return  1440; }
                    if(tf == PERIOD_W1)   { return  10080; }
                    if(tf == PERIOD_MN1)   { return  43200; }//
          }
          return 0;//
}
//====================================================================================================================================
bool IsFractalHigh(int index)
{         return (High[index] > High[index - 1] && High[index] > High[index + 1]) ? true : false;
//
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool IsFractalLow(int index)
{         return (Low[index] < Low[index - 1] && Low[index] < Low[index + 1]) ? true : false;
//
}