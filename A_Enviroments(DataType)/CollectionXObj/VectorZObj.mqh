//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(DataType)\CollectionX\VectorZ.mqh>
#property strict
template<typename T>
void ArrayInsertZObj(T &array[], int index, T &value, int extraBuffer = 10)
{         int size = ArraySize(array);
          if(index < 0 || index > size) return;
          ArrayResize(array, size + 1, extraBuffer);
          for(int i = size; i > index; i--)
          {         array[i] = array[i - 1]; }
          array[index] = value; }
//+------------------------------------------------------------------+
//| Generic array delete                                             |
//+------------------------------------------------------------------+
template<typename T>
void ArrayDeleteZObj(T &array[], int index)
{         int size = ArraySize(array);
          if(index < 0 || index >= size) return;
          for(int i = index; i < size - 1; i++)
          {         array[i] = array[i + 1]; }
          ArrayResize(array, size - 1); }
//#include "../LangXObj/ArrayXObj.mqh"
#include "ListXObj.mqh"
////#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(DataType)\CollectionX\ListXX.mqh>
//+------------------------------------------------------------------+
//| Generic VectorZObj                                                   |
//+------------------------------------------------------------------+
template<typename T>
class VectorZObj
{
private:
          int               m_extraBuffer;
          T                 m_array[];
protected:
          void resize(int size)   {         ArrayResize(m_array, size, m_extraBuffer); }
          void clearArray()
          {         int s = ArraySize(m_array);
                    if(  s > 0)
                    {         for(int i = 0; i < s; i++) { SafeDeleteXObj(m_array[i]);}//
                    } //
                    ArrayFree(m_array);//
          }
//------------------------------------------------------------------------
public:
          VectorZObj(uint Rows ):  m_extraBuffer(0) { countelement = 0; resize(Rows); }
          VectorZObj():  m_extraBuffer(0) { resize(0); countelement = 0;}
          VectorZObj(const VectorZObj& that) {   this = that;}
          //VectorZObj(bool owned = true, int extraBuffer = 0, EqualityComparerXObj<T>*comparer = NULL):ListXObj<T>(owned, comparer), m_extraBuffer(extraBuffer) { resize(0); }
          ~VectorZObj()
          {         //Print("beforre VectorZObj sizeof(this):", sizeof(this)); //
                    clearArray();
                    //for(int i = 0; i < ArraySize(m_array); i++) { if(GetPointer(m_array[i]) != NULL) delete GetPointer(m_array[i]);}
                    //ArrayFree(m_array);
                    //if(GetPointer(this) != NULL){         delete GetPointer(this);}//
                    //Print("after VectorZObj sizeof(this):", sizeof(this)); //
          }
          uint countelement;

          // VectorZObj specific
          void setExtraBuffer(int value) {m_extraBuffer = value; resize(size());}
          int  getExtraBuffer() const {return m_extraBuffer;}


          // Collection interface
          void clear() {clearArray(); resize(0); ArrayFree(m_array);}
          uint  size() const {return ArraySize(m_array);}
          uint  Total() const {return ArraySize(m_array);}
          uint  total() const {return ArraySize(m_array);}
          bool add(T &value) {push(value); return true;}
          bool Add(T &value) {push(value); return true;}
          bool operator<<(T &value) {push(value); return true;}
          //void operator =(const VectorZObj &obj)
          //{         for(int i = 0; i < obj.total(); i++) { T tempobj =  obj[i]; this << tempobj; }
          //          this.m_extraBuffer = obj.m_extraBuffer; //
          //          this.countelement  = obj.countelement;
          //          //
          //}

          // Sequence interface
          void insertAt(int i, T &val)                          { ArrayInsertZObj(m_array, i, val, m_extraBuffer); countelement++; }
          T removeAt(int i)                                     { T  val = m_array[i]; ArrayDeleteZObj(m_array, i); countelement--; return val; }

          //T operator[](int i) const                             {T obj = m_array[i]; return obj;}
          T *operator[](int i)                                  {return &m_array[i];}
          //T operator[](int i)                                   {return m_array[i];}
          T get(int i) const                                    {return m_array[i];}
          T At(int i) const                                     {return m_array[i];}
          T at(int i) const                                     {return m_array[i];}
          void set(int i, T &val)                               {m_array[i] = val;}

          // Stack and Queue interface: alias for Sequence interface
          void push(T &val)                      {insertAt(size(), val);}
          T    pop()                             {return removeAt(size() - 1);}
          T    back()                            {return m_array[size() - 1];}
          T    peek() const                      {return m_array[size() - 1];}
          void unshift(T &val)                   {insertAt(0, val);}
          T    shift()                           {return removeAt(0);} //
          //-------------------------------------------------------------
          void resize(uint size, T &val) {  for(uint i = 0; i < size; i++) { add(val); } } ; //
          uint  shape(uint i)
          {         if(i == 0) return Total();
                    //if(i == 1) return m_array.Total();
                    return -1;//
          }
          //

}; VectorZObj<VectorZ<double>> VectorZobj;
//+------------------------------------------------------------------+
