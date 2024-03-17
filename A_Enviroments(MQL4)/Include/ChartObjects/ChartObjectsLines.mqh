//+------------------------------------------------------------------+
//|                                            ChartObjectsLines.mqh |
//|                   Copyright 2009-2013, MetaQuotes Software Corp. |
//|                                              http://www.mql5.com |
//+------------------------------------------------------------------+
//| All lines.                                                       |
//+------------------------------------------------------------------+
#include "ChartObject.mqh"
//+------------------------------------------------------------------+
//| Class CChartObjectVLine_MQL4.                                         |
//| Purpose: Class of the "Vertical line" object of chart.           |
//|          Derives from class CChartObject_MQL4.                        |
//+------------------------------------------------------------------+
class CChartObjectVLine_MQL4 : public CChartObject_MQL4
{
public:
          CChartObjectVLine_MQL4(void);
          ~CChartObjectVLine_MQL4(void);
          //--- method of creating the object
          bool              Create(long chart_id, const string name, const int window, const datetime time);
          //--- method of identifying the object
          virtual int       Type(void) const { return(OBJ_VLINE); }
          //------------------------------------------------
          //---Extr DEV
          bool              CreateCall(long ChartID_, string Name_, int SubWindow_) {return Create( ChartID_, Name_, SubWindow_, 0);}
          //------------------------------------------------
          //
};
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CChartObjectVLine_MQL4::CChartObjectVLine_MQL4(void)
{}
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CChartObjectVLine_MQL4::~CChartObjectVLine_MQL4(void)
{}
//+------------------------------------------------------------------+
//| Create object "Vertical line"                                    |
//+------------------------------------------------------------------+
bool CChartObjectVLine_MQL4::Create(long chart_id, const string name, const int window, const datetime time)
{         if(!ObjectCreate(chart_id, name, OBJ_VLINE, window, time, 0.0))
                    return(false);
          if(!Attach(chart_id, name, window, 1))
                    return(false);
          Selectable(false);
          Hidden(true);
//--- successful
          return(true); }
//+------------------------------------------------------------------+
//| Class CChartObjectHLine_MQL4.                                         |
//| Purpose: Class of the "Horizontal line" object of chart.         |
//|          Derives from class CChartObject_MQL4.                        |
//+------------------------------------------------------------------+
class CChartObjectHLine_MQL4 : public CChartObject_MQL4
{
public:
          CChartObjectHLine_MQL4(void);
          ~CChartObjectHLine_MQL4(void);

          //------------------------------------------------------------------------------------------------------------
          //--- method of creating the object
          bool              Create(long chart_id, const string name, const int window, const double price);
          //--- method of identifying the object
          virtual int       Type(void) const { return(OBJ_HLINE); }

          //------------------------------------------------
          //---Extr DEV
          bool              CreateCall(long ChartID_, string Name_, int SubWindow_) {return Create( ChartID_, Name_, SubWindow_, 0);}
          //------------------------------------------------
          //

};
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CChartObjectHLine_MQL4::CChartObjectHLine_MQL4(void)
{}
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CChartObjectHLine_MQL4::~CChartObjectHLine_MQL4(void)
{}
//+------------------------------------------------------------------+
//| Create object "Horizontal line"                                  |
//+------------------------------------------------------------------+
bool CChartObjectHLine_MQL4::Create(long chart_id, const string name, const int window, const double price)
{         if(!ObjectCreate(chart_id, name, OBJ_HLINE, window, 0, price))
                    return(false);
          if(!Attach(chart_id, name, window, 1))
                    return(false);
          Selectable(false);
          Hidden(true);
//--- successful
          return(true); }
//+------------------------------------------------------------------+
//| Class CChartObjectTrend_MQL4.                                         |
//| Purpose: Class of the "Trendline" object of chart.               |
//|          Derives from class CChartObject_MQL4.                        |
//| It is the parent class for all objects that have properties      |
//| RAY_LEFT and RAY_RIGHT.                                          |
//+------------------------------------------------------------------+
class CChartObjectTrend_MQL4 : public CChartObject_MQL4
{
public:
          CChartObjectTrend_MQL4(void);
          ~CChartObjectTrend_MQL4(void);
          //--- methods of access to properties of the object
          bool              RayLeft(void) const;
          bool              RayLeft(const bool new_sel) const;
          bool              RayRight(void) const;
          bool              RayRight(const bool new_sel) const;
          //--- method of creating the object
          bool              Create(long chart_id, const string name, const int window,
                                   const datetime time1, const double price1,
                                   const datetime time2, const double price2);
          //--- method of identifying the object
          virtual int       Type(void) const { return(OBJ_TREND); }
          //--- methods for working with files
          virtual bool      Save(const int file_handle);
          virtual bool      Load(const int file_handle);
          //------------------------------------------------
          //---Extr DEV
          bool              CreateCall(long ChartID_, string Name_, int SubWindow_) { return Create(  ChartID_, Name_, SubWindow_, 0, 0, 0, 0);}
          //------------------------------------------------


};
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CChartObjectTrend_MQL4::CChartObjectTrend_MQL4(void)
{}
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CChartObjectTrend_MQL4::~CChartObjectTrend_MQL4(void)
{}
//+------------------------------------------------------------------+
//| Create object "Trendline"                                        |
//+------------------------------------------------------------------+
bool CChartObjectTrend_MQL4::Create(long chart_id, const string name, const int window,
                               const datetime time1, const double price1,
                               const datetime time2, const double price2)
{         if(!ObjectCreate(chart_id, name, OBJ_TREND, window, time1, price1, time2, price2))
                    return(false);
          if(!Attach(chart_id, name, window, 2))
                    return(false);
          Selectable(false);
          Hidden(true);
//--- successful
          return(true); }
//+------------------------------------------------------------------+
//| Get the "Ray left" flag                                          |
//+------------------------------------------------------------------+
bool CChartObjectTrend_MQL4::RayLeft(void) const
{
//--- check
          if(m_chart_id == -1)
                    return(false);
//--- result
          return((bool)ObjectGetInteger(m_chart_id, m_name, OBJPROP_RAY_LEFT)); }
//+------------------------------------------------------------------+
//| Set the "Ray left" flag                                          |
//+------------------------------------------------------------------+
bool CChartObjectTrend_MQL4::RayLeft(const bool new_ray) const
{
//--- check
          if(m_chart_id == -1)
                    return(false);
//--- result
          return(ObjectSetInteger(m_chart_id, m_name, OBJPROP_RAY_LEFT, new_ray)); }
//+------------------------------------------------------------------+
//| Get the "Ray right" flag                                         |
//+------------------------------------------------------------------+
bool CChartObjectTrend_MQL4::RayRight(void) const
{
//--- check
          if(m_chart_id == -1)
                    return(false);
//--- result
          return((bool)ObjectGetInteger(m_chart_id, m_name, OBJPROP_RAY_RIGHT)); }
//+------------------------------------------------------------------+
//| Set the "Ray right" flag                                         |
//+------------------------------------------------------------------+
bool CChartObjectTrend_MQL4::RayRight(const bool new_ray) const
{
//--- check
          if(m_chart_id == -1)
                    return(false);
//--- result
          return(ObjectSetInteger(m_chart_id, m_name, OBJPROP_RAY_RIGHT, new_ray)); }
//+------------------------------------------------------------------+
//| Writing parameters of objject to file                            |
//+------------------------------------------------------------------+
bool CChartObjectTrend_MQL4::Save(const int file_handle)
{
//--- check
          if(file_handle == INVALID_HANDLE || m_chart_id == -1)
                    return(false);
//--- write
          if(!CChartObject_MQL4::Save(file_handle))
                    return(false);
//--- write value of the "Ray left" property
          if(FileWriteInteger(file_handle, (int)ObjectGetInteger(m_chart_id, m_name, OBJPROP_RAY_LEFT), CHAR_VALUE) != sizeof(char))
                    return(false);
//--- write value of the "Ray right" property
          if(FileWriteInteger(file_handle, (int)ObjectGetInteger(m_chart_id, m_name, OBJPROP_RAY_RIGHT), CHAR_VALUE) != sizeof(char))
                    return(false);
//--- successful
          return(true); }
//+------------------------------------------------------------------+
//| Reading parameters of object from file                           |
//+------------------------------------------------------------------+
bool CChartObjectTrend_MQL4::Load(const int file_handle)
{
//--- check
          if(file_handle == INVALID_HANDLE || m_chart_id == -1)
                    return(false);
//--- read
          if(!CChartObject_MQL4::Load(file_handle))
                    return(false);
//--- read value of the "Ray left" property
          if(!ObjectSetInteger(m_chart_id, m_name, OBJPROP_RAY_LEFT, FileReadInteger(file_handle, CHAR_VALUE)))
                    return(false);
//--- read value of the "Ray right" property
          if(!ObjectSetInteger(m_chart_id, m_name, OBJPROP_RAY_RIGHT, FileReadInteger(file_handle, CHAR_VALUE)))
                    return(false);
//--- successful
          return(true); }
//+------------------------------------------------------------------+
//| Class CChartObjectTrendByAngle_MQL4.                                  |
//| Puprose: Class of the "Trendline by angle" object of chart.      |
//|          Derives from class CChartObjectTrend_MQL4.                   |
//+------------------------------------------------------------------+
class CChartObjectTrendByAngle_MQL4 : public CChartObjectTrend_MQL4
{
public:
          CChartObjectTrendByAngle_MQL4(void);
          ~CChartObjectTrendByAngle_MQL4(void);
          //--- methods of access to properties of the object
          double            Angle(void) const;
          bool              Angle(const double angle) const;
          //--- method of creating the object
          bool              Create(long chart_id, const string name, const int window,
                                   const datetime time1, const double price1,
                                   const datetime time2, const double price2);
          //--- method of identifying the object
          virtual int       Type(void) const { return(OBJ_TRENDBYANGLE); }
          //------------------------------------------------
          //---Extr DEV
          bool              CreateCall(long ChartID_, string Name_, int SubWindow_) { return Create(  ChartID_, Name_, SubWindow_, 0, 0, 0, 0);}
          //------------------------------------------------

};
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CChartObjectTrendByAngle_MQL4::CChartObjectTrendByAngle_MQL4(void)
{}
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CChartObjectTrendByAngle_MQL4::~CChartObjectTrendByAngle_MQL4(void)
{}
//+------------------------------------------------------------------+
//| Create object "Trendline by angle"                               |
//+------------------------------------------------------------------+
bool CChartObjectTrendByAngle_MQL4::Create(long chart_id, const string name, const int window,
                                      const datetime time1, const double price1,
                                      const datetime time2, const double price2)
{         if(!ObjectCreate(chart_id, name, OBJ_TRENDBYANGLE, window, time1, price1, time2, price2))
                    return(false);
          if(!Attach(chart_id, name, window, 2))
                    return(false);
          Selectable(false);
          Hidden(true);
//--- successful
          return(true); }
//+------------------------------------------------------------------+
//| Get the "Angle" property                                         |
//+------------------------------------------------------------------+
double CChartObjectTrendByAngle_MQL4::Angle(void) const
{
//--- check
          if(m_chart_id == -1)
                    return(EMPTY_VALUE);
//---
          return(ObjectGetDouble(m_chart_id, m_name, OBJPROP_ANGLE)); }
//+------------------------------------------------------------------+
//| Set the "Angle" property                                         |
//+------------------------------------------------------------------+
bool CChartObjectTrendByAngle_MQL4::Angle(const double angle) const
{
//--- check
          if(m_chart_id == -1)
                    return(false);
//--- result
          return(ObjectSetDouble(m_chart_id, m_name, OBJPROP_ANGLE, angle)); }
//+------------------------------------------------------------------+
//| Class CChartObjectCycles_MQL4.                                        |
//| Purpose: Class of the "Cycle lines" object of chart.             |
//|          Derives from class CChartObject_MQL4.                        |
//+------------------------------------------------------------------+
class CChartObjectCycles_MQL4 : public CChartObject_MQL4
{
public:
          CChartObjectCycles_MQL4(void);
          ~CChartObjectCycles_MQL4(void);
          //--- method of creating the object
          bool              Create(long chart_id, const string name, const int window,
                                   const datetime time1, const double price1,
                                   const datetime time2, const double price2);
          //--- method of identifying the object
          virtual int       Type(void) const { return(OBJ_TREND); }
          //------------------------------------------------
          //---Extr DEV
          bool              CreateCall(long ChartID_, string Name_, int SubWindow_) { return Create(  ChartID_, Name_, SubWindow_, 0, 0, 0, 0);}
          //------------------------------------------------


};
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CChartObjectCycles_MQL4::CChartObjectCycles_MQL4(void)
{}
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CChartObjectCycles_MQL4::~CChartObjectCycles_MQL4(void)
{}
//+------------------------------------------------------------------+
//| Create object "Cycle lines"                                      |
//+------------------------------------------------------------------+
bool CChartObjectCycles_MQL4::Create(long chart_id, const string name, const int window,
                                const datetime time1, const double price1,
                                const datetime time2, const double price2)
{         if(!ObjectCreate(chart_id, name, OBJ_CYCLES, window, time1, price1, time2, price2))
                    return(false);
          if(!Attach(chart_id, name, window, 2))
                    return(false);
          Selectable(false);
          Hidden(true);
//--- successful
          return(true); }
//+------------------------------------------------------------------+
