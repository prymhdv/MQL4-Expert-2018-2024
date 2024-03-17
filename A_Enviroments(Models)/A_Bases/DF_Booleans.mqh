//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
struct Bool_Two
{         bool IsA, IsB;
          bool getIsTrue()      { return IsA && IsB;   }
          bool getIsFalse()     { return !getIsTrue(); }
          bool getIsXor()       { return (!IsA && IsB) || (IsA && !IsB); }
          //
};
struct Bool_Three
{         bool IsA, IsB, IsC;
          bool getIsTrue()      { return IsA && IsB && IsC;   }
          bool getIsFalse()     { return !getIsTrue(); }
          bool getIsXor()       { return (!IsA && IsB && IsC) || (IsA && !IsB && IsC) || (IsA && IsB && !IsC); }
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct BoolWight
{         BoolWight() {};
          BoolWight(bool _IsBasicTrue, int _int_Weght ) { IsBasicTrue = _IsBasicTrue; int_Weght = _int_Weght ;};
          bool          IsBasicTrue;
          int           int_Weght;//--maximum is 100
          double        dbl_Weght;//--maximum is 0.00 - 1.00
          void set( bool _IsBasicTrue, int _int_Weght )     { IsBasicTrue = _IsBasicTrue; int_Weght = _int_Weght;  }//
          //
};
BoolWight Decition_One;
BoolWight Decition_Two(true, 10);
void ftest_BoolWight()
{         Decition_One.set(true, 10);
          Decition_One.IsBasicTrue = false;
          Decition_One.int_Weght = 2;//
          Decition_One.dbl_Weght = 0.2;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct BoolPercent //--Sg_
{         BoolPercent() {};
          BoolPercent(bool _IsBasic, int _Percent )             { IsBasic = _IsBasic; Percent = _Percent ;};
          bool          IsBasic;
          int           Percent;//--maximum is 100
          void          set( bool _IsBasic, int _Percent )      { IsBasic = _IsBasic; Percent = _Percent;  }//
          //---
          bool IsXAND_1npX(int p)               {return ( IsBasic && Percent == p);     }
          bool IsXAND_1npX_Grater(int p)        {return ( IsBasic && Percent > p);      }
          bool IsXAND_1npX_Lower(int p)         {return ( IsBasic && Percent < p);      }
          //---
          bool IsntXAND_1npX(int p)             {return ( !IsBasic && Percent == p);    }
          bool IsntXAND_1npX_Grater(int p)      {return ( !IsBasic && Percent > p);     }
          bool IsntXAND_1npX_Lower(int p)       {return ( !IsBasic && Percent < p);     }
          //---
          bool IsAND_10p()  {return ( IsBasic && Percent == 10);}
          bool IsAND_20p()  {return ( IsBasic && Percent == 20);}
          bool IsAND_30p()  {return ( IsBasic && Percent == 30);}
          bool IsAND_40p()  {return ( IsBasic && Percent == 40);}
          bool IsAND_50p()  {return ( IsBasic && Percent == 50);}
          bool IsAND_60p()  {return ( IsBasic && Percent == 60);}
          bool IsAND_70p()  {return ( IsBasic && Percent == 70);}
          bool IsAND_80p()  {return ( IsBasic && Percent == 80);}
          bool IsAND_90p()  {return ( IsBasic && Percent == 90);}
          bool IsAND_100p() {return ( IsBasic && Percent == 100);}
          //---
          bool IsAND_10n()  {return ( IsBasic && Percent == -10);}
          bool IsAND_20n()  {return ( IsBasic && Percent == -20);}
          bool IsAND_30n()  {return ( IsBasic && Percent == -30);}
          bool IsAND_40n()  {return ( IsBasic && Percent == -40);}
          bool IsAND_50n()  {return ( IsBasic && Percent == -50);}
          bool IsAND_60n()  {return ( IsBasic && Percent == -60);}
          bool IsAND_70n()  {return ( IsBasic && Percent == -70);}
          bool IsAND_80n()  {return ( IsBasic && Percent == -80);}
          bool IsAND_90n()  {return ( IsBasic && Percent == -90);}
          bool IsAND_100n() {return ( IsBasic && Percent == -100);}
          //---
          //---
          bool IsntAND_10p()  {return ( !IsBasic && Percent == 10);}
          bool IsntAND_20p()  {return ( !IsBasic && Percent == 20);}
          bool IsntAND_30p()  {return ( !IsBasic && Percent == 30);}
          bool IsntAND_40p()  {return ( !IsBasic && Percent == 40);}
          bool IsntAND_50p()  {return ( !IsBasic && Percent == 50);}
          bool IsntAND_60p()  {return ( !IsBasic && Percent == 60);}
          bool IsntAND_70p()  {return ( !IsBasic && Percent == 70);}
          bool IsntAND_80p()  {return ( !IsBasic && Percent == 80);}
          bool IsntAND_90p()  {return ( !IsBasic && Percent == 90);}
          bool IsntAND_100p() {return ( !IsBasic && Percent == 100);}
          //---
          bool IsntAND_10n()  {return ( !IsBasic && Percent == -10);}
          bool IsntAND_20n()  {return ( !IsBasic && Percent == -20);}
          bool IsntAND_30n()  {return ( !IsBasic && Percent == -30);}
          bool IsntAND_40n()  {return ( !IsBasic && Percent == -40);}
          bool IsntAND_50n()  {return ( !IsBasic && Percent == -50);}
          bool IsntAND_60n()  {return ( !IsBasic && Percent == -60);}
          bool IsntAND_70n()  {return ( !IsBasic && Percent == -70);}
          bool IsntAND_80n()  {return ( !IsBasic && Percent == -80);}
          bool IsntAND_90n()  {return ( !IsBasic && Percent == -90);}
          bool IsntAND_100n() {return ( !IsBasic && Percent == -100);}
          //---
};
BoolPercent Decition_BoolPercent;
BoolPercent Decition_BoolPercent_Two(true, 10);
void ftest_BoolPercent()
{         Decition_BoolPercent.set(true, 10);
          Decition_BoolPercent.IsBasic = false;
          Decition_BoolPercent.Percent = 2;//
          if(Decition_BoolPercent.IsBasic && Decition_BoolPercent.Percent == 10)
          {}
          if(Decition_BoolPercent.IsBasic && Decition_BoolPercent.Percent == 30)
          {}
          if(Decition_BoolPercent.IsBasic && Decition_BoolPercent.Percent == 50)
          {}
          if(Decition_BoolPercent.IsBasic && Decition_BoolPercent.Percent == 80)
          {}
          if(Decition_BoolPercent.IsBasic && Decition_BoolPercent.Percent == 100)
          {}
          //
          Decition_BoolPercent.IsAND_100p();
          Decition_BoolPercent.IsntAND_100n();
          Decition_BoolPercent.IsXAND_1npX_Grater(55);
          Decition_BoolPercent.IsntXAND_1npX_Lower(30);
          //
          //
}
//+------------------------------------------------------------------+
