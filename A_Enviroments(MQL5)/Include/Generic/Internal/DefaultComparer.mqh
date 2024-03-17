//+------------------------------------------------------------------+
//|                                              DefaultComparer.mqh |
//|                   Copyright 2016-2017, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL5)\Include\Generic\Interfaces\IComparer.mqh>
#include "CompareFunction.mqh"
//+------------------------------------------------------------------+
//| Class CDefaultComparer<T>.                                       |
//| Usage: Provides a default class for implementations of the       |
//|        IComparer<T> generic interface.                           |
//+------------------------------------------------------------------+
template<typename T>
class CDefaultComparer: public IComparer<T>
  {
public:
                     CDefaultComparer(void) {                        }
                    ~CDefaultComparer(void) {                        }
   //--- compares two values and returns a value describing relationship between them
   int               Compare(T x,T y) { return ::Compare(x,y); }
  };
//+------------------------------------------------------------------+
