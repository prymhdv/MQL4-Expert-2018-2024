//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+

#property strict
#define IsDebug_VectorZ 1
template<typename T>
void ArrayInsertZ(T &array[], int index, T value, int extraBuffer = 10)
{         int size = ArraySize(array);
          if(index < 0 || index > size) return;
          ArrayResize(array, size + 1, extraBuffer);
          for(int i = size; i > index; i--) { array[i] = array[i - 1]; }
          array[index] = value; //
}
template<typename T>
void ArrayDeleteZ(T &array[], int index)
{         int size = ArraySize(array);
          if(index < 0 || index >= size) return;
          for(int i = index; i < size - 1; i++) { array[i] = array[i + 1]; }
          ArrayResize(array, size - 1); //
}
//+------------------------------------------------------------------+
//| Generic VectorZ                                                   |
//+------------------------------------------------------------------+
template<typename T>
class VectorZ
{
private:
          int               m_extraBuffer;
          T                 m_array[];

protected:
          void resize(int size)   {         ArrayResize(m_array, size, m_extraBuffer); }
          void clearArrayX()
          {         ArrayFree(m_array);//
          }
//------------------------------------------------------------------------
public:
          VectorZ(uint count, int extraBuffer = 0): m_extraBuffer(extraBuffer) { resize(count); countelement = 0; }
          ~VectorZ()
          {         //Print("before VectorZ sizeof(this):", sizeof(this)); //
                    clearArrayX();
                    //ArrayFree(m_array);
                    //if(GetPointer(this) != NULL) { delete GetPointer(this);}//
                    //ZeroMemory(m_array);
                    //Print("after VectorZ sizeof(this):", sizeof(this)); //
          }
          VectorZ(): m_extraBuffer(0) { resize(0); countelement = 0; }
          VectorZ(const VectorZ<T>& that) { this = that;}
          //----------------------------------------------------------------------------------
          uint countelement;
          uint index;
          uint getIndex() {return index;}
          // VectorZ specific
          void setExtraBuffer(int value) {m_extraBuffer = value; resize(size());}
          int  getExtraBuffer() const {return m_extraBuffer;}


          // Collection interface
          void clear() {clearArrayX(); resize(0); ArrayFree(m_array);}
          void Clear() {clearArrayX(); resize(0); ArrayFree(m_array);}

          int  size() const {return ArraySize(m_array);}
          int  Size() const {return ArraySize(m_array);}
          int  Total() const {return ArraySize(m_array);}
          int  total() const {return ArraySize(m_array);}

          bool add(T value) {push(value); return true;}
          bool Add(T value)  {push(value); return true;}
          bool append (T value)  {push(value); return true;}
          bool operator<<(T value) {push(value); return true;}


          // Sequence interface
          void insertAt(int i, T val)           { ArrayInsertZ(m_array, i, val, m_extraBuffer); countelement++; }
          T removeAt(int i)                     { T val = m_array[i]; ArrayDeleteZ(m_array, i); countelement--; return val; }

          T operator[](uint i) const            { return m_array[i];}
          T get(int i, string f, int l) const     {/*Print(f," ",l);*/return m_array[i];}
          T At(int i) const                     {/*Print(f," ",l);*/return m_array[i];}
          //T operator[]()                        {return m_array;}
          void set(int i, T val)                {m_array[i] = val;}
          //T[] operator=(int i,T val) const              {m_array[i] = val;}

          // Stack and Queue interface: alias for Sequence interface
          void push(T val)                      {insertAt(size(), val);}
          T    pop()                            {return removeAt(size() - 1);}
          T    peek(uint i) const                     {if(size() == 0) {Print("Array Empty"); return (T)0.000000001;} return m_array[size() - i];}
          T    back(uint i) const                     {if(size() == 0) {Print("Array Empty"); return (T)0.000000001;}; return m_array[size() - i];}
          void unshift(T val)                   {insertAt(0, val);}
          T    shift()                          {return removeAt(0);} //
          T    forward()
          {         T temp = (T)0.00000000001;
                    if(size() == 0) {Print("Array Empty"); return temp;};
                    temp = m_array[0];
                    T ArrayTemp[];
                    ArrayCopy(ArrayTemp, m_array, 0, 1, WHOLE_ARRAY); //
                    ArrayCopy(m_array, ArrayTemp, 0, 0, WHOLE_ARRAY); //
                    countelement--;
                    return temp;//
          } //
          //-------------------------------------------------------------
          void resizer(uint size, T val)
          {         if(0)
                    {         for(uint i = 0; i < size; i++)
                              {         add(val);
                                        if(IsDebug_VectorZ)Print(" VectorZ::resizer()    val: ", val, "  size: ", size, "  i: ", i); //
                              } //
                    }
                    ArrayResize(m_array, size); //
                    ArrayInitialize(m_array, val); //
          } ;
          //VectorZ operator{ }(T Val)  {add(Val); return VectorZ;}
          //-------------------------------------------------------------
          T GetMin()
          {         T min = 0.0; //for(int i = 0; i < Total(); i++){         min = m_array[i] < min ?  m_array[i] : min; } //
                    if(-1 == ArrayMinimum(m_array)) return min;
                    min = m_array[ArrayMinimum(m_array)];
                    return min;//
          }
          T GetMax()
          {         T max = 0.0; //for(int i = 0; i < Total(); i++){         max = m_array[i] > max ?  m_array[i] : max; } //
                    if(-1 == ArrayMaximum(m_array)) return max;
                    max = m_array[ArrayMaximum(m_array)];
                    return max;//
          }
          T Mean()
          {         T sum = 0.0;
                    for(int i = 0; i < total(); i++) {sum += m_array[i]; } //
                    return sum / total(); //
          }
          T VarianceSample()
          {         T sum = 0; //
                    T Vmean = Mean();
                    for(int i = 0; i < Total(); i++) {sum += (T)pow(m_array[i] - Vmean, 2);}
                    uint sample  = Total() - 1;
                    T variance = sum / sample;
                    //Print("VarianceSample:", variance, "    sum:", sum, "    sample:", sample, "    Total():", Total()); //
                    return variance;//
          }
          T VariancePopulation()
          {         T sum = 0; //
                    T Vmean = Mean();
                    for(int i = 0; i < Total(); i++) {sum += (T)pow(m_array[i] - Vmean, 2);}
                    uint sample  = Total();
                    T variance =  sum / sample;
                    //Print("VariancePopulation:", variance, "    sum:", sum, "    sample:", sample, "    Total():", Total()); //
                    return variance;//
          }
          T SD()
          {         T StandardDeviration = (T)sqrt(VariancePopulation());
                    //Print("StandardDeviration:", StandardDeviration, "    Variance():", VariancePopulation()); //
                    return StandardDeviration;//
          }
          //-------------------------------------------------------------
          //
}; VectorZ<double>  Vectorz;
//+------------------------------------------------------------------+
