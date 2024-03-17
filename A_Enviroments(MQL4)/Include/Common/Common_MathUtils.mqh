// ����� ������ ��� ��������� �������������� ��������
#property copyright "Scriptong"
#property link      "http://scriptong.myqip.ru/"
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//| ������ �� ������ �����, ��� ������?                                                                                                                                                      |
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
bool IsFirstMoreThanSecond(double first,double second,double delta)
  {
   return (first - second > delta);
  }
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//| ����� �� ��������� ��������?                                                                                                                                                             |
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
bool IsValuesEquals(double first,double second,double delta)
  {
   return (MathAbs(first - second) < delta);
  }
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//| ���������� ������ � ���������� ����������� ��������                                                                                                                                      |
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
double VolumeCast(double volume,double volumeMin,double volumeMax,double volumeStep)
  {
   if(volumeStep==0.0)
      return volumeMin;

   return (MathFloor(MathMin(MathMax(volume, volumeMin), volumeMax) / volumeStep) * volumeStep);
  }
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//| ���������� ������ � ���������� ����������� �������� ����� ��������������� ����������                                                                                                     |
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
double VolumeRound(double volume,double volumeMin,double volumeMax,double volumeStep)
  {
   if(volumeStep==0.0)
      return volumeMin;

   return (MathRound(MathMin(MathMax(volume, volumeMin), volumeMax) / volumeStep) * volumeStep);
  }
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//| ���������� �������� � �������� ������ ����                                                                                                                                               |
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
double NP(double value,double tickSize)
  {
   if(tickSize==0)
      return (0);

   return (MathRound(value / tickSize) * tickSize);
  }
//+------------------------------------------------------------------+
