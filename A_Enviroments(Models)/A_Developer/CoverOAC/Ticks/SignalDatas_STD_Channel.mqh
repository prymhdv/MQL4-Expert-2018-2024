//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Ticks\StandardDevitionChannel.mqh>

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class SignalDatas_STD_Channel
{
public:
          SignalDatas_STD_Channel(void) {};
          ~SignalDatas_STD_Channel(void) {};
          bool       IsSTDxBulish;
          bool       IsPrice_Cross_upper161;
          bool       IsPrice_Cross_lower161;
          //----------------------------------------------------------
          void       Update(string Pfname, ENUM_TIMEFRAMES f, int BarSart = 0, int BarCount = 333, double Devi = 1)
          {         //---draw standard devition
                    {         startDev(Pfname, f, BarSart, BarCount, Devi); //2.61
                    }
                    //
                    IsSTDxBulish = ObjectGetValueByShift(Pfname + EnumToString(f) + " STDxTOP" + "1.00", 0) > ObjectGetValueByShift(Pfname + EnumToString(f) + "STDxTOP" + "1.00", 1);
                    //
                    IsPrice_Cross_upper161 = ObjectGetValueByShift(Pfname + EnumToString(f) + " STDxTOP" + "1.61", 0) < Ask;
                    IsPrice_Cross_lower161 = ObjectGetValueByShift(Pfname + EnumToString(f) + " STDxBTM" + "1.61", 0) > Bid;
                    //
          } //
          void       startDev(string Pfname, ENUM_TIMEFRAMES tf, int BarSart, int BarCount, double Devi)
          {         ObjectsDeleteAll(0, Pfname);
                    StandardDevitionChannel STDChannel_100(Pfname, tf, BarSart, BarCount, Devi = 1.00, STYLE_DOT, clrWhite, 1, 0);
                    StandardDevitionChannel STDChannel_161(Pfname, tf, BarSart, BarCount, Devi = 1.61, STYLE_SOLID, clrRed, 2, 0);
                    StandardDevitionChannel STDChannel_200(Pfname, tf, BarSart, BarCount, Devi = 2.00, STYLE_DOT, clrWhite, 1, 0);
                    StandardDevitionChannel STDChannel_261(Pfname, tf, BarSart, BarCount, Devi = 2.61, STYLE_SOLID, clrYellow, 2, 0);
                    StandardDevitionChannel STDChannel_300(Pfname, tf, BarSart, BarCount, Devi = 3.00, STYLE_DOT, clrWhite, 1, 0);
                    StandardDevitionChannel STDChannel_361(Pfname, tf, BarSart, BarCount, Devi = 3.61, STYLE_SOLID, clrGreen, 2, 0);
                    //-------------------------------------------------------------------------------+
          }//
};
//+------------------------------------------------------------------+
