//+------------------------------------------------------------------+
//|                                      ChartObjectTextAdvanced.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict

//+------------------------------------------------------------------+
//| Class AdvancedC_ChartObjectText.                                 |
//| Purpose: Class of the "Text" object of chart.                    |
//|          Derives from class AdvancedC_ChartObject.               |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Advanced_ChartObject.mqh>
class AdvancedC_ChartObjectText : public AdvancedC_ChartObject
{
public:
          AdvancedC_ChartObjectText(void);
          ~AdvancedC_ChartObjectText(void);
          //--- methods of access to properties of the object
          double            Angle(void) const;
          bool              Angle(const double angle) const;
          string            Font(void) const;
          bool              Font(const string font) const;
          int               FontSize(void) const;
          bool              FontSize(const int size) const;
          ENUM_ANCHOR_POINT Anchor(void) const;
          bool              Anchor(const ENUM_ANCHOR_POINT anchor) const;
          //--- method of creating the object
          bool              Create(long chart_id, const string name, const int window,
                                   const datetime time, const double price);
          //--- method of identifying the object
          virtual int       Type(void) const { return(OBJ_TEXT); }
          //--- methods for working with files
          virtual bool      Save(const int file_handle);
          virtual bool      Load(const int file_handle); //
};
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
AdvancedC_ChartObjectText::AdvancedC_ChartObjectText(void)
{}
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
AdvancedC_ChartObjectText::~AdvancedC_ChartObjectText(void)
{}
//+------------------------------------------------------------------+
//| Create object "Text"                                             |
//+------------------------------------------------------------------+
bool AdvancedC_ChartObjectText::Create(long chart_id, const string name, const int window,
                                       const datetime time, const double price)
{         if(!ObjectCreate(chart_id, name, OBJ_TEXT, window, time, price))return(false);
          if(!Attach(chart_id, name, window, 1))return(false);
          Selectable(false);
          Hidden(true);
//--- successful
          return(true); }
//+------------------------------------------------------------------+
//| Get value of the "Angle" property                                |
//+------------------------------------------------------------------+
double AdvancedC_ChartObjectText::Angle(void) const
{
//--- check
          if(m_chart_id == -1)
                    return(EMPTY_VALUE);
//--- result
          return(ObjectGetDouble(m_chart_id, m_name, OBJPROP_ANGLE)); }
//+------------------------------------------------------------------+
//| Set value of the "Angle" property                                |
//+------------------------------------------------------------------+
bool AdvancedC_ChartObjectText::Angle(const double angle) const
{
//--- check
          if(m_chart_id == -1)
                    return(false);
//--- result
          return(ObjectSetDouble(m_chart_id, m_name, OBJPROP_ANGLE, angle)); }
//+------------------------------------------------------------------+
//| Get font name                                                    |
//+------------------------------------------------------------------+
string AdvancedC_ChartObjectText::Font(void) const
{
//--- check
          if(m_chart_id == -1)
                    return("");
//--- result
          return(ObjectGetString(m_chart_id, m_name, OBJPROP_FONT)); }
//+------------------------------------------------------------------+
//| Set font name                                                    |
//+------------------------------------------------------------------+
bool AdvancedC_ChartObjectText::Font(const string font) const
{
//--- check
          if(m_chart_id == -1)
                    return(false);
//--- result
          return(ObjectSetString(m_chart_id, m_name, OBJPROP_FONT, font)); }
//+------------------------------------------------------------------+
//| Get font size                                                    |
//+------------------------------------------------------------------+
int AdvancedC_ChartObjectText::FontSize(void) const
{
//--- check
          if(m_chart_id == -1)
                    return(0);
//--- result
          return((int)ObjectGetInteger(m_chart_id, m_name, OBJPROP_FONTSIZE)); }
//+------------------------------------------------------------------+
//| Set font size                                                    |
//+------------------------------------------------------------------+
bool AdvancedC_ChartObjectText::FontSize(const int size) const
{
//--- check
          if(m_chart_id == -1)
                    return(false);
//--- result
          return(ObjectSetInteger(m_chart_id, m_name, OBJPROP_FONTSIZE, size)); }
//+------------------------------------------------------------------+
//| Get anchor point                                                 |
//+------------------------------------------------------------------+
ENUM_ANCHOR_POINT AdvancedC_ChartObjectText::Anchor(void) const
{
//--- check
          if(m_chart_id == -1)
                    return(WRONG_VALUE);
//--- result
          return((ENUM_ANCHOR_POINT)ObjectGetInteger(m_chart_id, m_name, OBJPROP_ANCHOR)); }
//+------------------------------------------------------------------+
//| Set anchor point                                                 |
//+------------------------------------------------------------------+
bool AdvancedC_ChartObjectText::Anchor(const ENUM_ANCHOR_POINT anchor) const
{
//--- check
          if(m_chart_id == -1)
                    return(false);
//--- result
          return(ObjectSetInteger(m_chart_id, m_name, OBJPROP_ANCHOR, anchor)); }
//+------------------------------------------------------------------+
//| Writing parameters of object to file                             |
//+------------------------------------------------------------------+
bool AdvancedC_ChartObjectText::Save(const int file_handle)
{         int    len;
          string str;
//--- check
          if(file_handle == INVALID_HANDLE || m_chart_id == -1)
                    return(false);
//--- write
          if(!AdvancedC_ChartObject::Save(file_handle))
                    return(false);
//--- write value of the "Angle" property
          if(FileWriteDouble(file_handle, ObjectGetDouble(m_chart_id, m_name, OBJPROP_ANGLE)) != sizeof(double))
                    return(false);
//--- write value of the "Font Name" property
          str = ObjectGetString(m_chart_id, m_name, OBJPROP_FONT);
          len = StringLen(str);
          if(FileWriteInteger(file_handle, len, INT_VALUE) != INT_VALUE)
                    return(false);
          if(len != 0 && FileWriteString(file_handle, str, len) != len)
                    return(false);
//--- write value of the "Font Size" property
          if(FileWriteInteger(file_handle, (int)ObjectGetInteger(m_chart_id, m_name, OBJPROP_FONTSIZE), INT_VALUE) != sizeof(int))
                    return(false);
//--- write value of the "Anchor Point" property
          if(FileWriteInteger(file_handle, (int)ObjectGetInteger(m_chart_id, m_name, OBJPROP_ANCHOR), INT_VALUE) != sizeof(int))
                    return(false);
//--- successful
          return(true); }
//+------------------------------------------------------------------+
//| Reading parameters of object from file                           |
//+------------------------------------------------------------------+
bool AdvancedC_ChartObjectText::Load(const int file_handle)
{         int    len;
          string str;
//--- check
          if(file_handle == INVALID_HANDLE || m_chart_id == -1)
                    return(false);
//--- read
          if(!AdvancedC_ChartObject::Load(file_handle))
                    return(false);
//--- reading value of the "Angle" property
          if(!ObjectSetDouble(m_chart_id, m_name, OBJPROP_ANGLE, 0, FileReadDouble(file_handle)))
                    return(false);
//--- read value of the "Font Name" property
          len = FileReadInteger(file_handle, INT_VALUE);
          str = (len != 0) ? FileReadString(file_handle, len) : "";
          if(!ObjectSetString(m_chart_id, m_name, OBJPROP_FONT, str))
                    return(false);
//--- read value of the "Font Size" property
          if(!ObjectSetInteger(m_chart_id, m_name, OBJPROP_FONTSIZE, FileReadInteger(file_handle, INT_VALUE)))
                    return(false);
//--- read value of the "Anchor Point" property
          if(!ObjectSetInteger(m_chart_id, m_name, OBJPROP_ANCHOR, FileReadInteger(file_handle, INT_VALUE)))
                    return(false);
//--- successful
          return(true); }
//+------------------------------------------------------------------+
