//+------------------------------------------------------------------+
//|                                                   C_TrendLevel.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|             Class C_EVENT     BEGIN                              |
//+------------------------------------------------------------------+
enum ENUM_TREND_BREAK
{ TREND_BREAK_NONE, TREND_BREAK_ABOVE, TREND_BREAK_BELOW };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_TrendLevel
{
private:
          string mLevelName;
public:
          C_TrendLevel(string levelName)            {SetLevelName(levelName);}
          ~C_TrendLevel()                           {  }
//==================================================================
          void    SetLevelName(string levelName)    {mLevelName = levelName; }
          string  GetLevelName()                    {return(mLevelName); }
//==================================================================
          ENUM_TREND_BREAK  GetBreak(int index);
          bool    Run(string levelNameCom);
//==================================================================
          //
};



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
ENUM_TREND_BREAK C_TrendLevel::GetBreak(int index)
{         if(ObjectFind(0, mLevelName) < 0) return(TREND_BREAK_NONE);
          double         prevOpen        = iOpen(Symbol(), Period(), index + 1);
          double         prevClose       = iClose(Symbol(), Period(), index + 1);
          double         currClose       = iClose(Symbol(), Period(), index);
          //--------------------
          datetime       prevTime        = iTime(Symbol(), Period(), index + 1);
          datetime       currTime        = iTime(Symbol(), Period(), index );
          //--------------------
          double         prevValue       = ObjectGetValueByTime(0, mLevelName, prevTime);
          double         currValue       = ObjectGetValueByTime(0, mLevelName, currTime);
          //--------------------
          if(prevValue == 0 || currValue == 0)return(TREND_BREAK_NONE);
          //--------------------
          if((prevOpen < prevValue && prevClose < prevValue) && currClose > currValue)
          {         return(TREND_BREAK_ABOVE);}
          if((prevOpen > prevValue && prevClose > prevValue) && currClose < currValue)
          {         return(TREND_BREAK_BELOW);}
          //
          return(TREND_BREAK_NONE);//
}
//+------------------------------------------------------------------+
bool C_TrendLevel::Run(string levelNameCom)
{         int StartBar = 99;  int EndBar = 0; //
          C_TrendLevel *trendlevel = new C_TrendLevel(levelNameCom);
          ENUM_TREND_BREAK brk;
//=============================================
          for(int i = StartBar; i >= EndBar; i--)
          {         brk = trendlevel.GetBreak(i); //
                    switch(brk)
                    {         case TREND_BREAK_NONE: break;
                              case TREND_BREAK_ABOVE: Alert("the TREND_BREAK_ABOVE at Candel: ", i); break;
                              case TREND_BREAK_BELOW: Alert("the TREND_BREAK_BELOW at Candel: ", i); break; //
                    } //
          }//
          delete trendlevel;//
//
//=============================================
          return true;///
}//
//+------------------------------------------------------------------+
//|             Class C_EVENT     BEGIN                              |
//+------------------------------------------------------------------+
