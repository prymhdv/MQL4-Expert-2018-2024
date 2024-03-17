//+------------------------------------------------------------------+
//|                                                      CSeries.mqh |
//|                                     Copyright 2017, S.Aukscionis |
//+------------------------------------------------------------------+
#property copyright "Copyright 2017, S.Aukscionis"
#property strict
//+------------------------------------------------------------------+
//| Class CSeries                                                    |
//+------------------------------------------------------------------+
class CSeries
{         double            m_series[];

public:
          CSeries(void) {};
          ~CSeries(void) {};

public:
          double            operator[](int index);
          int               length(void);
          bool              add(double newValue, int maxLength);
          double            ma(int maPeriod);
          double            std(int maPeriod);
          double            z(int maPeriod); };
//+------------------------------------------------------------------+
//| Series member                                                    |
//+------------------------------------------------------------------+
double CSeries::operator[](int index) {return(m_series[index]);}
//+------------------------------------------------------------------+
//| Series length                                                    |
//+------------------------------------------------------------------+
int CSeries::length(void) {return(ArraySize(m_series)); }
//+------------------------------------------------------------------+
//| Add to series                                                    |
//+------------------------------------------------------------------+
bool CSeries::add(double newValue, int maxLength)
{         ArraySetAsSeries(m_series, false);
          int newLength = ArraySize(m_series) + 1;
          ArrayResize(m_series, newLength);
          m_series[newLength - 1] = newValue;
          ArraySetAsSeries(m_series, true);
          if(newLength > maxLength)
          {         ArrayResize(m_series, maxLength);
                    return(false); }
          return(true); }
//+------------------------------------------------------------------+
//| Moving average                                                   |
//+------------------------------------------------------------------+
double CSeries::ma(int maPeriod) {return(iMAOnArray(m_series, WHOLE_ARRAY, maPeriod, 0, MODE_SMA, 0)); }
//+------------------------------------------------------------------+
//| Standard deviation                                               |
//+------------------------------------------------------------------+
double CSeries::std(int maPeriod) {return(iStdDevOnArray(m_series, WHOLE_ARRAY, maPeriod, 0, MODE_SMA, 0)); }
//+------------------------------------------------------------------+
//| Z score                                                          |
//+------------------------------------------------------------------+
double CSeries::z(int maPeriod)
{         double ma = iMAOnArray(m_series, WHOLE_ARRAY, maPeriod, 0, MODE_SMA, 0);
          double std = iStdDevOnArray(m_series, WHOLE_ARRAY, maPeriod, 0, MODE_SMA, 0);
          double z = std ? (m_series[0] - ma) / std : 0;
          return(z); }
//+------------------------------------------------------------------+
