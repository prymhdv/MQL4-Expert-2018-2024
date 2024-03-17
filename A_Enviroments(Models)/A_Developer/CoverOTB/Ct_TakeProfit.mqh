//+------------------------------------------------------------------+
//|                                                   Ct_TakeProfit.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|             Class Ct_TakeProfit::     BEGIN                             | ///////Money Manager////////          ///////Money Manager////////
//+------------------------------------------------------------------+
class Ct_TakeProfit
{
private:

public:
          void           Ct_TakeProfit();
          void           ~Ct_TakeProfit() {};
          bool           Update(int TP_Fixed_Pip);//  if(true)//Calcing TPSLPP
          //---------------------------
          int            Curr_Pip,     Fixed_Pip,        INP_Pip,  RiskedTakeProfit_Pip;//
          double         TakeProfitAmount(double TakeProfitCom);

          double         TPAmount;

          void           UpdateAdditionalFixedTP(int i);


          string         WarningTP;    //= "";
          bool           SetTP(int Type, int op_tkt, double TakeProfitCom);

          //-----------------------------
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Ct_TakeProfit::Ct_TakeProfit()
{         RunCallFunction++; ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_TakeProfit Error",  __LINE__, __FUNCTION__); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_TakeProfit::SetTP(int Type, int op_tkt, double TakeProfitCom)
{
//================================================
          if(Type == OP_BUY)
          {         if( TakeProfitCom > 0 && TakeProfitCom >= ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_STOPLEVEL)
                    {         if(OrderSelect(op_tkt, SELECT_BY_TICKET, MODE_TRADES))
                              {         if(!OrderModify(OrderTicket(), OrderOpenPrice(), OrderStopLoss(), OrderOpenPrice() + TakeProfitCom * _Point, 0, std_Global.COLOR_BUY))
                                        {         //-- Error
                                                  Print("Error in OrderModify. Error code=", _LastError);
                                                  Sound.PlaySoundS(Sound.ErrorSound );
                                                  Sleep(________________________________________________________Xerorr.ErrorInterval); }
                                        else
                                        {         //-- Succeeded
                                                  //Print("ct_Order modified successfully");
                                        } //
                              } //
                    }//
          }//
          if(Type == OP_SELL )
          {         //
                    if(TakeProfitCom > 0 && TakeProfitCom >= ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_STOPLEVEL)
                    {         if(OrderSelect(op_tkt, SELECT_BY_TICKET, MODE_TRADES))
                              {         if(!OrderModify(OrderTicket(), OrderOpenPrice(), OrderStopLoss(), OrderOpenPrice() - TakeProfitCom * _Point, 0, std_Global.COLOR_BUY))
                                        {         //-- Error
                                                  Print("Error in OrderModify. Error code=", _LastError);
                                                  Sound.PlaySoundS(Sound.ErrorSound );
                                                  Sleep(________________________________________________________Xerorr.ErrorInterval); }
                                        else
                                        {         //-- Succeeded
                                                  //Print("ct_Order modified successfully");*/
                                        } //
                              }//
                    } //
          }//
//================================================
          return true;//
//================================================
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Ct_TakeProfit::TakeProfitAmount(double TakeProfitCom)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
          if(false) // Check and adjust for TickSize granularity.
          {         //if (TickSize > 0)
                    // {         sets.TakeProfitLevel = NormalizeDouble(MathRound(sets.TakeProfitLevel / TickSize) * TickSize, _Digits);
                    //          ObjectSetDouble(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_PRICE, sets.TakeProfitLevel); }
                    // sets.TakeProfit = (int)MathRound(MathAbs(sets.TakeProfitLevel - sets.EntryLevel) / _Point); //
          }
          return (TPAmount = TakeProfitCom * Point); //
}
//+------------------------------------------------------------------+
//| Update Additional Fixed TP distance in pips if the line got      |
//| moved. Used when multiple TPs are set.                           |
//+------------------------------------------------------------------+
void Ct_TakeProfit::UpdateAdditionalFixedTP(int i)
{         if(false)
          {
//               double read_value;
//                    if (!ObjectGetDouble(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_PRICE, 0, read_value)) return; // Update only if line exists.
//                    else sets.ScriptTP[i] = read_value;
//// Check and adjust for TickSize granularity.
//                    if (TickSize > 0)
//                    {         sets.ScriptTP[i] = NormalizeDouble(MathRound(sets.ScriptTP[i] / TickSize) * TickSize, _Digits);
//                              ObjectSetDouble(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_PRICE, sets.ScriptTP[i]); }
//                    AdditionalTPEdits[i - 1].Text(IntegerToString((int)MathRound(MathAbs(sets.ScriptTP[i] - sets.EntryLevel) / _Point))); //
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_TakeProfit::Update(int TP_Fixed_Pip)//  if(true)//Calcing TPSLPP
{         Fixed_Pip = TP_Fixed_Pip;//200; //Pipet
          if(true)//ManualModeGet
          {         if(ObjectFind(0, "S_EDIT " +"Set TP..") >= 0)
                    {         if(Utilities.StringLieraled("S_EDIT " +"Set TP.." )) { ObjectSetString(0, "S_EDIT " +"Set TP..", OBJPROP_TEXT, "Set TP.."); }
                              if(ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_TP_Ok)                      { INP_Pip = (int)Utilities.DescToDouble("S_EDIT " +"Set TP.."); }//
                    } //
          }
          else if(! ct_Drive.TDD.ct_Bank.Is_MoneyManagerPad)//AutoModeGet
          {         INP_Pip       = (int)MathRound(MathAbs(Ask - Bid) + Bid * 0.01) ;   }
          //---------------------------------------------------Assignment
          Curr_Pip                       = INP_Pip;                //Alert(" TakeProfit: ", TakeProfit, " INP: ", INP, " bank_Pad.SetTPOk:", bank_Pad.SetTPOk, "--Line:", __LINE__);
          //---------------------------------------------------checking & verifying
          if (Curr_Pip < 200)         {Curr_Pip  = Fixed_Pip;}
          //---------------------------------------------------GetAmount TPSLPP
          TakeProfitAmount(Curr_Pip);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
          return true;//
}
//+------------------------------------------------------------------+
//|             Class Ct_TakeProfit::     BEGIN                             | ///////Money Manager////////          ///////Money Manager////////
//+------------------------------------------------------------------+
