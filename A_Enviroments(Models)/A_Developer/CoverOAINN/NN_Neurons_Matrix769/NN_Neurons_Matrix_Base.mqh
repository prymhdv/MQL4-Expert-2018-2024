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
//--- include external libraries


//---!#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\Graphics\Graphic.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\Arrays\ArrayObj(MQL4).mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\Arrays\ArrayInt(MQL4).mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\Arrays\ArrayDouble(MQL4).mqh>


#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\Math\Stat\Math.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(DataType)\CollectionX\VectorX.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(DataType)\CollectionX\MatrixArray.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
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
enum NN_Neurons_Matrix_ActFunctions
{         NNNM_ReLU,      // f(n)==a== if x < 0 : return 0  else return n
          NNNM_Sigmoid,   // f(n)==a== return  1.0 / (1 + MathPow(2.71828, -n));   ///hardlimit ///semantic hardlimit
          NNNM_SigmoidSymetric,
          NNNM_SoftMax,
          NNNM_TanH,      //tansigneded
          NNNM_CosH,
          NNNM_HyperTan,  //f(n)==a==n
          NNNM_Purelim,   //f(n)==a==n
          NNNM_HardLimit,
          NNNM_HardLimitSymetric,
          NNNM_Saturate,
          NNNM_SaturateSymetic,
          NNNM_posline,
          NNNM_Competive
          //
};
//+------------------------------------------------------------------+
//|                connections container                             |
//+------------------------------------------------------------------+
class NN_Neurons_Matrix_SConnection
{
public:
          NN_Neurons_Matrix_SConnection(void)     { weight = randWeight();  deltaWeight = 0.0; } //weight = MathRandomNonZero();
          ~NN_Neurons_Matrix_SConnection(void)    {}
          double                weight, deltaWeight;
private:
          float                 randWeight(void)  { return (float)rand() / (INT_MAX); } //random weight generator

public:
          //--- working with files
          void Save(int &file_handle)//save weights to a file
          {         if(file_handle == INVALID_HANDLE) return;
                    //---
                    FileWriteDouble(file_handle, weight);
                    FileWriteDouble(file_handle, deltaWeight);//
          }
          void Load(int &file_handle)//read weights from a file
          {         if(file_handle == INVALID_HANDLE) return;
                    //---
                    weight = FileReadDouble(file_handle);
                    deltaWeight = FileReadDouble(file_handle); //
          }

};
//+------------------------------------------------------------------+
