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
enum NNS_Neurons_Matrix_YX_ActFunctions
{         NNNMS_YX_ReLU,      // f(n)==a== if x < 0 : return 0  else return n
          NNNMS_YX_posline,
          NNNMS_YX_Purelim,   //f(n)==a==n
          NNNMS_YX_Sigmoid,   // f(n)==a== return  1.0 / (1 + MathPow(2.71828, -n));   ///hardlimit ///semantic hardlimit
          NNNMS_YX_SigmoidSymetric,
          NNNMS_YX_SoftMax,
          NNNMS_YX_TanH,      //tansigneded
          NNNMS_YX_CosH,
          NNNMS_YX_HyperTan,  //f(n)==a==n
          NNNMS_YX_HardLimit,
          NNNMS_YX_HardLimitSymetric,
          NNNMS_YX_Saturate,
          NNNMS_YX_SaturateSymetic,

          NNNMS_YX_Competive
          //
};
//+------------------------------------------------------------------+
//|                connections container                             |
//+------------------------------------------------------------------+
#define RAND_MAX_ 32767.0
class NNS_Neurons_Matrix_YX_SConnection
{
public:
          NNS_Neurons_Matrix_YX_SConnection(void)                { weight = randWeight();  deltaWeight = 0.0; } //weight = MathRandomNonZero();
          NNS_Neurons_Matrix_YX_SConnection(bool IsFristLayer)   { if(IsFristLayer) { weight = 1; deltaWeight = 0.0;} else { weight = randWeight();  deltaWeight = 0.0;} } //weight = MathRandomNonZero();
          ~NNS_Neurons_Matrix_YX_SConnection(void)    {}
          double                weight, deltaWeight;
private:
          double                 randWeight(void)  { return (double)(InRange( -RAND_MAX_, RAND_MAX_, -0.0001, 0.0001, rand())); } //random weight generator __IF HUGE NUMBER THE 2000 VAL MAKE SIGMOID 0 or 1___________

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
