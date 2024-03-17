//+------------------------------------------------------------------+
//|                                               Collection_Map.mqh |
//|                                                    A pourya 2021 |
//|                                               @prymhdv@gmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdv@gmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Module: Collection/IMap2.mqh                                       |
//| This file is part of the mql4-lib project:                       |
//|     https://github.com/dingmaotu/mql4-lib                        |
//|                                                                  |
//| Copyright 2017 Li Ding <dingmaotu@126.com>                       |
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
template<typename KeyOrVal>
interface Collection
{

};//
//+------------------------------------------------------------------+
//| Iterator for a map                                               |
//+------------------------------------------------------------------+
template<typename Key, typename Value> //---with out fields
interface Ig_MapIterator
{         Key       key() const;
          Value     value() const;
          void      next();
          bool      end() const;

          void      setValue(Value v);
          bool      remove(); //
          //------------
          //--!! int  testfield; // 'testfield' - cannot be a member of interface	Map.mqh	48	16

};
//+------------------------------------------------------------------+
//| IMap2 interface                                                    |
//+------------------------------------------------------------------+
template<typename Key, typename Value>
interface IMap2
{         //void                           IMap2(); //---'IMap2<int,double>' - cannot be a member of interface  IMap2.mqh  53        42
          int                            size() const;
          bool                           isEmpty() const;
          bool                           contains(Key key) const;
          bool                           remove(Key key);
          void                           clear();

          Ig_MapIterator<Key, Value>     *iterator();
          bool                           keys(Collection<Key>&col) const;
          bool                           values(Collection<Value>&col) const;

          Value                          operator[](Key key) const;
          Value                          get(Key key, Value def) const;

          void                           set(Key key, Value value);
          bool                           setIfExist(Key key, Value value);
          bool                           setIfNotExist(Key key, Value value);

//--- same as remove but does not delete the value
//--- only for pointers, returns NULL if key does not exist. For value types, use remove
          Value                          pop(Key key); //
};
//+------------------------------------------------------------------+
//| This is the utility class for implementing iterator RAII         |
//| assign and trueForOnce is for implementing foreach               |m = new IMap2<Key, Value>;
//+------------------------------------------------------------------+
template<typename Key, typename Value>
class CDSMapIter: public Ig_MapIterator<Key, Value>
{
private:
          Ig_MapIterator<Key, Value>        *ptr_m_it;   ///error//on global call  name expected..
          int           m_condition;
public:
          //---void      CDSMapIter(IMap2<Key, Value> &m): ptr_m_it(m.iterator()), m_condition(2) { Print("       ", __FUNCSIG__);}  //iner want init call interface map
          void           CDSMapIter(IMap2<Key, Value> *ptr_map): ptr_m_it(ptr_map.iterator()), m_condition(2) { Print("       ", __FUNCSIG__);}  //iner want init call interface map
          void           CDSMapIter()                         : /*ptr_m_it(ptr_map.iterator()),*/ m_condition(2) { Print("       ", __FUNCSIG__);}  //iner want init call interface map
          
          void          ~CDSMapIter() {SafeDelete(ptr_m_it);}
          //
          //
          //-------------------------------------------------------
          void          next() {ptr_m_it.next();}
          Key           key() const {return ptr_m_it.key();}
          Value         value() const {return ptr_m_it.value();}
          bool          end() const {return ptr_m_it.end();}

          void          setValue(Value v) {ptr_m_it.setValue(v);}
          bool          remove() {return ptr_m_it.remove();}
          //-------------------------------------------------------
          bool          testTrue() {if(m_condition == 0)return false; else {m_condition--; return true;}}
          bool          assignKey(Key &var) {var = ptr_m_it.key(); return true;}
          bool          assignValue(Value &var) {var = ptr_m_it.value(); return true;} //
          ///1///
          void          SafeDelete(Ig_MapIterator<Key, Value> *m_itX) {};
          ///1///
          void          Main()
          {
                  
          
          
          
          }
};

#define foreachm(KeyType,KeyName,ValueType,ValueName,IMap2) \
for(CDSMapIter<KeyType,ValueType>it(IMap2);it.testTrue();)\
        for(ValueType ValueName;it.testTrue();) \
                for(KeyType KeyName;(!it.end()) && it.assignKey(KeyName) && it.assignValue(ValueName);it.next())
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//1) A type template parameter without a default.
//template<class T>
//class My_vector { /* ... */ };
//-------------------------
////2) A type template parameter with a default.
//template<class T = void>
//struct My_op_functor { /* ... */ };
//template<typename Key = void> struct Gs {};///'=' - syntax error    Objects.mqh         39        23
//-------------------------
////3) A type template parameter pack.
//template<typename... Ts> class My_tuple { /* ... */ };
//-------------------------------
//4) A constrained type template parameter without a default.
//template <My_concept T>
//class My_constrained_vector { /* ... */ };
//-------------------------
//5) A constrained type template parameter with a default.
//template <My_concept T = void>
//class My_constrained_op_functor { /* ... */ };
////-------------------------------
//6) A constrained type template parameter pack.
//template <My_concept... Ts>
//class My_constrained_tuple { /* ... */ };
//========================
//template<typename T> concept C1 = true;
//template<typename T> SuperKEY C1 = true;//template cannot be used for data declaration  Objects.mqh         57        31
//========================
//template<const int* pci>  class classtesting{};//'const' - unexpected token   Objects.mqh         59        10
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//---IMap2<int, double> m_Map; //--- ERROR---'m_Map' - cannot instantiate abstract class   Map.mqh   151       19
//---IMap2<int, double> *m_Map;//--- ERROR--- invalid pointer access in 'IMap2.mqh' (150,61)
//---IMap2<int, double> *m_Map = new IMap2<int, double>(); //--- ERROR---'IMap2<int,double>' - cannot create an instance of an interface  Just Pointer allowed
//
//-----------------------------------------------------------------------------------------------------------------------------------------------
// IMap2<Key, Value> m;        >>> 'Key' - unexpected token       Capitan.mqh         194       5
//0// IMap2<int, double> m;       >>> 'm' - cannot instantiate abstract class    Capitan.mqh         194       18
//1// IMap2<int, double> *m;      >>>  OK
//--- CDSMapIter<int, double>  *MapIter_1 = new CDSMapIter<int, double>(m_Map);  //--- ERROR--- invalid pointer access in 'IMap2.mqh' (150,61)
//-----------------------------------------------------------------------------------------------------------------------------------------------
//0// CDSMapIter<int, double> MapIter_1;            >>>//'<' - wrong template parameters count    'IMap2' - objects are passed by reference only
//0// MapIter_1;                                 >>>    'CDSMapIter<int,double>' - wrong parameters count        Capitan.mqh         194       89
//0// CDSMapIter<int,double>                        >>>    new MapIter_1;     'new' - name expected    Capitan.mqh         194       88
//0// CDSMapIter<int,double>     = new MapIter_1;   >>>    '=' - name expected     Capitan.mqh         194       89
//0// CDSMapIter<int,double>     = new MapIter_1(); >>>    '=' - name expected     Capitan.mqh         194       89
//0// CDSMapIter<int,double>     = new MapIter_1<int,double>(); >>>        '=' - name expected         Capitan.mqh         194       89
//0// CDSMapIter<int,double>     MapIter_1 = new CDSMapIter<int,double>();  >>> 'CDSMapIter<int,double>' - wrong parameters count   Capitan.mqh         194       102
//0//  CDSMapIter<int,double>    MapIter_1 = new CDSMapIter<int,double>;   >>> 'CDSMapIter<int,double>' - default constructor of class 'CDSMapIter<int,double>' is not defined          Capitan.mqh         194       102
//1// CDSMapIter<int,double>                        >>>     MapIter_1(IMap2<int, char>)<<  sign are not samee...
//2// MapIter_1(new IMap2<int, double>);           >>>    'IMap2<int,double>' - cannot create an instance of an interface   Capitan.mqh         194       103
//3// CDSMapIter<int,double>     MapIter_1();       >>>    'CDSMapIter<int,double>' - wrong parameters count        Capitan.mqh         194       89
//4// CDSMapIter<int,double>     MapIter_1(int);    >>>    no #import declaration  Capitan.mqh         194       89
//5// CDSMapIter<int,double>     MapIter_1(int,int);>>>    no #import declaration  Capitan.mqh         194       89
//6// CDSMapIter<int, double>    MapIter_1 = new CDSMapIter<int, double>(m); >>>'CDSMapIter<int,double>' - wrong parameters count  Capitan.mqh         198       23
//7// CDSMapIter<int, double>   *MapIter_1 = new CDSMapIter<int, double>(m); >>> OK
//8// CDSMapIter<int, double>   *MapIter_1 = new CDSMapIter<int, double>(); >>>'CDSMapIter<int,double>' - wrong parameters count Capitan.mqh         198       40
//======================================================================================================PreNeedBasedClassOrder-OneNotErroring
//+------------------------------------------------------------------+
