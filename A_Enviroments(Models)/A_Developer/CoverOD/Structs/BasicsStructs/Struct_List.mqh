//+------------------------------------------------------------------+
//|                                             TreeNodeAdvanced.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|                                                         List.mqh |
//|                   Copyright 2009-2013, MetaQuotes Software Corp. |
//|                                              http://www.mql4.com |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_Object.mqh>
//+------------------------------------------------------------------+
//| Class CDSList.                                         |
//| Purpose: Provides the possibility of working with the list of    |
//|          CDSObject instances and its dervivatives      |
//|          Derives from class CDSObject.                 |
//+------------------------------------------------------------------+
class CDSList : public CDSObject  //---looks as array not stack and queue
{
protected:
          CDSObject          *m_first_node;       // pointer to the first element of the list
          CDSObject          *m_last_node;        // pointer to the last element of the list
          CDSObject          *m_curr_node;        // pointer to the current element of the list
          int               m_curr_idx;         // index of the current list item
          int               m_data_total;       // number of elements
          bool              m_free_mode;        // flag of the necessity of "physical" deletion of object
          bool              m_data_sort;        // flag if the list is sorted or not
          int               m_sort_mode;        // mode of sorting of array

public:
          CDSList(void);
          ~CDSList(void);
          //--- methods of access to protected data
          bool              FreeMode(void)          const { return(m_free_mode);  }
          void              FreeMode(bool mode)           { m_free_mode = mode;     }
          int               Total(void)             const { return(m_data_total); }
          bool              IsSorted(void)          const { return(m_data_sort);  }
          int               SortMode(void)          const { return(m_sort_mode);  }
          //--- method of identifying the object
          virtual int       Type(void) const { return(0x7779); }
          //--- methods for working with files
          virtual bool      Save(const int file_handle);
          virtual bool      Load(const int file_handle);
          //--- method of creating an element of the list
          virtual CDSObject  *CreateElement(void) { return(NULL); }
          //--- methods of filling the list
          int               Add(CDSObject *new_node);
          int               Insert(CDSObject *new_node, int index);
          //--- methods for navigating
          int               IndexOf(CDSObject *node);
          CDSObject          *GetNodeAtIndex(int index);
          CDSObject          *GetFirstNode(void);
          CDSObject          *GetPrevNode(void);
          CDSObject          *GetCurrentNode(void);
          CDSObject          *GetNextNode(void);
          CDSObject          *GetLastNode(void);
          //--- methods for deleting
          CDSObject          *DetachCurrent(void);
          bool              DeleteCurrent(void);
          bool              Delete(int index);
          void              Clear(void);
          //--- method for comparing lists
          bool              CompareList(CDSList *List);
          //--- methods for changing
          void              Sort(int mode);
          bool              MoveToIndex(int index);
          bool              Exchange(CDSObject *node1, CDSObject *node2);
          //--- method for searching
          CDSObject          *Search(CDSObject *element);
protected:
          void              QuickSort(int beg, int end, int mode);
          CDSObject          *QuickSearch(CDSObject *element); };
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CDSList::CDSList(void) : m_first_node(NULL),
          m_last_node(NULL),
          m_curr_node(NULL),
          m_curr_idx(-1),
          m_data_total(0),
          m_free_mode(true),
          m_data_sort(false),
          m_sort_mode(0)
{}
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CDSList::~CDSList(void) {Clear(); }
//+------------------------------------------------------------------+
//| Method QuickSort                                                 |
//+------------------------------------------------------------------+
void CDSList::QuickSort(int beg, int end, int mode)
{         int      i, j, k;
          CDSObject *i_ptr, *j_ptr, *k_ptr;
//---
          i_ptr = GetNodeAtIndex(i = beg);
          j_ptr = GetNodeAtIndex(j = end);
          while(i < end)
          {         //--- ">>1" is quick division by 2
                    k_ptr = GetNodeAtIndex(k = (beg + end) >> 1);
                    while(i < j)
                    {         while(i_ptr.Compare(k_ptr, mode) < 0)
                              {         //--- control the output of the array bounds
                                        if(i == m_data_total - 1)
                                                  break;
                                        i++;
                                        i_ptr = i_ptr.Next(); }
                              while(j_ptr.Compare(k_ptr, mode) > 0)
                              {         //--- control the output of the array bounds
                                        if(j == 0)
                                                  break;
                                        j--;
                                        j_ptr = j_ptr.Prev(); }
                              if(i <= j)
                              {         Exchange(i_ptr, j_ptr);
                                        i++;
                                        i_ptr = GetNodeAtIndex(i);
                                        //--- control the output of the array bounds
                                        if(j == 0)
                                                  break;
                                        else
                                        {         j--;
                                                  j_ptr = GetNodeAtIndex(j); } } }
                    if(beg < j)
                              QuickSort(beg, j, mode);
                    beg = i;
                    i_ptr = GetNodeAtIndex(i = beg);
                    j_ptr = GetNodeAtIndex(j = end); } }
//+------------------------------------------------------------------+
//| Index of element specified via the pointer to the list item      |
//+------------------------------------------------------------------+
int CDSList::IndexOf(CDSObject *node)
{
//--- check
          if(!CheckPointer(node) || !CheckPointer(m_curr_node))
                    return(-1);
//--- searching index
          if(node == m_curr_node)
                    return(m_curr_idx);
          if(GetFirstNode() == node)
                    return(0);
          for(int i = 1; i < m_data_total; i++)
                    if(GetNextNode() == node)
                              return(i);
//---
          return(-1); }
//+------------------------------------------------------------------+
//| Adding a new element to the end of the list                      |
//+------------------------------------------------------------------+
int CDSList::Add(CDSObject *new_node)
{
//--- check
          if(!CheckPointer(new_node))
                    return(-1);
//--- add
          if(m_first_node == NULL)
                    m_first_node = new_node;
          else
          {         m_last_node.Next(new_node);
                    new_node.Prev(m_last_node); }
          m_curr_node = new_node;
          m_curr_idx = m_data_total;
          m_last_node = new_node;
          m_data_sort = false;
//--- result
          return(m_data_total++); }
//+------------------------------------------------------------------+
//| Inserting a new element to the specified position in the list.   |
//| Inserting element to the current position of the list if index=-1|
//+------------------------------------------------------------------+
int CDSList::Insert(CDSObject *new_node, int index)
{         CDSObject *tmp_node;
//--- check
          if(!CheckPointer(new_node))
                    return(-1);
          if(index > m_data_total || index < 0)
                    return(-1);
//--- adjust
          if(index == -1)
          {         if(m_curr_node == NULL)
                              return(Add(new_node)); }
          else
          {         if(GetNodeAtIndex(index) == NULL)
                              return(Add(new_node)); }
//--- no need to check m_curr_node
          tmp_node = m_curr_node.Prev();
          new_node.Prev(tmp_node);
          if(tmp_node != NULL)
                    tmp_node.Next(new_node);
          else
                    m_first_node = new_node;
          new_node.Next(m_curr_node);
          m_curr_node.Prev(new_node);
          m_data_total++;
          m_data_sort = false;
          m_curr_node = new_node;
//--- result
          return(index); }
//+------------------------------------------------------------------+
//| Get a pointer to the position of element in the list             |
//+------------------------------------------------------------------+
CDSObject *CDSList::GetNodeAtIndex(int index)
{         int      i;
          bool     revers;
          CDSObject *result;
//--- check
          if(index >= m_data_total)
                    return(NULL);
          if(index == m_curr_idx)
                    return(m_curr_node);
//--- optimize bust list
          if(index < m_curr_idx)
          {         //--- index to the left of the current
                    if(m_curr_idx - index < index)
                    {         //--- closer to the current index
                              i = m_curr_idx;
                              revers = true;
                              result = m_curr_node; }
                    else
                    {         //--- closer to the top of the list
                              i = 0;
                              revers = false;
                              result = m_first_node; } }
          else
          {         //--- index to the right of the current
                    if(index - m_curr_idx < m_data_total - index - 1)
                    {         //--- closer to the current index
                              i = m_curr_idx;
                              revers = false;
                              result = m_curr_node; }
                    else
                    {         //--- closer to the end of the list
                              i = m_data_total - 1;
                              revers = true;
                              result = m_last_node; } }
          if(!CheckPointer(result))
                    return(NULL);
//---
          if(revers)
          {         //--- search from right to left
                    for(; i > index; i--)
                    {         result = result.Prev();
                              if(result == NULL)
                                        return(NULL); } }
          else
          {         //--- search from left to right
                    for(; i < index; i++)
                    {         result = result.Next();
                              if(result == NULL)
                                        return(NULL); } }
          m_curr_idx = index;
//--- result
          return(m_curr_node = result); }
//+------------------------------------------------------------------+
//| Get a pointer to the first itme of the list                      |
//+------------------------------------------------------------------+
CDSObject *CDSList::GetFirstNode(void)
{
//--- check
          if(!CheckPointer(m_first_node))
                    return(NULL);
//--- save
          m_curr_idx = 0;
//--- result
          return(m_curr_node = m_first_node); }
//+------------------------------------------------------------------+
//| Get a pointer to the previous itme of the list                   |
//+------------------------------------------------------------------+
CDSObject *CDSList::GetPrevNode(void)
{
//--- check
          if(!CheckPointer(m_curr_node) || m_curr_node.Prev() == NULL)
                    return(NULL);
//--- decrement
          m_curr_idx--;
//--- result
          return(m_curr_node = m_curr_node.Prev()); }
//+------------------------------------------------------------------+
//| Get a pointer to the current item of the list                    |
//+------------------------------------------------------------------+
CDSObject *CDSList::GetCurrentNode(void)
{         return(m_curr_node); }
//+------------------------------------------------------------------+
//| Get a pointer to the next item of the list                       |
//+------------------------------------------------------------------+
CDSObject *CDSList::GetNextNode(void)
{
//--- check
          if(!CheckPointer(m_curr_node) || m_curr_node.Next() == NULL)
                    return(NULL);
//--- increment
          m_curr_idx++;
//--- result
          return(m_curr_node = m_curr_node.Next()); }
//+------------------------------------------------------------------+
//| Get a pointer to the last itme of the list                       |
//+------------------------------------------------------------------+
CDSObject *CDSList::GetLastNode(void)
{
//--- check
          if(!CheckPointer(m_last_node))
                    return(NULL);
//---
          m_curr_idx = m_data_total - 1;
//--- result
          return(m_curr_node = m_last_node); }
//+------------------------------------------------------------------+
//| Detach current item in the list                                  |
//+------------------------------------------------------------------+
CDSObject *CDSList::DetachCurrent(void)
{         CDSObject *tmp_node, *result = NULL;
//--- check
          if(!CheckPointer(m_curr_node))
                    return(result);
//--- "explode" list
          result = m_curr_node;
          m_curr_node = NULL;
//--- if the deleted item was not the last one, pull up the "tail" of the list
          if((tmp_node = result.Next()) != NULL)
          {         tmp_node.Prev(result.Prev());
                    m_curr_node = tmp_node; }
//--- if the deleted item was not the first one, pull up "head" list
          if((tmp_node = result.Prev()) != NULL)
          {         tmp_node.Next(result.Next());
                    //--- if "last_node" is removed, move the current pointer to the end of the list
                    if(m_curr_node == NULL)
                    {         m_curr_node = tmp_node;
                              m_curr_idx = m_data_total - 2; } }
          m_data_total--;
//--- if necessary, adjust the settings of the first and last elements
          if(m_first_node == result)
                    m_first_node = result.Next();
          if(m_last_node == result)
                    m_last_node = result.Prev();
//--- complete the processing of element removed from the list
//--- remove references to the list
          result.Prev(NULL);
          result.Next(NULL);
//--- result
          return(result); }
//+------------------------------------------------------------------+
//| Delete current item of list item                                 |
//+------------------------------------------------------------------+
bool CDSList::DeleteCurrent(void)
{         CDSObject *result = DetachCurrent();
//--- check
          if(result == NULL)
                    return(false);
//--- complete the processing of element removed from the list
          if(m_free_mode)
          {         //--- delete it "physically"
                    if(CheckPointer(result) == POINTER_DYNAMIC)
                              delete result; }
//--- successful
          return(true); }
//+------------------------------------------------------------------+
//| Delete an item from a given position in the list                 |
//+------------------------------------------------------------------+
bool CDSList::Delete(int index)
{         if(GetNodeAtIndex(index) == NULL)
                    return(false);
//--- result
          return(DeleteCurrent()); }
//+------------------------------------------------------------------+
//| Remove all items from the list                                   |
//+------------------------------------------------------------------+
void CDSList::Clear(void)
{         GetFirstNode();
          while(m_data_total != 0) if(!DeleteCurrent()) break; }
//+------------------------------------------------------------------+
//| Equality comparing of two lists                                  |
//+------------------------------------------------------------------+
bool CDSList::CompareList(CDSList *List)
{         CDSObject *node, *lnode;
//--- check
          if(!CheckPointer(List))
                    return(false);
          if((node = GetFirstNode()) == NULL)
                    return(false);
          if((lnode = List.GetFirstNode()) == NULL)
                    return(false);
//--- compare
          if(node.Compare(lnode) != 0)
                    return(false);
          while((node = GetNextNode()) != NULL)
          {         if((lnode = List.GetNextNode()) == NULL)
                              return(false);
                    if(node.Compare(lnode) != 0)
                              return(false); }
//--- equal
          return(true); }
//+------------------------------------------------------------------+
//| Sorting an array in ascending order                              |
//+------------------------------------------------------------------+
void CDSList::Sort(int mode)
{
//--- check
          if(m_data_total == 0)
                    return;
          if(m_data_sort && m_sort_mode == mode)
                    return;
//--- sort
          QuickSort(0, m_data_total - 1, mode);
          m_sort_mode = mode;
          m_data_sort = true; }
//+------------------------------------------------------------------+
//| Move the current item of list to the specified position          |
//+------------------------------------------------------------------+
bool CDSList::MoveToIndex(int index)
{
//--- check
          if(index >= m_data_total || !CheckPointer(m_curr_node))
                    return(false);
//--- tune
          if(m_curr_idx == index)
                    return(true);
          if(m_curr_idx < index)
                    index--;
//--- move
          Insert(DetachCurrent(), index);
//--- successful
          return(true); }
//+------------------------------------------------------------------+
//| Move an item of the list from the specified position to the      |
//| current one                                                      |
//+------------------------------------------------------------------+
bool CDSList::Exchange(CDSObject *node1, CDSObject *node2)
{         CDSObject *tmp_node, *node;
//--- check
          if(!CheckPointer(node1) || !CheckPointer(node2))
                    return(false);
//---
          tmp_node = node1.Prev();
          node1.Prev(node2.Prev());
          if(node1.Prev() != NULL)
          {         node = node1.Prev();
                    node.Next(node1); }
          else
                    m_first_node = node1;
          node2.Prev(tmp_node);
          if(node2.Prev() != NULL)
          {         node = node2.Prev();
                    node.Next(node2); }
          else
                    m_first_node = node2;
          tmp_node = node1.Next();
          node1.Next(node2.Next());
          if(node1.Next() != NULL)
          {         node = node1.Next();
                    node.Prev(node1); }
          else
                    m_last_node = node1;
          node2.Next(tmp_node);
          if(node2.Next() != NULL)
          {         node = node2.Next();
                    node.Prev(node2); }
          else
                    m_last_node = node2;
//---
          m_curr_idx = 0;
          m_curr_node = m_first_node;
          m_data_sort = false;
//--- successful
          return(true); }
//+------------------------------------------------------------------+
//| Search position of an element in a sorted list                   |
//+------------------------------------------------------------------+
CDSObject *CDSList::QuickSearch(CDSObject *element)
{         int      i, j, m;
          CDSObject *t_node = NULL;
//--- check
          if(m_data_total == 0)
                    return(NULL);
//--- check the pointer is not needed
          i = 0;
          j = m_data_total;
          while(j >= i)
          {         //--- ">>1" is quick division by 2
                    m = (j + i) >> 1;
                    if(m < 0 || m >= m_data_total)
                              break;
                    t_node = GetNodeAtIndex(m);
                    if(t_node.Compare(element, m_sort_mode) == 0)
                              break;
                    if(t_node.Compare(element, m_sort_mode) > 0)
                              j = m - 1;
                    else
                              i = m + 1;
                    t_node = NULL; }
//--- result
          return(t_node); }
//+------------------------------------------------------------------+
//| Search position of an element in a sorted list                   |
//+------------------------------------------------------------------+
CDSObject *CDSList::Search(CDSObject *element)
{         CDSObject *result;
//--- check
          if(!CheckPointer(element) || !m_data_sort)
                    return(NULL);
//--- search
          result = QuickSearch(element);
//--- result
          return(result); }
//+------------------------------------------------------------------+
//| Writing list to file                                             |
//+------------------------------------------------------------------+
bool CDSList::Save(const int file_handle)
{         CDSObject *node;
          bool     result = true;
//--- check
          if(!CheckPointer(m_curr_node) || file_handle == INVALID_HANDLE)
                    return(false);
//--- write start marker - 0xFFFFFFFFFFFFFFFF
          if(FileWriteLong(file_handle, -1) != sizeof(long))
                    return(false);
//--- write type
          if(FileWriteInteger(file_handle, Type(), INT_VALUE) != INT_VALUE)
                    return(false);
//--- write list size
          if(FileWriteInteger(file_handle, m_data_total, INT_VALUE) != INT_VALUE)
                    return(false);
//--- sequential scannning of elements in the list using the call of method Save()
          node = m_first_node;
          while(node != NULL)
          {         result &= node.Save(file_handle);
                    node = node.Next(); }
//--- successful
          return(result); }
//+------------------------------------------------------------------+
//| Reading list from file                                           |
//+------------------------------------------------------------------+
bool CDSList::Load(const int file_handle)
{         uint     i, num;
          CDSObject *node;
          bool     result = true;
//--- check
          if(file_handle == INVALID_HANDLE)
                    return(false);
//--- read and checking begin marker - 0xFFFFFFFFFFFFFFFF
          if(FileReadLong(file_handle) != -1)
                    return(false);
//--- read and checking type
          if(FileReadInteger(file_handle, INT_VALUE) != Type())
                    return(false);
//--- read list size
          num = FileReadInteger(file_handle, INT_VALUE);
//--- sequential creation of list items using the call of method Load()
          Clear();
          for(i = 0; i < num; i++)
          {         node = CreateElement();
                    if(node == NULL)
                              return(false);
                    Add(node);
                    result &= node.Load(file_handle); }
//--- successful
          return(result); }
//+------------------------------------------------------------------+
