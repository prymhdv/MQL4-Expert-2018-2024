//+------------------------------------------------------------------+
//|                                            C_CustomIndicators .mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|             Class ZigzagUsing     BEGIN-END                      |
//+------------------------------------------------------------------+
class C_CustomIndicators
{         /*
          *Custom Indicators >>This is the group functions used in the creation of custom indicators. These functions can't be used when writing Expert Advisors and Scripts.
          *
          *
          *

          Function                      Action
          HideTestIndicators            The function sets a flag hiding indicators called by the Expert Advisor                         void  HideTestIndicators( bool hide // flag );
          IndicatorSetDouble            Sets the value of an indicator property of the double type
          IndicatorSetInteger           Sets the value of an indicator property of the int type
          IndicatorSetString            Sets the value of an indicator property of the string type
          SetIndexBuffer                Binds the specified indicator buffer with one-dimensional dynamic array of the double type
          IndicatorBuffers              Allocates memory for buffers used for custom indicator calculations
          IndicatorCounted              Returns the amount of bars not changed after the indicator had been launched last
          IndicatorDigits               Sets precision format to visualize indicator values
          IndicatorShortName            Sets the "short" name of a custom indicator to be shown in the DataWindow and in the chart subwindow
          SetIndexArrow                 Sets an arrow symbol for indicators line of the DRAW_ARROW type
          SetIndexDrawBegin             Sets the bar number from which the drawing of the given indicator line must start
          SetIndexEmptyValue            Sets drawing line empty value
          SetIndexLabel                 Sets drawing line description for showing in the DataWindow and in the tooltip
          SetIndexShift                 Sets offset for the drawing line
          SetIndexStyle                 Sets the new type, style, width and color for a given indicator line
          SetLevelStyle                 Sets a new style, width and color of horizontal levels of indicator to be output in a separate window
          SetLevelValue                 Sets a value for a given horizontal level of the indicator to be output in a separate window
          *
          *
          */
private:
//===================================================================
public:
          void                   C_CustomIndicators ();
          void                  ~C_CustomIndicators () {};
          bool                   Update();
          bool                   UPDATED;
//===================================================================
          bool                   hide;
//===================================================================
          bool                   Is_IndicatorSetDouble;
          bool                   Is_IndicatorSetInteger;
          bool                   Is_IndicatorSetString;
          bool                   Is_SetIndexBuffer;
          bool                   Is_IndicatorBuffersCount;
//===================================================================
          int                    IndicatorSetInteger_prop_id;
          int                    IndicatorSetInteger_prop_value;

          int                    IndicatorSetDouble_prop_id;
          double                 IndicatorSetDouble_prop_value;

          int                    IndicatorSetString_prop_id;
          string                 IndicatorSetString_prop_value;
//===================================================================
          int                    IndexBuffer;
          double                 buffer[];
          ENUM_INDEXBUFFER_TYPE  bufferDataType; // what will be stored

//===================================================================
          int                    BufferCount;//CustomIndicatorsBufferCount
//===================================================================
          int                    INDCounted;
          int                    INDdigits;
          string                 ShortName;
//===================================================================
          int                    ArrowSymbolIndex;
          int                    ArrowSymbolCode;
//===================================================================
          int                    IndexDrawBeginIndex;  //int     index,       // line index
          int                    IndexDrawBeginBegin;  //int     begin        // position
//===================================================================
          int                    IndexEmptyValueIndex; //int     index,       // line index
          double                 IndexEmptyValueValue; //double  value        // new "empty value"
//===================================================================
          int                    IndexLabelIndex;      //int     index,       // line index
          string                 IndexLabelText;       //string  text         // text
//===================================================================
          int                    IndexIndex;           //int     index,       // line index
          int                    IndexShift;
//===================================================================
          int                    IndexStyleIndex;       //int     index,       // line index
          int                    IndexStyleType;       //int     type,        // line type
          int                    IndexStyleStyle;      //int     style=EMPTY, // line style
          int                    IndexStyleWidth;      //int     width=EMPTY, // line width
          int                    IndexStyleclr;        //color   clr=clrNONE  // line color
//===================================================================
          int                    LevelStyleDraw_Style; //int     draw_style, // drawing style
          int                    LevelStyleLine_Width; //int     line_width, // line width
          color                  LevelStyleClr;        //color   clr         // color
//===================================================================
          int                    LevelValueLevel;     //int      level,      // level
          double                 LevelValueValue;     //double   value       // value
//===================================================================
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_CustomIndicators ::C_CustomIndicators ()
{}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_CustomIndicators::Update()
{         //========================================================================================================================================================================================================
          HideTestIndicators(hide);                                                                             //The function sets a flag hiding indicators called by the Expert Advisor.                                    void    HideTestIndicators( bool hide // flag );
          IndicatorSetDouble(IndicatorSetDouble_prop_id, IndicatorSetDouble_prop_value);                       //Sets the value of an indicator property of the double type.                                                 bool    IndicatorSetDouble( int prop_id, double prop_value );
          IndicatorSetInteger(IndicatorSetInteger_prop_id, IndicatorSetInteger_prop_value);                       //Sets the value of an indicator property of the int type.                                                    bool    IndicatorSetInteger(prop_id, prop_value);
          IndicatorSetString(IndicatorSetString_prop_id, IndicatorSetString_prop_value);                        //Sets the value of an indicator property of the string type.                                                 bool    IndicatorSetString(prop_id, prop_value);
          //----------------------
          SetIndexBuffer(IndexBuffer, buffer, bufferDataType);                                                  //Binds the specified indicator buffer with one-dimensional dynamic array of the double type.                 bool    SetIndexBuffer(int index,// buffer index double buffer[], // array ENUM_INDEXBUFFER_TYPE  data_type // what will be stored    );
          IndicatorBuffers(BufferCount);                                                                        //Allocates memory for buffers used for custom indicator calculations                                         bool    IndicatorBuffers(int count // buffers );
          INDCounted = IndicatorCounted();                                                                      //Returns the amount of bars not changed after the indicator had been launched last                           int     IndicatorCounted();
          IndicatorDigits(INDdigits);                                                                           //Sets precision format to visualize indicator values                                                         void    IndicatorDigits(int digits // digits );
          IndicatorShortName(ShortName);                                                                        //Sets the "short" name of a custom indicator to be shown in the DataWindow and in the chart subwindow        void    IndicatorShortName(string name // name );
          //----------------------
          SetIndexArrow(ArrowSymbolIndex, ArrowSymbolCode);                                                     //Sets an arrow symbol for indicators line of the DRAW_ARROW type                                             void    SetIndexArrow(int index, // line index// int code // code// );
          SetIndexDrawBegin(IndexDrawBeginIndex, IndexDrawBeginBegin);                                          //Sets the bar number from which the drawing of the given indicator line must start                           void    SetIndexDrawBegin(int index, // line index// int begin // position //);
          SetIndexEmptyValue(IndexEmptyValueIndex, IndexEmptyValueValue);                                       //Sets drawing line empty value                                                                               void    SetIndexEmptyValue(int index, // line index double  value // new "empty value" );
          SetIndexLabel(IndexLabelIndex, IndexLabelText);                                                       //Sets drawing line description for showing in the DataWindow and in the tooltip                              void    SetIndexLabel(int index, // line index// string text // text //);
          SetIndexShift(IndexIndex, IndexShift);                                                                //Sets offset for the drawing line                                                                            void    SetIndexShift(int index, // line index// int shift // shift //);
          SetIndexStyle(IndexStyleIndex, IndexStyleType, IndexStyleStyle, IndexStyleWidth, IndexStyleclr);      //Sets the new type, style, width and color for a given indicator line                                        void    SetIndexStyle(int index,int type,int style=EMPTY,int width=EMPTY,color clr=clrNONE);
          SetLevelStyle(LevelStyleDraw_Style, LevelStyleLine_Width, LevelStyleClr);                             //Sets a new style, width and color of horizontal levels of indicator to be output in a separate window       void    SetLevelStyle(int draw_style,int line_width,color clr);
          SetLevelValue(LevelValueLevel, LevelValueValue);                                                      //Sets a value for a given horizontal level of the indicator to be output in a separate window                void    SetLevelValue(int level, // level double value // value );
//========================================================================================================================================================================================================
          {         SetLevelValue(1, 3.14); }
          {         HideTestIndicators(true);
                    double MaCurrent = iMA(NULL, 0, 56, 0, MODE_EMA, PRICE_CLOSE, 0);
                    double MaPrevious = iMA(NULL, 0, 56, 0, MODE_EMA, PRICE_CLOSE, 1);
                    HideTestIndicators(false);//
          }
          {         IndicatorSetDouble(IndicatorSetDouble_prop_id, IndicatorSetDouble_prop_value); //
                    /*
                    LevelValueValue
                    ENUM_CUSTOMIND_PROPERTY_INTEGER
                    ID                          Description                                                                                     Property type
                    INDICATOR_DIGITS            Accuracy of drawing of indicator values                                                         int
                    INDICATOR_HEIGHT            Fixed height of the indicator's window (the preprocessor command #property indicator_height)    int
                    INDICATOR_LEVELS            Number of levels in the indicator window                                                        int
                    INDICATOR_LEVELCOLOR        Color of the level line                                                                         color            sets color for all levels
                    INDICATOR_LEVELSTYLE        Style of the level line                                                                         ENUM_LINE_STYLE  sets style for all levels
                    INDICATOR_LEVELWIDTH        Thickness of the level line                                                                     int     sets width for all levels
                    //===================================================================
                    ENUM_CUSTOMIND_PROPERTY_DOUBLE
                    ID                          Description                                                                                     Property type
                    INDICATOR_MINIMUM           Minimum of the indicator window                                                                 double
                    INDICATOR_MAXIMUM           Maximum of the indicator window                                                                 double
                    INDICATOR_LEVELVALUE        Level value                                                                                     double    modifier = level number
                    //===================================================================
                    ENUM_CUSTOMIND_PROPERTY_STRING
                    ID                          Description                                                                                     Property type
                    INDICATOR_SHORTNAME         Short indicator name                                                                            string
                    INDICATOR_LEVELTEXT         Level description                                                                               string    modifier = level number
                    //===================================================================
                    */
          }
          {         double ExtBlueBuffer[];
                    double ExtRedBuffer[];
                    double ExtLimeBuffer[];
                    int JawsPeriod = 3; int TeethPeriod = 6; int LipsPeriod = 9;
                    int limit;
                    int counted_bars = IndicatorCounted();
                    if(counted_bars < 0) {};/*return(-1)*/; //---- check for possible errors
                    if(counted_bars > 0) {counted_bars--;} //---- the last counted bar will be recounted
                    limit = Bars - counted_bars;
                    for(int i = 0; i < limit; i++)//---- main loop
                    {         //---- ma_shift set to 0 because SetIndexShift called abowe
                              ExtBlueBuffer[i] = iMA(NULL, 0, JawsPeriod, 0, MODE_SMMA, PRICE_MEDIAN, i);
                              ExtRedBuffer[i]  = iMA(NULL, 0, TeethPeriod, 0, MODE_SMMA, PRICE_MEDIAN, i);
                              ExtLimeBuffer[i] = iMA(NULL, 0, LipsPeriod, 0, MODE_SMMA, PRICE_MEDIAN, i);//
                    }
                    /*return(0);*/  //---- done
          }
          return true;//
}
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|             Class ZigzagUsing     BEGIN-END                      |
//+------------------------------------------------------------------+
