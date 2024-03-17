/* Get Price Volume by reaprite */
#property strict
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Texts\oTexts.mqh>;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Lines\oLines.mqh>;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOGC\.CoverOGC.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct S_BoxParam
{         color        clr;
          datetime     TimeStart;
          datetime     TimeEnd;
          double       PriceDown;
          double       PriceTop;

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_Box
{
public:
          C_Box(void) {};
          ~C_Box(void) {};
          long       VolumePart;
          long       VolumePartNet;
          double     PricePart;
          bool       IsBulish;
          int        bulishWeith;
          //***********************
          //Cgs_DevObjectPack Object_Pack;//--caused not resuze for extra memory
          //***********************
          void       Update(string s, int i, bool isKey, S_BoxParam &BoxParam)
          {         //***************************************************************************************
                    //Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, isKey, "Rect." + s, false, BoxParam.TimeStart, BoxParam.PriceDown, BoxParam.TimeEnd, BoxParam.PriceTop, BoxParam.clr, true);//
                    //
          }
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_HalfSide
{
public:
          C_HalfSide(int s) {ArrayResize(Box, s);  };
          C_HalfSide(void) {ArrayResize(Box, 10);  };
          ~C_HalfSide(void) {};//
          C_Box      Box[];//
          void       Update(string s, bool b)
          {         /*for(int i = 0; i < ArraySize(Box); i++)
                    {         datetime diffTime = 0;
                              if(StringFind(s, "Left") > 1)
                              {         diffTime -=  (datetime)(( VolumePart ) / 1 ); //(pricevolume[ArraySize(pricevolume) - 1 - i].VolumeAll //---VolumeAllBulish                 pricevolume[i].VolumeAllBulish         BoxesBuys[i].BoxVolumeBulish
                              }//
                              if(StringFind(s, "Right") > -1)
                              {         diffTime +=  (datetime)((VolumePart) / 1);//((PeriodSeconds() *  VolumeNET) / 15)//-----VolumeAllBearish                          pricevolume[i].Price                pricevolume[i].VolumeAllBearish         BoxesSells[i].BoxVolumeBearish
                              }//
                              //***************************************************************************************
                              S_BoxParam  BoxParam;
                              BoxParam.clr              = (StringFind(s, "Left") > 1) ? clrDarkTurquoise : clrTomato;;
                              BoxParam.TimeStart        = iTime(Symbol(), PERIOD_CURRENT, 0) + PeriodSeconds(PERIOD_CURRENT) * 75;;
                              BoxParam.TimeEnd          = diffTime;
                              BoxParam.PriceTop         = iClose(Symbol(), PERIOD_CURRENT, i) + 49 * Point();
                              BoxParam.PriceDown        = iClose(Symbol(), PERIOD_CURRENT, i);
                              Box[i].Update(s + (string)i, i, b, BoxParam); //
                    }//
                    */
                    //
          }//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_Side
{
public:
          C_Side(void) { };
          ~C_Side(void) {}; //
          C_HalfSide Upper, Downler; //
          void       Update(string s, bool b)
          {         Upper   = C_HalfSide(10);
                    Downler = C_HalfSide(10); ; //
                    Upper.Update(s + "Upper", b);
                    Downler.Update(s + "Downler", b);
                    //
          } //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_Book
{
public:
          C_Book(void) {};
          ~C_Book(void) {};
          C_Side     Right, Left;//
          //***************************************************
          double       SumVolumeAll;      //--long value / not worked!!!
          double       SumVolumeBuys;
          double       SumVolumeSells;
          double       VolumeNetAll;
          //***************************************************
          C_Box      Box[];
          float      DayCount;
          //***************************************************
          Cgs_DevObjectPack Object_Pack;
          //***************************************************
          void       Update(string s, bool b)
          {         ///****************
                    Oprate();
                    ///****************
                    /// Create Book AS Requested
                    //Right.Update(s + "Right", b);
                    //Left.Update(s + "Left", b);
                    ///****************
                    for(int i = 0; i < ArraySize(Box); i++)
                    {         Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, false, "Rect." + s + (string)i, "", false, 0, 0, 0, 0, 0, true); //
                              Object_Pack.Texts.Description.Draw_GDS_Text(MODE_CREATE, false, "Txt." + s + (string)i, "", 0, 0, clrWhite, "Arial", 10, ANCHOR_CENTER, 0, false); //
                              datetime diffTime = 0;
                              if(Box[i].VolumePart < 1) continue;
                              if(Box[i].bulishWeith > 0)
                              {         diffTime +=  (datetime)(( Box[i].VolumePartNet ) / 1 ); //pricevolume[i].VolumeAllBulish         BoxesBuys[i].BoxVolumeBulish
                              }//
                              if(Box[i].bulishWeith < 0)
                              {         diffTime +=  (datetime)((Box[i].VolumePartNet) / 1);    //pricevolume[i].Price                pricevolume[i].VolumeAllBearish         BoxesSells[i].BoxVolumeBearish
                              }//
                              S_BoxParam  BoxParam;
                              BoxParam.clr              = (Box[i].bulishWeith > 0) ? clrDarkTurquoise : clrTomato;;
                              BoxParam.TimeStart        = iTime(Symbol(), PERIOD_CURRENT, 0) + PeriodSeconds(PERIOD_CURRENT) * 75;;
                              BoxParam.TimeEnd          = BoxParam.TimeStart + diffTime ;
                              BoxParam.PriceTop         = Box[i].PricePart + 48 * Point();
                              BoxParam.PriceDown        = Box[i].PricePart + 2 * Point();
                              Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, b, "Rect." + s + (string)i, "Rect." + s + (string)i + " " + (string)Box[i].VolumePartNet + "/" + (string)SumVolumeAll, false, BoxParam.TimeStart, BoxParam.PriceDown, BoxParam.TimeEnd, BoxParam.PriceTop, BoxParam.clr, true); //
                              //
                              if(SumVolumeAll == 0)  continue;
                              double Percent;
                              Percent = (double)(MathAbs(Box[i].VolumePartNet) / MathAbs(SumVolumeAll) * 100);
                              //Print(" Percent: ",  DoubleToStrMorePrecision(  Box[i].VolumePartNet /  SumVolumeAll, 10), " (MathAbs(Box[i].VolumePartNet): ", MathAbs(Box[i].VolumePartNet), " SumVolumeAll: ", SumVolumeAll);  /////
                              datetime difftxtTime  = (Box[i].VolumePartNet > 0) ?  + PeriodSeconds() * 5 : - PeriodSeconds() * 5  ;//(Box[i].bulishWeith > 0)
                              color clrTxt = (Box[i].bulishWeith > 0) ? clrWhite  : clrWhite;;
                              Object_Pack.Texts.Description.Draw_GDS_Text(MODE_CREATE, b, "Txt." + s + (string)i, DoubleToString(Percent, 2) + "%", BoxParam.TimeStart + difftxtTime, BoxParam.PriceDown + 25 * Point(), clrTxt, "Arial Bold", 8, ANCHOR_CENTER, 0, false); //
                              //Print(" BoxParam.TimeStart +diffTime: ", TimeToString(BoxParam.TimeStart +diffTime), "  _Box[i].VolumePart : ", (string)Box[i].VolumePart ); //
                    } //
                    double Pricex; datetime timex; int subwin;
                    bool res = ChartXYToTimePrice(0, 0, 30, subwin, timex, Pricex);
                    color clrTXT = VolumeNetAll >= 0 ? clrYellowGreen : clrOrangeRed;
                    Object_Pack.Texts.Description.Draw_GDS_Text(MODE_CREATE, false, "Txt." + "VolumeNetAll", "VolumeNetAll:" + DoubleToString(VolumeNetAll, 0), iTime(Symbol(), PERIOD_CURRENT, 0) + PeriodSeconds(PERIOD_CURRENT) * 75, WindowPriceMax() - 75 * Point(), clrTXT, "Arial Bold", 10, ANCHOR_CENTER, 0, false); //
                    Object_Pack.Texts.Description.Draw_GDS_Text(MODE_CREATE, b, "Txt." + "VolumeNetAll", "VolumeNetAll:" + DoubleToString(VolumeNetAll, 0), iTime(Symbol(), PERIOD_CURRENT, 0) + PeriodSeconds(PERIOD_CURRENT) * 75, Pricex, clrTXT, "Arial Bold", 10, ANCHOR_CENTER, 0, false); //
          }
          void       Oprate()
          {         SumVolumeAll        = 0;
                    SumVolumeBuys       = 0;
                    SumVolumeSells      = 0;
                    DayCount            = 1.25;
                    VolumeNetAll        = 0;
                    //***************************************************
                    for(int i = 0; i < (int)(1440 * DayCount); i++)
                    {         SumVolumeAll      += (double)iVolume(Symbol(), PERIOD_CURRENT, i); //
                              //***************************************************
                              if(iOpen(Symbol(), PERIOD_CURRENT, i) < iClose(Symbol(), PERIOD_CURRENT, i)) {SumVolumeBuys       += (double)iVolume(Symbol(), PERIOD_CURRENT, i); }//
                              //***************************************************
                              if(iOpen(Symbol(), PERIOD_CURRENT, i) > iClose(Symbol(), PERIOD_CURRENT, i)) {SumVolumeSells      += (double)iVolume(Symbol(), PERIOD_CURRENT, i); }//
                              //***************************************************
                    }
                    //***************************************************8000 Parts
                    int Parts = (int)(4000.00000 / (50 * Point())); //Sleep(10);
                    ArrayResize(Box, Parts);
                    int BoxIDX = 0;
                    //***************************************************
                    for(int i = 0; i < ArraySize(Box); i++)
                    {         Box[i].VolumePart     = 0; //
                              Box[i].PricePart      = 0;//
                              Box[i].IsBulish    = 0;//
                              Box[i].bulishWeith = 0; //
                              Box[i].VolumePartNet  = 0; //
                    }//
                    //***************************************************iClose(Symbol(), PERIOD_CURRENT, i)--iClose(Symbol(), PERIOD_CURRENT, i)
                    for(double dplevel = 0.00000; dplevel < 4000.00000; dplevel += 50 * Point())//every 50 point increased
                    {         if(!((iHigh(Symbol(), PERIOD_W1, 0) > dplevel) && (iLow(Symbol(), PERIOD_W1, 0) < dplevel)) ) continue; //betwin week candel bar
                              for(int i = 0; i < (int)(1440 * DayCount); i++)
                              {         if( dplevel <  Close[i] && (dplevel + 50 * Point() >= Close[i] )) //Partion cluster track locked
                                        {         //Print("ArraySize(Box): ",(string)ArraySize(Box)," Parts: ",(string)Parts," BoxIDX: ", (string)BoxIDX);
                                                  Box[BoxIDX].IsBulish = iOpen(Symbol(), PERIOD_CURRENT, i) < iClose(Symbol(), PERIOD_CURRENT, i);//
                                                  Box[BoxIDX].IsBulish ? Box[BoxIDX].bulishWeith++ : Box[BoxIDX].bulishWeith--;
                                                  Box[BoxIDX].IsBulish ? Box[BoxIDX].VolumePartNet += iVolume(Symbol(), PERIOD_CURRENT, i) : Box[BoxIDX].VolumePartNet -= iVolume(Symbol(), PERIOD_CURRENT, i); //net
                                                  Box[BoxIDX].VolumePart += iVolume(Symbol(), PERIOD_CURRENT, i);
                                                  Box[BoxIDX].PricePart   = dplevel;//
                                        }//
                              }//
                              if(BoxIDX < Parts - 1) BoxIDX++; //
                    }
                    for(int i = 0; i < ArraySize(Box); i++)
                    {         VolumeNetAll += (double)Box[i].VolumePartNet;//
                    }
                    //
                    //
          }
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_OrderBookZ
{
public:
          C_OrderBookZ(void) {};
          ~C_OrderBookZ(void) {};
          void       Update();
          //-----------------------
          C_Book       Book;
          //-----------------------
          Cg_Texts   Texts;
          C_Lines    Lines;
          Cgs_DevObjectPack Object_Pack;
          //-----------------------
};
//+------------------------------------------------------------------+
void C_OrderBookZ::Update(void)
{         //1440 * 3 day
          bool isKey = true;
          if(!ct_Drive.TDD.ct_Configs.IsShow_Book_Shapes&&Initer.IsBasic_Done) {isKey = false;}
//-----------------------
          Book.Update("Book", isKey); //
//-----------------------
//MqlTick n_tiks[];
//SymbolInfoTick(Symbol(),n_tiks));
//-----------------------
//******************************
//median is bulish or bearish
//******************************
//for(int i = 0; i < ArraySize(pricevolume); i++)
//{         ObjectDelete(0, "pricevolume.lineBullish" + (string)i);
//          ObjectDelete(0, "pricevolume.lineBearish" + (string)i);//
//}
//ObjectDelete(0, "Lines.Vertical" + "TLV.pricevolume"); //
//-----------------------
//convert to level
//-----------------------
          /*datetime      dtime = 0; // iTime(Symbol(), PERIOD_CURRENT, 0) + PeriodSeconds() * 50;
          double        price = 0;
          for(int i = 0; i < ArraySize(pricevolume); i++)
          {         //Print(ArraySize(pricevolume), "    ", i ); //
                    //Print(  indx, " Price: ", pricevolume[ArraySize(pricevolume) - 1 - i].Price, "   ", indx, " Volume: ", pricevolume[ArraySize(pricevolume) - 1 - i].VolumeAll ); //
                    //Texts.Description.Draw_GDS_Text(MODE_CREATE, true, "pricevolume.text" + i, pricevolume[ArraySize(pricevolume) - 1 - i].VolumeAll,  iTime(Symbol(), PERIOD_CURRENT, 0) + PeriodSeconds() * 50, pricevolume[ArraySize(pricevolume) - 1 - i].Price, clrYellow, "Arial", 7, ANCHOR_CENTER, 0, false); //
                    color clr = 0;
                    clr = pricevolume[i].IsBulish ? clrDarkTurquoise : clrTomato;
                    //-----------------------------------------------------------------------------//must last one selected not fristones ArraySize(pricevolume) - 1 - i
                    int subwn = 0;
                    int CHART_WIDTH_Pixels      = (int)ChartGetInteger(0, CHART_WIDTH_IN_PIXELS, 0);
                    int CHART_HEIGHT_Pixels     = (int)ChartGetInteger(0, CHART_HEIGHT_IN_PIXELS, 0);; //
                    //CHART_WIDTH_Pixels = (int)ChartGetInteger(0, CHART_WIDTH_IN_PIXELS, 0);
                    // CHART_HEIGHT_Pixels =  WindowPriceMin(); //
                    //ResetLastError();//
                    bool res = ChartXYToTimePrice(0, CHART_WIDTH_Pixels, CHART_HEIGHT_Pixels, subwn, dtime, price);  //0 is ok
                    //Print("ChartXYToTimePrice return error code: ", GetLastError());//wrong parameter input not double
                    //Print(" price\: ", price, " dtime: ", dtime, "      CHART_WIDTH_Pixels: ", CHART_WIDTH_Pixels, " WindowPriceMin(): ", CHART_HEIGHT_Pixels);
                    datetime diffTime = 0;
                    dtime  = iTime(Symbol(), PERIOD_CURRENT, 0) + PeriodSeconds(PERIOD_CURRENT) * 75; //
                    if(pricevolume[i].IsBulish )
                    {         diffTime -=  (datetime)(( pricevolume[i].VolumeAllNet ) / 1 ); //(pricevolume[ArraySize(pricevolume) - 1 - i].VolumeAll //---VolumeAllBulish                 pricevolume[i].VolumeAllBulish         BoxesBuys[i].BoxVolumeBulish
                    }//
                    else
                    {         diffTime +=  (datetime)((pricevolume[i].VolumeAllNet) / 1);//((PeriodSeconds() *  VolumeNET) / 15)//-----VolumeAllBearish                          pricevolume[i].Price                pricevolume[i].VolumeAllBearish         BoxesSells[i].BoxVolumeBearish
                    }//
                    //-----------------------------------------------------------------------------
                    string Sentiment = VolumePercent1Bulish0Bearish ?  " " + DoubleToString(pricevolume[i].UnitBar.PriceLevelRange, 2) + " Sentiment Buy " + DoubleToString(pricevolume[i].UnitBar.VolumePercent, 2) + " " : " " + DoubleToString(pricevolume[i].UnitBar.PriceLevelRange, 2) + " Sentiment Sell " + DoubleToString(pricevolume[i].UnitBar.VolumePercent, 2) + " ";
                    //-----------------------------------------------------------------------------
                    if(pricevolume[i].IsBulish )   {Lines.Trend.Draw_GDS_Lines(MODE_CREATE, isKey, "pricevolume.lineBullish" + (string)i, Sentiment + (string)pricevolume[i].VolumeAllBulish + "/" + (string)VolumeNET, dtime, pricevolume[i].UnitBar.PriceLevelRange, dtime + diffTime, pricevolume[i].UnitBar.PriceLevelRange, clr, 4, false, STYLE_SOLID, false);} //
                    if(!pricevolume[i].IsBulish ) {Lines.Trend.Draw_GDS_Lines(MODE_CREATE, isKey, "pricevolume.lineBearish" + (string)i, Sentiment + (string)pricevolume[i].VolumeAllBearish + "/" + (string)VolumeNET, dtime, pricevolume[i].UnitBar.PriceLevelRange, dtime + diffTime, pricevolume[i].UnitBar.PriceLevelRange, clr, 4, false, STYLE_SOLID, false);} //
                    //
                    //Object_Pack.Texts.RectLabel.Draw_GDS(MODE_CREATE, isKey, "Rect.pricevolume.lineBullish" + (string)i,)
                    //Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, isKey, "Rect.pricevolume.lineBullish" + (string)i,)
                    //if(pricevolume[i].IsBulish )  {Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, isKey, "Rect.pricevolume.lineBullish" + (string)i, false, dtime, pricevolume[i].UnitBar.PriceLevelRange, dtime + diffTime, pricevolume[i].UnitBar.PriceLevelRange + 49 * Point(), clr, true); } //
                    //else                          {Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, isKey, "Rect.pricevolume.lineBearish" + (string)i, false, dtime, pricevolume[i].UnitBar.PriceLevelRange, dtime + diffTime, pricevolume[i].UnitBar.PriceLevelRange + 49 * Point(), clr, true); } //
                    //-----------------------------------------------------------------------------
          } //
          //Object_Pack.Lines.Vertical.Draw_GDSVertical1  (MODE_CREATE, isKey, "TLV.pricevolume", dtime + PeriodSeconds() * 1, STYLE_SOLID, 2, clrWhite, false); //
          */
//-----------------------
}
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
/*

Order
  int idNumber;
  bool buyOrSell;
  int shares;
  int limit;
  int entryTime;
  int eventTime;
  Order *nextOrder;
  Order *prevOrder;
  Limit *parentLimit;

Limit  // representing a single limit price
  int limitPrice;
  int size;
  int totalVolume;
  Limit *parent;
  Limit *leftChild;
  Limit *rightChild;
  Order *headOrder;
  Order *tailOrder;

Book
  Limit *buyTree;
  Limit *sellTree;
  Limit *lowestSell;
  Limit *highestBuy;
*/
//+------------------------------------------------------------------+
