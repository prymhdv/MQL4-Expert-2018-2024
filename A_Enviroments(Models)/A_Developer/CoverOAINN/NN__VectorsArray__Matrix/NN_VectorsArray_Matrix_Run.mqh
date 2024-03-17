//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(DataType)\CollectionXObj\VectorZObj.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(DataType)\CollectionX\VectorZ.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(DataType)\CollectionX\MatrixVector.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(DataType)\CollectionX\MatrixArray.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class NN_VectorsArray_Matrix_Run
{
public:

          NN_VectorsArray_Matrix_Run( VectorZ<uint> &fToplogy, double fLearningRate, double fMomentom, double fRASF):
                    //_toplogy(fToplogy),
                    // _weightMatrices({0.0}),
                    // _valueMatrices({0.0}),
                    // _biasMatrices({0.0}),
                    _LearningRate(fLearningRate),
                    _Momentom(fMomentom),
                    _RASF(fRASF)

          {         _toplogy = fToplogy; _LearningRate = fLearningRate;   _Momentom = fMomentom;  _RASF = fRASF;
                    _weightMatrices = new VectorZObj<CMatirx_Vector<double>>(0);
                    _valueMatrices  = new VectorZObj<CMatirx_Vector<double>>(0);
                    _biasMatrices   = new VectorZObj<CMatirx_Vector<double>>(0);
                    for(int i = 0; i < fToplogy.size() - 1; i++)
                    {         CMatirx_Vector<double>  weightMatriX(fToplogy[i + 1], fToplogy[i]);
                              weightMatriX.PlusScaler(MathRand() / RAND_MAX);
                              //weightMatriX.applyFunction("SigmodFnc");
                              //weightMatriX.applyFunction([](const double & f)
                              //{         return (float)MathRand() / RAND_MAX; } //
                              _weightMatrices.push(weightMatriX);
                              //
                              CMatirx_Vector<double>  biasMatriX(fToplogy[i + 1], fToplogy[i]);
                              biasMatriX.PlusScaler(MathRand() / RAND_MAX);
                              //biasMatriX.applyFunction("SigmodFnc");
                              //biasMatriX.applyFunction(([](const double & f)
                              //{         return (float)MathRand() / RAND_MAX; } //
                              _biasMatrices.push(biasMatriX);//
                    } //
                    CMatirx_Vector<double> sample;
                    _valueMatrices.resize(fToplogy.size(), sample); //
          }
          NN_VectorsArray_Matrix_Run(void) {};
          ~NN_VectorsArray_Matrix_Run(void) {};
          double                                  _LearningRate;
          double                                  _Momentom;
          double                                  _RASF;

          VectorZ<uint>                         _toplogy;
          VectorZObj<CMatirx_Vector<double>>    *_weightMatrices;
          VectorZObj<CMatirx_Vector<double>>    *_valueMatrices;
          VectorZObj<CMatirx_Vector<double>>    *_biasMatrices;


          void _MainRun_()
          {         VectorZ<uint> topology; topology.add(2); topology.add(8); topology.add(1);
                    NN_VectorsArray_Matrix_Run nn( topology, 0.5, 0.5, 100);//'100f' - invalid number NN_Matrix_Run.mqh   61        72
                    VectorZ<double> TrainingInputs1; TrainingInputs1.add(0.0); TrainingInputs1.add(0.0);
                    VectorZ<double> TrainingInputs2; TrainingInputs2.add(1.0); TrainingInputs2.add(1.0);
                    VectorZ<double> TrainingInputs3; TrainingInputs3.add(1.0); TrainingInputs3.add(0.0);
                    VectorZ<double> TrainingInputs4; TrainingInputs4.add(0.0); TrainingInputs4.add(1.0);
                    VectorZObj<VectorZ<double>> TrainingInputs(0);
                    TrainingInputs.add(TrainingInputs1); TrainingInputs.add(TrainingInputs2); TrainingInputs.add(TrainingInputs3); TrainingInputs.add(TrainingInputs4);
                    //
                    VectorZ<double> TrainingOutputs1; TrainingOutputs1.add(0.0);
                    VectorZ<double> TrainingOutputs2; TrainingOutputs2.add(0.0);
                    VectorZ<double> TrainingOutputs3; TrainingOutputs3.add(1.0);
                    VectorZ<double> TrainingOutputs4; TrainingOutputs4.add(1.0);
                    VectorZObj<VectorZ<double>> TrainingOutputs(0);
                    TrainingOutputs.add(TrainingOutputs1); TrainingOutputs.add(TrainingOutputs2); TrainingOutputs.add(TrainingOutputs3); TrainingOutputs.add(TrainingOutputs4);
                    //
                    uint epoch = 1000;
                    Print("NN_VectorsArray_Matrix_Run   training started...");
                    for(uint i = 0; i < epoch; i++)
                    {         uint index = MathRand() % 4;  //??---------------evey epoch provided one set of four set----------------------------
                              nn.NET_FeedForward(TrainingInputs[index]);
                              nn.BackPropagate(TrainingOutputs[index]); //
                    }
                    Print("NN_VectorsArray_Matrix_Run   training Completed...");
                    //VectorZObj<VectorZ<double>> inputed;
                    uint indexkeep = 0;
                    //foreachvXObj(VectorZ<double>, inp, TrainingInputs)
                    //{         nn.NET_FeedForward(inp);
                    //          VectorZ<double> preds = nn.getPrediction();
                    //          Print("  inputed[", 0, "]: ", TrainingInputs[indexkeep][0],
                    //                "  inputed[", 1, "]: ", TrainingInputs[indexkeep][1],
                    //                "  preds[", 0, "]->: ", preds[0],
                    //                "  indexkeep:", indexkeep
                    //               );
                    //          indexkeep++;
                    //          //
                    //}
                    //
          }; //

          double SigmodFnc(double x) {return 1.0 / (1 + exp(-x));}
          double SigmodFncD(double x) {return x * (1 - x);}

          bool  NET_FeedForward(VectorZ<double> &inputs)
          {         //Print("NN_VectorsArray_Matrix_Run   training NET_FeedForward...");
                    if(inputs.size() != _toplogy[0]) {Print("not same size..inputlayer"); return false;}
                    CMatirx_Vector<double> inputLayer_values(inputs.size(), 1);
                    //for(uint i = 0; i < (uint)inputLayer_values.size(); i++) values._vals[i] = inputs[i]; //
                    for(uint i = 0; i < (uint)inputs.size(); i++) inputLayer_values._vals.set(i, inputs.get(i, __FUNCSIG__, __LINE__)); //
                    //-----feedforward to next layers---------------------------------------
                    //Print("NN_VectorsArray_Matrix_Run   training NET_FeedForward to next layers...");
                    for(uint i = 0; i < _weightMatrices.size(); i++)
                    {         _valueMatrices[i] = inputLayer_values;
                              inputLayer_values = inputLayer_values.multiply(_weightMatrices[i]);
                              inputLayer_values = inputLayer_values.Plus(_biasMatrices[i]);
                              inputLayer_values = inputLayer_values.applyFunction("SigmodFnc");//
                    }
                    _valueMatrices[_weightMatrices.size()] = inputLayer_values;
                    return true;//
          }

          bool BackPropagate(VectorZ<double> &Output)
          {         //Print("NN_VectorsArray_Matrix_Run   training BackPropagate...");
                    if(Output.size() != _toplogy.back(1)) {Print("not same size..outputlayer"); return false;}
                    //-----BackPropagate errors to next layers---------------------------------------
                    CMatirx_Vector<double> _errors(Output.size(), 1);
                    _errors._vals                                               = Output;
                    CMatirx_Vector<double> sub                                  = _valueMatrices.back().negative();
                    _errors                                                     = _errors.Plus(sub); //
                    //-----BackPropagate to next layers---------------------------------------
                    //Print("NN_VectorsArray_Matrix_Run   training BackPropagate to next layers...");
                    for(uint i = _weightMatrices.size() - 1; i <= 0; i--)//minus -1 need int not uint
                    {         CMatirx_Vector<double> tans               = _weightMatrices[i].transpose();
                              CMatirx_Vector<double> prevErrors         = _errors.multiply(tans);
                              CMatirx_Vector<double> dOutputs           = _valueMatrices[i + 1].applyFunction("SigmodFncD");
                              CMatirx_Vector<double> gradients          = _errors.MultiplyElement(dOutputs);
                              gradients                                 = gradients.multiplyScaler(_LearningRate);
                              CMatirx_Vector<double> weightGradients    = _valueMatrices[i].transpose().multiply(gradients);
                              //update layers attribe
                              _weightMatrices[i]                        = _weightMatrices[i].Plus(weightGradients);
                              _biasMatrices[i]                          = _biasMatrices[i].Plus(gradients);
                              _errors                                   = prevErrors;
                              //
                    }
                    return true;//
          }
          //
          VectorZ<double>  *getPrediction()   {return  &_valueMatrices.back()._vals;} //--without * & application error--object of 'VectorZ<double>' cannot be returned, copy constructor 'VectorZ<double>::VectorZ<double>(const VectorZ<double> &)' not found     NN_Matrix_Run.mqh   135       77










};
//+------------------------------------------------------------------+
