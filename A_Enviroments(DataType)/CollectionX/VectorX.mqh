//+------------------------------------------------------------------+
//| Module: Collection/VectorX.mqh                                    |
//| This file is part of the mql4-lib project:                       |
//|     https://github.com/dingmaotu/mql4-lib                        |
//|                                                                  |
//| Copyright 2015-2016 Li Ding <dingmaotu@126.com>                  |
//|                                                                  |
//| Licensed under the Apache License, Version 2.0 (the "License");  |
//| you may not use this file except in compliance with the License. |
//| You may obtain a copy of the License at                          |
//|                                                                  |
//|     http://www.apache.org/licenses/LICENSE-2.0                   |
//|                                                                  |
//| Unless required by applicable law or agreed to in writing,       |
//| software distributed under the License is distributed on an      |
//| "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,     |
//| either express or implied.                                       |
//| See the License for the specific language governing permissions  |
//| and limitations under the License.                               |
//+------------------------------------------------------------------+
#property strict

#include "../LangX/ArrayX.mqh"
#include "ListX.mqh"
//#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(DataType)\CollectionX\ListXX.mqh>

//+------------------------------------------------------------------+
//| Generic VectorX                                                   |
//+------------------------------------------------------------------+
template<typename T>
class VectorX: public ListX<T>
{
private:
          int               m_extraBuffer;
          T                 m_array[];

protected:
          void resize(int size)   {         ArrayResize(m_array, size, m_extraBuffer); }
          void clearArrayX()
          {         int s = ArraySize(m_array);
                    if(m_owned || s > 0)//&&
                    {         for(int i = 0; i < s; i++)
                              {         SafeDeleteX(m_array[i]);}//
                    } //
                    ArrayFree(m_array);//
          }
//------------------------------------------------------------------------
public:
          VectorX(bool owned /*= true*/, int extraBuffer = 0, EqualityComparerX<T>*comparer = NULL): ListX<T>(owned, comparer), m_extraBuffer(extraBuffer) { resize(0); countelement = 0; }
          ~VectorX()
          {         //Print("before VectorX sizeof(this):", sizeof(this)); //
                    clearArrayX();
                    //ArrayFree(m_array);
                    //if(GetPointer(this) != NULL) { delete GetPointer(this);}//
                    //ZeroMemory(m_array);
                    //Print("after VectorX sizeof(this):", sizeof(this)); //
                    
          }
          VectorX(): ListX<T>(true, NULL), m_extraBuffer(0) { resize(0); countelement = 0; }
          VectorX(const VectorX<T>& that): ListX<T>(true, NULL), m_extraBuffer(0) { this = that;}
          // ConstIteratorX interface
          ConstIteratorX<T>*constIterator() const {return new ConstVectorIteratorX<T>(GetPointer(this));}
          // IteratorX interface
          IteratorX<T>*iterator() {return new VectorIteratorX<T>(GetPointer(this), m_owned);}
          //----------------------------------------------------------------------------------
          uint countelement;
          uint index;
          uint getIndex() {return index;}
          // VectorX specific
          void setExtraBuffer(int value) {m_extraBuffer = value; resize(size());}
          int  getExtraBuffer() const {return m_extraBuffer;}
          int  removeByAscendingIndex(int &removed[])
          {         if(m_owned)
                    {         for(int i = 0; i < ArraySize(removed); i++)
                              {         SafeDeleteX(m_array[removed[i]]); } }
                    int s = ArraySize(m_array);
                    int i = 0;
                    int k = 0;
                    for(int j = 0; j < s; j++)
                    {         if(k >= ArraySize(removed) || j != removed[k])
                              {         if(i != j)
                                        {         m_array[i] = m_array[j]; }
                                        i++; }
                              else k++; }
                    if(i < s)
                    {         ArrayResize(m_array, i, m_extraBuffer);
                              return s - i; }
                    else return 0; //
          }

          // Collection interface
          void clear() {clearArrayX(); resize(0); ArrayFree(m_array);}
          void Clear() {clearArrayX(); resize(0); ArrayFree(m_array);}
          int  size() const {return ArraySize(m_array);}
          int  Size() const {return ArraySize(m_array);}
          int  Total() const {return ArraySize(m_array);}
          int  total() const {return ArraySize(m_array);}
          bool add(T value) {push(value); return true;}
          bool Add(T value)  {push(value); return true;}
          bool operator<<(T value) {push(value); return true;}
          bool append (T value)  {push(value); return true;}
          bool remove(const T value)
          {         int s = ArraySize(m_array);
                    int i = 0;
                    for(int j = 0; j < s; j++)
                    {         if(!m_comparer.equals(m_array[j], value))
                              {         if(i != j) { m_array[i] = m_array[j]; }
                                        i++; } }
                    if(i < s)
                    {         ArrayResize(m_array, i);
                              // to conform to Collection semantics, a removed value should be deleted if it is owned
                              if(m_owned) SafeDeleteX(value);
                              return true; }
                    return false; //
          }

          // Sequence interface
          void insertAt(int i, T val)           { ArrayInsertX(m_array, i, val, m_extraBuffer); countelement++; }
          T removeAt(int i)                     { T val = m_array[i]; ArrayDeleteX(m_array, i); countelement--; return val; }
          T operator[](uint i) const            {return m_array[i];}
          T get(int i, string f, int l) const     {/*Print(f," ",l);*/return m_array[i];}
          T At(int i) const                     {/*Print(f," ",l);*/return m_array[i];}
          //T operator[]()                        {return m_array;}
          void set(int i, T val)                {m_array[i] = val;}
          //T[] operator=(int i,T val) const              {m_array[i] = val;}

          // Stack and Queue interface: alias for Sequence interface
          void push(T val)                      {insertAt(size(), val);}
          T    pop()                            {return removeAt(size() - 1);}
          T    peek() const                     {return m_array[size() - 1];}
          T    back() const                     {return m_array[size() - 1];}
          void unshift(T val)                   {insertAt(0, val);}
          T    shift()                          {return removeAt(0);} //
          T    forward()
          {         T temp = 0.0;
                    temp = m_array[0];
                    T ArrayTemp[];
                    ArrayCopy(ArrayTemp, m_array, 0, 1, WHOLE_ARRAY); //
                    ArrayCopy(m_array, ArrayTemp, 0, 0, WHOLE_ARRAY); //
                    countelement--;
                    return temp;//
          } //
          //-------------------------------------------------------------
          void resize(uint size, T val) {  for(uint i = 0; i < size; i++) { add(val); } } ;
          //VectorX operator{ }(T Val)  {add(Val); return VectorX;}
          double GetMin()
          {         double min = 0.0; //for(int i = 0; i < Total(); i++){         min = m_array[i] < min ?  m_array[i] : min; } //
                    min = m_array[ArrayMinimum(m_array)];
                    return min;//
          }
          double GetMax()
          {         double max = 0.0; //for(int i = 0; i < Total(); i++){         max = m_array[i] > max ?  m_array[i] : max; } //
                    max = m_array[ArrayMaximum(m_array)];
                    return max;//
          }
          double Mean()
          {         double sum = 0.0;
                    for(int i = 0; i < total(); i++) {sum += m_array[i]; } //
                    return sum / total(); //
          }
          double VarianceSample()
          {         double sum = 0; //
                    double Vmean = Mean();
                    for(int i = 0; i < Total(); i++) {sum += pow(m_array[i] - Vmean, 2);}
                    double sample  = Total() - 1;
                    double variance = sum / sample;
                    //Print("VarianceSample:", variance, "    sum:", sum, "    sample:", sample, "    Total():", Total()); //
                    return variance;//
          }
          double VariancePopulation()
          {         double sum = 0; //
                    double Vmean = Mean();
                    for(int i = 0; i < Total(); i++) {sum += pow(m_array[i] - Vmean, 2);}
                    double sample  = Total();
                    double variance =  sum / sample;
                    //Print("VariancePopulation:", variance, "    sum:", sum, "    sample:", sample, "    Total():", Total()); //
                    return variance;//
          }
          double SD()
          {         double StandardDeviration = sqrt(VariancePopulation());
                    //Print("StandardDeviration:", StandardDeviration, "    Variance():", VariancePopulation()); //
                    return StandardDeviration;//
          }
          //-------------------------------------------------------------
          //
};
//+------------------------------------------------------------------+
//| ConstIteratorX implementation for VectorX                          |
//+------------------------------------------------------------------+
template<typename T>
class ConstVectorIteratorX: public ConstIteratorX<T>
{
private:
          int               m_index;
          const int         m_size;
          const             VectorX<T>*m_vector;
public:
          ConstVectorIteratorX(const VectorX<T>*v): m_index(0), m_size(v.size()), m_vector(v) {}
          bool              end() const {return m_index >= m_size;}
          void              next() {if(!end()) {m_index++;}}
          T                 current() const {return m_vector[m_index];} };
//+------------------------------------------------------------------+
//| IteratorX implementation for VectorX                               |
//+------------------------------------------------------------------+
template<typename T>
class VectorIteratorX: public IteratorX<T>
{
private:
          int               m_index;
          const int         m_size;
          VectorX<T>*m_vector;
          int               m_removed[];
protected:
          bool              removed() const
          {         int s = ArraySize(m_removed);
                    return (s > 0 && m_removed[s - 1] == m_index); }
public:
          VectorIteratorX(VectorX<T>*v, bool owned): m_index(0), m_size(v.size()), m_vector(v) {}
          ~VectorIteratorX()
          {         if(ArraySize(m_removed) > 0)
                    {         m_vector.removeByAscendingIndex(m_removed); } }
          bool              end() const {return m_index >= m_size;}
          void              next() {if(!end()) {m_index++;}}
          T                 current() const {if(removed()) return NULL; else return m_vector[m_index];}

          virtual bool      set(T value) {if(removed()) return false; m_vector.set(m_index, value); return true;}
          bool              remove()
          {         if(end()) return false;
                    if(removed()) return false;
                    int s = ArraySize(m_removed);
                    ArrayResize(m_removed, s + 1, 5);
                    m_removed[s] = m_index;
                    return true; } };
//+------------------------------------------------------------------+
