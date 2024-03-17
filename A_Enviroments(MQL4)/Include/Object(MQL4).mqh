//+------------------------------------------------------------------+
//|                                                       Object.mqh |
//|                   Copyright 2009-2013, MetaQuotes Software Corp. |
//|                                              http://www.mql4.com |
//+------------------------------------------------------------------+
#include "StdLibErr.mqh"
//+------------------------------------------------------------------+
//| Class CObject_MQL4.                                                   |
//| Purpose: Base class for storing elements.                        |
//+------------------------------------------------------------------+
class CObject_MQL4
  {
private:
   CObject_MQL4          *m_prev;               // previous item of list
   CObject_MQL4          *m_next;               // next item of list

public:
                     CObject_MQL4(void): m_prev(NULL),m_next(NULL)            {                 }
                    ~CObject_MQL4(void)                                       {                 }
   //--- methods to access protected data
   CObject_MQL4          *Prev(void)                                    const { return(m_prev); }
   void              Prev(CObject_MQL4 *node)                                 { m_prev=node;    }
   CObject_MQL4          *Next(void)                                    const { return(m_next); }
   void              Next(CObject_MQL4 *node)                                 { m_next=node;    }
   //--- methods for working with files
   virtual bool      Save(const int file_handle)                         { return(true);   }
   virtual bool      Load(const int file_handle)                         { return(true);   }
   //--- method of identifying the object
   virtual int       Type(void)                                    const { return(0);      }
   //--- method of comparing the objects
   virtual int       Compare(const CObject_MQL4 *node,const int mode=0) const { return(0); }
  };
//+------------------------------------------------------------------+
