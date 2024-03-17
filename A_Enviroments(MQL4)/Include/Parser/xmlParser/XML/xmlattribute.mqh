//+------------------------------------------------------------------+
//|                                                 XmlAttribute.mqh |
//|                                                   yu-sha@ukr.net |
//+------------------------------------------------------------------+
//--------------------------------------------------------------------
//                         CXmlAttribute                             !
//--------------------------------------------------------------------
class CXmlAttribute
{
private:
          string            FName;
          string            FValue;
public:
          //--- constructor methods
          void  CXmlAttribute()         { FName = ""; FValue = ""; };
          void  ~CXmlAttribute()        { Clear(); };

          void  Init(const string aName, const string aValue = "")      { SetName(aName); SetValue(aValue); };
          virtual void                  Clear() {};
          virtual CXmlAttribute         *Clone()                        { CXmlAttribute *a = new CXmlAttribute;   a.FName = FName;   a.FValue = FValue;   return a; };

          //--- service methods
          string            GetName() const                             { return FName; };;
          void              SetName(const string aName)                 { FName = aName; };;
          string            GetValue() const                            { return FValue; };;
          void              SetValue(const string aValue)               { FValue = aValue; };        ;//
};
//--------------------------------------------------------------------
//                         CXmlAttribute                             !
//--------------------------------------------------------------------

