/*
Quicksort, adapted from https://forum.mql4.com/65041#991949 as follows.

Versions of the QuickSort function:

   QuickSort(array, comparer);
   QuickSort_Start_Count(array, start-index, count, comparer);
   QuickSort_Start_EndExclusive(array, start-index, end-index-exclusive, comparer);
   QuickSort_Left_Right(array, start-index, end-index-inclusive, comparer);

This version is partly written for compatibility/replacement of
insertion_sort_1 at https://forum.mql4.com/72249/page2#1034048.

Changes from https://forum.mql4.com/65041#991949:

   * Added templating
   * Added parameterised comparison
   * Added a switch to insertion-sort for very small subarrays. As the
     literature says (e.g. Wikipedia), this is very slightly faster than 
     pure quicksort. But the time gain is really *very* tiny on any 
     real-life data in MT4.
   * Added the multiple wrapper functions with different types of start and 
     end argument (partly to match insertion_sort_1, where the parameters are 
     start and exclusive-end, rather than the more usual MQL start and count)

The "comparer" is any class which inherits from the abstract IQuicksortComparer<T>,
defining a specific comparison for a specific datatype. For example, to compare
an array of MqlRates by their high prices:

   class MqlRatesSortByHighDesc : public IQuicksortComparer<MqlRates> {
   public:
   	bool is_before(const MqlRates & lhs, const MqlRates & rhs) {return lhs.high > rhs.high;}
   };

   ...
   MqlRates arr[];
   CopyRates(..., arr);
   
   MqlRatesSortByHighDesc shd;
   QuickSort(arr, shd);
   
To sort an array of object pointers, declare the type as Class* rather than just Class.
For example, to sort an array MyClass*[] you do the following:

   class MySort : public IQuicksortComparer<MyClass*> {
      bool is_before(const MyClass * & lhs, const MyClass * & rhs) {return lhs.Value > rhs.Value;}
   };
   
   ...
   MyClass * arr[];
   ...
   MySort srt;
   QuickSort(arr, srt);

Any code currently using insertion_sort_1 can be converted to use this quicksort 
by doing the following:

   * Replace all calls to insertion_sort() with calls to QuickSort_Start_EndExclusive()
     or, alternatively, add the following #define which has the same effect:
       #define insertion_sort QuickSort_Start_EndExclusive
     
   * Modify all comparison classes used with insertion_sort() so that
     they inherit from IQuicksortComparer. For example, a class 
     which compares a MyClass[] array:
       class MySortCondition {
     becomes:
       class MySortCondition : public IQuicksortComparer<MyClass> {

Note: unlike insertion sort, quicksort is not a "stable" sort. For example: you
have an array of bars in time order, and you sort them by high price. Any bars which
have the same high price are *not* then guaranteed to be sub-sorted by time. If you
want to preserve such an original order as the sub-sorting, then you need
to do this explicitly. For example:

   class MqlRatesSortByHighDesc : public IQuicksortComparer<MqlRates> {
   public:
   	bool is_before(const MqlRates & lhs, const MqlRates & rhs) {
   	   // Sort by descending high price, and then by ascending
   	   // time if the high prices are identical
   	   if (lhs.high > rhs.high) return true;
   	   if (lhs.high < rhs.high) return false;
   	   return lhs.time < rhs.time;
   	}
   };
     
*/

// Abstract class which defines a comparison: simply an is_before()
// which says whether object 1 should be sorted before object 2
template <typename T>
class IQuicksortComparer {
public:
	virtual bool is_before(const T & lhs, const T & rhs) = NULL;
};


// Sorts an entire array (no start and end/count parameters)
template <typename T>
void QuickSort(T &arr[], IQuicksortComparer<T> & IComparer)
{
   int ct = ArraySize(arr);
   if (ct > 1) QuickSort_Left_Right(arr, 0, ct - 1, IComparer);
}

// Version of the function which takes the following parameters:
//    * Start item in array (e.g. 100)
//    * Number of items (e.g. 200)
//    ... and thus sorts items [100-399] in the array
template <typename T>
void QuickSort_Start_Count(T &arr[], uint StartAt, uint Size, IQuicksortComparer<T> & IComparer)
{
   QuickSort_Left_Right(arr, StartAt, StartAt + Size - 1, IComparer);
}

// Version of the function which takes the following parameters:
//    * Start item in array (e.g. 100)
//    * Exclusive-end item in the array; first item *not* to be included (e.g. 400)
//    ... and thus sorts items [100-399] in the array
template <typename T>
void QuickSort_Start_EndExclusive(T &arr[], uint StartAt, uint End_Exclusive, IQuicksortComparer<T> & IComparer)
{
   QuickSort_Left_Right(arr, StartAt, End_Exclusive - 1, IComparer);
}

// Version of the function which takes the following parameters:
//    * Start item in array (e.g. 100)
//    * Inclusive-end item in the array; last item to be included (e.g. 399)
//    ... and thus sorts items [100-399] in the array
template <typename T>
void QuickSort_Left_Right(T &arr[], uint left, uint right, IQuicksortComparer<T> & IComparer)
{
   if (right <= left) return; // Nothing to sort

   uint i, j;
   T tmp;

   // Very marginal improvements can generally be made by 
   // switching to insertion-sort for very small arrays and sub-arrays.
   // But the gain from this is extremely small on any data likely to
   // be encountered in MT4.
   if (right - left <= 16) {
      for (i = left + 1; i <= right; i++) {
         tmp = arr[i];
         j = i - 1;
         // Note: j, which is a uint, can be decremented at 0 and wrap round to 0xFFFFFFFF.
         // Therefore, we test both j >= left and also j <= right
         while (j >= left && j <= right && IComparer.is_before(tmp, arr[j])) {
            arr[j + 1] = arr[j];
            j = j - 1;
         }
         arr[j + 1] = tmp;
      }
      return;
   }
   
   // Quicksort...
   i = left; j = right;
   T pivot = arr[(left + right) / 2];
   
   while (i <= j) {
      while (IComparer.is_before(arr[i], pivot)) i++;
      while (IComparer.is_before(pivot, arr[j])) j--;
              
      if (i <= j) {
         tmp = arr[i];
         arr[i] = arr[j];
         arr[j] = tmp;
         i++;
         j--;
      }
   }
   
   if (left < j) QuickSort_Left_Right(arr, left, j, IComparer);
   if (i < right) QuickSort_Left_Right(arr, i, right, IComparer);
}
