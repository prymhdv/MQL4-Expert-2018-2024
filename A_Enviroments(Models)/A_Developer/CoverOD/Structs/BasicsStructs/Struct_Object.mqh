//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|                                             CDSObject.mqh |
//|                   Copyright 2009-2013, MetaQuotes Software Corp. |
//|                                              http://www.mql4.com |
//+------------------------------------------------------------------+
//#include "StdLibErr.mqh"
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\StdLibErr.mqh>
//+------------------------------------------------------------------+
//| Class CDSObject.   class data struct                             |
//| Purpose: Base class for storing elements.                        |
//+------------------------------------------------------------------+
class CDSObject //as double list  //sth like ptr_node_prev
{
private:
          CDSObject              *ptr_m_prev;               // previous item of list
          CDSObject              *ptr_m_next;               // next item of list

public:
          CDSObject(void): ptr_m_prev(NULL), ptr_m_next(NULL)                 {       } //Print("       Passd StackOverflow",__FUNCSIG__);   !! defaultly are null pointer
          ~CDSObject(void)                                                    {       }
          //--- methods to access protected data
          CDSObject          *Prev(void)                      const           { return(ptr_m_prev);}
          void                          Prev(CDSObject *ptr_node_prev)                 { ptr_m_prev = ptr_node_prev;}
          CDSObject           *Next(void)                     const           { return(ptr_m_next);}
          void                          Next(CDSObject *ptr_node_next)                 { ptr_m_next = ptr_node_next;}
          //--- methods for working with files
          virtual bool                  Save(const int file_handle)                     { return(true);}
          virtual bool                  Load(const int file_handle)                     { return(true);}
          //--- method of identifying the object
          virtual int                   Type(void)                      const           { return(0);}
          //--- method of comparing the objects
          virtual int                   Compare(const CDSObject *ptr_node_prev, const int mode = 0) const { return(0);} //
};
//+------------------------------------------------------------------+
