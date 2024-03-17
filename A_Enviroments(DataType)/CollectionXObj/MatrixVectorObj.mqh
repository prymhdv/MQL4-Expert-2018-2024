//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(DataType)\CollectionX\VectorX.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename T>
class CVector
{
public:
          CVector(void);
          ~CVector(void);


          void resize();




//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename T>
class CMatirx_Vextor_Base
{
public:
          CMatirx_Vextor_Base(void);
          ~CMatirx_Vextor_Base(void);
          uint _cols;
          uint _rows;
          VectorX<T> _vals;
//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CMatirx_Vector
{
public:
          uint _cols; uint _rows;
          //CVector<double> _vals;
          VectorX<double> _vals;
          CMatirx_Vector(uint cols, uint rows): _cols(cols), _rows(rows)//, _vals({ })
          {         _vals.resize(cols * rows, 0.0); };

          ~CMatirx_Vector(void);
          /*
                    double  at(uint col, uint row)  {  return _vals[row * _cols + col];   }

                    CMatirx_Vector multiply( CMatirx_Vector &target)
                    {         if(_cols != target._rows)ExpertRemove();
                              CMatirx_Vector output(target._cols, _rows);
                              for(uint y = 0; y < output._rows; y++)
                              {         for(uint x = 0; x < output._cols; x++)
                                        {         double result = 0.0;
                                                  for(uint k = 0; k < _cols; k++)
                                                  {         result += at(k, y) * target.at(x, k); //
                                                  }//
                                                  output.at(x, y) = result; //
                                        }//
                              } //
                              return output;//
                    } //
                    CMatirx_Vector multiplyScaler(double s)
                    {         CMatirx_Vector output(_cols, _rows);
                              for(uint y = 0; y < output._rows; y++)
                              {         for(uint x = 0; x < output._cols; x++)
                                        {         output.at(x, y) = at(x, y) * s; //
                                        }//
                              } //
                              return output;//
                    } //

                    CMatirx_Vector add( CMatirx_Vector &target)
                    {         if(_rows != target._rows && _cols != target._cols)ExpertRemove();
                              CMatirx_Vector output(target._cols, _rows);
                              for(uint y = 0; y < output._rows; y++)
                              {         for(uint x = 0; x < output._cols; x++)
                                        {         output.at(x, y) = at(x, y) + target.at(x, y); } //
                              }//
                              return output;//
                    }

                    CMatirx_Vector addScaler(double s)
                    {         CMatirx_Vector output(_cols, _rows);
                              for(uint y = 0; y < output._rows; y++)
                              {         for(uint x = 0; x < output._cols; x++)
                                        {         output.at(x, y) = at(x, y) + s; //
                                        }//
                              } //
                              return output;//
                    } //

                    CMatirx_Vector negetive()

                    {         CMatirx_Vector output(_cols, _rows);
                              for(uint y = 0; y < output._rows; y++)
                              {         for(uint x = 0; x < output._cols; x++)
                                        {         output.at(x, y) = -at(x, y); //
                                        }//
                              } //
                              return output;//
                    } //
                    CMatirx_Vector tanspose()
                    {         CMatirx_Vector output(_rows, _cols);
                              for(uint y = 0; y < _rows; y++)
                              {         for(uint x = 0; x < _cols; x++)
                                        {         output.at(y, x) = at(x, y) ; //
                                        }//
                              } //
                              return output;//
                    }
          */

//

};
//+------------------------------------------------------------------+
