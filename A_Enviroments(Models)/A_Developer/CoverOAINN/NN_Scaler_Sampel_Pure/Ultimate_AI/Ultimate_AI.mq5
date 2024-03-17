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
#include "NetComplex.mqh"
//---
sinput uint show_time = 50; // Chart display time (seconds)
//+------------------------------------------------------------------+
//|              Script main function                                |
//+------------------------------------------------------------------+
void OnStart() {
//--- create our neural network
    CArrayInt topology;
//--- add the configuration [2,2,1]
    topology.Add(3);
    topology.Add(4);
    topology.Add(1);
//--- Initialize the network with our configuration
    CNet myNet(topology, TanH, TanH);
//--- create data containers
    CArrayDouble inputVals, targetVals, resultVals;
//---
    double rms[];
    uint epochs = 1000;
    ArrayResize(rms, 0, (int)epochs);
    uint trainingPass = 0;
//--- loop and train the network
    while(trainingPass < epochs) {
        ++trainingPass;
        //--- create training data and check compatibility with the network
        //--- number of inputs MUST be equal to number of input neurons in your network
        fillInputs(inputVals, targetVals);
        if(inputVals.Total() != topology.At(0)) {
            Print("Incompatible inputs!");
            break;
        }
        //--- make the network predict the result
        myNet.feedForward(inputVals);
        //--- check compatibility of target values and number of output neurons
        //--- target values must be equal to the number of output neurons
        if(targetVals.Total() != topology.At(topology.Total() - 1)) {
            Print("Incompatible targetVals");
            break;
        }
        //--- make the network learn
        myNet.backProp(targetVals);
        //---
        uint index = ArraySize(rms);
        ArrayResize(rms, index + 1);
        rms[index] = myNet.getRecentAverageError();
    }
//--- training complete. Get prediction of unseen data and plot
    fillInputs(inputVals, targetVals, true);
    myNet.feedForward(inputVals);
//--- print results
    double inp[];
    myNet.getResults(resultVals);
//---
    ArrayResize(inp, inputVals.Total());
    for(int i = 0; i < inputVals.Total() && !IsStopped(); ++i)
        inp[i] = inputVals.At(i);
//---
    Print("\nInputs : ");
    ArrayPrint(inp);
//--- check availability of results
    Print("Result : ", DoubleToString(resultVals.At(0), 4));
    Print("Expected : ", DoubleToString(targetVals.At(0), 4));
//--- check accuracy
    double expected = targetVals.At(0);
    double predicted = resultVals.At(0);
//---
    double error = MathAbs(predicted - expected);
    double accuracy = 100.0 - ((error / (1 + 1)) * 100);
    Print("Accuracy : ", DoubleToString(accuracy, 2) + "%");
//---begin plotting procedures
    int width = (int)ChartGetInteger(0, CHART_WIDTH_IN_PIXELS);
    int height = (int)ChartGetInteger(0, CHART_HEIGHT_IN_PIXELS);
    CGraphic graphic;
    graphic.Create(0, "Graphic", 0, 0, 0, width, height);
    CCurve *netError = graphic.CurveAdd(rms, CURVE_LINES, "AveNetError");
//---
    netError.LinesWidth(1);
    graphic.CurvePlotAll();
    graphic.Update();
//---
    Sleep(show_time * 100);
    restore();
    graphic.Destroy();
}

//+------------------------------------------------------------------+
//|  generate training data and feed into input arrays               |
//+------------------------------------------------------------------+
void fillInputs(CArrayDouble &inp, CArrayDouble &target, bool unseen = false) {
//--- generate training samples
    if(!unseen) {
        if(inp.Total() == 0)
            inp.Add(0.0);
//---
        if(inp.At(0) == 0.0) {
            inp.Clear();
            inp.Add(1.0);
            inp.Add(0.0);
            inp.Add(-1.0);
            //---
            target.Clear();
            target.Add(0.0);
            //---
            return;
        } else {
            inp.Clear();
            inp.Add(0.0);
            inp.Add(1.0);
            inp.Add(1.0);
            //---
            target.Clear();
            target.Add(1.0);
            //---
            return;
        }
    }
//--- if we are here, unseen data is needed [1,1,0] answer [1]
    inp.Clear();
    inp.Add(1.0);
    inp.Add(1.0);
    inp.Add(0.0);
//---
    target.Clear();
    target.Add(1.0);
//---
    return;
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void clear() {
    ChartSetInteger(0, CHART_SHOW, false);
    ChartSetInteger(0, CHART_CONTEXT_MENU, false);
    ChartSetInteger(0, CHART_SHOW_DATE_SCALE, false);
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void restore() {
    ChartSetInteger(0, CHART_SHOW, true);
    ChartSetInteger(0, CHART_CONTEXT_MENU, true);
    ChartSetInteger(0, CHART_SHOW_DATE_SCALE, false);
}
//+------------------------------------------------------------------+
