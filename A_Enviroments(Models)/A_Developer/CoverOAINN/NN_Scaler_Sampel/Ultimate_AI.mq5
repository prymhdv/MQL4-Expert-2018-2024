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
#include "NeuralNetwork.mqh"

//+------------------------------------------------------------------+
//|              Script main function                                |
//+------------------------------------------------------------------+
void OnStart() {
//--- create our neural network
    CArrayInt topology;
//--- add the configuration [2,2,1]
    topology.Add(2);
    topology.Add(2);
    topology.Add(1);
//--- Initialize the network with our configuration
    CNet myNet(topology);
//--- create data containers
    CArrayDouble inputVals, targetVals, resultVals;
    int trainingPass = 0;
//--- temporary arrays for ease of printing
    double inputs[2], results[1];
//--- loop and train the network
    while(trainingPass < 1000) {
        ++trainingPass;
        Print("\nPass: ", trainingPass);
        //--- create training data and check compatibility with the network
        //--- number of inputs MUST be equal to number of input neurons in your network
        fillInputs(inputVals, targetVals);
        if(inputVals.Total() != topology.At(0))
            return;
        //--- add inputs to our temp array and print to console
        inputs[0] = inputVals.At(0);
        inputs[1] = inputVals.At(1);
        Print("Inputs : ");
        ArrayPrint(inputs);
        //--- make the network predict the result
        myNet.feedForward(inputVals);
        //--- get the predicted result and print to console
        myNet.getResults(resultVals);
        results[0] = resultVals.At(0);
        Print("Predicted : ");
        ArrayPrint(results);
        //---
        Print("Expected : ");
        Print(inputs[0]);
        //--- check compatibility of target values and number of output neurons
        //--- target values must be equal to the number of output neurons
        if(targetVals.Total() != topology.At(topology.Total() - 1)) {
            Print("Incompatible targetVals");
            return;
        }
        //--- make the network compute the error and print it's average
        myNet.backProp(targetVals);
        Print("Net average error: ", myNet.getRecentAverageError());
    }
//---
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void fillInputs(CArrayDouble &inp, CArrayDouble &target) {
    if(inp.Total() == 0) {
        inp.Add(1);
        inp.Add(0);
        //---
        target.Clear();
        target.Add(1);
        //---
        return;
    }
//---
    if(inp.At(0) == 1) {
        inp.Clear();
        inp.Add(0);
        inp.Add(1);
        //---
        target.Clear();
        target.Add(0);
        //---
        return;
    } else {
        inp.Clear();
        inp.Add(1);
        inp.Add(0);
        //---
        target.Clear();
        target.Add(1);
        //---
        return;
    }
//---
    Print("An error occured!");
}
//+------------------------------------------------------------------+
