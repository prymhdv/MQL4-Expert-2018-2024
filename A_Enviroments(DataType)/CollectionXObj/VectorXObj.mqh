////+------------------------------------------------------------------+
////| Module: Collection/VectorXObj.mqh                                    |
////| This file is part of the mql4-lib project:                       |
////|     https://github.com/dingmaotu/mql4-lib                        |
////|                                                                  |
////| Copyright 2015-2016 Li Ding <dingmaotu@126.com>                  |
////|                                                                  |
////| Licensed under the Apache License, Version 2.0 (the "License");  |
////| you may not use this file except in compliance with the License. |
////| You may obtain a copy of the License at                          |
////|                                                                  |
////|     http://www.apache.org/licenses/LICENSE-2.0                   |
////|                                                                  |
////| Unless required by applicable law or agreed to in writing,       |
////| software distributed under the License is distributed on an      |
////| "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,     |
////| either express or implied.                                       |
////| See the License for the specific language governing permissions  |
////| and limitations under the License.                               |
////+------------------------------------------------------------------+
//#property strict
//
//#include "../LangXObj/ArrayXObj.mqh"
//#include "ListXObj.mqh"
////#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(DataType)\CollectionX\ListXX.mqh>
////+------------------------------------------------------------------+
////| Generic VectorXObj                                                   |
////+------------------------------------------------------------------+
//template<typename T>
//class VectorXObj: public ListXObj<T>
//{
//private:
//          int               m_extraBuffer;
//          T                 m_array[];
//protected:
//          void resize(int size)   {         ArrayResize(m_array, size, m_extraBuffer); }
//          void clearArray()
//          {         int s = ArraySize(m_array);
//                    if(m_owned || s > 0)
//                    {         for(int i = 0; i < s; i++) { SafeDeleteXObj(m_array[i]);}//
//                    } //
//                    ArrayFree(m_array);//
//          }
////------------------------------------------------------------------------
//public:
//          VectorXObj(uint cols, bool owned = true, int extraBuffer = 0, EqualityComparerXObj<T>*comparer = NULL): ListXObj<T>(owned, comparer), m_extraBuffer(extraBuffer) { countelement = 0; resize(cols); }
//          VectorXObj(): ListXObj<T>(true, NULL), m_extraBuffer(0) { resize(0); countelement = 0;}
//          VectorXObj(const VectorXObj& that): ListXObj<T>(true, NULL), m_extraBuffer(0) { resize(0); this = that;}
//          //VectorXObj(bool owned = true, int extraBuffer = 0, EqualityComparerXObj<T>*comparer = NULL):ListXObj<T>(owned, comparer), m_extraBuffer(extraBuffer) { resize(0); }
//          ~VectorXObj()
//          {         //Print("beforre VectorXObj sizeof(this):", sizeof(this)); //
//                    clearArray();
//                    //for(int i = 0; i < ArraySize(m_array); i++) { if(GetPointer(m_array[i]) != NULL) delete GetPointer(m_array[i]);}
//                    //ArrayFree(m_array);
//                    //if(GetPointer(this) != NULL){         delete GetPointer(this);}//
//                    //Print("after VectorXObj sizeof(this):", sizeof(this)); //
//          }
//          uint countelement;
//
//          // ConstIterator interface
//          ConstIteratorXObj<T>*constIterator() const {return new ConstVectorIteratorXObj<T>(GetPointer(this));}
//          // Iterator interface
//          IteratorXObj<T>*iterator() {return new VectorIteratorXObj<T>(GetPointer(this), m_owned);}
//
//          // VectorXObj specific
//          void setExtraBuffer(int value) {m_extraBuffer = value; resize(size());}
//          int  getExtraBuffer() const {return m_extraBuffer;}
//          int  removeByAscendingIndex(int &removed[])
//          {         if(m_owned)
//                    {         for(int i = 0; i < ArraySize(removed); i++)
//                              {         SafeDeleteXObj(m_array[removed[i]]); } }
//                    int s = ArraySize(m_array);
//                    int i = 0;
//                    int k = 0;
//                    for(int j = 0; j < s; j++)
//                    {         if(k >= ArraySize(removed) || j != removed[k])
//                              {         if(i != j)
//                                        {         m_array[i] = m_array[j]; }
//                                        i++; }
//                              else k++; }
//                    if(i < s)
//                    {         ArrayResize(m_array, i, m_extraBuffer);
//                              return s - i; }
//                    else return 0; //
//          }
//
//          // Collection interface
//          void clear() {clearArray(); resize(0); ArrayFree(m_array);}
//          int  size() const {return ArraySize(m_array);}
//          int  Total() const {return ArraySize(m_array);}
//          int  total() const {return ArraySize(m_array);}
//          bool add(T &value) {push(value); return true;}
//          bool Add(T &value) {push(value); return true;}
//          bool operator<<(T &value) {push(value); return true;}
//          bool remove(const T &value)
//          {         int s = ArraySize(m_array);
//                    int i = 0;
//                    for(int j = 0; j < s; j++)
//                    {         if(!m_comparer.equals(m_array[j], value))
//                              {         if(i != j) { m_array[i] = m_array[j]; }
//                                        i++; } }
//                    if(i < s)
//                    {         ArrayResize(m_array, i);
//                              // to conform to Collection semantics, a removed value should be deleted if it is owned
//                              if(m_owned) SafeDeleteXObj(value);
//                              return true; }
//                    return false; //
//          }
//
//          // Sequence interface
//          void insertAt(int i, T &val)                          { ArrayInsertXObj(m_array, i, val, m_extraBuffer); countelement++; }
//          T removeAt(int i)                                     { T *val = m_array[i]; ArrayDeleteXObj(m_array, i); countelement--; return val; }
//          T operator[](int i) const                             {return m_array[i];}
//          T get(int i) const                                    {return m_array[i];}
//          T At(int i) const                                     {return m_array[i];}
//          T at(int i) const                                     {return m_array[i];}
//          void set(int i, T &val)                               {m_array[i] = val;}
//
//          // Stack and Queue interface: alias for Sequence interface
//          void push(T &val)                      {insertAt(size(), val);}
//          T    pop()                             {return removeAt(size() - 1);}
//          T    back()                            {return m_array[size() - 1];}
//          T    peek() const                      {return m_array[size() - 1];}
//          void unshift(T &val)                   {insertAt(0, val);}
//          T    shift()                           {return removeAt(0);} //
//          //-------------------------------------------------------------
//          void resize(uint size, T &val) {  for(uint i = 0; i < size; i++) { add(val); } } ; //
//          uint  shape(uint i)
//          {         if(i == 0) return Total();
//                    //if(i == 1) return m_array.Total();
//                    return -1;//
//          }
//          //
//
//};
//////+------------------------------------------------------------------+
//////| ConstIterator implementation for VectorXObj                      |
//////+------------------------------------------------------------------+
//template<typename T>
//class ConstVectorIteratorXObj: public ConstIteratorXObj<T>
//{
//private:
//          int               m_index;
//          const int         m_size;
//          const             VectorXObj<T> *m_vector;
//public:
//          ConstVectorIteratorXObj(const VectorXObj<T>*v): m_index(0), m_size(v.size()), m_vector(v) {}
//          //ConstVectorIteratorXObj(const ConstVectorIteratorXObj& that) m_index(0), m_size(this.size()), m_vector(this) { this = that;}
//          bool              end() const {return m_index >= m_size;}
//          void              next() {if(!end()) {m_index++;}}
//          T                 *current() const {return m_vector[m_index];} //
//};
//////+------------------------------------------------------------------+
//////| Iterator implementation for VectorXObj                           |
//////+------------------------------------------------------------------+
//template<typename T>
//class VectorIteratorXObj: public IteratorXObj<T>
//{
//private:
//          int               m_index;
//          const int         m_size;
//          VectorXObj<T>     *m_vector;
//          int               m_removed[];
//protected:
//          bool              removed() const
//          {         int s = ArraySize(m_removed);
//                    return (s > 0 && m_removed[s - 1] == m_index); }
//public:
//          VectorIteratorXObj(VectorXObj<T> *v, bool owned): m_index(0), m_size(v.size()), m_vector(v) {}
//          VectorIteratorXObj(const VectorIteratorXObj& that) { this = that;}
//          ~VectorIteratorXObj()
//          {         if(ArraySize(m_removed) > 0)
//                    {         m_vector.removeByAscendingIndex(m_removed); } //
//                    delete m_vector;//
//          }
//          void  operator=(const VectorIteratorXObj<T>& that) {   this = that;     }
//
//          bool              end() const {return m_index >= m_size;}
//          void              next() {if(!end()) {m_index++;}}
//          T                 *current() const {if(removed()) return NULL; else return m_vector[m_index];}
//
//          virtual bool      set(T &value) {if(removed()) return false; m_vector.set(m_index, value); return true;}
//          bool              remove()
//          {         if(end()) return false;
//                    if(removed()) return false;
//                    int s = ArraySize(m_removed);
//                    ArrayResize(m_removed, s + 1, 5);
//                    m_removed[s] = m_index;
//                    return true; //
//          }
//          //
//}; //VectorIteratorXObj<double> VectorIteratorXobj;
////+------------------------------------------------------------------+
