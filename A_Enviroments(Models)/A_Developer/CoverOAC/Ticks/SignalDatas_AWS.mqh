class SignalDatas_AWS
{
public:
          SignalDatas_AWS(void) {};
          ~SignalDatas_AWS(void) {};
          //
          bool       IsAWSBulish_m1_3_14;
          bool       IsAWSBulishDownBuy_m1_;
          bool       IsAWSBearishUpSell_m1_;
          bool       IsAWSBulishDownBuy_m5_;
          bool       IsAWSBearishUpSell_m5_;
          bool       IsAWSBulishDownBuy_h1_;
          bool       IsAWSBearishUpSell_h1_;
          void       Update()
          {         IsAWSBulish_m1_3_14      = iAO(_Symbol, PERIOD_M1, 3) > iAO(_Symbol, PERIOD_M1, 14) ;
                    IsAWSBulishDownBuy_m1_   = iAO(_Symbol, PERIOD_M1, 0) > iAO(_Symbol, PERIOD_M1, 3) && iAO(_Symbol, PERIOD_M1, 0) < 0;
                    IsAWSBearishUpSell_m1_   = iAO(_Symbol, PERIOD_M1, 0) < iAO(_Symbol, PERIOD_M1, 3) && iAO(_Symbol, PERIOD_M1, 0) > 0;
                    IsAWSBulishDownBuy_m5_   = iAO(_Symbol, PERIOD_M5, 0) > iAO(_Symbol, PERIOD_M5, 3) && iAO(_Symbol, PERIOD_M5, 0) < 0;
                    IsAWSBearishUpSell_m5_   = iAO(_Symbol, PERIOD_M5, 0) < iAO(_Symbol, PERIOD_M5, 3) && iAO(_Symbol, PERIOD_M5, 0) > 0;
                    IsAWSBulishDownBuy_h1_   = iAO(_Symbol, PERIOD_H1, 0) > iAO(_Symbol, PERIOD_H1, 3) ;//&& iAO(_Symbol, PERIOD_H1, 0) < 0;
                    IsAWSBearishUpSell_h1_   = iAO(_Symbol, PERIOD_H1, 0) < iAO(_Symbol, PERIOD_H1, 3) ;//&& iAO(_Symbol, PERIOD_H1, 0) > 0;
          };//
};