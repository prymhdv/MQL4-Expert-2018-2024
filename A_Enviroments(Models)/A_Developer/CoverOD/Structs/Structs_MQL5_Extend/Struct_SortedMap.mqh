//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
template<typename TKey, typename TValue>
class CDSSortedMap: CSortedMap<TKey, TValue>
{
public:
          CDSSortedMap(void) {};
          ~CDSSortedMap(void) {};
          //---------------------
          CSortedMap<TKey, TValue> SortedMapArray[10];
          ///
          //--------------------
          void Main()
          {         SortedMapArray[0].Main(true);//
          }
          //--------------------
};//
