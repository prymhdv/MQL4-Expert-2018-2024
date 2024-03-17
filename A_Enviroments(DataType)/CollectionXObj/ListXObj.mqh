//+------------------------------------------------------------------+
//| Module: CollectionXObj/ListXObj.mqh                                      |
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

#include "CollectionXObj.mqh"
//+------------------------------------------------------------------+
//| Generic abstract base class for ListXObj like collections            |
//+------------------------------------------------------------------+
template<typename T>
class ListXObj: public CollectionXObj<T>
{
public:
          ListXObj(bool owned, EqualityComparerXObj<T>*comparer): CollectionXObj<T>(owned, comparer) {}
          ListXObj(const ListXObj& that): CollectionXObj<T>(false, NULL) { this = that;}
          ~ListXObj() { if(GetPointer(this) != NULL) { delete GetPointer(this);}}
          //--- Iterator interface
          //virtual           ConstIteratorXObj<T>*constIterator() const = 0;
          //virtual           IteratorXObj<T>*iterator() = 0;

          //--- CollectionXObj interface
          virtual void      clear() = 0;
          virtual int       size() const = 0;
          virtual bool      add(T &value) = 0;
          virtual bool      remove(const T &value) = 0; // remove the element and if owned, the element will be destructed

          //--- Sequence interface
          virtual void      insertAt(int i, T &val) = 0; // insert element at position i
          virtual T         removeAt(int i) = 0;       // remove element at position i; no need to destruct the object
          virtual T         get(int i) const = 0;
          virtual void      set(int i, T &val) = 0;     // the original object will not be destructed!!!

          //--- Stack and Queue interface: alias for Sequence interface
          // subclasses may have more efficient implemenations
          virtual void      push(T &val) {insertAt(size(), val);}
          virtual T         pop() {return removeAt(size() - 1);}
          virtual T         peek() const {return get(size() - 1);}
          virtual void      unshift(T &val) {insertAt(0, val);}
          virtual T         shift() {return removeAt(0);} //
};
//+------------------------------------------------------------------+
