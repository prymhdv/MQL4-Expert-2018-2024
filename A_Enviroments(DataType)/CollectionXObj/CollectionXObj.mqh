//+------------------------------------------------------------------+
//| Module: CollectionXObj/CollectionXObj.mqh                                |
//| This file is part of the mql4-lib project:                       |
//|     https://github.com/dingmaotu/mql4-lib                        |
//|                                                                  |
//| Copyright 2016 Li Ding <dingmaotu@126.com>                       |
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

#include "../LangXObj/PointerXObj.mqh"
#include "EqualityComparerXObj.mqh"
//+------------------------------------------------------------------+
//| ConstIteratorXObj (readonly) for all collections                     |
//+------------------------------------------------------------------+
template<typename T>
interface ConstIteratorXObj
{         //T val;//'val' - cannot be a member of interface CollectionXObj.mqh  30        13
          void      next();
          T         *current() const;
          bool      end() const;//
};
//+------------------------------------------------------------------+
//| Standard IteratorXObj for all collections                            |
//+------------------------------------------------------------------+
template<typename T>
interface IteratorXObj: public ConstIteratorXObj<T>
{         bool      set(T &value);  // replace current value in target collection
          bool      remove();      // safely remove current element
};
//+------------------------------------------------------------------+
//| Do something on each elements of an iterable                     |
//| Returns true if it is needed to delete this element              |
//+------------------------------------------------------------------+
template<typename T>
class ElementOperatorXObj
{
public:
          virtual void      begin() {}
          virtual void      end() {}
          virtual bool      operate(T &value) = 0;//
};
//+------------------------------------------------------------------+
//| A collection must be iterable                                    |
//+------------------------------------------------------------------+
template<typename T>
interface ConstIterableXObj
{         ConstIteratorXObj<T> *constIterator() const;//
};
//+------------------------------------------------------------------+
//| A collection must be iterable                                    |
//+------------------------------------------------------------------+
template<typename T>
interface IterableXObj: public ConstIterableXObj<T>
{         IteratorXObj<T> *iterator(); //
};
//+------------------------------------------------------------------+
//| This is the utility class for implementing iterator RAII         |
//| assign and trueForOnce is for implementing foreachXObj               |
//+------------------------------------------------------------------+
template<typename T>
class ConstIterXObj: public ConstIteratorXObj<T>
{
private:
          ConstIteratorXObj<T> *m_it;
          int               m_condition;
public:
          ConstIterXObj(const ConstIterableXObj<T>&it): m_it(it.constIterator()), m_condition(1) {}
          ~ConstIterXObj() {SafeDeleteXObj(m_it);}
          void              next() {m_it.next();}
          T                 *current() const {return m_it.current();}
          bool              end() const {return m_it.end();}

          bool              testTrue() {if(m_condition == 0)return false; else {m_condition--; return true;}}
          bool              assign(T &var) {if(m_it.end()) return false; else {var = m_it.current(); return true;}} //
};
#define cforeachXObj(Type,IterableXObj) for(ConstIterXObj<Type> it(IterableXObj);!it.end();it.next())//constforeach
#define cforeachvXObj(Type,Var,IterableXObj) for(ConstIterXObj<Type> it(IterableXObj);it.testTrue();) for(Type Var;it.assign(Var);it.next())//constforeachvector
//+------------------------------------------------------------------+
//| This is the utility class for implementing iterator RAII         |
//| assign and trueForOnce is for implementing foreachXObj               |
//+------------------------------------------------------------------+
template<typename T>
class IterXObj: public IteratorXObj<T>
{
private:
          IteratorXObj<T>*m_it;
          int               m_condition;
public:
          IterXObj(IterableXObj<T>&it): m_it(it.iterator()), m_condition(1) {}
          ~IterXObj() {SafeDeleteXObj(m_it);}
          void              next() {m_it.next();}
          T                 *current() const {return m_it.current();}
          bool              end() const {return m_it.end();}
          bool              set(T &value) {return m_it.set(value);}
          bool              remove() {return m_it.remove();}

          bool              testTrue() {if(m_condition == 0)return false; else {m_condition--; return true;}}
          bool              assign(T &var) {if(m_it.end()) { return false;} else {var = m_it.current();  return true;}} };
#define foreachXObj(Type,IterableXObj) for(IterXObj<Type> it(IterableXObj);!it.end();it.next())//foreach
#define foreachvXObj(Type,Var,IterableXObj) for(IterXObj<Type> it(IterableXObj);it.testTrue();) for(Type Var;it.assign(Var);it.next())//foreachvector
//+------------------------------------------------------------------+
//| Base class for collections                                       |
//+------------------------------------------------------------------+
template<typename T>
class CollectionXObj: public IterableXObj<T>
{
protected:
          EqualityComparerXObj<T>*m_comparer;
          bool              m_owned;
public:
          CollectionXObj(bool owned, EqualityComparerXObj<T>*comparer): m_owned(owned), m_comparer(comparer == NULL ? new GenericEqualityComparerXObj<T> : comparer) {}
          CollectionXObj(const CollectionXObj& that): m_owned(false), m_comparer(NULL == NULL ? new GenericEqualityComparerXObj<T> : NULL) { this = that;}
          ~CollectionXObj() {SafeDeleteXObj(m_comparer); if(GetPointer(this) != NULL) { delete GetPointer(this);} delete m_comparer; }


          // remove all elements of the collection
          virtual void      clear() = 0;
          // returns true if the collection changed because of adding the value
          virtual bool      add(T &value) = 0;
          // returns true if the collection changed because of removing the value
          virtual bool      remove(const T &value) = 0;
          virtual int       size() const = 0;

          virtual bool      addAll(T &array[]);
          virtual bool      addAll(const CollectionXObj<T>&collection);

          virtual bool      contains(const T &value) const;

          virtual bool      isEmpty() const {return size() == 0;}

          virtual void      toArray(T &array[]) const; };
//+------------------------------------------------------------------+
//| Standard implementation using iterators                          |
//+------------------------------------------------------------------+
template<typename T>
bool CollectionXObj::contains(const T &value) const
{         cforeachXObj(T, this)
          {         if(m_comparer.equals(it.current(), value)) return true; }
          return false; }
//+------------------------------------------------------------------+
//| Standard implementation using add                                |
//+------------------------------------------------------------------+
template<typename T>
bool CollectionXObj::addAll(T &array[])
{         int s = ArraySize(array);
          bool added = false;
          for(int i = 0; i < s; i++)
          {         bool tmp = add(array[i]);
                    if(!added) added = tmp; }
          return added; }
//+------------------------------------------------------------------+
//| Standard implementation using add                                |
//+------------------------------------------------------------------+
template<typename T>
bool CollectionXObj::addAll(const CollectionXObj<T>&collection)
{         bool added = false;
          cforeachXObj(T, collection)
          {         bool tmp = add(it.current());
                    if(!added) added = tmp; }
          return added; }
//+------------------------------------------------------------------+
//| Standard implementation using iterators                          |
//+------------------------------------------------------------------+
template<typename T>
void CollectionXObj::toArray(T &array[]) const
{         int s = size();
          if(s > 0)
          {         ArrayResize(array, s);
                    ConstIteratorXObj<T>*iter = constIterator();
                    for(int i = 0; !iter.end(); i++, iter.next()) array[i] = iter.current();
                    delete iter; } }
//+------------------------------------------------------------------+
