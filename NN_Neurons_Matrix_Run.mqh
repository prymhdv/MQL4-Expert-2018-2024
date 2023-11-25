//+------------------------------------------------------------------+
//||   ||||||||||       Sd_DATA_FILES_FOLDERS_DISK.mqh              ||
//|||  ||||||PO||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||URY|||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#property  strict
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAINN\NN_Neurons_Matrix\NN_Neurons_Matrix_Net.mqh>
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |, double LearningRate = 0.15, double Momentom = 0.5
//+------------------------------------------------------------------+
class NN_Neurons_Matrix_Run769
{
public:
          NN_Neurons_Matrix_Run769(double fBias, double fLearningRate, double fMomentom, double fRASF)
          {         IsTrained = false; isTarget2 = 1; Bias = fBias;   LearningRate = fLearningRate  ;   Momentom = fMomentom;  RASF = fRASF;
                    //myNet = NN_Neurons_Matrix_CNet(topology, NNNM_Sigmoid, NNNM_ReLU, LearningRate = 0.05, Momentom = 0.9, RASF = 6);//
          };
          NN_Neurons_Matrix_Run769(void)  { IsTrained = false; isTarget2 = 1; };
          ~NN_Neurons_Matrix_Run769(void) { delete myNet; };//delete myNet2;
          //----------------------------------------------------------
          uint       show_time;// = 50; // Chart display time (seconds)
          bool       IsTrained;
          bool       isTarget2;


          //----------------------------------------------------------
          NN_Neurons_Matrix_CNet *myNet;//class variables need pointer mode init
          double     Bias;
          double     LearningRate;          // = 0.15;
          double     Momentom;              // = 0.5
          double RASF    ;              //= 100
          double     calculateMSE_Sample(const CArrayDouble_MQL4 & predicted[], const CArrayDouble_MQL4 & actual[], string s);
          //----------------------------------------------------------
          int           MainProgress(bool b);
          void          _MainRun_();//>...........................................................................................................
          void          fillInputsTraining(CArrayDouble_MQL4 &inp[], CArrayDouble_MQL4 &tar[]);
          void          fillInputsValidation(CArrayDouble_MQL4 &inp[], CArrayDouble_MQL4 &tar[]);
          void          fillInputsPerdiction(CArrayDouble_MQL4 &inp[]);

          void          fillInputsTraining2(CArrayDouble_MQL4 &inp[], CArrayDouble_MQL4 &tar[]);
          void          fillInputsValidation2(CArrayDouble_MQL4 &inp[], CArrayDouble_MQL4 &inpMine[], CArrayDouble_MQL4 &tar[], CArrayDouble_MQL4 &finalseries[], int idx);
          void          fillInputsPerdiction2(CArrayDouble_MQL4 &inp[], CArrayDouble_MQL4 &finalseries[], int idx);

          void          fillInputsPerdiction3(CArrayDouble_MQL4 &inp[], CArrayDouble_MQL4 &finalseries[], int idx);
          //--
          bool          Load(bool IsKey, CArrayInt_MQL4 &fTopology);
          bool          Save(bool IsKey);
          //--
          void       clear()
          {         //---! ChartSetInteger(0, CHART_SHOW, false);
                    //---! ChartSetInteger(0, CHART_CONTEXT_MENU, false);
                    //---! ChartSetInteger(0, CHART_SHOW_DATE_SCALE, false); //
          }
          void       restore()
          {         //---!ChartSetInteger(0, CHART_SHOW, true);
                    //---! ChartSetInteger(0, CHART_CONTEXT_MENU, true);
                    //---! ChartSetInteger(0, CHART_SHOW_DATE_SCALE, false); //
          }
          //----------------------------------------------------------
          void       Vtrade();
          uchar      OptimizeOFFER( ushort bw, ushort sw, ushort bl, ushort sl);
          //---------------------------------------------------------


};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int NN_Neurons_Matrix_Run769::MainProgress(bool b)
{         //
          if(!b) {   return -1; }
          {         /*LOAD*///inner
                    /*PROGRESS*/ _MainRun_(); //Extract Trade Signal
                    /*PROGRESS*/ Vtrade();    //Trade Signal virtualy
                    /*SAVE*///inner
          }
          return 0;
//
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
uint DayoutX = (uint)((Time[0] + PeriodSeconds(PERIOD_D1) * 1) + Time[0]);
#define PeriodWork PERIOD_M1

#define DataSamples 10/10       /* 3/10 not aloved 0.3*/
#define DataElementsPack 1000     /* *2 */
#define DataElementInpSeries 6 //not sample based//series based
#define DataElementInp (DataElementInpSeries*DataElementsPack/1)  //one candel just say its bulish or bearish
#define DataElementOut (DataElementInpSeries*DataElementsPack+ DataElementInpSeries*600) //maeke 
//-----------------------------------------
#define ValidationRangeStartLR  (DataElementsPack*2+0)
#define DataPartsGap 50
//-----------------------------------------
#define WantedPerdicateRange 20
#define Trainingepochs 10000/10  //---350-400converge
//-----------------------------------------
#define NetworkSaveLoad 0//if saved convergence to training set
#define IsMine 1
//----------------------------------------- Last Trained Sample Convergenced By MSE ----------------------
#define IsMSE 1
#define IsMSEBreake 0.001
#define RunTimeLimit 6//secound
datetime InitTime = TimeLocal();
datetime CurrTime = TimeLocal();
void NN_Neurons_Matrix_Run769::_MainRun_()
{         {         Sleep(1000); } //
//********************************************************* Build Network *********************************************************
//--- create our neural network
          CArrayInt_MQL4 topology;    topology.Clear();                                  //--- add the configuration [2,2,1] //---!!
          {         topology.Add(DataElementInp);               //Input - frist  layer>>>>>//---adding element n to array elements form end//dependet number of element you want to input
                    //-----------------------------
                    topology.Add(5);
                    topology.Add(4);          //middle layer>
                    topology.Add(2);
                    //topology.Add(layerHiddenNeurons2 + 2);
                    //topology.Add(layerHiddenNeurons2 + 3);
                    //topology.Add(layerHiddenNeurons / 2);
                    //-----------------------------
                    topology.Add(DataElementOut);               //output layer>>>>>
          }
          /*-------------------------------------------------*///(MathRand() % 10)/10//
//__Learnin_Rate__ important other not effected  LearningRate 0.001= [1985.52 : 69] [LearningRate 0.19= 1985.52 :1400][LearningRate 0.039] [LearningRate = 0.039, Momentom = 0.051, RASF = 10>>1985.52 :1400]
//--- Initialize the network with our configuration ///when not pointer 2023.10.20 12:14:50.106     QUARTS_AF1 XAUUSD,M1: invalid pointer access in 'NN_Neurons_Matrix_Net.mqh' (98,106)
//topology, NNNM_Sigmoid, NNNM_ReLU,Bias = 1.0,  LearningRate = 0.039, Momentom = 0.051, RASF = 1000[notefected]
          myNet = new NN_Neurons_Matrix_CNet(topology, NNNM_SigmoidSymetric, NNNM_ReLU, Bias = 1.0,  LearningRate = 0.15 + 0.0000, Momentom = 0.50 - 0.0000, RASF = 100.0);
          if( !Load(NetworkSaveLoad, topology)) {}//no need before seted, myNet = NN_Neurons_Matrix_CNet(topology, NNNM_Sigmoid, NNNM_ReLU, LearningRate = 0.05, Momentom = 0.9, RASF = 6);
//********************************************************* Prapare Data Sample *********************************************************
//--- create data containers
          CArrayDouble_MQL4 Training_inputVals_Matrix[],   Training_targetVals_Matrix[], Training_resultVals_Matrix[];     ///--{0.0,     0.0,    0.0,    0.0,    0.0,    0.0,    0.0,    0.0,    0.0}
          CArrayDouble_MQL4 Validation_inputVals_Matrix[], Validation_inputValsMine_Matrix[], Validation_targetVals_Matrix[], Validation_resultVals_Matrix[], Validation_resultVals_MatrixFinal[];/*outputsVals_Matrix*/;
          CArrayDouble_MQL4 Perdiction_inputVals_Matrix[], Perdiction_resultVals_Matrix[], Perdiction_resultVals_MatrixFinalFeed[];/*outputsVals_Matrix*/;
          ArrayResize(Training_inputVals_Matrix,  DataSamples);    ArrayResize(Training_targetVals_Matrix, DataSamples); ArrayResize(Training_resultVals_Matrix, DataSamples);
          ArrayResize(Validation_inputVals_Matrix,  DataSamples) ; ArrayResize(Validation_inputValsMine_Matrix, DataSamples); ArrayResize(Validation_targetVals_Matrix, DataSamples); ArrayResize(Validation_resultVals_Matrix, DataSamples); ArrayResize(Validation_resultVals_MatrixFinal, DataSamples);
          ArrayResize(Perdiction_inputVals_Matrix,  DataSamples) ; ArrayResize(Perdiction_resultVals_Matrix, DataSamples); ArrayResize(Perdiction_resultVals_MatrixFinalFeed, DataSamples);
          /*-------------------------------------------------*/
//****************************************************************************** Start [Triaining] fillInputsTraining //******************************************************************************
          {         //--- create training data and check compatibility with the network
                    //--- number of inputs MUST be equal to number of input neurons in your network
                    fillInputsTraining(Training_inputVals_Matrix, Training_targetVals_Matrix);
                    //********************************************************* Start [Triaining] *********************************************************
                    {         //double        rms_ErrorLine[DataSamples][];   //---save netErrors every epoche reserve epochs count
                              double        rms_ErrorLine[DataSamples];
                              uint          epochs = Trainingepochs;          //--any cycle//700-300fixed targets
                              ArrayResize(rms_ErrorLine, 0, (int)epochs);
                              for(int i = 0; i < ArraySize(Training_inputVals_Matrix); i++)
                              {         uint index = MathRand() % DataSamples;  //??---------------evey epoch provided one set of four set----------------------------
                                        index = i;
                                        //******************************************************************************
                                        double MSE_Curr_Cheack = 0; double MSE_Prev_Cheack = 0;
                                        InitTime = TimeLocal();
                                        for(uint j = 0;  j < epochs ; j++)//(j < epochs*100000) &&( (CurrTime - InitTime) < RunTimeLimit )
                                        {         if(Training_inputVals_Matrix[index].Total() != topology.At(0)) { Print("Incompatible inputs!"); break; }
                                                  //******************************************************************************
                                                  //--- make the network predict the result
                                                  myNet.feedForward_Net(Training_inputVals_Matrix[index], "OnTraining");
                                                  //******************************************************************************
                                                  //--- check compatibility of target values and number of output neurons
                                                  //--- target values must be equal to the number of output neurons
                                                  if(Training_targetVals_Matrix[index].Total() != topology.At(topology.Total() - 1)) { Print("Incompatible targetVals", "  Training_targetVals_Matrix[", index, "].Total():", (string)Training_targetVals_Matrix[index].Total(), "  topology.At(topology.Total() - 1):", (string)topology.At(topology.Total() - 1)); break; }
                                                  //******************************************************************************
                                                  //--- make the network learn
                                                  myNet.backProp_Net(Training_targetVals_Matrix[index]);
                                                  //******************************************************************************
                                                  uint indexrms = ArraySize(rms_ErrorLine);
                                                  ArrayResize(rms_ErrorLine, indexrms + 1);
                                                  //rms_ErrorLine[index][indexrms] = myNet.getRecentAverageError();
                                                  rms_ErrorLine[indexrms] = myNet.getRecentAverageError(); //Print("myNet.getRecentAverageError():", (string)myNet.getRecentAverageError()); //
                                                  //Print("-------------epochs:", (string)epochs, "  ", "j:", (string)j,"   myNet.getRecentAverageError(): ",DoubleToStr(myNet.getRecentAverageError(),2)); // Sleep(3000);
                                                  //******************************************************************************
                                                  myNet.getResults(Training_resultVals_Matrix[index]); //
                                                  //******************************************************************************
                                                  if(IsMSE && 1)
                                                  {         MSE_Curr_Cheack = calculateMSE_Sample(Training_targetVals_Matrix, Training_resultVals_Matrix, "OnTraining");
                                                            //Print("epochs:j  ", epochs, ":", j, "  MSE_Curr_Cheack:", MSE_Curr_Cheack); ///.
                                                            if(IsMSEBreake > MSE_Curr_Cheack) {break;};
                                                            if(MSE_Prev_Cheack == MSE_Curr_Cheack && MSE_Curr_Cheack < 2.1000) {break;};
                                                            (MSE_Curr_Cheack < 0.1000) ? epochs -= 3 : epochs += 3 ;  //------200000000.1000 Effect: matched>> //
                                                            MSE_Prev_Cheack = MSE_Curr_Cheack;
                                                            if(0)Print("epochs:", (string)epochs, "  ", "j:", (string)j, "  ", "MSE_Curr_Cheack:", (string)MSE_Curr_Cheack);
                                                            //if(IsMSE)(MSE_Curr_Cheack < 200000000.1000) ? epochs -= 3 : epochs += 3 ;//------200000000.1000 Effect: matched>> //
                                                            //--best out--2023.10.21 17:20:11.041   QUARTS_AF1 XAUUSD,M1: epochs:136  MSE_Curr_Cheack:4090.061513722014
                                                            //if(MSE_Curr_Cheack < 20000.1000) ? myNet.m_layer[0].m_data[i].LearningRate=0
                                                            //if(IsMSE)(MSE_Curr_Cheack < 0.0010) ? epochs -= 3 : epochs += 3 ;//------off Effect:not matched>> //
                                                  }
                                                  //******************************************************************************
                                                  CurrTime = TimeLocal();
                                                  //Print("epochs:", (string)epochs, "  ", "j:", (string)j, "  ", (string)((double)(CurrTime - InitTime)), "  ", (datetime)InitTime, "  ", (datetime)CurrTime); //
                                                  //******************************************************************************
                                        }//
                              }//
                    }//
          }
          if( Save(NetworkSaveLoad)) {}
//********************************************************* Start [Training] feedForward_Net *********************************************************
          if(1)
          {         fillInputsTraining(Training_inputVals_Matrix, Training_targetVals_Matrix);
                    for(int i = 0; i < ArraySize(Training_inputVals_Matrix); i++)
                    {         myNet.feedForward_Net(Training_inputVals_Matrix[i], "OnTraining");
                              myNet.getResults(Training_resultVals_Matrix[i]); //
                    }//
          }
          if(IsMine)//mine time based
          {         int scaler = 0; int nameCounterSampleInput = 0; int nameCounterSampleOutput = 0; int nameCounterSampleTarget = 0;
                    for(int i = 0; i < ArraySize(Training_inputVals_Matrix); i++)//sample based
                    {         int nameCounterElementInput = 0; int nameCounterElementOutPut = 0; int nameCounterElementTarget = 0;  ++nameCounterSampleInput; ++nameCounterSampleOutput; ++nameCounterSampleTarget;
                              //Print("Validation_inputVals_Matrix[i].Total():", Validation_inputVals_Matrix[i].Total());
                              for(int j = 0; j < DataElementInp; j += DataElementInpSeries) //ArraySize(Training_resultVals_Matrix)-1
                              {         datetime time = (datetime)Training_inputVals_Matrix[i].At(5 + j);
                                        //time = iTime(_Symbol, PeriodWork, DataElementsPack + 100 + (i * DataElementsPack) + (i * DataPartsGap) - j);
                                        string nameInput =  "Fit Point.NN-Training-Input:" + (string)(nameCounterSampleInput) + ":" + (string)(++nameCounterElementInput) + "  " + string(Training_inputVals_Matrix[i].Total());
                                        ObjectDelete(0,         nameInput);
                                        ObjectCreate(0,         nameInput, OBJ_TEXT, 0, (datetime)time, Training_inputVals_Matrix[i].At(j)); //
                                        ObjectSetString(0,      nameInput, OBJPROP_TEXT, "*");
                                        ObjectSetString(0,      nameInput, OBJPROP_FONT, "Arial");
                                        ObjectSetInteger(0,     nameInput, OBJPROP_FONTSIZE, 14);
                                        ObjectSetDouble(0,      nameInput, OBJPROP_ANGLE, 0);
                                        ObjectSetInteger(0,     nameInput, OBJPROP_ANCHOR, 0);
                                        ObjectSetInteger(0,     nameInput, OBJPROP_COLOR, clrRed); //
                                        //Print(Validation_inputVals_Matrix[i].At(0 + scaler));//
                                        scaler += 6; //
                              }
                              for(int j = 0; j < DataElementInp; j += DataElementInpSeries)
                              {         //-----------------------------------------------------------
                                        datetime time = (datetime)Training_targetVals_Matrix[i].At(5 + j);
                                        //time = iTime(_Symbol, PeriodWork, DataElementsPack + (i * DataElementsPack) + (i * DataPartsGap) - j);
                                        string nameResult =  "Fit Point.NN-Training-Target:" + (string)(nameCounterSampleTarget) + ":" + (string)(++nameCounterElementTarget) + "  " + string(Training_resultVals_Matrix[i].Total());
                                        ObjectDelete(0,         nameResult);
                                        ObjectCreate(0,         nameResult, OBJ_TEXT, 0, (datetime)time, Training_targetVals_Matrix[i].At(j) + 10); //
                                        ObjectSetString(0,      nameResult, OBJPROP_TEXT, "*");
                                        ObjectSetString(0,      nameResult, OBJPROP_FONT, "Arial");
                                        ObjectSetInteger(0,     nameResult, OBJPROP_FONTSIZE, 14);
                                        ObjectSetDouble(0,      nameResult, OBJPROP_ANGLE, 0);
                                        ObjectSetInteger(0,     nameResult, OBJPROP_ANCHOR, 0);
                                        ObjectSetInteger(0,     nameResult, OBJPROP_COLOR, clrMaroon); //
                              }//
                              for(int j = 0; j < DataElementOut; j += DataElementInpSeries)
                              {         //-----------------------------------------------------------
                                        datetime time = (datetime)Training_resultVals_Matrix[i].At(5 + j);
                                        //time = iTime(_Symbol, PeriodWork, DataElementsPack + (i * DataElementsPack) + (i * DataPartsGap) - j);
                                        //time = iTime(_Symbol, PeriodWork, DataElementsPack + (i * DataElementsPack) + (i * DataPartsGap) - j) + PeriodSeconds(PeriodWork) * j;
                                        string nameResult =  "Fit Point.NN-Training-Result:" + (string)(nameCounterSampleOutput) + ":" + (string)(++nameCounterElementOutPut) + "  " + string(Training_resultVals_Matrix[i].Total());
                                        ObjectDelete(0,         nameResult);
                                        ObjectCreate(0,         nameResult, OBJ_TEXT, 0, (datetime)time, Training_resultVals_Matrix[i].At(j) + 2); //+ 15
                                        ObjectSetString(0,      nameResult, OBJPROP_TEXT, "*");
                                        ObjectSetString(0,      nameResult, OBJPROP_FONT, "Arial");
                                        ObjectSetInteger(0,     nameResult, OBJPROP_FONTSIZE, 14);
                                        ObjectSetDouble(0,      nameResult, OBJPROP_ANGLE, 0);
                                        ObjectSetInteger(0,     nameResult, OBJPROP_ANCHOR, 0);
                                        ObjectSetInteger(0,     nameResult, OBJPROP_COLOR, clrOrange); //
                              }//
                    }//
          }//
          if(0)          //--- create training data and check compatibility with the network
          {         //--- number of inputs MUST be equal to number of input neurons in your network
                    fillInputsValidation(Validation_inputVals_Matrix, Validation_targetVals_Matrix);
                    //********************************************************* Start [Triaining] *********************************************************
                    {         //double        rms_ErrorLine[DataSamples][];   //---save netErrors every epoche reserve epochs count
                              double        rms_ErrorLine[DataSamples];
                              uint          epochs = Trainingepochs;          //--any cycle//700-300fixed targets
                              ArrayResize(rms_ErrorLine, 0, (int)epochs);
                              for(int i = 0; i < ArraySize(Validation_inputVals_Matrix); i++)
                              {         uint index = MathRand() % DataSamples;  //??---------------evey epoch provided one set of four set----------------------------
                                        index = i;
                                        //******************************************************************************
                                        double MSE_Curr_Cheack = 0; double MSE_Prev_Cheack = 0;
                                        InitTime = TimeLocal();
                                        for(uint j = 0;  j < epochs ; j++)//(j < epochs*100000) &&( (CurrTime - InitTime) < RunTimeLimit )
                                        {         if(Validation_inputVals_Matrix[index].Total() != topology.At(0)) { Print("Incompatible inputs!"); break; }
                                                  //******************************************************************************
                                                  //--- make the network predict the result
                                                  myNet.feedForward_Net(Validation_inputVals_Matrix[index], "ValidationOnTraining");
                                                  //******************************************************************************
                                                  //--- check compatibility of target values and number of output neurons
                                                  //--- target values must be equal to the number of output neurons
                                                  if(Validation_targetVals_Matrix[index].Total() != topology.At(topology.Total() - 1)) { Print("Incompatible targetVals"); break; }
                                                  //******************************************************************************
                                                  //--- make the network learn
                                                  myNet.backProp_Net(Validation_targetVals_Matrix[index]);
                                                  //******************************************************************************
                                                  uint indexrms = ArraySize(rms_ErrorLine);
                                                  ArrayResize(rms_ErrorLine, indexrms + 1);
                                                  //rms_ErrorLine[index][indexrms] = myNet.getRecentAverageError();
                                                  rms_ErrorLine[indexrms] = myNet.getRecentAverageError(); //Print("myNet.getRecentAverageError():", (string)myNet.getRecentAverageError()); //
                                                  //******************************************************************************
                                                  myNet.getResults(Validation_resultVals_Matrix[index]); //
                                                  //******************************************************************************
                                                  if(IsMSE && 1)
                                                  {         MSE_Curr_Cheack = calculateMSE_Sample(Validation_targetVals_Matrix, Validation_resultVals_Matrix, "OnValidationTraining");
                                                            //Print("epochs:j  ", epochs, ":", j, "  MSE_Curr_Cheack:", MSE_Curr_Cheack); ///.
                                                            if(IsMSEBreake > MSE_Curr_Cheack) {break;};
                                                            if(MSE_Prev_Cheack == MSE_Curr_Cheack && MSE_Curr_Cheack < 2.1000) {break;};
                                                            (MSE_Curr_Cheack < 2.1000) ? epochs -= 30 : epochs += 1 ;  //------200000000.1000 Effect: matched>> //
                                                            MSE_Prev_Cheack = MSE_Curr_Cheack;
                                                            if(0)Print("epochs:", (string)epochs, "  ", "j:", (string)j, "  ", "MSE_Curr_Cheack:", (string)MSE_Curr_Cheack);
                                                            //if(IsMSE)(MSE_Curr_Cheack < 200000000.1000) ? epochs -= 3 : epochs += 3 ;//------200000000.1000 Effect: matched>> //
                                                            //--best out--2023.10.21 17:20:11.041   QUARTS_AF1 XAUUSD,M1: epochs:136  MSE_Curr_Cheack:4090.061513722014
                                                            //if(MSE_Curr_Cheack < 20000.1000) ? myNet.m_layer[0].m_data[i].LearningRate=0
                                                            //if(IsMSE)(MSE_Curr_Cheack < 0.0010) ? epochs -= 3 : epochs += 3 ;//------off Effect:not matched>> //
                                                  }
                                                  //******************************************************************************
                                                  CurrTime = TimeLocal();
                                                  //Print("epochs:", (string)epochs, "  ", "j:", (string)j, "  ", (string)((double)(CurrTime - InitTime)), "  ", (datetime)InitTime, "  ", (datetime)CurrTime); //
                                                  //******************************************************************************
                                        }//
                              }//
                    }//
          }
//********************************************************* Start [Validation] feedForward_Net *********************************************************
          if(0)
          {         fillInputsValidation(Validation_inputVals_Matrix, Validation_targetVals_Matrix);
                    for(int i = 0; i < DataSamples; i++)
                    {         myNet.feedForward_Net(Validation_inputVals_Matrix[i], "OnValidationCheak");
                              myNet.getResults(Validation_resultVals_Matrix[i]); //
                              Validation_resultVals_MatrixFinal[i].Add(Validation_resultVals_Matrix[i].At(0)); //
                    }
                    //********************************************************* Start Validation Show *********************************************************Validation_inputVals_Matrix[i].At(5 + scaler)
                    if(IsMine)//mine time based
                    {         int scaler = 0; int nameCounterSampleInput = 0; int nameCounterSampleOutput = 0; int nameCounterSampleTarget = 0;
                              for(int i = 0; i < ArraySize(Validation_inputVals_Matrix); i++)//sample based
                              {         int nameCounterElementInput = 0; int nameCounterElementOutPut = 0; int nameCounterElementTarget = 0; ++nameCounterSampleInput; ++nameCounterSampleOutput; ++nameCounterSampleTarget;
                                        //Print("Validation_inputVals_Matrix[i].Total():", Validation_inputVals_Matrix[i].Total());
                                        for(int j = 0; j < DataElementInp; j += DataElementInpSeries) //ArraySize(Training_resultVals_Matrix)-1
                                        {         datetime time = (datetime)Validation_inputVals_Matrix[i].At(5 + j);
                                                  //time = iTime(_Symbol, PeriodWork, ValidationRangeStartLR + 100 + (i * DataElementsPack) + (i * DataPartsGap) - j);
                                                  string nameInput =  "Fit Point.NN-Validation-Input:" + (string)(nameCounterSampleInput) + ":" + (string)(++nameCounterElementInput) + "  " + string(Validation_inputVals_Matrix[i].Total());
                                                  ObjectDelete(0,         nameInput);
                                                  ObjectCreate(0,         nameInput, OBJ_TEXT, 0, (datetime)time, Validation_inputVals_Matrix[i].At(j) - 16); //
                                                  ObjectSetString(0,      nameInput, OBJPROP_TEXT, "*");
                                                  ObjectSetString(0,      nameInput, OBJPROP_FONT, "Arial");
                                                  ObjectSetInteger(0,     nameInput, OBJPROP_FONTSIZE, 14);
                                                  ObjectSetDouble(0,      nameInput, OBJPROP_ANGLE, 0);
                                                  ObjectSetInteger(0,     nameInput, OBJPROP_ANCHOR, 0);
                                                  ObjectSetInteger(0,     nameInput, OBJPROP_COLOR, clrRoyalBlue); //
                                                  //Print(Validation_inputVals_Matrix[i].At(0 + scaler));//
                                                  scaler += 6; //
                                        }
                                        for(int j = 0; j < DataElementInp; j += DataElementInpSeries)
                                        {         //-----------------------------------------------------------
                                                  datetime time = (datetime)Validation_targetVals_Matrix[i].At(5 + j);
                                                  //time = iTime(_Symbol, PeriodWork, ValidationRangeStartLR + 0 + (i * DataElementsPack) + (i * DataPartsGap) - j);
                                                  string nameResult =  "Fit Point.NN-Validation-Target:" + (string)(nameCounterSampleTarget) + ":" + (string)(++nameCounterElementTarget) + "  " + string(Validation_targetVals_Matrix[i].Total());
                                                  ObjectDelete(0,         nameResult);
                                                  ObjectCreate(0,         nameResult, OBJ_TEXT, 0, (datetime)time, Validation_targetVals_Matrix[i].At(j) - 20); //
                                                  ObjectSetString(0,      nameResult, OBJPROP_TEXT, "*");
                                                  ObjectSetString(0,      nameResult, OBJPROP_FONT, "Arial");
                                                  ObjectSetInteger(0,     nameResult, OBJPROP_FONTSIZE, 14);
                                                  ObjectSetDouble(0,      nameResult, OBJPROP_ANGLE, 0);
                                                  ObjectSetInteger(0,     nameResult, OBJPROP_ANCHOR, 0);
                                                  ObjectSetInteger(0,     nameResult, OBJPROP_COLOR, clrSlateBlue); //
                                        }//
                                        for(int j = 0; j < DataElementInp; j += DataElementInpSeries)
                                        {         //-----------------------------------------------------------
                                                  datetime time = (datetime)Validation_resultVals_Matrix[i].At(5 + j);
                                                  //time = iTime(_Symbol, PeriodWork, ValidationRangeStartLR + 0 + (i * DataElementsPack) + (i * DataPartsGap) - j);
                                                  //time = Validation_inputVals_Matrix[i].At(j); //
                                                  string nameResult =  "Fit Point.NN-Validation-Result:" + (string)(nameCounterSampleOutput) + ":" + (string)(++nameCounterElementOutPut) + "  " + string(Validation_resultVals_Matrix[i].Total());
                                                  ObjectDelete(0,         nameResult);
                                                  ObjectCreate(0,         nameResult, OBJ_TEXT, 0, (datetime)time, Validation_resultVals_Matrix[i].At(j) - 24); //
                                                  ObjectSetString(0,      nameResult, OBJPROP_TEXT, "*");
                                                  ObjectSetString(0,      nameResult, OBJPROP_FONT, "Arial");
                                                  ObjectSetInteger(0,     nameResult, OBJPROP_FONTSIZE, 14);
                                                  ObjectSetDouble(0,      nameResult, OBJPROP_ANGLE, 0);
                                                  ObjectSetInteger(0,     nameResult, OBJPROP_ANCHOR, 0);
                                                  ObjectSetInteger(0,     nameResult, OBJPROP_COLOR, clrDeepSkyBlue); //
                                        }//
                              }//
                    }//
          }
//********************************************************* Start [Perdiction] feedForward_Net*********************************************************
          {         if(0)
                    {         for(int i = 0; i < ArraySize(Perdiction_resultVals_MatrixFinalFeed); i++)
                              {         Perdiction_resultVals_MatrixFinalFeed[i].Clear(); Perdiction_resultVals_MatrixFinalFeed[i].Add(-2.0); }
                              Print("Perdiction: Perdiction_resultVals_MatrixFinalFeed[0].At(0):", Perdiction_resultVals_MatrixFinalFeed[0].At(0)); Sleep(2000); //
                              fillInputsPerdiction3(Perdiction_inputVals_Matrix, Perdiction_resultVals_MatrixFinalFeed, 0);
                              for(int i = 0; i < ArraySize(Perdiction_resultVals_Matrix); i++)
                              {         for(int j = 0; j < WantedPerdicateRange; j++)
                                        {         //if(i > 0)
                                                  //--- training complete. Get prediction of unseen data and plot
                                                  fillInputsPerdiction3(Perdiction_inputVals_Matrix, Perdiction_resultVals_MatrixFinalFeed, 0);
                                                  Perdiction_resultVals_MatrixFinalFeed[i].Clear();
                                                  myNet.feedForward_Net(Perdiction_inputVals_Matrix[i], "OnPerdictionCheak: J: " + (string)j + ":  i:" + (string)i);
                                                  myNet.getResults(Perdiction_resultVals_Matrix[i]); //
                                                  for(int n = 0; n < DataElementInp; n++)
                                                  {         Perdiction_resultVals_MatrixFinalFeed[i].Add(Perdiction_resultVals_Matrix[i].At(n)); //
                                                  }//
                                                  for(int k = 0; k < DataElementInp; k += 6)
                                                  {         if(0)
                                                            {         Print("DataElementInp:", DataElementInp, " k:", k, " j:", j,
                                                                            "  Time: ", (datetime)Perdiction_resultVals_Matrix[i].At(5 + k), "  Close: ", Perdiction_resultVals_Matrix[i].At(k),
                                                                            "  Time: ", (datetime)Perdiction_inputVals_Matrix[i].At(5 + k), "  Close: ", Perdiction_inputVals_Matrix[i].At(k)
                                                                           ); //
                                                                      Sleep(600); //
                                                            } //
                                                  } //
                                                  //Print("--------"); Sleep(2000); //
                                        }//
                              } //
                    }//
                    fillInputsPerdiction(Perdiction_inputVals_Matrix);
                    for(int i = 0; i < DataSamples; i++)
                    {         myNet.feedForward_Net(Perdiction_inputVals_Matrix[i], "OnValidationCheak");
                              myNet.getResults(Validation_resultVals_Matrix[i]); //
                    }
                    //********************************************************* Start Perdiction Show *********************************************************
                    if(0)
                    {         int nameCounterSampleOutput = 0;
                              for(int i = 0; i < ArraySize(Validation_resultVals_Matrix); i++)
                              {         int nameCounterElementOutPut = 0; ++nameCounterSampleOutput;
                                        for(int j = 0; j < DataElementInp ; j += DataElementInpSeries) //ArraySize(Training_resultVals_Matrix)-1
                                        {         datetime time = (datetime)Validation_resultVals_Matrix[i].At(5 + j);
                                                  //time = iTime(_Symbol, PeriodWork, DataElementsPack + (i * DataElementsPack) + (i * DataPartsGap) - j);
                                                  string name = "Fit Point.NN-Perdiction" + (string)(nameCounterSampleOutput) + ":" + (string)(++nameCounterElementOutPut) + "  " + string(Validation_resultVals_Matrix[i].Total());
                                                  ObjectDelete(0,         name );
                                                  ObjectCreate(0,         name, OBJ_TEXT, 0, iTime(_Symbol, PeriodWork, j - DataElementInp) + PeriodSeconds(PeriodWork) * (j - 0), Perdiction_resultVals_Matrix[0].At(j - DataElementInp));
                                                  ObjectCreate(0,         name, OBJ_TEXT, 0, (datetime)time, Validation_resultVals_Matrix[i].At(j) - 30); //iTime(_Symbol, PeriodWork, 0) + PeriodSeconds(PeriodWork) * (j - DataElementInp)
                                                  ObjectSetString(0,      name, OBJPROP_TEXT, "*");
                                                  ObjectSetString(0,      name, OBJPROP_FONT, "Arial");
                                                  ObjectSetInteger(0,     name, OBJPROP_FONTSIZE, 14);
                                                  ObjectSetDouble(0,      name, OBJPROP_ANGLE, 0);
                                                  ObjectSetInteger(0,     name, OBJPROP_ANCHOR, 0);
                                                  ObjectSetInteger(0,     name, OBJPROP_COLOR, clrWhite);  //
                                        }//
                              }//
                    }//
          }
//--- print results
          if(0)
          {         double inp[];
                    ArrayResize(inp, Training_inputVals_Matrix[0].Total());
                    for(int i = 0; i < Training_inputVals_Matrix[0].Total() && !IsStopped(); ++i) inp[i] = Training_inputVals_Matrix[0].At(i);//
          }
//---
//Print("\nInputs : ");ArrayPrint(inp);
//---ACCURANCY VALIDATION
          {         double expected = 0;
                    double predicted = 0;
                    double error = 0;
                    double allresult = 0;
                    for(int i = 0; i < ArraySize(Validation_resultVals_Matrix); i++)
                    {         for(int k = 0; k < Validation_resultVals_Matrix[i].Total(); k++)
                              {         //--- check availability of results
                                        //Print("Result : ", DoubleToString(Training_resultVals_Matrix[0].At(0), 4));
                                        //Print("Expected : ", DoubleToString(Training_resultVals_Matrix[0].At(0), 4));
                                        //--- check accuracy
                                        expected = Validation_targetVals_Matrix[i].At(k);
                                        predicted = Validation_resultVals_Matrix[i].At(k);
                                        //---
                                        error += MathAbs(predicted - expected);//
                              }//
                    }//
                    error = error / (DataSamples * DataElementInp);
                    double accuracy = 100.0 - (((error) / (1 + 1)) * 100);//
                    double mse = calculateMSE_Sample(Validation_targetVals_Matrix, Validation_resultVals_Matrix, "OnValidation");
                    Print("Validation_Accuracy : ", DoubleToString(accuracy, 2) + "%", "  Validation_MSE:", DoubleToStr(mse, 7)); //
                    //Print("Result       : ", TimeToStr(Training_resultVals_Matrix[0].At(0)), "  ", "Result2      : ", DoubleToStr(Training_resultVals_Matrix[0].At(1), 2));
                    //Print("Expected : ", TimeToStr(Training_targetVals_Matrix[0].At(0)), "  ", "Expected2 : ", DoubleToStr(Training_targetVals_Matrix[0].At(1), 2));        //
                    Print( "Validation_OneNeuronResult2      : ", DoubleToStr(Validation_resultVals_Matrix[0].At(0), 2));
                    Print( "Validation_OneNeuronExpected2 : ", DoubleToStr(Validation_targetVals_Matrix[0].At(0), 2));        //
                    //
          }
//********************************************************* Validation Show *********************************************************
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double returnValue(uint x, uint j, uint u)
{         if(x == 0) return (double)iTime(      _Symbol, PeriodWork,  j + DataElementInp * u); //
          if(x == 1) return (double)iClose(     _Symbol, PeriodWork,  j + DataElementInp * u); //
          if(x == 2) return (double)iVolume(    _Symbol, PeriodWork,  j + DataElementInp * u); //
          if(x == 3) return (double)iLow(       _Symbol, PeriodWork,  j + DataElementInp * u); //
          if(x == 4) return (double)iHigh(      _Symbol, PeriodWork,  j + DataElementInp * u); //
          if(x == 5) return (double)iOpen(      _Symbol, PeriodWork,  j + DataElementInp * u); //
          return 0;//
}
//+------------------------------------------------------------------+if(MathRand() % 2 == 0)
//|  generate training data and feed into input arrays               |MathRand() % inp_index_StartTo0  ///over training
//+------------------------------------------------------------------+
void NN_Neurons_Matrix_Run769::fillInputsTraining(CArrayDouble_MQL4 &inp[], CArrayDouble_MQL4 &tar[])
{         //******************************************** Input Elements *********************************************************DataSamples * DataElementInp % k==0  uint indexSeries = k * DataElementInp;
          const uint inp_index_StartTo0 = DataElementsPack + 100 ; //yesterday     //+ MathRand() % DataElementsPack///--depended where series start...to plot validation
          const uint tar_index_StartTo0 = inp_index_StartTo0 - 100; //today     - 99//inp_index_StartTo0 - MathRand() % inp_index_StartTo0 not work
//-------------------------------------------------
          int idxD = 0;//arrayneded
//input
          uint inp_index_StartTo0A = 0;
          for(int i = 0; i < ArraySize(inp); i++)
          {         //inp_index_StartTo0A = (inp_index_StartTo0 * i) + inp_index_StartTo0 + (i * DataPartsGap);
                    inp_index_StartTo0A = inp_index_StartTo0 + (i * DataElementsPack) + (i * DataPartsGap);
                    inp[i].Clear();
                    for(int k = 0; k < (DataElementInp / DataElementInpSeries); k++)
                    {         uint  idxc = inp_index_StartTo0A; // MathRand() % inp_index_StartTo0; idxD = idxc;
                              inp[i].Add(((double)iClose(        _Symbol, PeriodWork,  idxc))); //
                              inp[i].Add(((double)iVolume(       _Symbol, PeriodWork,  idxc))); //
                              inp[i].Add(((double)iOpen(         _Symbol, PeriodWork,  idxc))); //
                              inp[i].Add(((double)iHigh(         _Symbol, PeriodWork,  idxc))); //
                              inp[i].Add(((double)iLow(          _Symbol, PeriodWork,  idxc))); //
                              inp[i].Add(((double)iTime(         _Symbol, PeriodWork,  idxc))); //
                              inp_index_StartTo0A--;//
                    } //
          }
//target
          uint tar_index_StartTo0A = 0;
          for(int i = 0; i < ArraySize(tar); i++)
          {         //tar_index_StartTo0A = (tar_index_StartTo0 * i) + tar_index_StartTo0 + (i * DataPartsGap);
                    tar_index_StartTo0A = tar_index_StartTo0 + (i * DataElementsPack) + (i * DataPartsGap);
                    tar[i].Clear();
                    for(int k = 0; k < (DataElementOut / DataElementInpSeries); k++)
                    {         uint idxc = tar_index_StartTo0A; // MathRand() % tar_index_StartTo0;
                              if(1)
                              {         uint idxcS = tar_index_StartTo0 + (i * DataElementsPack) + (i * DataPartsGap);;
                                        if(k >= (DataElementInp / DataElementInpSeries))
                                        {         tar[i].Add(0); //
                                                  tar[i].Add(0); //
                                                  tar[i].Add(0); //
                                                  tar[i].Add(0); //
                                                  tar[i].Add(0); //
                                                  tar[i].Add((double)iTime(         _Symbol, PeriodWork,  0) + PeriodSeconds()*k); //
                                                  idxcS--; }
                                        else
                                        {         tar[i].Add((double)iClose(        _Symbol, PeriodWork,  idxc)); //
                                                  tar[i].Add((double)iVolume(       _Symbol, PeriodWork,  idxc)); //
                                                  tar[i].Add((double)iOpen(         _Symbol, PeriodWork,  idxc)); //
                                                  tar[i].Add((double)iHigh(         _Symbol, PeriodWork,  idxc)); //
                                                  tar[i].Add((double)iLow(          _Symbol, PeriodWork,  idxc)); //
                                                  tar[i].Add((double)iTime(         _Symbol, PeriodWork,  idxc)); //
                                        }//
                              }
                              tar_index_StartTo0A--; //
                    }//
          } //
//Print("tar.Total(): ",tar[0].Total(),"   ","inp.Total(): ",inp[0].Total()); Sleep(5000);//
//---
          return; //
}
//+------------------------------------------------------------------++ PeriodSeconds(PeriodWork) * 100
//|  generate Validating data and feed into input arrays             |+ PeriodSeconds(PeriodWork) * 300)
//+------------------------------------------------------------------++ PeriodSeconds(PeriodWork) * 10
void NN_Neurons_Matrix_Run769::fillInputsValidation(CArrayDouble_MQL4 &inp[], CArrayDouble_MQL4 &tar[])
{         //******************************************** Validation Input Elements *********************************************************
//--- if we are here, unseen data is needed [1,1,0] answer [1] trained network
          const uint inp_index_StartTo0 = ValidationRangeStartLR + 100; //yesterday
          const uint tar_index_StartTo0 = inp_index_StartTo0 - 100; //today
//-------------------------------------------------
//input
          uint inp_index_StartTo0A = 0;
          for(int i = 0; i < ArraySize(inp); i++)
          {         inp_index_StartTo0A =  inp_index_StartTo0 + (i * DataElementsPack) + (i * DataPartsGap);
                    //inp_index_StartTo0A = (inp_index_StartTo0 * i) + inp_index_StartTo0 + (i * DataPartsGap);
                    //if(i == 0)inp_index_StartTo0A =  inp_index_StartTo0;
                    //else inp_index_StartTo0A =  inp_index_StartTo0 + (i * DataElementsPack) + (i * DataPartsGap);
                    //if(i == 0) inp_index_StartTo0A = (inp_index_StartTo0 * i) + inp_index_StartTo0 + (i * DataPartsGap);
                    //if(i == 1) inp_index_StartTo0A = (inp_index_StartTo0 * 0) + inp_index_StartTo0 + (0 * DataPartsGap) + (i * ValidationRangeStartLR);
                    //if(i == 2) inp_index_StartTo0A = (inp_index_StartTo0 * 0) + inp_index_StartTo0 + (i * ValidationRangeStartLR);
                    //if(i == 0)inp_index_StartTo0A = (inp_index_StartTo0 * i) + inp_index_StartTo0 + (i * 10); //inp_index_StartTo0 + 0; //
                    //if(i == 1)inp_index_StartTo0A = (inp_index_StartTo0 * i) + inp_index_StartTo0 + 10;
                    //if(i == 2)inp_index_StartTo0A = (inp_index_StartTo0 * i) + inp_index_StartTo0 + 20;
                    inp[i].Clear();
                    for(int k = 0; k < (DataElementInp / DataElementInpSeries); k++)
                    {         inp[i].Add(((double)iClose(        _Symbol, PeriodWork,  inp_index_StartTo0A))); //
                              inp[i].Add(((double)iVolume(       _Symbol, PeriodWork,  inp_index_StartTo0A))); //
                              inp[i].Add(((double)iOpen(         _Symbol, PeriodWork,  inp_index_StartTo0A))); //
                              inp[i].Add(((double)iHigh(         _Symbol, PeriodWork,  inp_index_StartTo0A))); //
                              inp[i].Add(((double)iLow(          _Symbol, PeriodWork,  inp_index_StartTo0A))); //
                              inp[i].Add(((double)iTime(         _Symbol, PeriodWork,  inp_index_StartTo0A))); //
                              inp_index_StartTo0A--;//
                    } //
          }
//target
          uint tar_index_StartTo0A = 0;
          for(int i = 0; i < ArraySize(tar); i++)//target need for MSE
          {         tar_index_StartTo0A =  tar_index_StartTo0 + (i * DataElementsPack) + (i * DataPartsGap);
                    //tar_index_StartTo0A = (tar_index_StartTo0 * i) + tar_index_StartTo0 + (i * DataPartsGap);
                    //if(i == 0)tar_index_StartTo0A = (tar_index_StartTo0 * i) + tar_index_StartTo0; //tar_index_StartTo0+=tar_index_StartTo0 + 0; //
                    //if(i == 1)tar_index_StartTo0A = (tar_index_StartTo0 * i) + tar_index_StartTo0 + 10;
                    //if(i == 2)tar_index_StartTo0A = (tar_index_StartTo0 * i) + tar_index_StartTo0 + 20;
                    tar[i].Clear();
                    for(int k = 0; k < (DataElementOut / DataElementInpSeries); k++) ///!!!!big errorr cheaking it for change
                    {         tar[i].Add((double)iClose(        _Symbol, PeriodWork,  tar_index_StartTo0A)); //
                              tar[i].Add((double)iVolume(       _Symbol, PeriodWork,  tar_index_StartTo0A)); //
                              tar[i].Add((double)iOpen(         _Symbol, PeriodWork,  tar_index_StartTo0A)); //
                              tar[i].Add((double)iHigh(         _Symbol, PeriodWork,  tar_index_StartTo0A)); //
                              tar[i].Add((double)iLow(          _Symbol, PeriodWork,  tar_index_StartTo0A)); //
                              tar[i].Add((double)iTime(         _Symbol, PeriodWork,  tar_index_StartTo0A)); //
                              tar_index_StartTo0A--; //
                    }//
          } //
}
//+------------------------------------------------------------------++ PeriodSeconds(PeriodWork) * 100
//|  generate Validating data and feed into input arrays             |+ PeriodSeconds(PeriodWork) * 300)
//+------------------------------------------------------------------++ PeriodSeconds(PeriodWork) * 10
void NN_Neurons_Matrix_Run769::fillInputsPerdiction(CArrayDouble_MQL4 &inp[])
{         //******************************************** Perdiction Input Elements *********************************************************
//--- if we are here, unseen data is needed [1,1,0] answer [1] trained network
          const uint inp_index_StartTo0 = DataElementsPack; //today
//-------------------------------------------------
//input
          uint inp_index_StartTo0A = 0;
          for(int i = 0; i < ArraySize(inp); i++)
          {         inp_index_StartTo0A =  inp_index_StartTo0 + (i * DataElementsPack) + (i * DataPartsGap);
                    //inp_index_StartTo0A = (inp_index_StartTo0 * i) + inp_index_StartTo0 + (i * DataPartsGap);
                    inp[i].Clear();
                    for(int k = 0; k < (DataElementInp / DataElementInpSeries); k++)
                    {         inp[i].Add(((double)iClose(        _Symbol, PeriodWork,  inp_index_StartTo0A))); //
                              inp[i].Add(((double)iVolume(       _Symbol, PeriodWork,  inp_index_StartTo0A))); //
                              inp[i].Add(((double)iOpen(         _Symbol, PeriodWork,  inp_index_StartTo0A))); //
                              inp[i].Add(((double)iHigh(         _Symbol, PeriodWork,  inp_index_StartTo0A))); //
                              inp[i].Add(((double)iLow(          _Symbol, PeriodWork,  inp_index_StartTo0A))); //
                              inp[i].Add(((double)iTime(         _Symbol, PeriodWork,  inp_index_StartTo0A))); //
                              inp_index_StartTo0A--;//
                    } //
          }
//Print("inp[0].Total():", inp[0].Total()); //
//----------------------------------------------------------------------
}
//+------------------------------------------------------------------++ PeriodSeconds(PeriodWork) * 100
//|  generate Validating data and feed into input arrays             |+ PeriodSeconds(PeriodWork) * 300)
//+------------------------------------------------------------------++ PeriodSeconds(PeriodWork) * 10
void NN_Neurons_Matrix_Run769::fillInputsPerdiction3(CArrayDouble_MQL4 &inp[], CArrayDouble_MQL4 &finalseries[], int idx)
{         //******************************************** Input Elements *********************************************************
//--- if we are here, unseen data is needed [1,1,0] answer [1] trained network
          uint inp_index_StartTo0 = 0 ; //DataElementsPack //yesterday
//Print("fillInputsPerdiction3: finalseries.At(0):", finalseries.At(0));
          if(finalseries[idx].At(0) > 0.000)
          {         for(int k = 0; k < DataSamples; k++)
                    {         inp[k].Clear();
                              for(int j = 0; j < finalseries[k].Total(); j++)
                              {         inp[k].Add( ((double)(finalseries[k].At(j)))); } //
                              //Print("------");//
                    }//
          } //
          else
          {         //input
                    for(int i = 0; i < ArraySize(inp); i++)
                    {         inp_index_StartTo0 = 0;
                              inp[i].Clear();
                              for(int k = 0; k < (DataElementInp / DataElementInpSeries); k++)
                              {         inp[i].Add(((double)iClose(        _Symbol, PeriodWork,  inp_index_StartTo0))); //
                                        inp[i].Add(((double)iVolume(       _Symbol, PeriodWork,  inp_index_StartTo0))); //
                                        inp[i].Add(((double)iOpen(         _Symbol, PeriodWork,  inp_index_StartTo0))); //
                                        inp[i].Add(((double)iHigh(         _Symbol, PeriodWork,  inp_index_StartTo0))); //
                                        inp[i].Add(((double)iLow(          _Symbol, PeriodWork,  inp_index_StartTo0))); //
                                        inp[i].Add(((double)iTime(         _Symbol, PeriodWork,  inp_index_StartTo0))); //
                                        //
                              } //
                    }//
          } //
//Print("inp[0].Total():", inp[0].Total()); //
//----------------------------------------------------------------------
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double NN_Neurons_Matrix_Run769:: calculateMSE_Sample(const CArrayDouble_MQL4 &predicted[], const CArrayDouble_MQL4 &actual[], string s)
{         if (ArraySize(predicted) != ArraySize(actual)) {Print("NN_Neurons_Matrix_Run769:: calculateMSE_Sample-> ArraySize(predicted) != ArraySize(actual)"); return -999.999;}
          double mseall = 0;
          uint count = 0;
          for(int j = 0; j < ArraySize(predicted); j++)
          {         if (predicted[j].Total() != actual[j].Total())
                    {         // Error handling for input size mismatch
                              //throw std::runtime_error("Input vectors must have the same size.");
                              continue;
                              Print("NN_Neurons_Matrix_Run769:: calculateMSE_Sample-> not same size predicted[", (string)j, "].Total() != actual[", (string)j, "].Total()" + s); return -999.999; //
                    }
                    count++;
                    double sumSquaredDiff = 0.0;
                    for (int i = 0; i < predicted[j].Total(); ++i)
                    {         double diffError = predicted[j].At(i) - actual[j].At(i);
                              sumSquaredDiff += diffError * diffError; //
                    }
                    double mse = sumSquaredDiff / predicted[j].Total();//
                    mseall += mse; //
          }
          if(count != 0) {mseall /= count;} //ArraySize(actual);
          else {Print("NN_Neurons_Matrix_Run769:: calculateMSE_Sample count:zero ", count);}//
          return mseall; //
}
//+------------------------------------------------------------------+
//|                                                                  |_LastError, ErrorDescription(_LastError)
//+------------------------------------------------------------------+
bool NN_Neurons_Matrix_Run769:: Load(bool IsKey, CArrayInt_MQL4 &fTopology)
{         if(IsKey)
          {         int handle = -1;
                    handle = FileOpen("QuArtsRoot\\NN\\" + "NN_Neurons_Matrix_Run769.bin", FILE_READ | FILE_BIN);
                    //Cheack file not existed
                    if(INVALID_HANDLE == handle)
                    {         Print("**************************** Load: Cant Open NetWork File *************************");
                              FileClose(handle);
                              handle = FileOpen("QuArtsRoot\\NN\\" + "NN_Neurons_Matrix_Run769.bin", FILE_WRITE | FILE_READ | FILE_BIN);//
                    }
                    //Cheack file Is Empty Var
                    if(INVALID_HANDLE != handle)
                    {         if(FileSize(handle) == 0)    { myNet.IsEmptyFile = true; Print("**************************** NN_Neurons_Matrix_Run769::Load FILE_EMPTY ****************************");}
                              else                         { myNet.IsEmptyFile = false; }//
                    }
                    //Cheack file Load
                    if( 1 && myNet.IsEmptyFile == false) //IsFristTime
                    {         ResetLastError();// file must be opened with FILE_READ flag  5010
                              //Cheack file Load
                              if(!myNet.Load(handle, fTopology))
                              {         Print("**************************** Cant Load NN NET diffrent topology *************************");
                                        FileClose(handle); FileDelete("QuArtsRoot\\NN\\" + "NN_Neurons_Matrix_Run769.bin"); Sleep(1000); //
                                        return false;//
                              } //
                              else { FileClose(handle); return true; }//
                    } //
                    else
                    {         FileClose(handle); Print("**************************** Cant Load NetWork File >> myNet.IsEmptyFile == true *************************"); } //
          }
//Print("**************************** Cant Load Not Active ****************************");
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool NN_Neurons_Matrix_Run769:: Save(bool IsKey)
{         if(IsKey)
          {         ResetLastError(); int handle = FileOpen("QuArtsRoot\\NN\\" + "NN_Neurons_Matrix_Run769.bin", FILE_WRITE | FILE_BIN);
                    if(INVALID_HANDLE != handle)
                    {         //
                              if(!myNet.Save(handle))/*Worked successfuly*/
                              {         Print("**************************** Cant Save NetWork *************************");
                                        FileClose(handle); FileDelete("QuArtsRoot\\NN\\" + "NN_Neurons_Matrix_Run769.bin"); Sleep(1000); } //
                              else {return true; /*IsFristTime = 1;*/} //
                    }//
                    else
                    {         Print("**************************** Cant Save invaliade file *************************", _LastError, ErrorDescription(_LastError));
                              FileClose(handle); Sleep(1000);  } //
          }//
//Print("**************************** Cant Save Not Active ****************************");
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//Print(j, " j1:", j % 1 );; //
//Print(j, " j2:", j % 2);
//Print(j, " j3:", j % 3);
//Print(j, " j4:", j % 4);
//Print(j, " j5:", j % 5); Sleep(300);
//Print(j, " j6:", j % 6); //
//Print(j, "  ", j == (DataElementInp % 1));
//Print(j, "  ", j == (DataElementInp % 2));
//Print(j, "  ", j == (DataElementInp % 3));
//Print(j, "  ", j == (DataElementInp % 4));
//Print(j, "  ", j == (DataElementInp % 5));
//Print(j, "  ", j == (DataElementInp % 6));
//Print(j, "  ", j == (DataElementInp % 7)); Sleep(600); //

//if(j == 0)===if(j % DataElementInp == 0)
//if(j == 1)===if(j % DataElementInp == 1)
//if(j == 2)===if(j % DataElementInp == 2)
//if(j == 3)===if(j % DataElementInp == 3)
//if(j == 4)===if(j % DataElementInp == 4)
//if(j == 5)===if(j % DataElementInp == 5)
// not same as 123456--123456---need tyo set  if(j == 0)
// if(j % DataElementInp == 0) Print(j);
//if(j % DataElementInp == 1) Print(j);
//if(j % DataElementInp == 2) Print(j);
//if(j % DataElementInp == 3) Print(j);
//if(j % DataElementInp == 4) Print(j);
//if(j % DataElementInp == 5) Print(j);
//if(j % DataElementInp == 6) Print(j);
//Print("--------");
//+------------------------------------------------------------------+if(MathRand() % 2 == 0)
//|  generate training data and feed into input arrays               |
//+------------------------------------------------------------------+
void NN_Neurons_Matrix_Run769::fillInputsTraining2(CArrayDouble_MQL4 &inp[], CArrayDouble_MQL4 &target[])
{         //******************************************** Input Elements *********************************************************DataSamples * DataElementInp % k==0  uint indexSeries = k * DataElementInp;
          double inpvalSeriesX[DataSamples][DataElementInp]; ArrayInitialize(inpvalSeriesX, 0.0);
          uint indexSeries = 0;//yesterday
          uint indexSeriesB = 0;//yesterday
          indexSeries = MathRand() % 3000; //yesterdays
          indexSeries = 1; //yesterdays
          for(int k = 0; k < DataSamples; k++)
          {         for(int j = 0; j < DataElementInp; j++)
                    {         if(IsMine)//mine idea
                              {         //inpvalSeriesX[k][j] = (double)iTime(    _Symbol, PeriodWork,  indexSeries); //wrong
                                        int plus = 0;
                                        inpvalSeriesX[k][plus] = (double)iClose(    _Symbol, PeriodWork,  indexSeries); //
                                        inpvalSeriesX[k][++plus] = (double)iVolume(    _Symbol, PeriodWork,  indexSeries); //
                                        inpvalSeriesX[k][++plus] = (double)iOpen(    _Symbol, PeriodWork,  indexSeries); //
                                        inpvalSeriesX[k][++plus] = (double)iHigh(    _Symbol, PeriodWork,  indexSeries); //
                                        inpvalSeriesX[k][++plus] = (double)iLow(    _Symbol, PeriodWork,  indexSeries); //
                                        inpvalSeriesX[k][++plus] = (double)iTime(    _Symbol, PeriodWork,  indexSeries); //
                              }
                              if(!IsMine)//profesor
                              {         inpvalSeriesX[k][j] = (double)iClose(    _Symbol, PeriodWork,  indexSeriesB); //
                                        //inpvalSeriesX[k][plus] = (double)iClose(    _Symbol, PeriodWork,  indexSeries); //
                                        //inpvalSeriesX[k][++plus] = (double)iVolume(    _Symbol, PeriodWork,  indexSeries); //
                                        //inpvalSeriesX[k][++plus] = (double)iOpen(    _Symbol, PeriodWork,  indexSeries); //
                                        //inpvalSeriesX[k][++plus] = (double)iHigh(    _Symbol, PeriodWork,  indexSeries); //
                                        //inpvalSeriesX[k][++plus] = (double)iLow(    _Symbol, PeriodWork,  indexSeries); //
                                        //Print("times ", TimeToStr(iTime(    _Symbol, PeriodWork,  j + DataElementInp * k))); //
                              }
                              //
                              //for(int o = 0; o < DataElementInp; o++)
                              //{         static uint c = 0;
                              //          if(c > 5)c = 0;
                              //          inpvalSeriesX[k][j] = returnValue(c, j, u); //
                              //          c++;//
                              //}  //
                              indexSeriesB++;//
                    } //
                    indexSeries++;//
                    //Print("------");//
          }
          for(int k = 0; k < ArraySize(inp); k++)
          {         inp[k].Clear();
                    for( int j = 0; j < DataElementInp; j++)
                              inp[k].Add(inpvalSeriesX[k][j]);//
          }
//******************************************** Target Elements *********************************************************
          double tarvalSeriesX[DataSamples][DataElementOut]; ArrayInitialize(tarvalSeriesX, 0.0);//{{1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }, {1, 1, 1, 1, 1, 1, 1, 1, 1, 1 } };
          uint indexSeries2 = 0;//today
          uint indexSeriesBt = 0; //
          for(int k = 0; k < DataSamples; k++)
          {         for(int j = 0; j < DataElementOut; j++)
                    {         if(IsMine)//mine
                              {         tarvalSeriesX[k][j] = (double)iClose(    _Symbol, PeriodWork, indexSeriesBt);//
                              }
                              if(!IsMine)//profesor
                              {         if(1)//two neuron out
                                        {         int plus = 0;
                                                  //   tarvalSeriesX[k][plus] = (double)iTime(    _Symbol, PeriodWork, indexSeries2);
                                                  //    tarvalSeriesX[k][++plus] = iClose(   _Symbol, PeriodWork,  indexSeries2); //
                                                  //    tarvalSeriesX[k][++plus] = iVolume(   _Symbol, PeriodWork,  j + DataElementOut * k); //
                                        }
                                        if(1)//one neuron out
                                        {         //tarvalSeriesX[k][j] = iClose(   _Symbol, PeriodWork,  j + DataElementOut * k); //
                                                  tarvalSeriesX[k][j] = (double)iClose(    _Symbol, PeriodWork, indexSeriesBt);//
                                        } //
                              }//
                              indexSeriesBt++;//
                    } //
                    indexSeries2++;//
          }
          for(int k = 0; k < ArraySize(target); k++)
          {         target[k].Clear();
                    for(int j = 0; j < DataElementOut; j++)
                    {         target[k].Add(tarvalSeriesX[k][j]);}//
          }
//---
          return; //
}

//+------------------------------------------------------------------++ PeriodSeconds(PeriodWork) * 100
//|  generate Validating data and feed into input arrays             |+ PeriodSeconds(PeriodWork) * 300)
//+------------------------------------------------------------------++ PeriodSeconds(PeriodWork) * 10
void NN_Neurons_Matrix_Run769::fillInputsValidation2(CArrayDouble_MQL4 &inp[], CArrayDouble_MQL4 &inpMine[], CArrayDouble_MQL4 &tar[], CArrayDouble_MQL4 &finalseries[], int idx)
{         //******************************************** Validation Input Elements *********************************************************
//--- if we are here, unseen data is needed [1,1,0] answer [1] trained network
          double inpvalSeriesX[DataSamples][DataElementInp]; ArrayInitialize(inpvalSeriesX, 0.0);
          double inpvalSeriesY[DataSamples][DataElementInp]; ArrayInitialize(inpvalSeriesY, 0.0);
          uint indexSeries = ValidationRangeStartLR;//validation no need jump back//--at time frame 1m its start 100 candel !
          uint indexSeriesB = ValidationRangeStartLR;
          uint indexStartTo0 = ValidationRangeStartLR + DataSamples;
//seriesfinal
          if(finalseries[idx].At(0) > 0.000)
          {         for(int k = 0; k < DataSamples; k++)
                    {         for(int j = 0; j < DataElementInp; j++)
                              {         if(IsMine)//mine
                                        {         int plus = 0;
                                                  inpvalSeriesX[k][j] = (double)(finalseries[k].At(j));//
                                                  inpvalSeriesY[k][j] = (double)(finalseries[k].At(j));//
                                        }
                                        if(!IsMine)//profesor
                                        {         //inpvalSeriesX[k][j] = (double)(iTime(    _Symbol, PeriodWork,  j) + PeriodSeconds(PeriodWork) * indexSeries ); //has coralation!!!
                                                  inpvalSeriesX[k][j] = (double)(finalseries[k].At(j));
                                                  int plus = 0;
                                                  //if(plus)inpvalSeriesX[k][j] = (double)(finalseries[k].At(j));
                                                  //if(++plus)inpvalSeriesX[k][j] = (double)(finalseries[k].At(j));
                                                  //if(++plus)inpvalSeriesX[k][j] = (double)(finalseries[k].At(j));
                                                  //if(++plus)inpvalSeriesX[k][j] = (double)(finalseries[k].At(j));
                                                  //if(++plus)inpvalSeriesX[k][j] = (double)(finalseries[k].At(j));
                                                  //Print("times ",TimeToStr(iTime(    _Symbol, PeriodWork,  j + DataElementInp * k)));//
                                        }//
                                        indexSeriesB++;//
                              } //
                              indexSeries++; //
                              //Print("------");//
                    }//
          } //
          else//frist time
          {         for(int k = 0; k < DataSamples; k++)
                    {         if(IsMine)
                              {         int plus = 0;
                                        inpvalSeriesX[k][plus]   = (double)iClose(    _Symbol, PeriodWork,  indexSeries);
                                        inpvalSeriesX[k][++plus] = (double)iVolume(    _Symbol, PeriodWork,  indexSeries);
                                        inpvalSeriesX[k][++plus] = (double)iOpen(    _Symbol, PeriodWork,  indexSeries);
                                        inpvalSeriesX[k][++plus] = (double)iHigh(    _Symbol, PeriodWork,  indexSeries); //
                                        inpvalSeriesX[k][++plus] = (double)iLow(    _Symbol, PeriodWork,  indexSeries); //
                                        inpvalSeriesX[k][++plus] = (double)iTime(    _Symbol, PeriodWork,  indexSeries); //
                                        //
                                        int plus2 = 0; //Sleep(2000); ResetLastError();
                                        inpvalSeriesY[k][plus2]   = (double)iClose(    _Symbol, PeriodWork,  indexSeries); // Print("inpvalSeriesY[", k, "][", plus2, "]:", inpvalSeriesY[k][plus2],ErrorDescription(_LastError));ResetLastError();////
                                        inpvalSeriesY[k][++plus2] = (double)iVolume(    _Symbol, PeriodWork,  indexSeries);//Print("inpvalSeriesY[", k, "][", plus2, "]:", inpvalSeriesY[k][plus2],ErrorDescription(_LastError));ResetLastError();// //
                                        inpvalSeriesY[k][++plus2] = (double)iOpen(    _Symbol, PeriodWork,  indexSeries);  //Print("inpvalSeriesY[", k, "][", plus2, "]:", inpvalSeriesY[k][plus2],ErrorDescription(_LastError));ResetLastError();////
                                        inpvalSeriesY[k][++plus2] = (double)iHigh(    _Symbol, PeriodWork,  indexSeries);  //Print("inpvalSeriesY[", k, "][", plus2, "]:", inpvalSeriesY[k][plus2],ErrorDescription(_LastError));ResetLastError();////
                                        inpvalSeriesY[k][++plus2] = (double)iLow(    _Symbol, PeriodWork,  indexSeries);   //
                                        inpvalSeriesY[k][++plus2] = (double)iTime(    _Symbol, PeriodWork,  indexSeries);  //
                              }
                              indexSeries++;
                              for(int j = 0; j < DataElementInp; j++)
                              {         if(IsMine)//mine
                                        {         //inpvalSeriesY[k][j] = (double)iClose(    _Symbol, PeriodWork,  indexSeriesB);//
                                                  //inpvalSeriesX[k][j] = (double)iTime(    _Symbol, PeriodWork,  indexSeriesB);// //
                                                  //Print(j, "  ", j == (DataElementInp % 0));'0' - division by zero in the constant expression       NN_Neurons_Matrix_Run.mqh     449       89
                                                  //
                                        }
                                        if(!IsMine)//profesor
                                        {         inpvalSeriesX[k][j] = (double)(iClose(    _Symbol, PeriodWork,  indexSeries) ); //
                                                  //if(j % DataElementInp ==  0)inpvalSeriesX[k][j] = (double)(iClose(    _Symbol, PeriodWork,  indexSeries) ); //
                                                  //if(j % DataElementInp ==  0)inpvalSeriesX[k][j] = (double)(iVolume(    _Symbol, PeriodWork,  indexSeries) ); //
                                                  //if(j % DataElementInp ==  0)inpvalSeriesX[k][j] = (double)(iOpen(    _Symbol, PeriodWork,  indexSeries) ); //
                                                  //if(j % DataElementInp ==  0)inpvalSeriesX[k][j] = (double)(iHigh(    _Symbol, PeriodWork,  indexSeries) ); //
                                                  //if(j % DataElementInp ==  0)inpvalSeriesX[k][j] = (double)(iLow(    _Symbol, PeriodWork,  indexSeries) ); //
                                        }
                                        //Print("times ",TimeToStr(iTime(    _Symbol, PeriodWork,  j + DataElementInp * k)));//
                                        indexSeriesB++;//
                              } //
                              //Print("------");//
                    }//
          } //
          for(int k = 0; k < ArraySize(inp); k++)
          {         inp[k].Clear();
                    for(int j = 0; j < DataElementInp; j++)//count neuron equal..there is no target
                              inp[k].Add(inpvalSeriesX[k][j]);//
          }
          for(int k = 0; k < ArraySize(inpMine); k++)
          {         inpMine[k].Clear();
                    for(int j = 0; j < DataElementInp; j++)//count neuron equal..there is no target
                    {         //if(j == 0)Print("inpMine==inpvalSeriesY[", k, "][", 0, "]:", inpvalSeriesY[k][0]);
                              inpMine[k].Add(inpvalSeriesY[k][j]);//
                    }//
          }
//******************************************** Validation Target Elements *********************************************************
          double tarvalSeriesX[DataSamples][DataElementOut]; ArrayInitialize(tarvalSeriesX, 0.0);//{{1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }, {1, 1, 1, 1, 1, 1, 1, 1, 1, 1 } };
          uint indexSeries2 = ValidationRangeStartLR - 1; //today
          for(int k = 0; k < DataSamples; k++)
          {         for(int j = 0; j < DataElementOut; j++)
                    {         if(1)//two neuron out
                              {         //if(j == 0)   tarvalSeriesX[k][j] = (double)iTime(    _Symbol, PeriodWork, indexSeries2);
                                        //if(j == 1)   tarvalSeriesX[k][j] = iClose(   _Symbol, PeriodWork,  indexSeries2); //
                                        //if(j == 2)   tarvalSeriesX[k][j] = iVolume(   _Symbol, PeriodWork,  j + DataElementOut * k); //
                              }
                              if(1)//one neuron out
                              {         //tarvalSeriesX[k][j] = iClose(   _Symbol, PeriodWork,  j + DataElementOut * k); //
                                        tarvalSeriesX[k][j] = (double)iClose(    _Symbol, PeriodWork, indexSeries2);//
                              } //
                              indexSeries2++;//
                    } //
          }
          for(int k = 0; k < ArraySize(tar); k++)
          {         tar[k].Clear();
                    for(int j = 0; j < DataElementOut; j++)
                    {         tar[k].Add(tarvalSeriesX[k][j]);}//
          }
//
}
//+------------------------------------------------------------------++ PeriodSeconds(PeriodWork) * 100
//|  generate Validating data and feed into input arrays             |+ PeriodSeconds(PeriodWork) * 300)
//+------------------------------------------------------------------++ PeriodSeconds(PeriodWork) * 10
void NN_Neurons_Matrix_Run769::fillInputsPerdiction2(CArrayDouble_MQL4 &inp[], CArrayDouble_MQL4 &finalseries[], int idx)
{         //******************************************** Input Elements *********************************************************
//--- if we are here, unseen data is needed [1,1,0] answer [1] trained network
          double inpvalSeriesX[DataSamples][DataElementInp]; ArrayInitialize(inpvalSeriesX, 0.0);
          uint indexSeries = DataElementInp;//validation no need jump back  // -3000
//Print("fillInputsPerdiction3: finalseries.At(0):", finalseries.At(0));
//for(int g = 0; g < ArraySize(finalseries); g++)
          {         if(finalseries[idx].At(0) > 0.000)
                    {         for(int k = 0; k < DataSamples; k++)
                              {         for(int j = DataElementInp; j < 0; j--)
                                        {         inpvalSeriesX[k][j] = (double)(finalseries[k].At(j)); } //
                                        //Print("------");//
                              }//
                    } //
                    else
                    {         for(int i = 0; i < DataSamples; i++)
                              {         for(int k = 0; k < (DataElementInp / DataElementInpSeries); k++)
                                        {         //inpvalSeriesX[k][j] = (double)(iTime(    _Symbol, PeriodWork,  0) + PeriodSeconds(PeriodWork) * indexSeries); //
                                                  int plus = 0;
                                                  inpvalSeriesX[i][plus] = (double)iClose(    _Symbol, PeriodWork,  indexSeries); //
                                                  inpvalSeriesX[i][++plus] = (double)iVolume(    _Symbol, PeriodWork,  indexSeries); //
                                                  inpvalSeriesX[i][++plus] = (double)iOpen(    _Symbol, PeriodWork,  indexSeries); //
                                                  inpvalSeriesX[i][++plus] = (double)iHigh(    _Symbol, PeriodWork,  indexSeries); //
                                                  inpvalSeriesX[i][++plus] = (double)iLow(    _Symbol, PeriodWork,  indexSeries); //
                                                  inpvalSeriesX[i][++plus] = (double)iTime(    _Symbol, PeriodWork,  indexSeries); //
                                                  indexSeries--; //
                                        } //
                                        //Print("------");//
                              }//
                    }//
          }
          for(int k = 0; k < ArraySize(inp); k++)
          {         inp[k].Clear();
                    for(int j = 0; j < DataElementInp; j++)//count neuron equal..there is no target
                              inp[k].Add(inpvalSeriesX[k][j]);//
          }
//----------------------------------------------------------------------
}
/*
if(0)
                    {         for(int i = 0; i < ArraySize(Validation_resultVals_MatrixFinal); i++)
                              {         Validation_resultVals_MatrixFinal[i].Clear(); Validation_resultVals_MatrixFinal[i].Add(-2.0); }
                              fillInputsValidation2(Validation_inputVals_Matrix, Validation_inputValsMine_Matrix, Validation_targetVals_Matrix, Validation_resultVals_MatrixFinal, 0);
                              for(int i = 0; i < ArraySize(Validation_resultVals_Matrix); i++)
                              {         fillInputsValidation2(Validation_inputVals_Matrix, Validation_inputValsMine_Matrix, Validation_targetVals_Matrix, Validation_resultVals_MatrixFinal, i);
                                        //--- training complete. Get prediction of unseen data and plot
                                        myNet.feedForward_Net(Validation_inputVals_Matrix[i], "OnValidation");
                                        myNet.getResults(Validation_resultVals_Matrix[i]); //
                                        for(int n = 0; n < Validation_resultVals_Matrix[i].Total(); n++)
                                        {         Validation_resultVals_MatrixFinal[i].Add(Validation_resultVals_Matrix[i].At(n)); //
                                                  Print("Validation_resultVals_Matrix[i].At(n)", Validation_resultVals_Matrix[i].At(n)); //
                                        }//
                              }//
                    }

*/
//+------------------------------------------------------------------+
