//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class StandardDevitionChannel
{
public:

          StandardDevitionChannel(void);
          StandardDevitionChannel(string Pfname,ENUM_TIMEFRAMES tf, int s, int bc, double f, ENUM_LINE_STYLE st, color c, int w, bool r);
          ~StandardDevitionChannel(void) {};
          //--------------------------------
          int InputStarBar  ;//= 0; //StarBar
          int InputCalcBars ;// = 120; //Bars for Calculation
          ENUM_TIMEFRAMES timeframe;
          double f1 ;//= 1.0; //Inner Channel Multiplier, f1
          double f2 ;//= 2.0; //Outer Channel Multiplier, f2
          double f3 ;//= 3.0; //Outer Channel Multiplier, f3


          //--- indicator buffers
          double         topBuffer[];
          double         midBuffer[];
          double         btmBuffer[];
          //double         topBuffer2[];
          //double         btmBuffer2[];
          //double         topBuffer3[];
          //double         btmBuffer3[];
          double         sample[];//sample data for calculating linear regression
          //---
          int   StarBar  ;//= 0;
          int   CalcBars ;//= 0;
          //-------------------------------------
          void       OnIniter();
          void       OnCalculater();
          void       CalcAB(const double &arr[], int size, double &a, double &b);
          double     GetStdDev(const double &arr[], int size);


};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void StandardDevitionChannel::StandardDevitionChannel(void)
{         //--------------------------------
          InputStarBar = 0; //StarBar
          InputCalcBars = 120; //Bars for Calculation
          f1 = 1.0; //Inner Channel Multiplier, f1
          f2 = 2.0; //Outer Channel Multiplier, f2
          f3 = 3.0; //Outer Channel Multiplier, f3
//--- indicator buffers
//topBuffer[];
//midBuffer[];
//btmBuffer[];
//topBuffer2[];
//btmBuffer2[];
//topBuffer3[];
//btmBuffer3[];
//sample[];//sample data for calculating linear regression
//---
          StarBar  = 0;
          CalcBars = 0; //
//===========================
          OnIniter();
          OnCalculater();
//===========================
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void StandardDevitionChannel::StandardDevitionChannel(string Pfname, ENUM_TIMEFRAMES tf, int s, int bc, double f, ENUM_LINE_STYLE st, color c, int w, bool r)
{         //--------------------------------
          InputStarBar = s; //StarBar
          InputCalcBars = bc; //Bars for Calculation
          timeframe = tf;
          f1 = f; //Inner Channel Multiplier, f1
//f2 = 2.0; //Outer Channel Multiplier, f2
//f3 = 3.0; //Outer Channel Multiplier, f3
//--- indicator buffers
//topBuffer[];
//midBuffer[];
//btmBuffer[];
//topBuffer2[];
//btmBuffer2[];
//topBuffer3[];
//btmBuffer3[];
//sample[];//sample data for calculating linear regression
//---
          StarBar  = 0;
          CalcBars = 0; //
//===========================
          OnIniter();
          OnCalculater();
//===========================
          
          ObjectDelete(Pfname + EnumToString(timeframe) + " STDx" + DoubleToString(f, 2));
          ObjectCreate(Pfname + EnumToString(timeframe) + " STDx" + DoubleToString(f, 2), OBJ_TREND, 0,  iTime(_Symbol, timeframe, StarBar), midBuffer[StarBar], iTime(_Symbol, timeframe, StarBar + CalcBars - 1), midBuffer[StarBar + CalcBars - 1]  );  //base line
          ObjectSet(Pfname + EnumToString(timeframe) + " STDx" + DoubleToString(f, 2), OBJPROP_WIDTH, w + 2);
          ObjectSet(Pfname + EnumToString(timeframe) + " STDx" + DoubleToString(f, 2), OBJPROP_COLOR, clrGray  );
          ObjectSet(Pfname + EnumToString(timeframe) + " STDx" + DoubleToString(f, 2), OBJPROP_RAY_RIGHT, r);
          ObjectSet(Pfname + EnumToString(timeframe) + " STDx" + DoubleToString(f, 2), OBJPROP_STYLE, st);
          //
          ObjectDelete(Pfname + EnumToString(timeframe) + " STDxTOP" + DoubleToString(f, 2));
          ObjectCreate(Pfname + EnumToString(timeframe) + " STDxTOP" + DoubleToString(f, 2), OBJ_TREND, 0, iTime(_Symbol, timeframe, StarBar), topBuffer[StarBar], iTime(_Symbol, timeframe, StarBar + CalcBars - 1), topBuffer[StarBar + CalcBars - 1]  );  //base line
          ObjectSet(Pfname + EnumToString(timeframe) + " STDxTOP" + DoubleToString(f, 2), OBJPROP_WIDTH, w);
          ObjectSet(Pfname + EnumToString(timeframe) + " STDxTOP" + DoubleToString(f, 2), OBJPROP_COLOR, c );
          ObjectSet(Pfname + EnumToString(timeframe) + " STDxTOP" + DoubleToString(f, 2), OBJPROP_RAY_RIGHT, r);
          ObjectSet(Pfname + EnumToString(timeframe) + " STDxTOP" + DoubleToString(f, 2), OBJPROP_STYLE, st);
          //
          ObjectDelete(Pfname + EnumToString(timeframe) + " STDxBTM" + DoubleToString(f, 2));
          ObjectCreate(Pfname + EnumToString(timeframe) + " STDxBTM" + DoubleToString(f, 2), OBJ_TREND, 0, iTime(_Symbol, timeframe, StarBar), btmBuffer[StarBar], iTime(_Symbol, timeframe, StarBar + CalcBars - 1), btmBuffer[StarBar + CalcBars - 1]  );  //base line
          ObjectSet(Pfname + EnumToString(timeframe) + " STDxBTM" + DoubleToString(f, 2), OBJPROP_WIDTH, w);
          ObjectSet(Pfname + EnumToString(timeframe) + " STDxBTM" + DoubleToString(f, 2), OBJPROP_COLOR, c );
          ObjectSet(Pfname + EnumToString(timeframe) + " STDxBTM" + DoubleToString(f, 2), OBJPROP_RAY_RIGHT, r);
          ObjectSet(Pfname + EnumToString(timeframe) + " STDxBTM" + DoubleToString(f, 2), OBJPROP_STYLE, st);
//===========================
}
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
void StandardDevitionChannel::OnIniter()
{         //--- indicator buffers mapping
//SetIndexBuffer(0, midBuffer);
//SetIndexBuffer(1, topBuffer);
//SetIndexBuffer(2, btmBuffer);
//SetIndexBuffer(3, topBuffer2);
//SetIndexBuffer(4, btmBuffer2);
//SetIndexBuffer(5, topBuffer3);
//SetIndexBuffer(6, btmBuffer3);
//--------------------------------------
          ArrayResize(topBuffer, InputStarBar + InputCalcBars );  //Print("StarBar + CalcBars:",StarBar + CalcBars);
          ArrayResize(midBuffer, InputStarBar + InputCalcBars );
          ArrayResize(btmBuffer, InputStarBar + InputCalcBars );
//--------------------------------------
//for(int i = 0; i < 7; i++)SetIndexEmptyValue(i, 0.0);
//IndicatorDigits(_Digits);
          StarBar  = InputStarBar;
          CalcBars = InputCalcBars;
          if(CalcBars < 2)CalcBars = 120;
          if(StarBar < 0)StarBar = 0;
          ArrayResize(sample, CalcBars);
//---
          return;//
}
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
void StandardDevitionChannel::OnCalculater()
{         //---
          int i;
          double A = 0.0, B = 0.0, stdev = 0.0;
//?if(StarBar + CalcBars > rates_total - 1)return;
//explicitly initialize array buffer to zero
//?if(prev_calculated == 0)
          {         ArrayInitialize(midBuffer, 0.0);
                    ArrayInitialize(topBuffer, 0.0);
                    ArrayInitialize(btmBuffer, 0.0);
                    //ArrayInitialize(topBuffer2, 0.0);
                    //ArrayInitialize(btmBuffer2, 0.0);
                    //ArrayInitialize(topBuffer3, 0.0);
                    //ArrayInitialize(btmBuffer3, 0.0); //
          }
//--- copy close data to sample array
          if(CopyClose(_Symbol, timeframe, StarBar, CalcBars, sample) != CalcBars)return;
//--- use sample data to calculate linear regression,to get the coefficient a and b
          CalcAB(sample, CalcBars, A, B);
          for(i = StarBar; i < StarBar + CalcBars /*&& i < rates_total*/; i++)
          {         //Print("i:", i); //
                    midBuffer[i] = A * (StarBar + CalcBars - i - 1) + B; // y =f(x) =a*x+b;
          }
//--- draw channel
          stdev = GetStdDev(sample, CalcBars); //calculate standand deviation
          for(i = StarBar; i < StarBar + CalcBars /*&& i < rates_total*/; i++)
          {         topBuffer[i] = midBuffer[i] + stdev * f1;
                    btmBuffer[i] = midBuffer[i] - stdev * f1;
                    //topBuffer2[i] = midBuffer[i] + stdev * f2;
                    //btmBuffer2[i] = midBuffer[i] - stdev * f2;
                    //topBuffer3[i] = midBuffer[i] + stdev * f3;
                    //btmBuffer3[i] = midBuffer[i] - stdev * f3; //
          }
//---if a new bar occurs,the last value should be set to EMPTY VALUE
          static int LastTotalBars = 0;
//?if(i < rates_total && LastTotalBars != rates_total)
//{         midBuffer[i] = 0.0;
//          topBuffer[i] = 0.0;
//          btmBuffer[i] = 0.0;
//          topBuffer2[i] = 0.0;
//          btmBuffer2[i] = 0.0;
//          topBuffer3[i] = 0.0;
//          btmBuffer3[i] = 0.0;
//          LastTotalBars = rates_total; //
//}
//--- return value of prev_calculated for next call
          return;//
}
//+------------------------------------------------------------------+
//Linear Regression Calculation for sample data: arr[]
//line equation  y = f(x)  = ax + b
void StandardDevitionChannel::CalcAB(const double &arr[], int size, double &a, double &b)
{         a = 0.0; b = 0.0;
          if(size < 2)return;
          double sumxy = 0.0, sumx = 0.0, sumy = 0.0, sumx2 = 0.0;
          for(int i = 0; i < size; i++)
          {         sumxy += i * arr[i];
                    sumy += arr[i];
                    sumx += i;
                    sumx2 += i * i; //
          }
          double M = size * sumx2 - sumx * sumx;
          if(M == 0.0)return;
          a = (size * sumxy - sumx * sumy) / M;
          b = (sumy - a * sumx) / size;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double StandardDevitionChannel::GetStdDev(const double &arr[], int size)
{         if(size < 2)return(0.0);
          double sum = 0.0;
          for(int i = 0; i < size; i++)
          {         sum = sum + arr[i]; }
          sum = sum / size;
          double sum2 = 0.0;
          for(int k = 0; k < size; k++)
          {         sum2 = sum2 + (arr[k] - sum) * (arr[k] - sum); }
          sum2 = sum2 / (size - 1);
          sum2 = MathSqrt(sum2);
          return(sum2);//
}
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
