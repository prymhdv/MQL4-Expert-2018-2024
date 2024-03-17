//+------------------------------------------------------------------+
//|                                         ChartObjectsChannels.mqh |
//|                   Copyright 2009-2013, MetaQuotes Software Corp. |
//|                                              http://www.mql5.com |
//+------------------------------------------------------------------+
//| All channels.                                                    |
//+------------------------------------------------------------------+
#include "ChartObjectsLines.mqh"
//+------------------------------------------------------------------+
//| Class CChartObjectChannel_MQL4.                                       |
//| Purpose: Class of the "Equidistant channel" object of chart.     |
//|          Derives from class CChartObjectTrend_MQL4.                   |
//+------------------------------------------------------------------+
class CChartObjectChannel_MQL4 : public CChartObjectTrend_MQL4
{
public:
          CChartObjectChannel_MQL4(void);
          ~CChartObjectChannel_MQL4(void);
          //--- method of creating the object
          bool              Create(long chart_id, const string name, const int window,
                                   const datetime time1, const double price1,
                                   const datetime time2, const double price2,
                                   const datetime time3, const double price3);
          //--- method of identifying the object
          virtual int       Type(void) const { return(OBJ_CHANNEL); }
          //
          //---Extr DEV
          bool              CreateCall(long ChartID_, string Name_, int SubWindow_) { return Create(  ChartID_, Name_, SubWindow_, 0, 0, 0, 0, 0, 0);}
          //------------------------------------------------
};
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CChartObjectChannel_MQL4::CChartObjectChannel_MQL4(void)
{}
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CChartObjectChannel_MQL4::~CChartObjectChannel_MQL4(void)
{}
//+------------------------------------------------------------------+
//| Create object "Equidistant channel"                              |
//+------------------------------------------------------------------+
bool CChartObjectChannel_MQL4::Create(long chart_id, const string name, const int window,
                                 const datetime time1, const double price1,
                                 const datetime time2, const double price2,
                                 const datetime time3, const double price3)
{         //---
          if(!ObjectCreate(chart_id, name, OBJ_CHANNEL, window, time1, price1, time2, price2, time3, price3)) return(false);
          //---
          if(!Attach(chart_id, name, window, 3)) return(false);
          Selectable(false);
          Hidden(true);
//--- successful
          return(true); //
}
//+------------------------------------------------------------------+
//| Class CChartObjectStdDevChannel_MQL4.                                 |
//| Purpose: Class of the "Standrad deviation channel"               |
//|          object of chart.                                        |
//|          Derives from class CChartObjectTrend_MQL4.                   |
//+------------------------------------------------------------------+
class CChartObjectStdDevChannel_MQL4 : public CChartObjectTrend_MQL4
{
public:
          CChartObjectStdDevChannel_MQL4(void);
          ~CChartObjectStdDevChannel_MQL4(void);
          //--- methods of access to properties of the object
          double            Deviations(void) const;
          bool              Deviations(const double deviation) const;
          //--- method of creating the object
          bool              Create(long chart_id, const string name, const int window,
                                   const datetime time1, const datetime time2, const double deviation);
          //--- method of identifying the object
          virtual int       Type(void) const { return(OBJ_STDDEVCHANNEL); }
          //--- methods for working with files
          virtual bool      Save(const int file_handle);
          virtual bool      Load(const int file_handle);//
          //---Extr DEV
          bool              CreateCall(long ChartID_, string Name_, int SubWindow_) { return Create(  ChartID_, Name_, SubWindow_, 0, 0, 0);}
          //------------------------------------------------
};
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CChartObjectStdDevChannel_MQL4::CChartObjectStdDevChannel_MQL4(void)
{}
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CChartObjectStdDevChannel_MQL4::~CChartObjectStdDevChannel_MQL4(void)
{}
//+------------------------------------------------------------------+
//| Create object "Standard deviation channel"                       |
//+------------------------------------------------------------------+
bool CChartObjectStdDevChannel_MQL4::Create(long chart_id, const string name, const int window,
                                       const datetime time1, const datetime time2, const double deviation)
{         if(!ObjectCreate(chart_id, name, OBJ_STDDEVCHANNEL, window, time1, 0.0, time2, 0.0))
                    return(false);
          if(!Attach(chart_id, name, window, 2))
                    return(false);
          if(!Deviations(deviation))
                    return(false);
          Selectable(false);
          Hidden(true);
//--- successful
          return(true); //
}
//+------------------------------------------------------------------+
//| Get value of the "Deviations" property                           |
//+------------------------------------------------------------------+
double CChartObjectStdDevChannel_MQL4::Deviations(void) const
{
//--- check
          if(m_chart_id == -1)
                    return(EMPTY_VALUE);
//--- result
          return(ObjectGetDouble(m_chart_id, m_name, OBJPROP_DEVIATION)); //
}
//+------------------------------------------------------------------+
//| Set value for the "Deviations" property                          |
//+------------------------------------------------------------------+
bool CChartObjectStdDevChannel_MQL4::Deviations(const double deviation) const
{
//--- check
          if(m_chart_id == -1)
                    return(false);
//--- result
          return(ObjectSetDouble(m_chart_id, m_name, OBJPROP_DEVIATION, deviation)); //
}
//+------------------------------------------------------------------+
//| Writing parameters of object to file                             |
//+------------------------------------------------------------------+
bool CChartObjectStdDevChannel_MQL4::Save(const int file_handle)
{
//--- check
          if(file_handle == INVALID_HANDLE || m_chart_id == -1)
                    return(false);
//--- write
          if(!CChartObjectTrend_MQL4::Save(file_handle))
                    return(false);
//--- write value of the "Deviations" property
          if(FileWriteDouble(file_handle, ObjectGetDouble(m_chart_id, m_name, OBJPROP_DEVIATION)) != sizeof(double))
                    return(false);
//--- successful
          return(true);//
}
//+------------------------------------------------------------------+
//| Reading parameters of object from file                           |
//+------------------------------------------------------------------+
bool CChartObjectStdDevChannel_MQL4::Load(const int file_handle)
{
//--- check
          if(file_handle == INVALID_HANDLE || m_chart_id == -1)
                    return(false);
//--- read
          if(!CChartObjectTrend_MQL4::Load(file_handle))
                    return(false);
//--- read value of the "Deviations" property
          if(!ObjectSetDouble(m_chart_id, m_name, OBJPROP_DEVIATION, FileReadDouble(file_handle)))
                    return(false);
//--- successful
          return(true);//
}
//+------------------------------------------------------------------+
//| Class CChartObjectRegression_MQL4.                                    |
//| Purpose: Class of the "Regression channel" object of chart.      |
//|          Derives from class CChartObjectTrend_MQL4.                   |
//+------------------------------------------------------------------+
class CChartObjectRegression_MQL4 : public CChartObjectTrend_MQL4
{
public:
          CChartObjectRegression_MQL4(void);
          ~CChartObjectRegression_MQL4(void);
          //--- method of creating the object
          bool              Create(long chart_id, const string name, const int window,
                                   const datetime time1, const datetime time2);
          //--- method of identifying the object
          virtual int       Type(void) const { return(OBJ_REGRESSION); } //
          //---Extr DEV
          bool              CreateCall(long ChartID_, string Name_, int SubWindow_) { return Create(  ChartID_, Name_, SubWindow_, 0, 0);}
          //------------------------------------------------

};
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CChartObjectRegression_MQL4::CChartObjectRegression_MQL4(void)
{}
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CChartObjectRegression_MQL4::~CChartObjectRegression_MQL4(void)
{}
//+------------------------------------------------------------------+
//| Create object "Regression channel"                               |
//+------------------------------------------------------------------+
bool CChartObjectRegression_MQL4::Create(long chart_id, const string name, const int window,
                                    const datetime time1, const datetime time2)
{         if(!ObjectCreate(chart_id, name, OBJ_REGRESSION, window, time1, 0.0, time2, 0.0))
                    return(false);
          if(!Attach(chart_id, name, window, 2))
                    return(false);
          Selectable(false);
          Hidden(true);
//--- successful
          return(true);//
}
//+------------------------------------------------------------------+
//| Class CChartObjectPitchfork_MQL4.                                     |
//| Purpose: Class of the "Andrews pitchfork" object of chart        |
//|          Derives from class CChartObjectTrend_MQL4.                   |
//+------------------------------------------------------------------+
class CChartObjectPitchfork_MQL4 : public CChartObjectTrend_MQL4
{
public:
          CChartObjectPitchfork_MQL4(void);
          ~CChartObjectPitchfork_MQL4(void);
          //--- method of creating the object
          bool              Create(long chart_id, const string name, const int window,
                                   const datetime time1, const double price1,
                                   const datetime time2, const double price2,
                                   const datetime time3, const double price3);
          //--- method of identifying the object
          virtual int       Type(void) const { return(OBJ_PITCHFORK); }//
          //---Extr DEV
          bool              CreateCall(long ChartID_, string Name_, int SubWindow_) { return Create(  ChartID_, Name_, SubWindow_, 0, 0, 0, 0, 0, 0);}
          //------------------------------------------------
};
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CChartObjectPitchfork_MQL4::CChartObjectPitchfork_MQL4(void)
{}
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CChartObjectPitchfork_MQL4::~CChartObjectPitchfork_MQL4(void)
{}
//+------------------------------------------------------------------+
//| Create object "Andrews pitchfork"                                |
//+------------------------------------------------------------------+
bool CChartObjectPitchfork_MQL4::Create(long chart_id, const string name, const int window,
                                   const datetime time1, const double price1,
                                   const datetime time2, const double price2,
                                   const datetime time3, const double price3)
{         if(!ObjectCreate(chart_id, name, OBJ_PITCHFORK, window, time1, price1, time2, price2, time3, price3))
                    return(false);
          if(!Attach(chart_id, name, window, 3))
                    return(false);
          Selectable(false);
          Hidden(true);
//--- successful
          return(true);//
}
//+------------------------------------------------------------------+
