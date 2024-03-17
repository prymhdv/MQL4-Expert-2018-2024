//+------------------------------------------------------------------+
//|                                         TradingFatherUpdated.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict

//+------------------------------------------------------------------+
//|             Class TradingFaderUpdated     BEGIN                  |
//+------------------------------------------------------------------+
class TradingFaderUpdated
{
public:

//+------------------------------------------------------------------+
//|                                       trading_robot_template.mq4 |
//|                                                   Enrico Lambino |
//|                             https://www.mql5.com/en/users/iceron |
//+------------------------------------------------------------------+
//#property copyright "Enrico Lambino"
//#property link      "https://www.mql5.com/en/users/iceron"
//#property version   "1.4"
//#property strict
//+------------------------------------------------------------------+
//| ENUMERATIOS                                                      |
//+------------------------------------------------------------------+
          //--- trade signal types
          enum ENUM_TRADE_SIGNAL
          {         TRADE_SIGNAL_VOID = -1,
                    TRADE_SIGNAL_NEUTRAL,
                    TRADE_SIGNAL_BUY,
                    TRADE_SIGNAL_SELL //
          };
          //--- order set types
          enum ENUM_ORDER_SET
          {         ORDER_SET_ALL = -1,
                    ORDER_SET_BUY,
                    ORDER_SET_SELL,
                    ORDER_SET_BUY_LIMIT,
                    ORDER_SET_SELL_LIMIT,
                    ORDER_SET_BUY_STOP,
                    ORDER_SET_SELL_STOP,
                    ORDER_SET_LONG,
                    ORDER_SET_SHORT,
                    ORDER_SET_LIMIT,
                    ORDER_SET_STOP,
                    ORDER_SET_MARKET,
                    ORDER_SET_PENDING //
          };
          //--- money management types
          //enum MM
          //{         MM_FIXED_LOT,
          //          MM_RISK_PERCENT,
          //          MM_FIXED_RATIO,
          //          MM_FIXED_RISK,
          //          MM_FIXED_RISK_PER_POINT, //
          //};
          ////////////////////////////////////////////////////
          ////////////////////////////////////////////////////

          string     symbol;
          int        timeframe;
          double     lotsize;

//--- hard stops params
          int        stoploss;
          int        takeprofit;
//--- virtual stops params
          int        virtual_sl;
          int        virtual_tp;

          int        max_slippage;
          string     order_comment;
          int        order_magic;
          int        order_expire;
          bool       market_exec;

//--- money management params
          MM         money_management;
          double     mm1_risk;
          double     mm2_lots;
          double     mm2_per;
          double     mm3_risk;
          double     mm4_risk;

//--- breakeven params
          int        breakeven_threshold;
          int        breakeven_plus;
//--- trailingstop params
          int        trail_value;
          int        trail_threshold;
          int        trail_step;

//--- money management params
          bool       exit_opposite_signal;
          int        maxtrades;
          bool       entry_new_bar;
          bool       wait_next_bar_on_load;

//--- trading time params
          int        start_time_hour;
          int        start_time_minute;
          int        end_time_hour;
          int        end_time_minute;
          int        gmt;

//--- misc params
          color      arrow_color_long;
          color      arrow_color_short;
          bool       long_allowed;
          bool       short_allowed;

          int        ma_period;
          int        ma_shift;
          ENUM_MA_METHOD ma_method;
          ENUM_APPLIED_PRICE ma_applied;
          int        ma_index;
/////=========================================================================================================//////

          void          TradingFaderUpdated::TradingFaderUpdated();
          void          TradingFaderUpdated::~TradingFaderUpdated();
          int           TradingFaderUpdated::OnInit_TradingFaderUpdated();
          void          TradingFaderUpdated::OnDeinit_TradingFaderUpdated(const int reason);
          //========================================================================#A
          void          TradingFaderUpdated::OnTick_TradingFaderUpdated();
          //========================================================================#B
          /* int signal_ma()    {return 0;} */// --- uncomment the lines below to make the code compile
          int           TradingFaderUpdated::signal_ma2()                { return 0; }
          int           TradingFaderUpdated::signal_ma();
          int           TradingFaderUpdated::signal_entry(int signal = TRADE_SIGNAL_NEUTRAL);
          int           TradingFaderUpdated::signal_exit();
          //========================================================================#C
          void          TradingFaderUpdated::enter_order(ENUM_ORDER_TYPE type);
          double        TradingFaderUpdated::mm(MM method, string ins, double lots, int sl, double risk_mm1, double lots_mm2, double per_mm2, double risk_mm3, double risk_mm4);
          double        TradingFaderUpdated::calculate_volume();
          int           TradingFaderUpdated::entry(string ins, int cmd, double volume, int distance, int slippage, int sl, int tp, string comment = NULL, int magic = 0, int expire = 0, color a_clr = clrNONE, bool market = false, int retries = 3, int sleep = 500);
          //=========================================================================#4
          int           TradingFaderUpdated::send_order(string ins, int cmd, double volume, int distance, int slippage, int sl, int tp, string comment = NULL, int magic = 0, int expire = 0, color a_clr = clrNONE, bool market = false);
          int           TradingFaderUpdated::send_order2(string ins, int cmd, double volume, int distance, int slippage, int sl, int tp, string comment = NULL, int magic = 0, int expire = 0, color a_clr = clrNONE);
          bool          TradingFaderUpdated::modify(int ticket, double sl, double tp = -1, double price = -1, datetime expire = 0, color a_color = clrNONE, int retries = 3, int sleep = 500);
          bool          TradingFaderUpdated::modify_order(int ticket, double sl, double tp = -1, double price = -1, datetime expire = 0, color a_color = clrNONE);
          int           TradingFaderUpdated::compare_doubles(double var1, double var2, int precision);
          //========================================================================#5
          void          TradingFaderUpdated::close_all();
          void          TradingFaderUpdated::close_all_long();
          void          TradingFaderUpdated::close_all_short();
          //========================================================================


          void          TradingFaderUpdated::signal_manage(ENUM_TRADE_SIGNAL &entry, ENUM_TRADE_SIGNAL &exit);
          bool          TradingFaderUpdated::breakeven_check_order(int ticket, int threshold, int plus);
          void          TradingFaderUpdated::breakeven_check(int threshold, int plus, int magic = -1);

          bool          TradingFaderUpdated::exit_order(int ticket, double size = -1, color a_color = clrNONE, int slippage = 50);
          bool          TradingFaderUpdated::exit(int ticket, color a_color = clrNONE, int slippage = 50, int retries = 3, int sleep = 500);
          void          TradingFaderUpdated::exit_all(int type = -1, int magic = -1);
          void          TradingFaderUpdated::exit_all_set(ENUM_ORDER_SET type = -1, int magic = -1);
          //========================================================================
          bool          TradingFaderUpdated::trailingstop_check_order(int ticket, int trail, int threshold, int step);
          void          TradingFaderUpdated::trailingstop_check(int trail, int threshold, int step, int magic = -1);
          int           TradingFaderUpdated::signal_add(int current, int add, bool exit = false);
          //========================================================================
          //========================================================================
          bool          TradingFaderUpdated::is_new_bar(string ins, int tf, bool wait = false);
          int           TradingFaderUpdated::count_orders(ENUM_ORDER_SET type = -1, int magic = -1);
          bool          TradingFaderUpdated::is_time_in_range(datetime time, int start_hour, int start_min, int end_hour, int end_min, int gmt_offset = 0);
          bool          TradingFaderUpdated::virtualstop_check_order(int ticket, int sl, int tp);
          void          TradingFaderUpdated::virtualstop_check(int sl, int tp, int magic = -1);

//+------------------------------------------------------------------+

///class TradingFaderUpdated  END
} ;///TFUX;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
TradingFaderUpdated::TradingFaderUpdated()
{         Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);
          RunCallFunction++; ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          symbol = NULL; //Alert(" ", __FUNCSIG__, __LINE__); //
          timeframe = 0;
          lotsize = 0.1;
          //--- hard stops params
          stoploss = 0;
          takeprofit = 0;
          //--- virtual stops params
          virtual_sl = 200;
          virtual_tp = 200;
          max_slippage = 50;
          order_comment = "";
          order_magic = 12345;
          order_expire = 0;
          market_exec = false;
          //--- money management params
          money_management = MM_FIXED_LOT;
          mm1_risk = 0.05;
          mm2_lots = 0.1;
          mm2_per = 1000;
          mm3_risk = 50;
          mm4_risk = 50;
          //--- breakeven params
          breakeven_threshold = 500;
          breakeven_plus = 0;
          //--- trailingstop params
          trail_value = 20;
          trail_threshold = 500;
          trail_step = 20;
          //--- money management params
          exit_opposite_signal = false;
          maxtrades = 1;
          entry_new_bar = true;
          wait_next_bar_on_load = true;
          //--- trading time params
          start_time_hour = 22;
          start_time_minute = 0;
          end_time_hour = 22;
          end_time_minute = 0;
          gmt = 0;
          //--- misc params
          arrow_color_long = clrGreen;
          arrow_color_short = clrRed;
          long_allowed = true;
          short_allowed = true;
          ////more++++
          ma_period = 14;
          ma_shift = 0;
          ma_method = MODE_SMA;
          ma_applied = PRICE_CLOSE;
          ma_index = 1;
          ///
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
TradingFaderUpdated::~TradingFaderUpdated()
{
//
          if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int TradingFaderUpdated::signal_ma()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          // --- get the moving average value at the index bar and the bar before it
          double ma = iMA(NULL, 0, ma_period, ma_shift, ma_method, ma_applied, ma_index);
          double ma1 = iMA(NULL, 0, ma_period, ma_shift, ma_method, ma_applied, ma_index + 1);
// --- get the close price the index bar and the bar before it
          double close = iClose(NULL, 0, ma_index);
          double close1 = iClose(NULL, 0, ma_index + 1);
// --- crossover check: checks if the MA crosses up or down the price line
// --- this will be covered in detail later in the course
          if(ma < close && ma1 > close1)
          {         return TRADE_SIGNAL_BUY; }
          else if(ma > close && ma1 < close1)
          {         return TRADE_SIGNAL_SELL; }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return 0; //
}
//+------------------------------------------------------------------+
//| Function for entry signals                                       |
//+------------------------------------------------------------------+
int TradingFaderUpdated::signal_entry(int signal = TRADE_SIGNAL_NEUTRAL)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
//add entry signals below
          signal = signal_add(signal, signal_ma());
          //return entry signal
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return signal;//
}
//+------------------------------------------------------------------+
//| Evaluation of exit signals                                       |
//+------------------------------------------------------------------+
int TradingFaderUpdated::signal_exit()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          int signal = TRADE_SIGNAL_NEUTRAL;
          //add entry signals below
          //return exit signal
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return signal; //
}
//+------------------------------------------------------------------+
//| Calculation of volume                                            |
//+------------------------------------------------------------------+
double TradingFaderUpdated::calculate_volume()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          double volume = mm(money_management, symbol, lotsize, stoploss, mm1_risk, mm2_lots, mm2_per, mm3_risk, mm4_risk);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return volume; //
}
//+------------------------------------------------------------------+
//| Entry of order                                                   |
//+------------------------------------------------------------------+
void TradingFaderUpdated::enter_order(ENUM_ORDER_TYPE type)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          if(type == OP_BUY || type == OP_BUYSTOP || type == OP_BUYLIMIT)       if(!long_allowed) return;
          if(type == OP_SELL || type == OP_SELLSTOP || type == OP_SELLLIMIT)    if(!short_allowed) return;
          double volume = calculate_volume();
          entry(NULL, type, volume, 0, max_slippage, stoploss, takeprofit, order_comment, order_magic, order_expire, arrow_color_short, market_exec); //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//| Exit of all positions (or by set)                                |
//+------------------------------------------------------------------+
void TradingFaderUpdated::close_all()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          exit_all_set(ORDER_SET_ALL, order_magic);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}


//+------------------------------------------------------------------+
//| Exit of all long positions                                       |
//+------------------------------------------------------------------+
void TradingFaderUpdated::close_all_long()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          exit_all_set(ORDER_SET_BUY, order_magic);
//exit_all_set(ORDER_SET_BUY_STOP,order_magic);
//exit_all_set(ORDER_SET_BUY_LIMIT,order_magic);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//| Exit of all short positions                                      |
//+------------------------------------------------------------------+
void TradingFaderUpdated::close_all_short()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          exit_all_set(ORDER_SET_SELL, order_magic);
//exit_all_set(ORDER_SET_SELL_STOP,order_magic);
//exit_all_set(ORDER_SET_SELL_LIMIT,order_magic);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int TradingFaderUpdated::OnInit_TradingFaderUpdated()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
//---
//---
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return(INIT_SUCCEEDED); //
}
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void TradingFaderUpdated::OnDeinit_TradingFaderUpdated(const int reason)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void TradingFaderUpdated::OnTick_TradingFaderUpdated()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          /* time check */
          bool time_in_range = is_time_in_range(TimeCurrent(), start_time_hour, start_time_minute, end_time_hour, end_time_minute, gmt);
          ///////=======================================================================================================================
          /* signals */
          ENUM_TRADE_SIGNAL entry = 0, exit = 0;
          entry = (ENUM_TRADE_SIGNAL)signal_entry();
          exit = (ENUM_TRADE_SIGNAL)signal_exit();
          signal_manage(entry, exit);
          //////========================================================================================================================
          /* exit */
          if(exit == TRADE_SIGNAL_BUY)          { close_all_short(); }
          else if(exit == TRADE_SIGNAL_SELL)    { close_all_long(); }
          else if(exit == TRADE_SIGNAL_VOID)    { close_all(); }
          /* entry */
          int count_orders = 0;
          if(entry > 0)
          {         if(entry == TRADE_SIGNAL_BUY)
                    {         if(exit_opposite_signal)
                              {         exit_all_set(ORDER_SET_SELL, order_magic); }
                              count_orders = count_orders(-1, order_magic);
                              if(maxtrades > count_orders)
                              {         if(!entry_new_bar || (entry_new_bar && is_new_bar(symbol, timeframe, wait_next_bar_on_load)))
                                        {         enter_order(OP_BUY); } } }
                    else if(entry == TRADE_SIGNAL_SELL)
                    {         if(exit_opposite_signal)
                              {         exit_all_set(ORDER_SET_BUY, order_magic); }
                              count_orders = count_orders(-1, order_magic);
                              if(maxtrades > count_orders)
                              {         if(!entry_new_bar || (entry_new_bar && is_new_bar(symbol, timeframe, wait_next_bar_on_load)))
                                        {         enter_order(OP_SELL); //
                                        } //
                              }///
                    }//
          }
//---- breakeven check
          if(breakeven_threshold > 0) {         breakeven_check(breakeven_threshold, breakeven_plus, order_magic); } //
//---- trailingstop check
          if(trail_value > 0) {         trailingstop_check(trail_value, trail_threshold, trail_step, order_magic); } //
//---- virtual stop check
          if(virtual_sl > 0 || virtual_tp > 0) {         virtualstop_check(virtual_sl, virtual_tp);} ///
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//| Management of overall signal                                     |
//+------------------------------------------------------------------+
void TradingFaderUpdated::signal_manage(ENUM_TRADE_SIGNAL &entry, ENUM_TRADE_SIGNAL &exit)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          if(exit == TRADE_SIGNAL_VOID)
                    entry = TRADE_SIGNAL_NEUTRAL;
          if(exit == TRADE_SIGNAL_BUY && entry == TRADE_SIGNAL_SELL)
                    entry = TRADE_SIGNAL_NEUTRAL;
          if(exit == TRADE_SIGNAL_SELL && entry == TRADE_SIGNAL_BUY)
                    entry = TRADE_SIGNAL_NEUTRAL; //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//| Breakeven check for an order                                     |
//+------------------------------------------------------------------+
bool TradingFaderUpdated::breakeven_check_order(int ticket, int threshold, int plus)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          if(ticket <= 0) return true;
          if(!OrderSelect(ticket, SELECT_BY_TICKET)) return false;
          int digits = (int)MarketInfo(OrderSymbol(), MODE_DIGITS);
          double point = MarketInfo(OrderSymbol(), MODE_POINT);
          bool result = true;
          if(OrderType() == OP_BUY)
          {         double newsl = OrderOpenPrice() + plus * point;
                    double profit_in_pts = OrderClosePrice() - OrderOpenPrice();
                    if(OrderStopLoss() == 0 || compare_doubles(newsl, OrderStopLoss(), digits) > 0)
                              if(compare_doubles(profit_in_pts, threshold * point, digits) >= 0)
                                        result = modify(ticket, newsl); //
          }
          else if(OrderType() == OP_SELL)
          {         double newsl = OrderOpenPrice() - plus * point;
                    double profit_in_pts = OrderOpenPrice() - OrderClosePrice();
                    if(OrderStopLoss() == 0 || compare_doubles(newsl, OrderStopLoss(), digits) < 0)
                              if(compare_doubles(profit_in_pts, threshold * point, digits) >= 0)
                                        result = modify(ticket, newsl); //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return result; //
}
//+------------------------------------------------------------------+
//| Breakeven check                                |
//+------------------------------------------------------------------+
void TradingFaderUpdated::breakeven_check(int threshold, int plus, int magic = -1)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          for(int i = 0; i < OrdersTotal(); i++)
          {         if(OrderSelect(i, SELECT_BY_POS))
                              if(magic == -1 || magic == OrderMagicNumber())
                                        breakeven_check_order(OrderTicket(), threshold, plus);//
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//| ct_Order modification                                               |
//+------------------------------------------------------------------+
bool TradingFaderUpdated::modify_order(int ticket, double sl, double tp = -1, double price = -1, datetime expire = 0, color a_color = clrNONE)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          bool result = false;
          if(OrderSelect(ticket, SELECT_BY_TICKET))
          {         string ins = OrderSymbol();
                    int digits = (int)MarketInfo(ins, MODE_DIGITS);
                    if(sl == -1) sl = OrderStopLoss();
                    else sl = NormalizeDouble(sl, digits);
                    if(tp == -1) tp = OrderTakeProfit();
                    else tp = NormalizeDouble(tp, digits);
                    if(OrderType() <= 1)
                    {         if(compare_doubles(sl, OrderStopLoss(), digits) == 0 &&
                                                  compare_doubles(tp, OrderTakeProfit(), digits) == 0)
                                        return true;
                              price = OrderOpenPrice();//
                    }
                    else if(OrderType() > 1)
                    {         if(price == -1)
                                        price = OrderOpenPrice();
                              else price = NormalizeDouble(price, digits);
                              if(compare_doubles(price, OrderOpenPrice(), digits) == 0 &&
                                                  compare_doubles(sl, OrderStopLoss(), digits) == 0 &&
                                                  compare_doubles(tp, OrderTakeProfit(), digits) == 0 &&
                                                  expire == OrderExpiration())
                                        return true; ///
                    }
                    result = OrderModify(ticket, price, sl, tp, expire, a_color); //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return result; //
}
//+------------------------------------------------------------------+
//| Checking before calling the modify_order() function              |
//+------------------------------------------------------------------+
bool TradingFaderUpdated::modify(int ticket, double sl, double tp = -1, double price = -1, datetime expire = 0, color a_color = clrNONE, int retries = 3, int sleep = 500)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          bool result = false;
          if(ticket > 0)
          {         for(int i = 0; i < retries; i++)
                    {         if(!IsConnected()) Print("No internet connection");
                              else if(!IsExpertEnabled()) Print("Experts not enabled in trading platform");
                              else if(IsTradeContextBusy()) Print("Trade context is busy");
                              else if(!IsTradeAllowed()) Print("Trade is not allowed in trading platform");
                              else result = modify_order(ticket, sl, tp, price, expire, a_color);
                              if(result)
                                        break;
                              Sleep(sleep); //
                    } ///
          }
          else Print("Invalid ticket for modify function");
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return result; //
}
//+------------------------------------------------------------------+
//| Function for comparing values of type double                     |grater or lower//
//+------------------------------------------------------------------+
int TradingFaderUpdated::compare_doubles(double var1, double var2, int precision)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          double point = MathPow(10, -precision); //10^(-precision)
          int var1_int = (int) (var1 / (int) point); ////i add (int)
          int var2_int = (int) (var2 / (int) point);
          if(var1_int > var2_int)
                    return 1;
          else if(var1_int < var2_int)
                    return -1;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return 0; //
}
//+------------------------------------------------------------------+
//| Exit an order                                                    |
//+------------------------------------------------------------------+
bool TradingFaderUpdated::exit_order(int ticket, double size = -1, color a_color = clrNONE, int slippage = 50)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          bool result = false;
          if(OrderSelect(ticket, SELECT_BY_TICKET))
          {         if(OrderType() <= 1)
                    {         result = OrderClose(ticket, OrderLots(), OrderClosePrice(), slippage, a_color); }
                    else if(OrderType() > 1)
                    {         result = OrderDelete(ticket, a_color); //
                    } //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return result; //
}
//+------------------------------------------------------------------+
//| Checking before calling exit_order() function                    |
//+------------------------------------------------------------------+
bool TradingFaderUpdated::exit(int ticket, color a_color = clrNONE, int slippage = 50, int retries = 3, int sleep = 500)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          bool result = false;
          for(int i = 0; i < retries; i++)
          {         if(!IsConnected()) Print("No internet connection");
                    else if(!IsExpertEnabled()) Print("Experts not enabled in trading platform");
                    else if(IsTradeContextBusy()) Print("Trade context is busy");
                    else if(!IsTradeAllowed()) Print("Trade is not allowed in trading platform");
                    else result = exit_order(ticket, a_color, slippage);
                    if(result)
                              break;
                    Print("Closing order# " + DoubleToStr(OrderTicket(), 0) + " failed " + DoubleToStr(GetLastError(), 0));
                    Sleep(sleep);//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return result; //
}
//+------------------------------------------------------------------+
//| Exit all orders by type and/or magic                             |
//+------------------------------------------------------------------+
void TradingFaderUpdated::exit_all(int type = -1, int magic = -1)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          for(int i = OrdersTotal(); i >= 0; i--)
          {         if(OrderSelect(i, SELECT_BY_POS))
                    {         if((type == -1 || type == OrderType()) && (magic == -1 || magic == OrderMagicNumber()))
                                        exit(OrderTicket()); //
                    } //
          } //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//| Exit all orders by set                                           |
//+------------------------------------------------------------------+
void TradingFaderUpdated::exit_all_set(ENUM_ORDER_SET type = -1, int magic = -1)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          for(int i = OrdersTotal(); i >= 0; i--)
          {         if(OrderSelect(i, SELECT_BY_POS))
                    {         if(magic == -1 || magic == OrderMagicNumber())
                              {         int ordertype = OrderType();
                                        int ticket = OrderTicket();
                                        switch(type)
                                        {         case ORDER_SET_BUY:
                                                            if(ordertype == OP_BUY) exit(ticket);
                                                            break;
                                                  case ORDER_SET_SELL:
                                                            if(ordertype == OP_SELL) exit(ticket);
                                                            break;
                                                  case ORDER_SET_BUY_LIMIT:
                                                            if(ordertype == OP_BUYLIMIT) exit(ticket);
                                                            break;
                                                  case ORDER_SET_SELL_LIMIT:
                                                            if(ordertype == OP_SELLLIMIT) exit(ticket);
                                                            break;
                                                  case ORDER_SET_BUY_STOP:
                                                            if(ordertype == OP_BUYSTOP) exit(ticket);
                                                            break;
                                                  case ORDER_SET_SELL_STOP:
                                                            if(ordertype == OP_SELLSTOP) exit(ticket);
                                                            break;
                                                  case ORDER_SET_LONG:
                                                            if(ordertype == OP_BUY || ordertype == OP_BUYLIMIT || ordertype == OP_BUYSTOP)
                                                                      exit(ticket);
                                                            break;
                                                  case ORDER_SET_SHORT:
                                                            if(ordertype == OP_SELL || ordertype == OP_SELLLIMIT || ordertype == OP_SELLSTOP)
                                                                      exit(ticket);
                                                            break;
                                                  case ORDER_SET_LIMIT:
                                                            if(ordertype == OP_BUYLIMIT || ordertype == OP_SELLLIMIT)
                                                                      exit(ticket);
                                                            break;
                                                  case ORDER_SET_STOP:
                                                            if(ordertype == OP_BUYSTOP || ordertype == OP_SELLSTOP)
                                                                      exit(ticket);
                                                            break;
                                                  case ORDER_SET_MARKET:
                                                            if(ordertype <= 1) exit(ticket);
                                                            break;
                                                  case ORDER_SET_PENDING:
                                                            if(ordertype > 1) exit(ticket);
                                                            break;
                                                  default: exit(ticket); //
                                        } //
                              } //
                    } //
          } //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}

//+------------------------------------------------------------------+
//| Sending an order                                                 |
//+------------------------------------------------------------------+
int TradingFaderUpdated::send_order(string ins, int cmd, double volume, int distance, int slippage, int sl, int tp, string comment = NULL, int magic = 0, int expire = 0, color a_clr = clrNONE, bool market = false)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          double price = 0;
          double price_sl = 0;
          double price_tp = 0;
          double point = MarketInfo(ins, MODE_POINT);
          datetime expiry = 0;
          int order_type = -1;
          if(cmd == OP_BUY)
          {         if(distance > 0) order_type = OP_BUYSTOP;
                    else if(distance < 0) order_type = OP_BUYLIMIT;
                    else order_type = OP_BUY;
                    if(order_type == OP_BUY) distance = 0;
                    price = MarketInfo(ins, MODE_ASK) + distance * point;
                    if(!market)
                    {         if(sl > 0) price_sl = price - sl * point;
                              if(tp > 0) price_tp = price + tp * point; //
                    } //
          }
          else if(cmd == OP_SELL)
          {         if(distance > 0) order_type = OP_SELLLIMIT;
                    else if(distance < 0) order_type = OP_SELLSTOP;
                    else order_type = OP_SELL;
                    if(order_type == OP_SELL) distance = 0;
                    price = MarketInfo(ins, MODE_BID) + distance * point;
                    if(!market)
                    {         if(sl > 0) price_sl = price + sl * point;
                              if(tp > 0) price_tp = price - tp * point; } ///
          }
          if(order_type < 0) return 0;
          else  if(order_type == 0 || order_type == 1) expiry = 0;
          else if(expire > 0)
                    expiry = (datetime)MarketInfo(ins, MODE_TIME) + expire;
          if(market)
          {         int ticket = OrderSend(ins, order_type, volume, price, slippage, 0, 0, comment, magic, expiry, a_clr);
                    if(ticket > 0)
                    {         if(OrderSelect(ticket, SELECT_BY_TICKET))
                              {         if(cmd == OP_BUY)
                                        {         if(sl > 0) price_sl = OrderOpenPrice() - sl * point;
                                                  if(tp > 0) price_tp = OrderOpenPrice() + tp * point; }
                                        else if(cmd == OP_SELL)
                                        {         if(sl > 0) price_sl = OrderOpenPrice() + sl * point;
                                                  if(tp > 0) price_tp = OrderOpenPrice() - tp * point; }
                                        bool result = modify(ticket, price_sl, price_tp); //
                              } //
                    }
                    return ticket; //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return OrderSend(ins, order_type, volume, price, slippage, price_sl, price_tp, comment, magic, expiry, a_clr); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int TradingFaderUpdated::send_order2(string ins, int cmd, double volume, int distance, int slippage, int sl, int tp, string comment = NULL, int magic = 0, int expire = 0, color a_clr = clrNONE)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          double price = 0;
          double price_sl = 0;
          double price_tp = 0;
          double point = MarketInfo(ins, MODE_POINT);
          datetime expiry = 0;
          int order_type = -1;
          if(cmd == OP_BUY)
          {         if(distance > 0) order_type = OP_BUYSTOP;
                    else if(distance < 0) order_type = OP_BUYLIMIT;
                    else order_type = OP_BUY;
                    if(order_type == OP_BUY) distance = 0;
                    price = MarketInfo(ins, MODE_ASK) + distance * point;
                    if(sl > 0) price_sl = price - sl * point;
                    if(tp > 0) price_tp = price + tp * point; }
          else if(cmd == OP_SELL)
          {         if(distance > 0) order_type = OP_SELLLIMIT;
                    else if(distance < 0) order_type = OP_SELLSTOP;
                    else order_type = OP_SELL;
                    if(order_type == OP_SELL) distance = 0;
                    price = MarketInfo(ins, MODE_BID) + distance * point;
                    if(sl > 0) price_sl = price + sl * point;
                    if(tp > 0) price_tp = price - tp * point; }
          if(order_type < 0) return 0;
          else  if(order_type == 0 || order_type == 1) expiry = 0;
          else if(expire > 0)
                    expiry = (datetime)MarketInfo(ins, MODE_TIME) + expire;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return OrderSend(ins, order_type, volume, price, slippage, price_sl, price_tp, comment, magic, expiry, a_clr);//
}
//+------------------------------------------------------------------+
//| Checking before send_order() function is called                  |
//+------------------------------------------------------------------+
int TradingFaderUpdated::entry(string ins, int cmd, double volume, int distance, int slippage, int sl, int tp, string comment = NULL, int magic = 0, int expire = 0, color a_clr = clrNONE, bool market = false, int retries = 3, int sleep = 500)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          int ticket = 0;
          for(int i = 0; i < retries; i++)
          {         if(IsStopped()) Print("Expert was stopped");
                    else if(!IsConnected()) Print("No internet connection");
                    else if(!IsExpertEnabled()) Print("Experts not enabled in trading platform");
                    else if(IsTradeContextBusy()) Print("Trade context is busy");
                    else if(!IsTradeAllowed()) Print("Trade is not allowed in trading platform");
                    else ticket = send_order(ins, cmd, volume, distance, slippage, sl, tp, comment, magic, expire, a_clr, market);
                    if(ticket > 0)
                              break;
                    else Print("Error in sending order (" + IntegerToString(GetLastError(), 0) + "), retry: " + IntegerToString(i, 0) + "/" + IntegerToString(retries));
                    Sleep(sleep); //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return ticket; //
}
//+------------------------------------------------------------------+
//| Trailingstop check for an order                                  |
//+------------------------------------------------------------------+
bool TradingFaderUpdated::trailingstop_check_order(int ticket, int trail, int threshold, int step)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          if(ticket <= 0) return true;
          if(!OrderSelect(ticket, SELECT_BY_TICKET)) return false;
          int digits = (int) MarketInfo(OrderSymbol(), MODE_DIGITS);
          double point = MarketInfo(OrderSymbol(), MODE_POINT);
          bool result = true;
          if(OrderType() == OP_BUY)
          {         double newsl = OrderClosePrice() - trail * point;
                    double activation = OrderOpenPrice() + threshold * point;
                    double activation_sl = activation - (trail * point);
                    double step_in_pts = newsl - OrderStopLoss();
                    if(OrderStopLoss() == 0 || compare_doubles(activation_sl, OrderStopLoss(), digits) > 0)
                    {         if(compare_doubles(OrderClosePrice(), activation, digits) >= 0)
                                        result = modify(ticket, activation_sl); }
                    else if(compare_doubles(step_in_pts, step * point, digits) >= 0)
                    {         result = modify(ticket, newsl); } //
          }
          else if(OrderType() == OP_SELL)
          {         double newsl = OrderClosePrice() + trail * point;
                    double activation = OrderOpenPrice() - threshold * point;
                    double activation_sl = activation + (trail * point);
                    double step_in_pts = OrderStopLoss() - newsl;
                    if(OrderStopLoss() == 0 || compare_doubles(activation_sl, OrderStopLoss(), digits) < 0)
                    {         if(compare_doubles(OrderClosePrice(), activation, digits) <= 0)
                                        result = modify(ticket, activation_sl); }
                    else if(compare_doubles(step_in_pts, step * point, digits) >= 0)
                    {         result = modify(ticket, newsl); } //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return result; //
}
//+------------------------------------------------------------------+
//| Trailingstop check for all orders                                |
//+------------------------------------------------------------------+
void TradingFaderUpdated::trailingstop_check(int trail, int threshold, int step, int magic = -1)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          for(int i = 0; i < OrdersTotal(); i++)
          {         if(OrderSelect(i, SELECT_BY_POS))
                    {         if(magic == -1 || magic == OrderMagicNumber())
                                        trailingstop_check_order(OrderTicket(), trail, threshold, step); ///
                    } //
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//| Addition of a new signal                                         |
//+------------------------------------------------------------------+
int TradingFaderUpdated::signal_add(int current, int add, bool exit = false)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          if(current == TRADE_SIGNAL_VOID)
                    return current;
          else if(current == TRADE_SIGNAL_NEUTRAL)
                    return add;
          else
          {         if(add == TRADE_SIGNAL_NEUTRAL)
                              return current;
                    else if(add == TRADE_SIGNAL_VOID)
                              return add;
                    else if(add != current)
                    {         if(exit)
                                        return TRADE_SIGNAL_VOID;
                              else
                                        return TRADE_SIGNAL_NEUTRAL; //
                    }//
          }
          return add;//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//| Money management                                                 |
//+------------------------------------------------------------------+
double TradingFaderUpdated::mm(MM method, string ins, double lots, int sl, double risk_mm1, double lots_mm2, double per_mm2, double risk_mm3, double risk_mm4)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          double balance = AccountBalance();
          double tick_value = MarketInfo(ins, MODE_TICKVALUE);
          double volume = lots;
          switch(method)
          {         case MM_RISK_PERCENT:               if(sl > 0) volume = ((balance * risk_mm1) / sl) / tick_value; break;
                    case MM_FIXED_RATIO:                           volume =   balance * lots_mm2 / per_mm2; break;
                    case MM_FIXED_RISK:                 if(sl > 0) volume = (risk_mm3 / tick_value) / sl; break;
                    case MM_FIXED_RISK_PER_POINT:                  volume =  risk_mm4 / tick_value; break; ///
          }
          double min_lot = MarketInfo(ins, MODE_MINLOT);
          double max_lot = MarketInfo(ins, MODE_MAXLOT);
          int lot_digits = (int) - MathLog10(MarketInfo(ins, MODE_LOTSTEP));
          volume = NormalizeDouble(volume, lot_digits);
          if(volume < min_lot) volume = min_lot;
          if(volume > max_lot) volume = max_lot;
          return volume; //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//| New bar detection                                                |
//+------------------------------------------------------------------+
bool TradingFaderUpdated::is_new_bar(string ins, int tf, bool wait = false)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          static datetime bar_time = 0;
          static double open_price = 0;
          datetime current_bar_time = iTime(ins, tf, 0);
          double current_open_price = iOpen(ins, tf, 0);
          int digits = (int)MarketInfo(ins, MODE_DIGITS);
          if(bar_time == 0 && open_price == 0)
          {         bar_time = current_bar_time;
                    open_price = current_open_price;
                    if(wait)
                              return false;
                    else return true;//
          }
          else if(current_bar_time > bar_time &&
                              compare_doubles(open_price, current_open_price, digits) != 0)
          {         bar_time = current_bar_time;
                    open_price = current_open_price;
                    return true; //
          }
          return false; //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//| Counting of orders                                               |
//+------------------------------------------------------------------+
int TradingFaderUpdated::count_orders(ENUM_ORDER_SET type = -1, int magic = -1)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          int count = 0;
          for(int i = OrdersTotal(); i >= 0; i--)
          {         if(OrderSelect(i, SELECT_BY_POS))
                    {         if(magic == -1 || magic == OrderMagicNumber())
                              {         int ordertype = OrderType();
                                        int ticket = OrderTicket();
                                        switch(type)
                                        {         case ORDER_SET_BUY:
                                                            if(ordertype == OP_BUY) count++;
                                                            break;
                                                  case ORDER_SET_SELL:
                                                            if(ordertype == OP_SELL) count++;
                                                            break;
                                                  case ORDER_SET_BUY_LIMIT:
                                                            if(ordertype == OP_BUYLIMIT) count++;
                                                            break;
                                                  case ORDER_SET_SELL_LIMIT:
                                                            if(ordertype == OP_SELLLIMIT) count++;
                                                            break;
                                                  case ORDER_SET_BUY_STOP:
                                                            if(ordertype == OP_BUYSTOP) count++;
                                                            break;
                                                  case ORDER_SET_SELL_STOP:
                                                            if(ordertype == OP_SELLSTOP) count++;
                                                            break;
                                                  case ORDER_SET_LONG:
                                                            if(ordertype == OP_BUY || ordertype == OP_BUYLIMIT || ordertype == OP_BUYSTOP)
                                                                      count++;
                                                            break;
                                                  case ORDER_SET_SHORT:
                                                            if(ordertype == OP_SELL || ordertype == OP_SELLLIMIT || ordertype == OP_SELLSTOP)
                                                                      count++;
                                                            break;
                                                  case ORDER_SET_LIMIT:
                                                            if(ordertype == OP_BUYLIMIT || ordertype == OP_SELLLIMIT)
                                                                      count++;
                                                            break;
                                                  case ORDER_SET_STOP:
                                                            if(ordertype == OP_BUYSTOP || ordertype == OP_SELLSTOP)
                                                                      count++;
                                                            break;
                                                  case ORDER_SET_MARKET:
                                                            if(ordertype <= 1) count++;
                                                            break;
                                                  case ORDER_SET_PENDING:
                                                            if(ordertype > 1) count++;
                                                            break;
                                                  default: count++; //
                                        } //
                              }//
                    } //
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return count;//
}
//+------------------------------------------------------------------+
//| Checking if time is in range                                     |
//+------------------------------------------------------------------+
bool TradingFaderUpdated::is_time_in_range(datetime time, int start_hour, int start_min, int end_hour, int end_min, int gmt_offset = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          if(gmt_offset != 0)
          {         start_hour += gmt_offset;
                    end_hour += gmt_offset; }
          if(start_hour > 23) start_hour = (start_hour - 23) - 1;
          else if(start_hour < 0) start_hour = 23 + start_hour + 1;
          if(end_hour > 23) end_hour = (end_hour - 23) - 1;
          else if(end_hour < 0) end_hour = 23 + end_hour + 1;
          int hour = TimeHour(time);
          int minute = TimeMinute(time);
          int t = (hour * 3600) + (minute * 60);
          int s = (start_hour * 3600) + (start_min * 60);
          int e = (end_hour * 3600) + (end_min * 60);
          if(s == e)
                    return true;
          else if(s < e)
          {         if(t >= s && t < e)
                              return true; }
          else if(s > e)
          {         if(t >= s || t < e)
                              return true; }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return false;//
}
//+------------------------------------------------------------------+
//| Virtual stop checking for an order                               |
//+------------------------------------------------------------------+
bool TradingFaderUpdated::virtualstop_check_order(int ticket, int sl, int tp)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          if(ticket <= 0) return true;
          if(!OrderSelect(ticket, SELECT_BY_TICKET)) return false;
          int digits = (int) MarketInfo(OrderSymbol(), MODE_DIGITS);
          double point = MarketInfo(OrderSymbol(), MODE_POINT);
          bool result = true;
          if(OrderType() == OP_BUY)
          {         double virtual_stoploss = OrderOpenPrice() - sl * point;
                    double virtual_takeprofit = OrderOpenPrice() + tp * point;
                    if((sl > 0 && compare_doubles(OrderClosePrice(), virtual_stoploss, digits) <= 0) ||
                                        (tp > 0 && compare_doubles(OrderClosePrice(), virtual_takeprofit, digits) >= 0))
                    {         result = exit_order(ticket); } }
          else if(OrderType() == OP_SELL)
          {         double virtual_stoploss = OrderOpenPrice() + sl * point;
                    double virtual_takeprofit = OrderOpenPrice() - tp * point;
                    if((sl > 0 && compare_doubles(OrderClosePrice(), virtual_stoploss, digits) >= 0) ||
                                        (tp > 0 && compare_doubles(OrderClosePrice(), virtual_takeprofit, digits) <= 0))
                    {         result = exit_order(ticket); } }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return result; //
}
//+------------------------------------------------------------------+
//| Virtual stop check for all orders                                |
//+------------------------------------------------------------------+
void TradingFaderUpdated::virtualstop_check(int sl, int tp, int magic = -1)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          for(int i = 0; i < OrdersTotal(); i++)
          {         if(OrderSelect(i, SELECT_BY_POS))
                              if(magic == -1 || magic == OrderMagicNumber())
                                        virtualstop_check_order(OrderTicket(), sl, tp); //
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-TradingFaderUpdated- Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//|             Class TradingFaderUpdated     BEGIN-END              |
//+------------------------------------------------------------------+
