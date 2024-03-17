//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class SignalDatas_MovingAvrages
{
public:
          SignalDatas_MovingAvrages(void) {};
          ~SignalDatas_MovingAvrages(void) {};
          //-----------------------
          bool       IsMA_bulishPeriodsFrames(string sy,ENUM_TIMEFRAMES f1, int p1, ENUM_MA_METHOD m1, int s1, ENUM_TIMEFRAMES f2, int p2, ENUM_MA_METHOD m2, int s2) 
          {return iMA(sy, f1, p1, 0, m1, PRICE_CLOSE, s1) > iMA(sy, f2, p2, 0, m2, PRICE_CLOSE, s2);};

          bool       IsMA_BulishMAPrice(ENUM_TIMEFRAMES f1, int p1, ENUM_MA_METHOD m1, int s1,double Price)
          {         return iMA(_Symbol, f1, p1, 0, m1, PRICE_CLOSE, s1) > Price;};
          //
          bool       IsMA_bulishPeriodsFramesCross(ENUM_TIMEFRAMES f1, int p1, ENUM_MA_METHOD m1, int s1, ENUM_TIMEFRAMES f2, int p2, ENUM_MA_METHOD m2, int s2)     {return iMA(_Symbol, f1, p1, 0, m1, PRICE_CLOSE, s1 + 1) > iMA(_Symbol, f2, p2, 0, m2, PRICE_CLOSE, s2 + 1) && iMA(_Symbol, f1, p1, 0, m1, PRICE_CLOSE, s1) < iMA(_Symbol, f2, p2, 0, m2, PRICE_CLOSE, s2);};
          bool       IsMA_bearishCross(ENUM_TIMEFRAMES f1, int p1, ENUM_MA_METHOD m1, int s1, ENUM_TIMEFRAMES f2, int p2, ENUM_MA_METHOD m2, int s2)    {return iMA(_Symbol, f1, p1, 0, m1, PRICE_CLOSE, s1 + 1) < iMA(_Symbol, f2, p2, 0, m2, PRICE_CLOSE, s2 + 1) && iMA(_Symbol, f1, p1, 0, m1, PRICE_CLOSE, s1) > iMA(_Symbol, f2, p2, 0, m2, PRICE_CLOSE, s2);};
          bool       IsMA_BulishCrossPoint(ENUM_TIMEFRAMES f, int p1, int p2, int s, ENUM_MA_METHOD m2)                                                 {return iMA(_Symbol, f, p1, 0, m2, PRICE_CLOSE, s) > iMA(_Symbol, f, p2, 0, m2, PRICE_CLOSE, s) && iMA(_Symbol, f, p1, 0, m2, PRICE_CLOSE, s + 1) < iMA(_Symbol, f, p2, 0, m2, PRICE_CLOSE, s + 1);};
          bool       IsMA_BearishCrossPointt(ENUM_TIMEFRAMES f, int p1, int p2, int s, ENUM_MA_METHOD m2)                                               {return iMA(_Symbol, f, p1, 0, m2, PRICE_CLOSE, s) < iMA(_Symbol, f, p2, 0, m2, PRICE_CLOSE, s) && iMA(_Symbol, f, p1, 0, m2, PRICE_CLOSE, s + 1) > iMA(_Symbol, f, p2, 0, m2, PRICE_CLOSE, s + 1);};
          //
          bool       IsMA_Expaning1_Nearing0(ENUM_TIMEFRAMES f1, int p1, ENUM_MA_METHOD m1, int s1, ENUM_TIMEFRAMES f2, int p2, ENUM_MA_METHOD m2, int s2)
          {         return MathAbs(iMA(_Symbol, f1, p1, 0, m1, PRICE_CLOSE, s1 + 5) - iMA(_Symbol, f1, p2, 0, m1, PRICE_CLOSE, s2 + 5)) < MathAbs(iMA(_Symbol, f1, p1, 0, m1, PRICE_CLOSE, s1) - iMA(_Symbol, f1, p2, 0, m1, PRICE_CLOSE, s2)); }

          //
          bool       IsBulish__Forwarding(ENUM_TIMEFRAMES f, int p1, int p2, int p3, int p4)
          {         return iMA(_Symbol, f, p1, 0, MODE_SMA, PRICE_CLOSE, 0) > iMA(_Symbol, f, p3, 0, MODE_SMA, PRICE_CLOSE, 1)
                           && iMA(_Symbol, f, p1, 0, MODE_SMA, PRICE_CLOSE, 0) > iMA(_Symbol, f, p2, 0, MODE_SMA, PRICE_CLOSE, 0)
                           && iMA(_Symbol, f, p3, 0, MODE_SMA, PRICE_CLOSE, 0) > iMA(_Symbol, f, p4, 0, MODE_SMA, PRICE_CLOSE, 1); };
          //----------------------------------------------------------------
          bool       IsBulish__Correction(ENUM_TIMEFRAMES f, int p1, int p2, int p3, int p4)
          {         return iMA(_Symbol, f, p1, 0, MODE_SMA, PRICE_CLOSE, 0) > iMA(_Symbol, f, p3, 0, MODE_SMA, PRICE_CLOSE, 1)
                           && iMA(_Symbol, f, p1, 0, MODE_SMA, PRICE_CLOSE, 0) < iMA(_Symbol, f, p2, 0, MODE_SMA, PRICE_CLOSE, 0)
                           && iMA(_Symbol, f, p3, 0, MODE_SMA, PRICE_CLOSE, 0) > iMA(_Symbol, f, p4, 0, MODE_SMA, PRICE_CLOSE, 1); };
          //----------------------------------------------------------------
          bool       IsBearish__Forwarding(ENUM_TIMEFRAMES f, int p1, int p2, int p3, int p4)
          {         return iMA(_Symbol, f, p1, 0, MODE_SMA, PRICE_CLOSE, 0) < iMA(_Symbol, f, p3, 0, MODE_SMA, PRICE_CLOSE, 1)
                           && iMA(_Symbol, f, p1, 0, MODE_SMA, PRICE_CLOSE, 0) < iMA(_Symbol, f, p2, 0, MODE_SMA, PRICE_CLOSE, 0)
                           && iMA(_Symbol, f, p3, 0, MODE_SMA, PRICE_CLOSE, 0) < iMA(_Symbol, f, p4, 0, MODE_SMA, PRICE_CLOSE, 1); };
          //----------------------------------------------------------------
          bool       IsBearish__Correction(ENUM_TIMEFRAMES f, int p1, int p2, int p3, int p4)
          {         return iMA(_Symbol, f, p1, 0, MODE_SMA, PRICE_CLOSE, 0) < iMA(_Symbol, f, p3, 0, MODE_SMA, PRICE_CLOSE, 1)
                           && iMA(_Symbol, f, p1, 0, MODE_SMA, PRICE_CLOSE, 0) > iMA(_Symbol, f, p2, 0, MODE_SMA, PRICE_CLOSE, 0)
                           && iMA(_Symbol, f, p3, 0, MODE_SMA, PRICE_CLOSE, 0) < iMA(_Symbol, f, p4, 0, MODE_SMA, PRICE_CLOSE, 1); };
          //----------------------------------------------------------------
          bool       IsMA20_PriceUpperLevel300;
          bool       IsMA20_PriceUnderLevel300;
          bool       IsMA500_PriceUpperLevel1300;
          bool       IsMA500_PriceUnderLevel1300;
          //

          bool       IsMA1000_0Upper_Bearish_m1;
          bool       IsMA14_70Under_Bearish_m1;
          bool       IsMA7_3_Bulish;
          bool       IsMADownWard;
          bool       IsMAUpWard;
          //
          bool       IsMA_Bulish_13_5_m1;
          bool       IsMA_Bulish_13_5__PRICE_UNDER13_m1;
          bool       IsMA_Bearish_13_5__PRICE_ABOVE13_m1;
          //
          bool       MABuy10_3_Bulish__;
          bool       MASell10_3_Bearish__;
          //
          bool       IsBulish_1_Bearish_0__200_300_m1;
          bool       IsBulish_1_Bearish_0__200_300_m5;
          //
          //---------
          bool       IsCross20_200_m1_Buy;
          bool       IsCross20_200_m1_Sell;
          void       Update()
          {         //----------------------------------------------------------------
                    IsMA20_PriceUpperLevel300 = iMA(_Symbol, PERIOD_M1, 20, 0, MODE_SMA, PRICE_CLOSE, 0) + 300 * Point() < Ask;
                    IsMA20_PriceUnderLevel300 = iMA(_Symbol, PERIOD_M1, 20, 0, MODE_SMA, PRICE_CLOSE, 0) - 300 * Point() > Bid;
                    IsMA500_PriceUpperLevel1300 = iMA(_Symbol, PERIOD_M1, 500, 0, MODE_SMA, PRICE_CLOSE, 0) + 1300 * Point() < Ask;
                    IsMA500_PriceUnderLevel1300 = iMA(_Symbol, PERIOD_M1, 500, 0, MODE_SMA, PRICE_CLOSE, 0) - 1300 * Point() > Bid;
                    //
                    //
                    IsMA1000_0Upper_Bearish_m1     = iMA(_Symbol, PERIOD_M1, 1000, 0, MODE_EMA, PRICE_CLOSE, 0) > Close[0];
                    IsMA14_70Under_Bearish_m1      = iMA(_Symbol, PERIOD_M1, 14, 0, MODE_EMA, PRICE_CLOSE, 0) < iMA(_Symbol, PERIOD_M1, 70, 0, MODE_EMA, PRICE_CLOSE, 0);
                    IsMA7_3_Bulish                 = iMA(_Symbol, PERIOD_M1, 3, 0, MODE_EMA, PRICE_CLOSE, 0) > iMA(_Symbol, PERIOD_M1, 7, 0, MODE_EMA, PRICE_CLOSE, 0);
                    IsMADownWard                   = IsMA1000_0Upper_Bearish_m1 && IsMA14_70Under_Bearish_m1 && !IsMA7_3_Bulish;   //Print("IsMADownWard:", IsMADownWard);
                    IsMAUpWard                     = !IsMA1000_0Upper_Bearish_m1 && !IsMA14_70Under_Bearish_m1 && IsMA7_3_Bulish; //Print("IsMAUpWard:", IsMAUpWard);
                    //
                    //
                    //
                    IsMA_Bulish_13_5_m1            = iMA(_Symbol, PERIOD_M1, 13, 0, MODE_EMA, PRICE_CLOSE, 0) < iMA(_Symbol, PERIOD_M1, 5, 0, MODE_SMA, PRICE_CLOSE, 0);
                    IsMA_Bulish_13_5__PRICE_UNDER13_m1            = iMA(_Symbol, PERIOD_M1, 13, 0, MODE_EMA, PRICE_CLOSE, 0) < iMA(_Symbol, PERIOD_M1, 5, 0, MODE_SMA, PRICE_CLOSE, 0) && iMA(_Symbol, PERIOD_M1, 13, 0, MODE_SMA, PRICE_CLOSE, 0) > Ask;
                    IsMA_Bearish_13_5__PRICE_ABOVE13_m1            = iMA(_Symbol, PERIOD_M1, 13, 0, MODE_EMA, PRICE_CLOSE, 0) > iMA(_Symbol, PERIOD_M1, 5, 0, MODE_SMA, PRICE_CLOSE, 0) && iMA(_Symbol, PERIOD_M1, 13, 0, MODE_SMA, PRICE_CLOSE, 0) < Bid;
                    //
                    MABuy10_3_Bulish__     = iMA(_Symbol, PERIOD_M1, 10, 0, MODE_EMA, PRICE_CLOSE, 1) > iMA(_Symbol, PERIOD_M1, 10, 0, MODE_SMA, PRICE_CLOSE, 2) && iMA(_Symbol, PERIOD_M1, 3, 0, MODE_EMA, PRICE_CLOSE, 1) > iMA(_Symbol, PERIOD_M1, 3, 0, MODE_SMA, PRICE_CLOSE, 2);
                    MASell10_3_Bearish__   = iMA(_Symbol, PERIOD_M1, 10, 0, MODE_EMA, PRICE_CLOSE, 1) < iMA(_Symbol, PERIOD_M1, 10, 0, MODE_SMA, PRICE_CLOSE, 2) && iMA(_Symbol, PERIOD_M1, 3, 0, MODE_EMA, PRICE_CLOSE, 1) < iMA(_Symbol, PERIOD_M1, 3, 0, MODE_SMA, PRICE_CLOSE, 2);
                    //
                    //
                    //---------
                    IsCross20_200_m1_Buy       = iMA(_Symbol, PERIOD_M1, 20, 0, MODE_EMA, PRICE_CLOSE, 1) > iMA(_Symbol, PERIOD_M1, 200, 0, MODE_EMA, PRICE_CLOSE, 1) && iMA(_Symbol, PERIOD_M1, 20, 0, MODE_EMA, PRICE_CLOSE, 2) < iMA(_Symbol, PERIOD_M1, 200, 0, MODE_EMA, PRICE_CLOSE, 2);
                    IsCross20_200_m1_Sell       = iMA(_Symbol, PERIOD_M1, 20, 0, MODE_EMA, PRICE_CLOSE, 1) < iMA(_Symbol, PERIOD_M1, 200, 0, MODE_EMA, PRICE_CLOSE, 1) && iMA(_Symbol, PERIOD_M1, 20, 0, MODE_EMA, PRICE_CLOSE, 2) > iMA(_Symbol, PERIOD_M1, 200, 0, MODE_EMA, PRICE_CLOSE, 2); //
          }; //

          int MovingDirection(ENUM_TIMEFRAMES f, int pa1, int pa2, int pa3, int pa4, int pb1, int pb2, int pb3, int pb4, int pc1, int pc2, int pc3, int pc4)
          {         int MovingDirection = 0;
                    if(IsBearish__Forwarding(f, pa1, pa2, pa3, pa4))
                    {         MovingDirection -= 1;
                              if(IsBearish__Forwarding(f, pb1, pb2, pb3, pb4))
                              {         MovingDirection -= 1;
                                        if(IsBearish__Forwarding(f, pc1, pc2, pc3, pc4))           { MovingDirection -= 1; }
                                        else if(IsBearish__Correction(f, pc1, pc2, pc3, pc4))      { MovingDirection += 1; }
                                        else if(IsBulish__Forwarding(f, pc1, pc2, pc3, pc4))       { MovingDirection += 1; }
                                        else if(IsBulish__Correction(f, pc1, pc2, pc3, pc4))       { MovingDirection -= 1; } //
                              }
                              else if(IsBearish__Correction(f, pb1, pb2, pb3, pb4))
                              {         MovingDirection += 1;
                                        if(IsBearish__Forwarding(f, pc1, pc2, pc3, pc4))           { MovingDirection -= 1; }
                                        else if(IsBearish__Correction(f, pc1, pc2, pc3, pc4))      { MovingDirection += 1; }
                                        else if(IsBulish__Forwarding(f, pc1, pc2, pc3, pc4))       { MovingDirection += 1; }
                                        else if(IsBulish__Correction(f, pc1, pc2, pc3, pc4))       { MovingDirection -= 1; } //
                              }
                              else if(IsBulish__Forwarding(f, pb1, pb2, pb3, pb4))
                              {         MovingDirection += 1;
                                        if(IsBearish__Forwarding(f, pc1, pc2, pc3, pc4))           { MovingDirection -= 1; }
                                        else if(IsBearish__Correction(f, pc1, pc2, pc3, pc4))      { MovingDirection += 1; }
                                        else if(IsBulish__Forwarding(f, pc1, pc2, pc3, pc4))       { MovingDirection += 1; }
                                        else if(IsBulish__Correction(f, pc1, pc2, pc3, pc4))       { MovingDirection -= 1; } //
                              }
                              else if(IsBulish__Correction(f, pb1, pb2, pb3, pb4))
                              {         MovingDirection -= 1;
                                        if(IsBearish__Forwarding(f, pc1, pc2, pc3, pc4))           { MovingDirection -= 1; }
                                        else if(IsBearish__Correction(f, pc1, pc2, pc3, pc4))      { MovingDirection += 1; }
                                        else if(IsBulish__Forwarding(f, pc1, pc2, pc3, pc4))       { MovingDirection += 1; }
                                        else if(IsBulish__Correction(f, pc1, pc2, pc3, pc4))       { MovingDirection -= 1; } //
                              } //
                    }
                    else if(IsBearish__Correction(f, pa1, pa2, pa3, pa4))
                    {         MovingDirection += 1;
                              if(IsBearish__Forwarding(f, pb1, pb2, pb3, pb4))
                              {         MovingDirection -= 1;
                                        if(IsBearish__Forwarding(f, pc1, pc2, pc3, pc4))           { MovingDirection -= 1; }
                                        else if(IsBearish__Correction(f, pc1, pc2, pc3, pc4))      { MovingDirection += 1; }
                                        else if(IsBulish__Forwarding(f, pc1, pc2, pc3, pc4))       { MovingDirection += 1; }
                                        else if(IsBulish__Correction(f, pc1, pc2, pc3, pc4))       { MovingDirection -= 1; } //
                              }
                              else if(IsBearish__Correction(f, pb1, pb2, pb3, pb4))
                              {         MovingDirection += 1;
                                        if(IsBearish__Forwarding(f, pc1, pc2, pc3, pc4))           { MovingDirection -= 1; }
                                        else if(IsBearish__Correction(f, pc1, pc2, pc3, pc4))      { MovingDirection += 1; }
                                        else if(IsBulish__Forwarding(f, pc1, pc2, pc3, pc4))       { MovingDirection += 1; }
                                        else if(IsBulish__Correction(f, pc1, pc2, pc3, pc4))       { MovingDirection -= 1; } //
                              }
                              else if(IsBulish__Forwarding(f, pb1, pb2, pb3, pb4))
                              {         MovingDirection += 1;
                                        if(IsBearish__Forwarding(f, pc1, pc2, pc3, pc4))           { MovingDirection -= 1; }
                                        else if(IsBearish__Correction(f, pc1, pc2, pc3, pc4))      { MovingDirection += 1; }
                                        else if(IsBulish__Forwarding(f, pc1, pc2, pc3, pc4))       { MovingDirection += 1; }
                                        else if(IsBulish__Correction(f, pc1, pc2, pc3, pc4))       { MovingDirection -= 1; } //
                              }
                              else if(IsBulish__Correction(f, pb1, pb2, pb3, pb4))
                              {         MovingDirection -= 1;
                                        if(IsBearish__Forwarding(f, pc1, pc2, pc3, pc4))           { MovingDirection -= 1; }
                                        else if(IsBearish__Correction(f, pc1, pc2, pc3, pc4))      { MovingDirection += 1; }
                                        else if(IsBulish__Forwarding(f, pc1, pc2, pc3, pc4))       { MovingDirection += 1; }
                                        else if(IsBulish__Correction(f, pc1, pc2, pc3, pc4))       { MovingDirection -= 1; } //
                              } //
                    }
                    else if(IsBulish__Forwarding(f, pa1, pa2, pa3, pa4))
                    {         MovingDirection += 1;
                              if(IsBearish__Forwarding(f, pb1, pb2, pb3, pb4))
                              {         MovingDirection -= 1;
                                        if(IsBearish__Forwarding(f, pc1, pc2, pc3, pc4))           { MovingDirection -= 1; }
                                        else if(IsBearish__Correction(f, pc1, pc2, pc3, pc4))      { MovingDirection += 1; }
                                        else if(IsBulish__Forwarding(f, pc1, pc2, pc3, pc4))       { MovingDirection += 1; }
                                        else if(IsBulish__Correction(f, pc1, pc2, pc3, pc4))       { MovingDirection -= 1; } //
                              }
                              else if(IsBearish__Correction(f, pb1, pb2, pb3, pb4))
                              {         MovingDirection += 1;
                                        if(IsBearish__Forwarding(f, pc1, pc2, pc3, pc4))           { MovingDirection -= 1; }
                                        else if(IsBearish__Correction(f, pc1, pc2, pc3, pc4))      { MovingDirection += 1; }
                                        else if(IsBulish__Forwarding(f, pc1, pc2, pc3, pc4))       { MovingDirection += 1; }
                                        else if(IsBulish__Correction(f, pc1, pc2, pc3, pc4))       { MovingDirection -= 1; } //
                              }
                              else if(IsBulish__Forwarding(f, pb1, pb2, pb3, pb4))
                              {         MovingDirection += 1;
                                        if(IsBearish__Forwarding(f, pc1, pc2, pc3, pc4))           { MovingDirection -= 1; }
                                        else if(IsBearish__Correction(f, pc1, pc2, pc3, pc4))      { MovingDirection += 1; }
                                        else if(IsBulish__Forwarding(f, pc1, pc2, pc3, pc4))       { MovingDirection += 1; }
                                        else if(IsBulish__Correction(f, pc1, pc2, pc3, pc4))       { MovingDirection -= 1; } //
                              }
                              else if(IsBulish__Correction(f, pb1, pb2, pb3, pb4))
                              {         MovingDirection -= 1;
                                        if(IsBearish__Forwarding(f, pc1, pc2, pc3, pc4))           { MovingDirection -= 1; }
                                        else if(IsBearish__Correction(f, pc1, pc2, pc3, pc4))      { MovingDirection += 1; }
                                        else if(IsBulish__Forwarding(f, pc1, pc2, pc3, pc4))       { MovingDirection += 1; }
                                        else if(IsBulish__Correction(f, pc1, pc2, pc3, pc4))       { MovingDirection -= 1; } //
                              } //
                    }
                    else if(IsBulish__Correction(f, pa1, pa2, pa3, pa4))
                    {         MovingDirection -= 1;
                              if(IsBearish__Forwarding(f, pb1, pb2, pb3, pb4))
                              {         MovingDirection -= 1;
                                        if(IsBearish__Forwarding(f, pc1, pc2, pc3, pc4))           { MovingDirection -= 1; }
                                        else if(IsBearish__Correction(f, pc1, pc2, pc3, pc4))      { MovingDirection += 1; }
                                        else if(IsBulish__Forwarding(f, pc1, pc2, pc3, pc4))       { MovingDirection += 1; }
                                        else if(IsBulish__Correction(f, pc1, pc2, pc3, pc4))       { MovingDirection -= 1; } //
                              }
                              else if(IsBearish__Correction(f, pb1, pb2, pb3, pb4))
                              {         MovingDirection += 1;
                                        if(IsBearish__Forwarding(f, pc1, pc2, pc3, pc4))           { MovingDirection -= 1; }
                                        else if(IsBearish__Correction(f, pc1, pc2, pc3, pc4))      { MovingDirection += 1; }
                                        else if(IsBulish__Forwarding(f, pc1, pc2, pc3, pc4))       { MovingDirection += 1; }
                                        else if(IsBulish__Correction(f, pc1, pc2, pc3, pc4))       { MovingDirection -= 1; } //
                              }
                              else if(IsBulish__Forwarding(f, pb1, pb2, pb3, pb4))
                              {         MovingDirection += 1;
                                        if(IsBearish__Forwarding(f, pc1, pc2, pc3, pc4))           { MovingDirection -= 1; }
                                        else if(IsBearish__Correction(f, pc1, pc2, pc3, pc4))      { MovingDirection += 1; }
                                        else if(IsBulish__Forwarding(f, pc1, pc2, pc3, pc4))       { MovingDirection += 1; }
                                        else if(IsBulish__Correction(f, pc1, pc2, pc3, pc4))       { MovingDirection -= 1; } //
                              }
                              else if(IsBulish__Correction(f, pb1, pb2, pb3, pb4))
                              {         MovingDirection -= 1;
                                        if(IsBearish__Forwarding(f, pc1, pc2, pc3, pc4))           { MovingDirection -= 1; }
                                        else if(IsBearish__Correction(f, pc1, pc2, pc3, pc4))      { MovingDirection += 1; }
                                        else if(IsBulish__Forwarding(f, pc1, pc2, pc3, pc4))       { MovingDirection += 1; }
                                        else if(IsBulish__Correction(f, pc1, pc2, pc3, pc4))       { MovingDirection -= 1; } //
                              }  //
                    }//
                    return MovingDirection;//
          }//

};
//+------------------------------------------------------------------+
