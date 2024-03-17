//+------------------------------------------------------------------+
//|                                                   C_Volumetric.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|             Class Cgp_ElliotWavePAD     BEGIN-END                    |
//+------------------------------------------------------------------+
class C_Volumetric
{
private:
//===================================================================
public:
          void                  C_Volumetric::C_Volumetric();
          void                  C_Volumetric::~C_Volumetric() {/*if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Volumetric Error",  __LINE__, __FUNCTION__);*/ }
//===================================================================
          double                C_Volumetric::CylinderVolume(double h, double r);
          void                  C_Volumetric::Update();
//===================================================================
//===================================================================
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_Volumetric::C_Volumetric()
{         //Alert("C_Volumetric::C_Volumetric()");
//
}
//+------------------------------------------------------------------+
double C_Volumetric::CylinderVolume(double h, double r) ///Calc
{         double _r = 1.0 ;               // cylinder base radius
          double _h = 2.5 ;               // cylinder height
          double v = M_PI * r * r * h;   // cylinder volume
          Print ( "Cylinder volume =", DoubleToString (v)); //
          return (v); }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_Volumetric::Update()
{         double r = 1.0 ;          // cylinder base radius
          double h = 2.5 ;          // cylinder height
          double v = CylinderVolume (r, h);  // cylinder volume
          Print ( "Cylinder volume =", DoubleToString (v)); //
}
//+------------------------------------------------------------------+
//|             Class Cgp_ElliotWavePAD     BEGIN-END                    |
//+------------------------------------------------------------------+
