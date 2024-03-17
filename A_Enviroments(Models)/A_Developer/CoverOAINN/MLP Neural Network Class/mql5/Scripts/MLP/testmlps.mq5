//+------------------------------------------------------------------+
//|                                                     TestMLPs.mq5 |
//+------------------------------------------------------------------+
#property copyright "Yurich"
//+------------------------------------------------------------------+
#include "class_NetMLP.mqh"
//+------------------------------------------------------------------+
// Network features: input vector and network structure notions are separated,
// i.e. input vector and network structure descriptions are not connected to each other.
// The size of the input vector can have any value within reasonable limits.
// The data should be normalized, i.e. the data should be within the range  -1 .. -1..1 or 0..1.
// Various activation functions are applied for the network depending on 
// the type of the used data: hyperbolic tangent should be used for -1..1 data range, 
// while sigmoid is used for 0..1 data range.
// Tne network structure is described by a one-dimensional array, where the value of the array element 
// determines the number of neurons in the appropriate layer. The number of layers and neurons is not limited.
// The network may consist of a single neuron.
// Each neuron has multiple inputs, defined by its place in the network
// and a single output. If you need the network to give out N responses, the last layer should 
// contain N neurons.
// The learning algorithm is iRprop.
// Input and output training data are located in one-dimensional arrays vector by vector.
// The learning process is limited either by the number of learnnig epochs or by a permissible error.
//+------------------------------------------------------------------+
double vector[2];   // Input vector
int snn[]={3,1};    // Network structure: the first layer  - 3 neurons, the second (output) one - 1 neuron
double out[1];      // The network responses array
                    // The network must learn to calculate "exclusive OR" function value
//  -----------------------------------
//    input 1  |   input 2   |  output
//  -----------------------------------
//      1           1            0
//      1           0            1
//      0           1            1
//      0           0            0
//  -----------------------------------
//--- the data for the function network teaching 
//--- two cases: for the input data range from -1 to 1
//--- and for the range from 0 to 1
double inppth[]={1,1,1,-1,-1,1,-1,-1}; // Input teaching data array
double tchth[]={-1,1,1,-1};            // Output teaching data array
//---
double inpps[]={1,1,1,0,0,1,0,0};      // Input teaching data array
double tchs[]={0,1,1,0};               // Output teaching data array
//+------------------------------------------------------------------+
void OnStart()
  {
   CNetMLP *net;
   int epoch=1000;
//---
   Print("Example for the input data range from -1 to 1");
//--- for the input data range -1..1 the active function hyperbolic tangent is used
   int AFT=1;
//--- network creation
   net=new CNetMLP(ArraySize(snn),snn,2,AFT);
//--- network teaching
//--- number of patterns, input data array, output data array, permissible error
   net.Learn(4,inppth,tchth,epoch,1.0e-8);
   Print("MSE=",net.mse,"  Epoch=",net.epoch);
//--- network checking
   for(int i=0,j=0; i<4; i++)
     {
      vector[0]=inppth[j++]; vector[1]=inppth[j++];
      net.Calculate(vector,out);
      Print("Input=",(string)vector[0],", ",(string)vector[1],
            " Output=",DoubleToString(out[0],0),
            " Checking=",(string)tchth[i]);
     }
//--- deleting network
   delete net;
//---
   Print("Example for the input data range from 0 to 1");
//--- for the input data range 0..1 the active function sigmoid is used
   AFT=0;
   net=new CNetMLP(ArraySize(snn),snn,2,AFT);
   net.Learn(4,inpps,tchs,epoch,1.0e-8);
   Print("MSE=",net.mse,"  Epoch=",net.epoch);
//--- saving network to a file and deleting network
   int h=FileOpen("test.net",FILE_BIN|FILE_WRITE);
   net.Save(h);
   FileClose(h);
   delete net;
//--- creating network again and downloading network from the file
   net=new CNetMLP(ArraySize(snn),snn,2,AFT);
   h=FileOpen("test.net",FILE_BIN|FILE_READ);
   net.Load(h);
   FileClose(h);
//--- network checking
   for(int i=0,j=0; i<4; i++)
     {
      vector[0]=inpps[j++]; vector[1]=inpps[j++];
      net.Calculate(vector,out);
      Print("Input=",(string)vector[0],", ",(string)vector[1],
            " Output=",DoubleToString(out[0],0),
            " Checking=",(string)tchs[i]);
     }
//--- deleting network
   delete net;
   FileDelete("test.net");
  }
//+------------------------------------------------------------------+
