//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
#property strict
struct STrendPont
{         int           bar;
          double        price;
          datetime      time; };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct STrend
{         double       slope;
          STrendPont   base; };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CTrendHiLo
{

protected:
          string     mSymbol;
          ENUM_TIMEFRAMES mTimeframe;

          int        mStart;
          int        mLength;

          STrend     mUpperTrend;
          STrend     mLowerTrend;

          double     ValueAt(const int index, const STrend &trend) { int offset = (trend.base.bar - index); double value = trend.base.price + (trend.slope * offset); return value;  }
public:
          CTrendHiLo(const int startbar = 1, const int length = 20, ENUM_TIMEFRAMES tf = PERIOD_M1);
          ~CTrendHiLo(void);
          //-----------------
          void       Update();
          void       UpdateLower();
          void       UpdateUpper();
          //-----------------
          double     UpperValueAt(const int index)              {return (ValueAt(index, mUpperTrend));};
          double     UpperValueAt(const datetime time)          { int index = iBarShift(mSymbol, mTimeframe, time, false); return(ValueAt(index, mUpperTrend));};
          double     LowerValueAt(const int index)              {return (ValueAt(index, mLowerTrend));};
          double     LowerValueAt(const datetime time)          { int index = iBarShift(mSymbol, mTimeframe, time, false); return(ValueAt(index, mLowerTrend));};
          //-----------------
          int        Start()                   {return(mStart);}
          void       Start(int value)         {mStart = value; Update();}
          int        Length()                  {return(mLength);}
          void       Length(int value)        {mLength = value; Update();}
          //-----------------


};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CTrendHiLo::CTrendHiLo(const int startbar = 1, const int length = 20, ENUM_TIMEFRAMES tf = PERIOD_M1)
{         mSymbol = _Symbol;
          mTimeframe = tf;//(ENUM_TIMEFRAMES)Period();
          mStart = startbar;
          mLength = length;
          Update(); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CTrendHiLo::~CTrendHiLo()
{}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CTrendHiLo::Update()
{         UpdateLower();
          UpdateUpper();//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CTrendHiLo::UpdateLower()
{         int firstBar = iLowest(mSymbol, mTimeframe, MODE_LOW, mLength, mStart);
          int nextBar = firstBar;
//
          double firstValue = 0;
          int midBar = mStart + (mLength / 2);
          double bestSlope = 0; //
          if(firstBar >= midBar)
          {         //Up Slope
                    while(nextBar >= midBar)
                    {         firstBar = nextBar;
                              firstValue = iLow(mSymbol, mTimeframe, firstBar);
                              bestSlope = 0; //
                              for(int i = firstBar - 1; i > mStart; i--)
                              {         //count left to right
                                        int pos = firstBar - i;
                                        double slope = (iLow(mSymbol, mTimeframe, i) - firstValue) / pos; //+ve slope
                                        if(nextBar == firstBar || slope < bestSlope)
                                        {         //least +ve slope
                                                  nextBar = i;
                                                  bestSlope = slope; }
                                        //
                              } //
                    }//
          }
          else
          {         //Down Slope
                    while(nextBar < midBar)
                    {         firstBar = nextBar;
                              firstValue = iLow(mSymbol, mTimeframe, firstBar);
                              bestSlope = 0; //
                              for(int i = firstBar + 1; i < (mStart + mLength); i++)
                              {         //count Right to Left
                                        int pos =  i - firstBar ;
                                        double slope = (firstValue - iLow(mSymbol, mTimeframe, i) ) / pos; //-ve slope
                                        if(nextBar == firstBar || slope > bestSlope)
                                        {         //least -ve slope
                                                  nextBar = i;
                                                  bestSlope = slope; }
                                        //
                              } //
                    }//
          }
          mLowerTrend.slope = bestSlope;
          mLowerTrend.base.bar = firstBar;
          mLowerTrend.base.price = firstValue;
          mLowerTrend.base.time = iTime(mSymbol, mTimeframe, firstBar); //
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CTrendHiLo::UpdateUpper()
{         int firstBar = iHighest(mSymbol, mTimeframe, MODE_LOW, mLength, mStart);
          int nextBar = firstBar;
          double firstValue = 0;
          int midBar = mStart + ((mLength + 1) / 2);
          double bestSlope = 0;
//
          if(firstBar >= midBar)
          {         //Down Slope
                    while(nextBar >= midBar)
                    {         firstBar = nextBar;
                              firstValue = iHigh(mSymbol, mTimeframe, firstBar);
                              bestSlope = 0; //
                              for(int i = firstBar - 1; i >= mStart; i--)
                              {         //count left to right
                                        int pos = firstBar - i;
                                        double slope = (iHigh(mSymbol, mTimeframe, i) - firstValue) / pos; //-ve slope
                                        if(nextBar == firstBar || slope > bestSlope)
                                        {         //least -ve slope
                                                  nextBar = i;
                                                  bestSlope = slope; }
                                        //
                              } //
                    }//
          }
          else
          {         //Up Slope
                    while(nextBar < midBar)
                    {         firstBar = nextBar;
                              firstValue = iHigh(mSymbol, mTimeframe, firstBar);
                              bestSlope = 0; //
                              for(int i = firstBar + 1; i < (mStart + mLength); i++)
                              {         //count Right to Left
                                        int pos =  i - firstBar ;
                                        double slope = (firstValue - iHigh(mSymbol, mTimeframe, i) ) / pos; //+ve slope
                                        if(nextBar == firstBar || slope < bestSlope)
                                        {         //least +ve slope
                                                  nextBar = i;
                                                  bestSlope = slope; }
                                        //
                              } //
                    }//
          }
          mUpperTrend.slope = bestSlope;
          mUpperTrend.base.bar = firstBar;
          mUpperTrend.base.price = firstValue;
          mUpperTrend.base.time = iTime(mSymbol, mTimeframe, firstBar); //
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class SignalDatas_TrendLine
{
public:
          SignalDatas_TrendLine(void) {};
          ~SignalDatas_TrendLine(void) {};

          void Update(int s = 1, int l = 50, ENUM_TIMEFRAMES tf = PERIOD_M1, bool r = 0)
          {         CTrendHiLo trend(s, l, tf);
                    trend.Update();
                    //
                    string nameHi = "TL.Hi" + EnumToString(tf);
                    ObjectDelete(0, nameHi ); //
                    if(!ObjectCreate(0, nameHi, OBJ_TREND, 0, iTime(_Symbol, tf, s + l), trend.UpperValueAt(s + l), iTime(_Symbol, tf, 0), trend.UpperValueAt(0)))
                    {         Print(nameHi + ": not created ", ErrorDescription(_LastError));} //
                    ObjectSetInteger(0, nameHi, OBJPROP_RAY_RIGHT, r); //
                    ObjectSetInteger(0, nameHi, OBJPROP_WIDTH, 3); //
                    ObjectSetInteger(0, nameHi, OBJPROP_COLOR, clrRed); //
                    //
                    string nameLo = "TL.Lo" + EnumToString(tf);
                    ObjectDelete(0, nameLo ); //
                    if(!ObjectCreate(0, nameLo, OBJ_TREND, 0, iTime(_Symbol, tf, s + l), trend.LowerValueAt(s + l), iTime(_Symbol, tf, 0), trend.LowerValueAt(0)))
                    {         Print(nameLo + ": not created ", ErrorDescription(_LastError));} //
                    ObjectSetInteger(0, nameLo, OBJPROP_RAY_RIGHT, r); //
                    ObjectSetInteger(0, nameLo, OBJPROP_WIDTH, 3); //
                    ObjectSetInteger(0, nameLo, OBJPROP_COLOR, clrGreen); //
                    //
          }





};
//+------------------------------------------------------------------+
