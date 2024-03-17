//+------------------------------------------------------------------+
//|                                                    UseAlglib.mq4 |
//|                        Copyright 2012, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2012, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Including the libraries                                          |
//+------------------------------------------------------------------+
#include <Math\Alglib\alglib.mqh>
#include <Arrays\ArrayDouble.mqh>
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//--- object for storing profit/loss of every trade
   CArrayDouble *profit=new CArrayDouble;
   if(CheckPointer(profit)==POINTER_INVALID)
     {
      PrintFormat("Error creating a dynamic object for storing profits/losses: %d",GetLastError());
      return;
     }
//--- objects for storing the balance
   CArrayDouble *balance_total=new CArrayDouble;
   if(CheckPointer(balance_total)==POINTER_INVALID)
     {
      PrintFormat("Error creating a dynamic object for storing the balance: %d",GetLastError());
      delete profit;
      return;
     }
//--- initial balance
   double        balance=0;
//--- retrieve the history
//--- total number of closed orders
   int orders_total=OrdersHistoryTotal();
//--- get data on profit and balance
   for(int i=0;i<orders_total;i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_HISTORY)==false)
        {
         Print("Error accessing the history database (",GetLastError(),")");
         delete profit;
         delete balance_total;
         return;
        }
      int order_type=OrderType();
      //--- get the initial balance
      if(order_type==6) // OP_BALANCE=6
        {
         if(NormalizeDouble(OrderProfit()+OrderSwap(),2)>=0.0)
            if(balance==0.0)
               balance=OrderProfit();
        }
      //--- get the profit and balance
      if(order_type==OP_BUY || order_type==OP_SELL)
        {
         if(balance==0.0)
           {
            Print("Trade operations with zero balance");
            delete balance_total;
            delete profit;
            return;
           }
         double order_profit=OrderProfit()+OrderSwap()+OrderCommission();
         profit.Add(NormalizeDouble(order_profit,2));
         balance_total.Add(balance);
         balance=balance+NormalizeDouble(order_profit,2);
        }
     }
//--- check if there are trade operations in the history
   if(balance_total.Total()==0 || profit.Total()==0)
     {
      Print("No closed trade operations in the trade history");
      delete balance_total;
      delete profit;
      return;
     }
   balance_total.Add(balance_total.At(balance_total.Total()-1)+profit.At(balance_total.Total()-1));
//--- copy the balance data into an array of double type
   double arr_balance[];
   ArrayResize(arr_balance,balance_total.Total());
   for(int i=0;i<balance_total.Total();i++)
      arr_balance[i]=balance_total.At(i);
//--- copy the profit data into an array of double type
   double arr_profit[];
   ArrayResize(arr_profit,profit.Total());
   for(int i=0;i<profit.Total();i++)
      arr_profit[i]=profit.At(i);
//--- linear regression
//--- number of independent variables
   int nvars=1;
//--- sample size
   int npoints=balance_total.Total();
//--- create a parameter matrix for linear regression
   CMatrixDouble xy(npoints,nvars+1);
   for(int i=0;i<npoints;i++)
     {
      xy[i].Set(0,i);
      xy[i].Set(1,arr_balance[i]);
     }
//--- variable for checking the calculation result (successful, unsuccessful)
   int info;
//--- class objects for storing information on calculations
   CLinearModelShell lm;
   CLRReportShell    ar;
//--- arrays for storing the regression results
   double lr_coeff[];
   double lr_values[];
   ArrayResize(lr_values,npoints);
//--- calculate linear regression coefficients
   CAlglib::LRBuild(xy,npoints,nvars,info,lm,ar);
//--- check the calculation result
   if(info!=1)
     {
      PrintFormat("Error calculating the linear regression coefficients: %d",info);
      delete balance_total;
      delete profit;
      return;
     }
//--- get the linear regression coefficients
   CAlglib::LRUnpack(lm,lr_coeff,nvars);
//--- get the recovered linear regression values
   for(int i=0;i<npoints;i++)
      lr_values[i]=lr_coeff[0]*i+lr_coeff[1];
//--- calculate Expected Payoff
   double exp_payoff,tmp1,tmp2,tmp3;
   CAlglib::SampleMoments(arr_profit,exp_payoff,tmp1,tmp2,tmp3);
//--- calculate HPR array
   double HPR[];
   ArrayResize(HPR,balance_total.Total()-1);
   for(int i=0;i<balance_total.Total()-1;i++)
      HPR[i]=balance_total.At(i+1)/balance_total.At(i);
//--- calculate standard deviation and mathematical expectation of HPR
   double AHPR,SD;
   CAlglib::SampleMoments(HPR,AHPR,SD,tmp2,tmp3);
   SD=MathSqrt(SD);
//--- calculate LR Correlation
   double lr_corr=CAlglib::PearsonCorr2(arr_balance,lr_values);
//--- get LR Standard Error
   double lr_stand_err=0;
   for(int i=0;i<npoints;i++)
     {
      double delta=MathAbs(arr_balance[i]-lr_values[i]);
      lr_stand_err=lr_stand_err+delta*delta;
     }
   lr_stand_err=MathSqrt(lr_stand_err/(npoints-2));
//--- calculate Sharpe Ratio
   double sharpe_ratio=(AHPR-1)/SD;
//--- print
   PrintFormat("-----------------------------------------------");
   PrintFormat("Correlation function: y = %.2fx + %.2f",lr_coeff[0],lr_coeff[1]);
//--- parameters
   PrintFormat("Expected Payoff = %.2f",exp_payoff);
   PrintFormat("AHPR = %.4f",AHPR);
   PrintFormat("Sharpe Ratio = %.2f",sharpe_ratio);
   PrintFormat("LR Correlation = %.2f",lr_corr);
   PrintFormat("LR Standard Error = %.2f",lr_stand_err);
   PrintFormat("-----------------------------------------------");
//--- delete objects
   delete profit;
   delete balance_total;
  }
//+------------------------------------------------------------------+
