//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+




struct Ct_Series_Base
{         Ct_MqlSeries   MQL;
          bool          RefreshRate() {IsRefreshRate = false; if(IsConnected()) {IsRefreshRate = MQL._RefreshRates();} return (IsRefreshRate); }
          bool          IsRefreshRate;

};
//+------------------------------------------------------------------+
