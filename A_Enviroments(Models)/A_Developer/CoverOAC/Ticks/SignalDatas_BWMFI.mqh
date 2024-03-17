class SignalDatas_BWMFI
{
public:
          SignalDatas_BWMFI(void) {};
          ~SignalDatas_BWMFI(void) {};
          //
          bool       ISBWMFI_Bulish;

          void       Update()
          {         ISBWMFI_Bulish = iBWMFI(_Symbol, PERIOD_M1, 0); }; //
};