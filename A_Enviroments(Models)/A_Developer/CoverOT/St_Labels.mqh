//+------------------------------------------------------------------+
//||   ||||||||||                 C_FLOWPANEL.mqh                   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+

struct Std_Labels
{         Std_Labels();
          string          _Desc_BuyMarket;////its filed when sending Orders
          string          _Desc_SellMarket;////its filed when sending Orders
          string          _Desc_BuyStop;////its filed when sending Orders
          string          _Desc_BuyLimit;////its filed when sending Orders
          string          _Desc_SellStop;////its filed when sending Orders
          string          _Desc_SellLimit;////its filed when sending Orders


};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Std_Labels::Std_Labels()
{         _Desc_BuyMarket   = "-*-";////its filed when sending Orders
          _Desc_SellMarket  = "-*-";
          _Desc_BuyStop     = "-*-";
          _Desc_BuyLimit    = "-*-";
          _Desc_SellStop    = "-*-";
          _Desc_SellLimit   = "-*-";
          //
}
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
