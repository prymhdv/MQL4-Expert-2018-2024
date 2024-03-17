//+------------------------------------------------------------------+
//|                                                  Sd_MqlArray.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|             Class C_BANK::     BEGIN                             |
//+------------------------------------------------------------------+
class Sd_MqlArray
{         /* ===============================================================================================================================================
           * Group of Functions for Working with Arrays
           * Arrays are allowed to be maximum four-dimensional. Each dimension is indexed from 0 to dimension_size-1.
           * In a particular case of a one-dimensional array of 50 elements, calling of the first element will appear as array[0], of the last one - as array[49].
           * Function                Action
           * ===============================================================================================================================================
           * ArrayBsearch            Returns index of the first found element in the first array dimension
           * ArrayCopy               Copies one array into another
           * ArrayCompare            Returns the result of comparing two arrays of simple types or custom structures without complex objects
           * ArrayFree               Frees up buffer of any dynamic array and sets the size of the zero dimension in 0.
           * ArrayGetAsSeries        Checks direction of array indexing
           * ArrayInitialize         Sets all elements of a numeric array into a single value
           * ArrayFill               Fills an array with the specified value
           * ArrayIsSeries           Checks whether an array is a timeseries
           * ArrayIsDynamic          Checks whether an array is dynamic
           * ArrayMaximum            Search for an element with the maximal value
           * ArrayMinimum            Search for an element with the minimal value
           * ArrayRange              Returns the number of elements in the specified dimension of the array
           * ArrayResize             Sets the new size in the first dimension of the array
           * ArraySetAsSeries        Sets the direction of array indexing
           * ArraySize               Returns the number of elements in the array
           * ArraySort               Sorting of numeric arrays by the first dimension
           * ArrayCopyRates          Copies rates to the two-dimensional array from chart RateInfo array returns copied bars amount
           * ArrayCopySeries         Copies a series array to another one and returns the count of the copied elements
           * ArrayDimension          Returns the multidimensional array rank
           * ===============================================================================================================================================
           *int ArrayBsearch( const double&   array[], // array for search
           *                         double          value,                 // what is searched for
           *                         int             count=WHOLE_ARRAY,     // count of elements to search for
           *                         int             start=0,               // starting position
           *                         int             direction=MODE_ASCEND  // search direction
           *                  );
           * ===============================================================================================================================================
           * int ArrayBsearch (double&| float& | long& | int& | short&| char& ,..)
           * ===============================================================================================================================================
           * int ArrayCopy(      void& dst_array[],         // destination array
           *                const void& src_array[],         // source array
           *                      int   dst_start=0,         // index starting from which write into destination array
           *                      int   src_start=0,         // first index of a source array
           *                      int   count=WHOLE_ARRAY    // number of elements
           *               );
           * ===============================================================================================================================================
           * int ArrayCompare( const void&     array1[],            // first array
           *                     const void&     array2[],            // second array
           *                             int     start1=0,            // initial offset in the first array
           *                             int     start2=0,            // initial offset in the second array
           *                             int     count=WHOLE_ARRAY    // number of elements for comparison
           *                     );
           * ===============================================================================================================================================
           * void ArrayFree(void&  array[]     // array);
           * ===============================================================================================================================================
           * bool ArrayGetAsSeries( const void&  array[] // array for checking );
           * ===============================================================================================================================================
           * int ArrayInitialize(char  array[],        // initialized array
           *                      char  value           // value that will be set
           *                     );
           * ===============================================================================================================================================
           * int ArrayInitialize( char|short|int|long|float|double|bool|uint,..)
           * ===============================================================================================================================================
           * void ArrayFill(void&  array[],      // array
           *                 int    start,        // starting index
           *                 int    count,        // number of elements to fill
           *                 void   value         // value
           *                 );
           * ===============================================================================================================================================
           * bool ArrayIsSeries(const void&  array[] // checked array );
           * ===============================================================================================================================================
           * bool ArrayIsDynamic(const void&  array[] // checked array );
           * ===============================================================================================================================================
           * int ArrayMaximum(const void&      array[],                // array for search
           *                            int     count=WHOLE_ARRAY,      // number of checked elements
           *                            int     start=0                 // index to start checking with
           *                  );
           * ===============================================================================================================================================
           * int ArrayMinimum(const void&      array[],             // array for search
           *                            int     count=WHOLE_ARRAY,   // number of checked elements
           *                            int     start=0              // index to start checking with
           *                  );
           * ===============================================================================================================================================
           * int ArrayRange( const void&       array[],        // array for check
           *                          int       rank_index      // index of dimension
           *                );
           * ===============================================================================================================================================
           * int ArrayResize( void&    array[],        // array passed by reference
           *                   int      new_size,       // new array size
           *                   int      reserve_size=0  // reserve size value (excess)
           *                 );
           * ===============================================================================================================================================
           * bool ArraySetAsSeries( const void&        array[],        // array by reference
           *                               bool         flag            // true denotes reverse order of indexing
           *                       );
           * ===============================================================================================================================================
           * int ArraySize( const void& array[] // checked array  );
           * ===============================================================================================================================================
           * bool ArraySort( void&      array[],                // array for sorting
           *                    int     count=WHOLE_ARRAY,      // count
           *                    int     start=0,                // starting index
           *                    int     direction=MODE_ASCEND   // sort direction
           *               );
           * ===============================================================================================================================================
           * int ArrayCopyRates( MqlRates&     rates_array[],  // MqlRates array, passed by reference
           *                      string        symbol=NULL,    // symbol
           *                      int           timeframe=0     // timeframe
           *                    );
           * ===============================================================================================================================================
           * int ArrayCopyRates( void&         dest_array[][], // destination array, passed by reference
           *                      string        symbol=NULL,    // symbol
           *                      int           timeframe=0     // timeframe
           *                    );
           * ===============================================================================================================================================
           * int ArrayCopySeries( void&        array[],        // destination array
           *                       int          series_index,   // series array identifier
           *                       string       symbol=NULL,    // symbol
           *                       int          timeframe=0     // timeframe
           *                     );
           * ===============================================================================================================================================
           * int ArrayDimension( void&          array[]         // array );
           * ===============================================================================================================================================
           * ===============================================================================================================================================*/
private:
//=====================================================================
public:
          Sd_MqlArray() {};
          ~Sd_MqlArray() {};
//=====================================================================
          int           Sd_MqlArray::IndexFindInArray(const int & f_array [], /*array*/  int f_value,       /*search value*/    bool f_direction = true); /*check direction*/
          void          Sd_MqlArray::DeleteInArray(double & f_array [],       /*array*/  double f_delete);  /*value to delete*/
          double        Sd_MqlArray::ArrayAverage(const double &f_array[]);   /*tablica*/
//=====================================================================
          //template<typename T>
          //int   _ArrayBsearch(double &array[], double value, int count, int Start = 0, int Start = 0)                                  {return ArrayBsearch(array, value,, count, Start, Start); }             //Returns index of the first found element in the first array dimension
          //int   _ArrayCopy(void &dst_array[], const void & array[].int dst_start = 0, int src_start = 0, int count = WHOLE_ARRAY)      {return ArrayCopy(dst_array, array, dst_start, src_start, count); }     //Copies one array into another
          //int   _ArrayCompare(const void &array[], const void & array2[].int start1 = 0, int start2 = 0, int count = WHOLE_ARRAY)      {return ArrayCompare(array, array2, start1, start2, count); }           //Returns the result of comparing two arrays of simple types or custom structures without complex objects
          //void  _ArrayFree(void &array[])                                                                                              {return ArrayFree(array); }                                             //Frees up buffer of any dynamic array and sets the size of the zero dimension in 0.
          //bool  _ArrayGetAsSeries(void &array[])                                                                                       {return ArrayGetAsSeries(array); }                                      //Checks direction of array indexing
          //int   _ArrayInitialize(double &array[], double value)                                                                        {return ArrayInitialize(array[], value); }                              //Sets all elements of a numeric array into a single value
          //void  _ArrayFill(double &array[], int offset, int count, void value)                                                         {return ArrayFill(array, offset, count, value);}                        //Fills an array with the specified value
          //bool  _ArrayIsSeries(const void &array[])                                                                                    {return ArrayIsSeries(array); }                                         //Checks whether an array is a timeseries
          //bool  _ArrayIsDynamic(const void &array[])                                                                                   {return ArrayIsDynamic(array); }                                        //Checks whether an array is dynamic
          //int   _ArrayMaximum(void &array[], int count = WHOLE_ARRAY, int Start = 0)                                                   {return ArrayMaximum(array, count, Start); }                            //Search for an element with the maximal value
          //int   _ArrayMinimum(void &array[], int count = WHOLE_ARRAY, int Start = 0)                                                   {return ArrayMinimum(array, count, Start); }                            //Search for an element with the minimal value
          //int   _ArrayRange(const void &array[], int Rank_Index)                                                                       {return ArrayRange(array, Rank_Index); }                                //Returns the number of elements in the specified dimension of the array
          //int   _ArrayResize(void &array[], int new_size, int reserve_size = 0)                                                        {return ArrayResize(array, new_size, reserve_size); }                   //Sets the new size in the first dimension of the array
          //bool  _ArraySetAsSeries(const void &array[], bool flag)                                                                      {return ArraySetAsSeries(array, flag); }                                //Sets the direction of array indexing
          //int   _ArraySize(const void &array[]                                                                                         {return ArraySize(array); }                                             //Returns the number of elements in the array
          //int   _ArraySort(void &array[], int count = WHOLE_ARRAY, int Start = 0, int sort_dir = MODE_ASCEND)                          {return ArraySort(array, count, Start, sort_dir); }                     //Sorting of numeric arrays by the first dimension
          //bool  _ArrayCopyRates(void &array[], const string symbol = NULL, int timeframe = 0)                                          {return ArrayCopyRates(array, symbol, timeframe); }                     //Copies rates to the two-dimensional array from chart RateInfo array returns copied bars amount
          //int   _ArrayCopySeries(void &array[], ENUM_SERIESMODE series_index, const string symbol = NULL, int timeframe = 0)           {return ArrayCopySeries(array, series_index, symbol, timeframe); }      //Copies a series array to another one and returns the count of the copied elements
          //int   _ArrayDimension(const void &array[])                                                                                   {return ArrayDimension(array); }                                        //Returns the multidimensional array rank
//=====================================================================
//=====================================================================
//=====================================================================
//=====================================================================

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int Sd_MqlArray::IndexFindInArray ( const  int & f_array [], int f_value, /*search value*/ bool f_direction = true ) // check direction
{
//1) Find the index of the element in array , 555, and search from the beginning of the array:           IndexFindInArray ( array , 555 );
//2) Find the index of an array element of the array equal to 33 and a search of the end plate( false ): IndexFindInArray ( array , 33 , false );
          int f_size = ArraySize (f_array);
// ---
          if (f_direction)
                    for ( int i = 0 ; i < f_size; i ++)
                              if (f_array [i] == f_value)
                                        return i;
// ---
          if (! f_direction)
                    for ( int i = f_size - 1 ; i >= 0 ; i--)
                              if (f_array [i] == f_value)
                                        return i;
          return - 1 ; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Sd_MqlArray::DeleteInArray ( double & f_array [], double f_delete) // value to delete
{         int size = ArraySize (f_array);
// ---
          for ( int i = 0 ; i < size; i ++)
          {         if (f_array [i] != f_delete) continue ;
                    ArrayCopy (f_array, f_array, i, i + 1 );//---=---//////----=--//
                    ArrayResize (f_array, ArraySize (f_array) - 1 );//---=---//////----=-
                    i--; size--; //
          } //
//========================================
//An example of how to use a function
//By removing all elements with value 5 from array : DeleteInArray (array, 5 );
//========================================
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Sd_MqlArray::ArrayAverage(const double &f_array[])  // tablica
{         double f_result = 0;
          int    f_size = ArraySize(f_array);
//---
          if(f_size == 0) return DBL_MAX;
          else {         for(int i = 0; i < f_size; i++)f_result += f_array[i]; }
          return f_result /= f_size; //
          //=============================================
//An example of how to use a function
//Find the arithmetic mean of the elements in array :ArrayAverage(array);
          //=============================================
}
//+------------------------------------------------------------------+
//|             Class C_BANK::     BEGIN                             |
//+------------------------------------------------------------------+
