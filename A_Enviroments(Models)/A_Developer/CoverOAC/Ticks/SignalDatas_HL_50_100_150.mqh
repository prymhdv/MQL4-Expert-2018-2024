class SignalDatas_HL_50_100_150
{
public:
          SignalDatas_HL_50_100_150(void) {};
          ~SignalDatas_HL_50_100_150(void) {};
          bool isBulish_50_0HL ;
          bool isBulish_100_50HL ;
          bool isBulish_150_100HL ;
          void       Update()
          {
                    {         int lengh = 50;
                              int         ilow            = iLowest(_Symbol, PERIOD_M5, MODE_LOW, lengh, 0);
                              int         ihigh           = iHighest(_Symbol, PERIOD_M5, MODE_HIGH, lengh, 0);
                              double      Lowest          = iLow(_Symbol, PERIOD_M5, ilow );
                              double      Highest         = iHigh(_Symbol, PERIOD_M5, ihigh);
                              isBulish_50_0HL                   = ilow > ihigh; }
                    {         int lengh = 50;
                              int         ilow            = iLowest(_Symbol, PERIOD_M5, MODE_LOW, lengh, 50);
                              int         ihigh           = iHighest(_Symbol, PERIOD_M5, MODE_HIGH, lengh, 50);
                              double      Lowest          = iLow(_Symbol, PERIOD_M5, ilow );
                              double      Highest         = iHigh(_Symbol, PERIOD_M5, ihigh);
                              isBulish_100_50HL                   = ilow > ihigh; }
                    {         int lengh = 50;
                              int         ilow            = iLowest(_Symbol, PERIOD_M5, MODE_LOW, lengh, 100);
                              int         ihigh           = iHighest(_Symbol, PERIOD_M5, MODE_HIGH, lengh, 100);
                              double      Lowest          = iLow(_Symbol, PERIOD_M5, ilow );
                              double      Highest         = iHigh(_Symbol, PERIOD_M5, ihigh);
                              isBulish_150_100HL                   = ilow > ihigh; }
                    //
          }; //
};