//+------------------------------------------------------------------+
//| This software is being issued under the GNU license. Please      |
//| refer to the online description of the license terms or find a   |
//| copy in the project files' resource text file, in MetaEditor5    |
//| public project > ULTIMATE_AI Project <                           |
//+------------------------------------------------------------------+
//|           First written by: Nelson Wanyama                       |
//|                           : ngaira14nelson@gmail.com             |
//|                           : https://www.mql5.com/en/users/_nelson|
//|           Discussion link : https://www.mql5.com/en/forum/338341 |
//+------------------------------------------------------------------+
#property  strict
//
//--- include external libraries
//---!#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\Graphics\Graphic.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\Arrays\ArrayObj(MQL4).mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\Arrays\ArrayInt(MQL4).mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\Math\Stat\Math.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOF\.CoverOF.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\Arrays\ArrayDouble(MQL4).mqh>

#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(DataType)\CollectionX\VectorX.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(DataType)\CollectionX\MatrixArray.mqh>
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
//enum activation
//{         AF_ELU_ = AF_ELU,
//          AF_EXP_ = AF_EXP,
//          AF_GELU_ = AF_GELU,
//          AF_LINEAR_ = AF_LINEAR,
//          AF_LRELU_ = AF_LRELU,
//          AF_RELU_ = AF_RELU,
//          AF_SELU_ = AF_SELU,
//          AF_TRELU_ = AF_TRELU,
//          AF_SOFTPLUS_ = AF_SOFTPLUS };
//enum loss
//{         LOSS_MSE_ = LOSS_MSE,
//          LOSS_MAE_ = LOSS_MAE,
//          LOSS_MSLE_ = LOSS_MSLE,
//          LOSS_HUBER_ = LOSS_HUBER };
//+------------------------------------------------------------------+
//|           enumerate activation functions                         |
//+------------------------------------------------------------------+
enum NN_Neurons_Vector_ActFunctions
{         NNNV_Void,
          NNNV_ReLU,      // f(n)==a== if x < 0 : return 0  else return n
          NNNV_Sigmoid,   // f(n)==a== return  1.0 / (1 + MathPow(2.71828, -n));   ///hardlimit ///semantic hardlimit
          NNNV_SoftMax,
          NNNV_TanH,
          NNNV_CosH,
          NNNV_HyperTan,  //f(n)==a==n
          NNNV_Purelim   //f(n)==a==n

};
//+------------------------------------------------------------------+
//|                connections container                             |
//+------------------------------------------------------------------+
class NN_Neurons_Vector_SConnection
{
public:   void   NN_Neurons_Vector_SConnection() {Totals++;};
          void  ~NN_Neurons_Vector_SConnection() {};
          double           weight[], deltaWeight[];///vector of one input
          static uint      Totals;
          uint             Total() {return Totals;}
public:
          NN_Neurons_Vector_SConnection(int idx);
          //--- working with files
          void             Save(int &file_handle);
          void             Load(int &file_handle);

};
uint NN_Neurons_Vector_SConnection::Totals = 0;
//+------------------------------------------------------------------+
//|             save weights to a file                               |
//+------------------------------------------------------------------+
void NN_Neurons_Vector_SConnection::Save(int &file_handle)
{         if(file_handle == INVALID_HANDLE) return;
          //---
          for(int i = 0; i < ArraySize(weight); i++)
          {         FileWriteDouble(file_handle, weight[i]);
                    FileWriteDouble(file_handle, deltaWeight[i]);//
          }//
}
//+------------------------------------------------------------------+
//|              read weights from a file                            |
//+------------------------------------------------------------------+
void NN_Neurons_Vector_SConnection::Load(int &file_handle)
{         if(file_handle == INVALID_HANDLE) return;
          //---
          for(int i = 0; i < ArraySize(weight); i++)
          {         weight[i] = FileReadDouble(file_handle);
                    deltaWeight[i] = FileReadDouble(file_handle); //
          }//
}
//+------------------------------------------------------------------+
//|          initialize new connections with random values           |
//+------------------------------------------------------------------+
NN_Neurons_Vector_SConnection::NN_Neurons_Vector_SConnection(int idx)
{         weight[idx]           = MathRandomNonZero();
          deltaWeight[idx]      = 0.0; //
}
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
