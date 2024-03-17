//+------------------------------------------------------------------+
//|                                                       C_Size.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\.CoverOGCP.mqh>
//+------------------------------------------------------------------+
//|             Class C_CHART::BEGIN                                 |
//+------------------------------------------------------------------+
class C_OSTART_Pad
{
public:
          bool          C_OSTART_Pad::Update();// {return true;};
          bool          C_OSTART_Pad::UPDATED;
          //
};
//+------------------------------------------------------------------+
//|             Class C_CHART::BEGIN                                 |OrderPutting.IsMarkets
//+------------------------------------------------------------------+
bool C_OSTART_Pad::Update()
{         UPDATED = false;
          {         ct_Drive.TDD.ct_Start.Panel_OrderPutting.Is_Orders                 = RightMenu.SubController.OrderPutting.Is_Orders; // OrderPutting.IsOrders;
                    //Is_OrdersPuted;
                    ct_Drive.TDD.ct_Start.Panel_OrderPutting.Is_Markets                = RightMenu.SubController.OrderPutting.Is_Markets;
                    ct_Drive.TDD.ct_Start.Panel_OrderPutting.Is_MarketsBuy             = RightMenu.SubController.OrderPutting.Is_OrdersBuy;
                    ct_Drive.TDD.ct_Start.Panel_OrderPutting.Is_MarketsSell            = RightMenu.SubController.OrderPutting.Is_MarketsSell;
                    //Is_BuyMarketPuted,                Is_SellMarketPuted;
                    ct_Drive.TDD.ct_Start.Panel_OrderPutting.Is_PendingsBuyLimit       = RightMenu.SubController.OrderPutting.Is_PendingsBuyLimit;
                    ct_Drive.TDD.ct_Start.Panel_OrderPutting.Is_PendingsBuyStop        = RightMenu.SubController.OrderPutting.Is_PendingsBuyStop;
                    //Is_BuyLimitPuted,                 Is_BuyStopPuted;
                    ct_Drive.TDD.ct_Start.Panel_OrderPutting.Is_PendingsSellLimit      = RightMenu.SubController.OrderPutting.Is_PendingsSellLimit;
                    ct_Drive.TDD.ct_Start.Panel_OrderPutting.Is_PendingsSellStop       = RightMenu.SubController.OrderPutting.Is_PendingsSellStop;
                    //Is_SellLimitPuted,                Is_SellStopPuted;
          }
          this.UPDATED = true;//
          if(!this.UPDATED)    {Alert("Start_Pad.UPDATED: ", this.UPDATED);}
          return UPDATED;//
}
//+------------------------------------------------------------------+
