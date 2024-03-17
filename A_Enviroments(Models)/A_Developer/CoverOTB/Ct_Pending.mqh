//+------------------------------------------------------------------+
//|                                                      Ct_Pending.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|             Class Ct_Pending::     BEGIN                             | ///////Money Manager////////          ///////Money Manager////////
//+------------------------------------------------------------------+
class Ct_Pending
{
private:

public:
          void           Ct_Pending();
          void           ~Ct_Pending() {};
          bool           Update(int PP_Fixed_Pip);////  if(true)//Calcing TPSLPP
          //----------------------
          int            Curr_Pip,    Fixed_Pip,        INP_Pip,  Curr_RiskedPendingPips;//
          double         PendingAmount(double PendingPipsCom);
          void           UpdateAdditionalFixedPP(int i);
          double         PPAmount;


          //----------------------

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Ct_Pending::Ct_Pending()
{         RunCallFunction++; ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Pending Error",  __LINE__, __FUNCTION__); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Ct_Pending::PendingAmount(double PendingPipsCom)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
          return (PPAmount = PendingPipsCom * Point); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Pending::Update(int PP_Fixed_Pip)//  if(true)//Calcing TPSLPP
{         Fixed_Pip = PP_Pip_Fixed_inp;//300; //Pipet
          if(true)//ManualModeGet
          {         if(ObjectFind(0, "S_EDIT " + "Set PP..") >= 0)
                    {         if(Utilities.StringLieraled("S_EDIT " + "Set PP.." )) { ObjectSetString(0, "S_EDIT " + "Set PP..", OBJPROP_TEXT, "Set PP.."); }
                              if(ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_PP_Ok)                               { INP_Pip = (int)Utilities.DescToDouble("S_EDIT " + "Set PP.."); } //
                    } //
                    //Alert(" Curr_Pip: ", Curr_Pip, " INP: ", INP, " bank_Pad.SetPPOk:", bank_Pad.SetPPOk, "--Line:", __LINE__);//
          }
          else if(! ct_Drive.TDD.ct_Bank.Is_MoneyManagerPad)//AutoModeGet
          {         INP_Pip       = (int)((Ask - Bid) + (Bid * 0.005)); }
          //---------------------------------------------------Assignment
          Curr_Pip                      = INP_Pip;                //Alert(" Curr_Pip: ", Curr_Pip, " INP: ", INP, " bank_Pad.SetPPOk:", bank_Pad.SetPPOk, "--Line:", __LINE__);
          //---------------------------------------------------checking & verifying
          if (Curr_Pip < 300)        {Curr_Pip = Fixed_Pip;}//
          //---------------------------------------------------GetAmount TPSLPP
          PendingAmount(Curr_Pip); //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
          return true;//
}
//+------------------------------------------------------------------+
//|             Class Ct_Pending::     BEGIN                             | ///////Money Manager////////          ///////Money Manager////////
//+------------------------------------------------------------------+
