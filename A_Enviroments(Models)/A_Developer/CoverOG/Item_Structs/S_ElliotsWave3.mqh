//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\_COBF_.mqh>
#define  OBJ_ELLIOTWAVE3 9000
struct S_ElliotsWave3: public _COBF_
{         void  S_ElliotsWave3()
          {         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                    TYPE_O_00 = (ENUM_OBJECT)OBJ_ELLIOTWAVE3;
                    St_CDI_CZZ _ZigZags_(false,"_ZZv_" + EnumToString(PERIOD_CURRENT), 12, 5, 3, PERIOD_CURRENT, NULL, 0, 0, 5, 3); _ZigZags_12_5_3_Current = _ZigZags_; //   , 10, 200
                    //******************************
                    Sg_Wave_      _Wave1("Wave1"), _Wave2("Wave2"), _Wave3("Wave3"), _Wave4("Wave4"), _Wave5("Wave5"), _Wave6("Wave6"), _Wave7("Wave7"), _Wave8("Wave8");
                    Sg_Wave_      _Wave_Lowest("WaveLowest"), _Wave_Highest("WaveHighest");//
                    Sg_Wave_      _Wave0_1_4_5_Middle("Wave0_1_4_5_Middle");
                    Wave1               = _Wave1;
                    Wave2               = _Wave2;
                    Wave3               = _Wave3;
                    Wave4               = _Wave4;
                    Wave5               = _Wave5;
                    Wave6               = _Wave6;
                    Wave7               = _Wave7;
                    Wave8               = _Wave8;
                    Wave0_1_4_5_Middle  = _Wave0_1_4_5_Middle; //
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          }
          bool Update_Zigzag(ENUM_TIMEFRAMES f, int zzMul, int zzg,bool isKey)
          {         St_CDI_CZZ _ZigZags_(isKey,"_ZZb_" + " S_ElliotsWave3 ", 12, 5, 3, f, NULL, 0, 0, 5 + zzg, zzMul); _ZigZags_12_5_3_Current = _ZigZags_; return true;} // /*10, 200*/
          bool DRAWLINES;                    //Displaying lines for marking the Elliott Wave  bool
          //****************************************************
          bool Is_Ellot_Standard;
          //
          double Highth_All;
          double Highth_All_Lowest, Highth_All_Highest;
          bool   Is_Bulish_All_Middle;

          //
          Sg_Wave_                 Wave1, Wave2, Wave3, Wave4, Wave5, Wave6, Wave7, Wave8;

          Sg_Point_                Point_Lowest, Point_Highest;
          Sg_Wave_                 Wave0_1_4_5_Middle;//--- Wave0_1_4_5_Middle_Up, ;Wave0_1_4_5_Middle_Down,

          void                   Find_Waves(ENUM_TIMEFRAMES f, int zzMul, int zzg,bool isKey);
          void                   Find_Lowest_Highest();

          double                FiboRet_LastPrice__Lowest_Highest_Shape;
          double                Calc_FiboRet_LastPrice__Lowest_Highest_Shape(    )
          {         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                    Highth_All = MathAbs(Point_Highest._Price - Point_Lowest._Price); //Alert("Wave_Highest.Price_Highest:", Wave_Highest.Price_Highest, "  Wave_Lowest.Price_Lowest", Wave_Lowest.Price_Lowest);
                    //
                    Highth_All_Lowest  =   MathAbs(Point_Lowest._Price   - Bid);
                    Highth_All_Highest =   MathAbs(Point_Highest._Price - Bid);
                    //
                    if(Highth_All_Lowest > Highth_All_Highest) {};
                    //
                    // Highth_All ;
                    //
                    FiboRet_LastPrice__Lowest_Highest_Shape = -1;
                    if(Highth_All == 0) return -1;
                    FiboRet_LastPrice__Lowest_Highest_Shape = Is_TrendUp_Forwarding ? Highth_All_Lowest / Highth_All : Highth_All_Highest / Highth_All ; //
                    return FiboRet_LastPrice__Lowest_Highest_Shape = NormalizeDouble(FiboRet_LastPrice__Lowest_Highest_Shape, 3);
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          }

          //***********************************************************************************
          //Cheack is Uptend forwarding..
          bool       Is_Bulish_TL_2_4;
          bool       Is_Bulish_TL_1_3;
          bool       Is_TrendUp_Forwarding;             // = ( Wave5.Z._Price >  Wave5.A._Price) && ( Wave3.Z._Price >  Wave3.A._Price) ? true : false;
          bool       Is_TrendUp_Forwarding_Correcting;  // = ( Wave2.A._Price >  Wave2.Z._Price) && ( Wave4.Z._Price >  Wave2.Z._Price) ? true : false;
          bool       Is_TrendDown_Forwarding_Correcting;// = ( Wave2.A._Price <  Wave2.Z._Price) && ( Wave4.Z._Price <  Wave2.Z._Price) ? true : false;

          St_CDI_CZZ _ZigZags_12_5_3_Current;// //its class




};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void S_ElliotsWave3::Find_Waves(ENUM_TIMEFRAMES f, int zzMul, int zzg,bool isKey)
{         //
          int ZZG = zzg;
          {         //                  /* *//* */wave 1 ok //************************************
                    Update_Zigzag(f, zzMul, ZZG,isKey);
                    //**************
                    Wave1.SetUp(f, _ZigZags_12_5_3_Current._CZZ_Point[5 + ZZG]._Shift, _ZigZags_12_5_3_Current._CZZ_Point[5 + ZZG]._Price, _ZigZags_12_5_3_Current._CZZ_Point[5 + ZZG]._Time, _ZigZags_12_5_3_Current._CZZ_Point[4 + ZZG]._Shift, _ZigZags_12_5_3_Current._CZZ_Point[4 + ZZG]._Price, _ZigZags_12_5_3_Current._CZZ_Point[4 + ZZG]._Time, Wave1, Wave2);
                    Wave2.SetUp(f, _ZigZags_12_5_3_Current._CZZ_Point[4 + ZZG]._Shift, _ZigZags_12_5_3_Current._CZZ_Point[4 + ZZG]._Price, _ZigZags_12_5_3_Current._CZZ_Point[4 + ZZG]._Time, _ZigZags_12_5_3_Current._CZZ_Point[3 + ZZG]._Shift, _ZigZags_12_5_3_Current._CZZ_Point[3 + ZZG]._Price, _ZigZags_12_5_3_Current._CZZ_Point[3 + ZZG]._Time, Wave1, Wave2);
                    Wave3.SetUp(f, _ZigZags_12_5_3_Current._CZZ_Point[3 + ZZG]._Shift, _ZigZags_12_5_3_Current._CZZ_Point[3 + ZZG]._Price, _ZigZags_12_5_3_Current._CZZ_Point[3 + ZZG]._Time, _ZigZags_12_5_3_Current._CZZ_Point[2 + ZZG]._Shift, _ZigZags_12_5_3_Current._CZZ_Point[2 + ZZG]._Price, _ZigZags_12_5_3_Current._CZZ_Point[2 + ZZG]._Time, Wave2, Wave2);
                    Wave4.SetUp(f, _ZigZags_12_5_3_Current._CZZ_Point[2 + ZZG]._Shift, _ZigZags_12_5_3_Current._CZZ_Point[2 + ZZG]._Price, _ZigZags_12_5_3_Current._CZZ_Point[2 + ZZG]._Time, _ZigZags_12_5_3_Current._CZZ_Point[1 + ZZG]._Shift, _ZigZags_12_5_3_Current._CZZ_Point[1 + ZZG]._Price, _ZigZags_12_5_3_Current._CZZ_Point[1 + ZZG]._Time, Wave3, Wave2);
                    Wave5.SetUp(f, _ZigZags_12_5_3_Current._CZZ_Point[1 + ZZG]._Shift, _ZigZags_12_5_3_Current._CZZ_Point[1 + ZZG]._Price, _ZigZags_12_5_3_Current._CZZ_Point[1 + ZZG]._Time, _ZigZags_12_5_3_Current._CZZ_Point[0 + ZZG]._Shift, _ZigZags_12_5_3_Current._CZZ_Point[0 + ZZG]._Price, _ZigZags_12_5_3_Current._CZZ_Point[0 + ZZG]._Time, Wave4, Wave2);
                    //
                    //                  /* *//* */ //**********************************************
                    //Alert("Find_Waves()  Wave1.A._Time: ",  Wave1.A._Time, "     Wave1.Z._Price: ",  Wave1.Z._Price, "    .Wave1.Z._Time: ", Wave1.Z._Time, "  Wave1.Z._Price: ", Wave1.Z._Price, "    _ZigZags_12_5_3_Current._CZZ_Point[4].Shift: ", _ZigZags_12_5_3_Current._CZZ_Point[4].Shift ); //
          }
          {         Wave0_1_4_5_Middle.A._Shift = _ZigZags_12_5_3_Current._CZZ_Point[4 + ZZG]._Shift + MathAbs(_ZigZags_12_5_3_Current._CZZ_Point[5 + ZZG]._Shift - _ZigZags_12_5_3_Current._CZZ_Point[4 + ZZG]._Shift) / 2;
                    Wave0_1_4_5_Middle.A._Price = Wave1.Is_Bulish ? _ZigZags_12_5_3_Current._CZZ_Point[4 + ZZG]._Price - (_ZigZags_12_5_3_Current._CZZ_Point[4 + ZZG]._Price - _ZigZags_12_5_3_Current._CZZ_Point[5 + ZZG]._Price) / 2 : _ZigZags_12_5_3_Current._CZZ_Point[4 + ZZG]._Price + (_ZigZags_12_5_3_Current._CZZ_Point[5 + ZZG]._Price - _ZigZags_12_5_3_Current._CZZ_Point[4 + ZZG]._Price) / 2 ;
                    Wave0_1_4_5_Middle.A._Time  = iTime(NULL, f, Wave0_1_4_5_Middle.A._Shift);; //_ZigZags_12_5_3_Current._CZZ_Point[0].time;//
                    //
                    Wave0_1_4_5_Middle.Z._Shift = MathAbs(_ZigZags_12_5_3_Current._CZZ_Point[1 + ZZG]._Shift - _ZigZags_12_5_3_Current._CZZ_Point[0 + ZZG]._Shift) / 2;
                    Wave0_1_4_5_Middle.Z._Price = Wave5.Is_Bulish ? _ZigZags_12_5_3_Current._CZZ_Point[0 + ZZG]._Price - (_ZigZags_12_5_3_Current._CZZ_Point[0 + ZZG]._Price - _ZigZags_12_5_3_Current._CZZ_Point[1 + ZZG]._Price) / 2 : _ZigZags_12_5_3_Current._CZZ_Point[0 + ZZG]._Price + (_ZigZags_12_5_3_Current._CZZ_Point[1 + ZZG]._Price - _ZigZags_12_5_3_Current._CZZ_Point[0 + ZZG]._Price) / 2 ;
                    //////--  Alert("GDS.Wave0_1_4_5_Middle.Z._Price: ", Wave0_1_4_5_Middle.Z._Price);
                    Wave0_1_4_5_Middle.Z._Time  = iTime(NULL, f, Wave0_1_4_5_Middle.Z._Shift);; //_ZigZags_12_5_3_Current._CZZ_Point[0].time;//
                    //---
                    Wave0_1_4_5_Middle.SetUp(f, Wave0_1_4_5_Middle.A._Shift, Wave0_1_4_5_Middle.A._Price, Wave0_1_4_5_Middle.A._Time, Wave0_1_4_5_Middle.Z._Shift, Wave0_1_4_5_Middle.Z._Price, Wave0_1_4_5_Middle.Z._Time, Wave0_1_4_5_Middle, Wave0_1_4_5_Middle);
                    //---Alert("Wave0_1_4_5_Middle.A._Shift: ", Wave0_1_4_5_Middle.A._Shift, "  Wave0_1_4_5_Middle.A._Price: ", Wave0_1_4_5_Middle.A._Price, "  Wave0_1_4_5_Middle.A._Time: ", Wave0_1_4_5_Middle.A._Time);
                    //---Alert("Wave0_1_4_5_Middle.Z._Shift: ", Wave0_1_4_5_Middle.Z._Shift, "  Wave0_1_4_5_Middle.Z._Price: ", Wave0_1_4_5_Middle.Z._Price, "  Wave0_1_4_5_Middle.Z._Time: ", Wave0_1_4_5_Middle.Z._Time); ///
          }
          //
          Find_Lowest_Highest();
          //
          {         //Cheack is Uptend forwarding..
                    Is_TrendUp_Forwarding                = ( Wave5.Z._Price >  Wave5.A._Price) && ( Wave3.Z._Price >  Wave3.A._Price) ? true : false;
                    Is_TrendUp_Forwarding_Correcting     = ( Wave2.A._Price >  Wave2.Z._Price) && ( Wave4.Z._Price >  Wave2.Z._Price) ? true : false;
                    Is_TrendDown_Forwarding_Correcting   = ( Wave2.A._Price <  Wave2.Z._Price) && ( Wave4.Z._Price <  Wave2.Z._Price) ? true : false; //
                    Is_Bulish_TL_2_4                       = ( Wave4.Z._Price >  Wave2.Z._Price) ? true : false;
                    Is_Bulish_TL_1_3                       = ( Wave3.Z._Price >  Wave1.Z._Price) ? true : false;
                    //
          }
          //
          Calc_FiboRet_LastPrice__Lowest_Highest_Shape();
          //*** Cheack wave is Ellot
          {         //********************************************************************
                    //# I       wave2_Highth < Wave1 * 0.50
                    //# II      wave3_Highth > Wave2
                    //# III     wave4_Highth < Wave3 * 0.50 && wave4.Z > Wave1.Z * 1.10
                    //# IV
                    //********************************************************************
                    bool Cond_Is_wave2 =  Wave1.Highth > Wave2.Highth;
                    bool Cond_Is_wave4 =  Wave3.Highth > Wave4.Highth;
                    bool Cond_Is_wave3 =  Wave3.Highth > Wave1.Highth;
                    //
                    Is_Ellot_Standard = (Cond_Is_wave2 && Cond_Is_wave4 && Cond_Is_wave3 ) ? true : false;
                    //Alert("Is_Ellot_Standard: ",Is_Ellot_Standard);
                    //
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void S_ElliotsWave3::Find_Lowest_Highest()
{         //
          //---a b c d e f
          double Little = 0, Grater = 0;
          {         double n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;
                    n1  = Wave1.A._Price;
                    n2  = Wave2.A._Price;
                    n3  = Wave3.A._Price;
                    n4  = Wave4.A._Price;
                    n5  = Wave5.A._Price;
                    n6  = Wave1.Z._Price;
                    n7  = Wave2.Z._Price;
                    n8  = Wave3.Z._Price;
                    n9  = Wave4.Z._Price;
                    n10 = Wave5.Z._Price;
                    if (n1 <= n2 && n1 <= n3 && n1 <= n4 && n1 <= n5 && n1 <= n6 && n1 <= n7 && n1 <= n8 && n1 <= n9 && n1 <= n10)               {Little = n1; Wave1.A.Is_Lowest = true; Point_Lowest = Wave1.A; }
                    //the largest number.", n1
                    //
                    // if n2 is greater than both n1 and n3, n2 is the largest0
                    if (n2 <= n1 && n2 <= n3 && n2 <= n4 && n2 <= n5 && n2 <= n6 && n2 <= n7 && n2 <= n8 && n2 <= n9 && n2 <= n10)               {Little = n2; Wave2.A.Is_Lowest = true; Point_Lowest = Wave2.A;}
                    //the largest number.", n2
                    //
                    // if n3 is greater than both n1 and n2, n3 is the largest
                    if (n3 <= n1 && n3 <= n2 && n3 <= n4 && n3 <= n5 && n3 <= n6 && n3 <= n7 && n3 <= n8 && n3 <= n9 && n3 <= n10)               {Little = n3; Wave3.A.Is_Lowest = true; Point_Lowest = Wave3.A;}
                    //the largest number.", n3
                    // if n1 is greater than both n2 and n3, n1 is the largest
                    if (n4 <= n1 && n4 <= n2 && n4 <= n3 && n4 <= n5 && n4 <= n6 && n4 <= n7 && n4 <= n8 && n4 <= n9 && n4 <= n10)               {Little = n4; Wave4.A.Is_Lowest = true; Point_Lowest = Wave4.A;}
                    //the largest number.", n1
                    //
                    // if n2 is greater than both n1 and n3, n2 is the largest
                    if (n5 <= n1 && n5 <= n2 && n5 <= n3 && n5 <= n4 && n5 <= n6 && n5 <= n7 && n5 <= n8 && n5 <= n9 && n5 <= n10)               {Little = n5; Wave5.A.Is_Lowest = true; Point_Lowest = Wave5.A;}
                    //the largest number.", n2
                    //
                    // if n3 is greater than both n1 and n2, n3 is the largest
                    if (n6 <= n1 && n6 <= n2 && n6 <= n3 && n6 <= n4 && n6 <= n5 && n6 <= n7 && n6 <= n8 && n6 <= n9 && n6 <= n10)               {Little = n6; Wave1.Z.Is_Lowest = true; Point_Lowest = Wave1.Z;}
                    //the largest number.", n3
                    //
                    // if n3 is greater than both n1 and n2, n3 is the largest
                    if (n7 <= n1 && n7 <= n2 && n7 <= n3 && n7 <= n4 && n7 <= n5 && n7 <= n6 && n7 <= n8 && n7 <= n9 && n7 <= n10)               {Little = n7; Wave2.Z.Is_Lowest = true; Point_Lowest = Wave2.Z;}
                    //the largest number.", n3
                    // if n2 is greater than both n1 and n3, n2 is the largest
                    if (n8 <= n1 && n8 <= n2 && n8 <= n3 && n8 <= n4 && n8 <= n5 && n8 <= n6 && n8 <= n7 && n8 <= n9 && n8 <= n10 )              {Little = n8; Wave3.Z.Is_Lowest = true; Point_Lowest = Wave3.Z;}
                    //the largest number.", n2
                    //
                    // if n3 is greater than both n1 and n2, n3 is the largest
                    if (n9 <= n1 && n9 <= n2 && n9 <= n3 && n9 <= n4 && n9 <= n5 && n9 <= n6 && n9 <= n7 && n9 <= n8 && n9 <= n10)               {Little = n9; Wave4.Z.Is_Lowest = true; Point_Lowest = Wave4.Z;}
                    //the largest number.", n3
                    //
                    // if n3 is greater than both n1 and n2, n3 is the largest
                    if (n10 <= n1 && n10 <= n2 && n10 <= n3 && n10 <= n4 && n10 <= n5 && n10 <= n6 && n10 <= n7 && n10 <= n8 && n10 <= n9)       {Little = n10; Wave5.Z.Is_Lowest = true; Point_Lowest = Wave5.Z;}
                    //********************************
          }
          //---a b c d e f
          {         double n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;
                    n1  = Wave1.A._Price;
                    n2  = Wave2.A._Price;
                    n3  = Wave3.A._Price;
                    n4  = Wave4.A._Price;
                    n5  = Wave5.A._Price;
                    n6  = Wave1.Z._Price;
                    n7  = Wave2.Z._Price;
                    n8  = Wave3.Z._Price;
                    n9  = Wave4.Z._Price;
                    n10 = Wave5.Z._Price;
                    // if n1 is greater than both n2 and n3, n1 is the largest
                    if (n1 >= n2 && n1 >= n3 && n1 >= n4 && n1 >= n5 && n1 >= n6 && n1 >= n7 && n1 >= n8 && n1 >= n9 && n1 >= n10)               {Grater = n1; Wave1.A.Is_Highest = true; Point_Highest = Wave1.A;}
                    //the largest number.", n1
                    //
                    // if n2 is greater than both n1 and n3, n2 is the largest0
                    if (n2 >= n1 && n2 >= n3 && n2 >= n4 && n2 >= n5 && n2 >= n6 && n2 >= n7 && n2 >= n8 && n2 >= n9 && n2 >= n10)               {Grater = n2; Wave2.A.Is_Highest = true; Point_Highest = Wave2.A;}
                    //the largest number.", n2
                    //
                    // if n3 is greater than both n1 and n2, n3 is the largest
                    if (n3 >= n1 && n3 >= n2 && n3 >= n4 && n3 >= n5 && n3 >= n6 && n3 >= n7 && n3 >= n8 && n3 >= n9 && n3 >= n10)               {Grater = n3; Wave3.A.Is_Highest = true; Point_Highest = Wave3.A;}
                    //the largest number.", n3
                    // if n1 is greater than both n2 and n3, n1 is the largest
                    if (n4 >= n1 && n4 >= n2 && n4 >= n3 && n4 >= n5 && n4 >= n6 && n4 >= n7 && n4 >= n8 && n4 >= n9 && n4 >= n10)               {Grater = n4; Wave4.A.Is_Highest = true; Point_Highest = Wave4.A;}
                    //the largest number.", n1
                    //
                    // if n2 is greater than both n1 and n3, n2 is the largest
                    if (n5 >= n1 && n5 >= n2 && n5 >= n3 && n5 >= n4 && n5 >= n6 && n5 >= n7 && n5 >= n8 && n5 >= n9 && n5 >= n10)               {Grater = n5; Wave5.A.Is_Highest = true; Point_Highest = Wave5.A;}
                    //the largest number.", n2
                    //
                    // if n3 is greater than both n1 and n2, n3 is the largest
                    if (n6 >= n1 && n6 >= n2 && n6 >= n3 && n6 >= n4 && n6 >= n5 && n6 >= n7 && n6 >= n8 && n6 >= n9 && n6 >= n10)               {Grater = n6; Wave1.Z.Is_Highest = true; Point_Highest = Wave1.Z;}
                    //the largest number.", n3
                    //
                    // if n3 is greater than both n1 and n2, n3 is the largest
                    if (n7 >= n1 && n7 >= n2 && n7 >= n3 && n7 >= n4 && n7 >= n5 && n7 >= n6 && n7 >= n8 && n7 >= n9 && n7 >= n10)               {Grater = n7; Wave2.Z.Is_Highest = true; Point_Highest = Wave2.Z;}
                    //the largest number.", n3
                    // if n2 is greater than both n1 and n3, n2 is the largest
                    if (n8 >= n1 && n8 >= n2 && n8 >= n3 && n8 >= n4 && n8 >= n5 && n8 >= n6 && n8 >= n7 && n8 >= n9 && n8 >= n10 )              {Grater = n8; Wave3.Z.Is_Highest = true; Point_Highest = Wave3.Z;}
                    //the largest number.", n2
                    //
                    // if n3 is greater than both n1 and n2, n3 is the largest
                    if (n9 >= n1 && n9 >= n2 && n9 >= n3 && n9 >= n4 && n9 >= n5 && n9 >= n6 && n9 >= n7 && n9 >= n8 && n9 >= n10)               {Grater = n9; Wave4.Z.Is_Highest = true; Point_Highest = Wave4.Z;}
                    //the largest number.", n3
                    //
                    // if n3 is greater than both n1 and n2, n3 is the largest
                    if (n10 >= n1 && n10 >= n2 && n10 >= n3 && n10 >= n4 && n10 >= n5 && n10 >= n6 && n10 >= n7 && n10 >= n8 && n10 >= n9)       {Grater = n10; Wave5.Z.Is_Highest = true; Point_Highest = Wave5.Z;}
                    //the largest number.", n3
                    //********************************
          }
          // Alert("Wave_Highest name: ", Wave_Highest.name, "  Grater:", Grater);
          // Alert("Wave_Lowest name: ", Wave_Lowest.name, "  Little:", Little);
          //
          //
}
//+------------------------------------------------------------------+
