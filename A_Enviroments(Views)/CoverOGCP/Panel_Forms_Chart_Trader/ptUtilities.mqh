//+------------------------------------------------------------------+
//|                                                      Defines.mqh |
//|                             Copyright © 2012-2021, EarnForex.com |
//|                                     Based on panel by qubbit.com |
//|                                       https://www.earnforex.com/ |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|     Module ~~ GUI ~~ Panels Complete                             |
//+------------------------------------------------------------------+
class C_TradeUTILITIES
{
public:   //---constructor is privet not to get varible of class
          void          C_TradeUTILITIES() {   };
          void          ~C_TradeUTILITIES() {   };
          //------------------------------------------------------------
          bool          Update();
          bool          UPDATED;
          //------------------------------------------------------------
          void          DrawOrdHistory(int WhichMode, bool IsKey);
          //------------------------------------------------------------
          double        iCustomindicator();
          //------------------------------------------------------------
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_TradeUTILITIES::Update()
{         UPDATED = false;
          DrawOrdHistory(MODE_CREATE, ShowOrdHistory);
          //==========================================================
          // SYS Timer Cheackup Start C_WINUSER32 App Enviroments<<<<|
          //==========================================================
          //
          UPDATED = true;
          //
          //==========================================================
          // SYS Timer Cheackup End C_WINUSER32 App Enviroments<<<<<<|
          //==========================================================
          if(!this.UPDATED)       {Alert("TradeUtilities.UPDATED: ", this.UPDATED);}
          return UPDATED;//
}
//+------------------------------------------------------------------+
//| DrawOrdHistory                                                   |
//+------------------------------------------------------------------+
void C_TradeUTILITIES::DrawOrdHistory(int WhichMode, bool IsKey)
{         /*Use--DisplayOrderHistory*/// if(ShowOrdHistory) Utilities.DrawOrdHistory(); //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          static color  COLOR_ARROW = clrNONE;
          static color  COLOR_SELL = C'225,68,29';
          static color  COLOR_BUY = C'3,95,172';
          static color  COLOR_CLOSE = clrGoldenrod;
          //==========================================
          string obj_name = "", ordtype = "", ticket = "", openprice = "", closeprice = "", ordlots = "", stoploss = "", takeprofit = "";
          //=============================================================================================================================
          for(int i = OrdersHistoryTotal() - 1; i >= 0; i--)  //--- loop for all order in history
          {         if(OrderSelect(i, SELECT_BY_POS, MODE_HISTORY) && OrderSymbol() == _Symbol && OrderMagicNumber() == MAGICMAX)
                    {         if(OrderType() <= OP_SELL) //MarketOrdersOnly
                              {         //OP_BUY_0_Buy_operation
                                        //OP_SELL_1_Sell_operation
                                        //================================================================================
                                        //-- Set_Color&OrdType
                                        if(OrderType() == OP_SELL) {COLOR_ARROW = COLOR_SELL; ordtype = "sell";} //SellOrders
                                        else                       {COLOR_ARROW = COLOR_BUY; ordtype = "buy";} /*BuyOrders*/
                                        //================================================================================
                                        //-- ConvertToString
                                        ticket        = IntegerToString(OrderTicket());                 //GetTicket
                                        openprice     = DoubleToString(OrderOpenPrice(), _Digits);      //GetOpenPrice
                                        closeprice    = DoubleToString(OrderClosePrice(), _Digits);     //GetClosePrice
                                        ordlots       = DoubleToString(OrderLots(), 2);                 /*GetOrderLots*/
                                        //================================================================================
                                        {         //-- OrderLine//
                                                  obj_name = "#" + ticket + " " + openprice + " -> " + closeprice; //Set_Name
                                                  Dev_Object_Pack.Lines.Trend.Create2(0, obj_name, 0, OrderOpenTime(), OrderOpenPrice(), OrderCloseTime(), OrderClosePrice(), COLOR_ARROW, STYLE_DOT, 1, True, false, false, 0); //
                                        }
                                        {         //-- OpenArrow
                                                  obj_name = "#" + ticket + " " + ordtype + " " + ordlots + " " + _Symbol + " at " + openprice; //Set_Name
                                                  //----OBJ.Arrows.Arrow.GDS.Set_Desc_2(obj_name, 1); OBJ.Arrows.Arrow.Action(OBJ.Arrows.Arrow);
                                                  {         ArrowX.GDS.Set_Action_2(WhichMode, IsKey);
                                                            ArrowX.GDS.Set_Desc_2(obj_name, 1);
                                                            ArrowX.GDS.Set_Location_3(OrderOpenTime(), OrderOpenPrice(), ANCHOR_BOTTOM );
                                                            ArrowX.GDS.Set_Color_1(COLOR_ARROW);
                                                            ArrowX.GDS.Set_Style_2(STYLE_SOLID, 15);
                                                            ArrowX.GDS.Set_Common_6(false, 91, false, false, false, obj_name);
                                                            ArrowX.GDS.Set_Chart_6();
                                                            ArrowX.Action(ArrowX); //
                                                            //0// //OBJ.Arrows.Arrow.CreateA(0, obj_name, 1, 0, OrderOpenTime(), OrderOpenPrice(), ANCHOR_BOTTOM, COLOR_ARROW, STYLE_SOLID, 15, True, false, false, 0);
                                                            //---off--- ArrowCreate(0, obj_name, 0, OrderOpenTime(), OrderOpenPrice(), 1, ANCHOR_BOTTOM, COLOR_ARROW, STYLE_SOLID, 1, false, false, false, 0);
                                                  }//
                                        }
                                        {         //-- CloseArrow
                                                  obj_name += " close at " + closeprice; //Set_Name
                                                  {         ArrowX.GDS.Set_Action_2(WhichMode, IsKey);
                                                            ArrowX.GDS.Set_Desc_2(obj_name, 3);
                                                            ArrowX.GDS.Set_Location_3(OrderCloseTime(), OrderClosePrice(), ANCHOR_BOTTOM );
                                                            ArrowX.GDS.Set_Color_1(COLOR_CLOSE);
                                                            ArrowX.GDS.Set_Style_2(STYLE_SOLID, 15);
                                                            ArrowX.GDS.Set_Common_6(false, 91, false, false, false, obj_name);
                                                            ArrowX.GDS.Set_Chart_6();
                                                            ArrowX.Action(ArrowX);//
                                                            //0//    //OBJ.Arrows.Arrow.CreateA(0, obj_name, 3, 0, OrderCloseTime(), OrderClosePrice(), ANCHOR_BOTTOM, COLOR_CLOSE, STYLE_SOLID, 15, True, false, false, 0);
                                                            //---off--- ArrowCreate(0, obj_name, 0, OrderCloseTime(), OrderClosePrice(), 3, ANCHOR_BOTTOM, COLOR_CLOSE, STYLE_SOLID, 1, false, false, false, 0);
                                                  }//
                                        }
                                        {         //-- StopLossArrow
                                                  if(OrderStopLoss() > 0)
                                                  {         stoploss = DoubleToString(OrderStopLoss(), _Digits); //GetStopLoss
                                                            obj_name = "#" + ticket + " " + ordtype + " " + ordlots + " " + _Symbol + " at " + openprice + " sl at " + stoploss; //Set_Name
                                                            {         ArrowX.GDS.Set_Action_2(WhichMode, IsKey);
                                                                      ArrowX.GDS.Set_Desc_2(obj_name, 4);
                                                                      ArrowX.GDS.Set_Location_3(OrderOpenTime(), OrderStopLoss(), ANCHOR_BOTTOM );
                                                                      ArrowX.GDS.Set_Color_1(COLOR_SELL);
                                                                      ArrowX.GDS.Set_Style_2(STYLE_SOLID, 15);
                                                                      ArrowX.GDS.Set_Common_6(false, 91, false, false, false, obj_name);
                                                                      ArrowX.GDS.Set_Chart_6();
                                                                      ArrowX.Action(ArrowX);//
                                                                      //0// //OBJ.Arrows.Arrow.CreateA(0, obj_name, 4, 0, OrderOpenTime(), OrderStopLoss(), ANCHOR_BOTTOM, COLOR_SELL, STYLE_SOLID, 15, True, false, false, 0); //
                                                                      //---off--- ArrowCreate(0, obj_name, 0, OrderOpenTime(), OrderStopLoss(), 4, ANCHOR_BOTTOM, COLOR_SELL, STYLE_SOLID, 1, false, false, false, 0);
                                                            }//
                                                  }//
                                        }
                                        {         //-- TakeProfitArrow
                                                  if(OrderTakeProfit() > 0)
                                                  {         takeprofit = DoubleToString(OrderTakeProfit(), _Digits); //GetTakeProfit
                                                            obj_name = "#" + ticket + " " + ordtype + " " + ordlots + " " + _Symbol + " at " + openprice + " tp at " + takeprofit; //Set_Name
                                                            {         ArrowX.GDS.Set_Action_2(WhichMode, IsKey);
                                                                      ArrowX.GDS.Set_Desc_2(obj_name, 4);
                                                                      ArrowX.GDS.Set_Location_3(OrderOpenTime(), OrderTakeProfit(), ANCHOR_BOTTOM );
                                                                      ArrowX.GDS.Set_Color_1(COLOR_BUY);
                                                                      ArrowX.GDS.Set_Style_2(STYLE_SOLID, 15);
                                                                      ArrowX.GDS.Set_Common_6(false, 91, false, false, false, obj_name);
                                                                      ArrowX.GDS.Set_Chart_6();
                                                                      ArrowX.Action(ArrowX);//
                                                                      //0// //OBJ.Arrows.Arrow.CreateA(0, obj_name, 4, 0, OrderOpenTime(), OrderTakeProfit(), ANCHOR_BOTTOM, COLOR_BUY, STYLE_SOLID, 15, True, false, false, 0); //
                                                                      //---off--- ArrowCreate(0, obj_name, 0, OrderOpenTime(), OrderTakeProfit(), 4, ANCHOR_BOTTOM, COLOR_BUY, STYLE_SOLID, 1, false, false, false, 0); //
                                                            }//
                                                  } //
                                        } //
                              } //
                    } //
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double C_TradeUTILITIES::iCustomindicator()
{         //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error", __LINE__, __FUNCTION__); //
          //============================//============================
          //
          double       result         = 0;
          ///UseTimeframe   = PERIOD_M1;                     // argtimeframe=0
          string       arfname        = "v";           // path/name of the custom indicator compiled program
          //...                                 // custom indicator input parameters (if necessary)
          int          arfmode         = 1;             // line index  iCustom() function. The first parameter is an integer from 0 to 7, and the second parameter is the name of the buffer array.
          int          arfargshift     = 1;         // argshift (whitch candell
          double       iCustomX        = iCustom(StSymbol.Current = Symbol(), PERIOD_M1, arfname, arfmode, ChartData_ChartInfo.BarShift); //
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error", __LINE__, __FUNCTION__); //
          //============================//============================
          return result; //
}
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
