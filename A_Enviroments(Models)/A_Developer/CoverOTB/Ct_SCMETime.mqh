//+------------------------------------------------------------------+
//|                                                     Ct_SCMETime.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|             Class C_BANK::     BEGIN                             | ///////Money Manager////////          ///////Money Manager////////
//+------------------------------------------------------------------+
struct St_Expiration
{         datetime         BuyMarket;
          datetime         BuyLimit;
          datetime         BuyStop;
          datetime         SellMarket;
          datetime         SellLimit;
          datetime         SellStop;
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Ct_SCMETime //Manage Trade Time Data
{
private:

public:
          void           Ct_SCMETime();
          void           ~Ct_SCMETime() {};
          //----------------
          bool           Update();
          //===============================================================Date Data
          int            ExpirationInp ;
          St_Expiration  Expiration;



          //------------------
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Ct_SCMETime::Ct_SCMETime()
{         RunCallFunction++; ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_SCMETime Error",  __LINE__, __FUNCTION__); //
          //Alert("Ct_SCMETime::Ct_SCMETime()");//
}
//+------------------------------------------------------------------+
bool Ct_SCMETime::Update()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|'
          //===============================================================Date Data
          ExpirationInp         = Day();
          Expiration.BuyMarket  = ExpirationInp; ///iTime(NULL, PERIOD_M1, 14);      ;
          Expiration.BuyStop    = ExpirationInp;
          Expiration.BuyLimit   = ExpirationInp;
          Expiration.SellMarket = ExpirationInp;
          Expiration.SellStop   = ExpirationInp;
          Expiration.SellLimit  = ExpirationInp;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
          return true;//
}
//+------------------------------------------------------------------+
//|             Class C_BANK::     BEGIN                             | ///////Money Manager////////          ///////Money Manager////////
//+------------------------------------------------------------------+
