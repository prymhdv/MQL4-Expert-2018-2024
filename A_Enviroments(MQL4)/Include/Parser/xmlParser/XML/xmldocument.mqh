//+------------------------------------------------------------------+
//|                                                  XmlDocument.mqh |
//|                                                   yu-sha@ukr.net |
//+------------------------------------------------------------------+
#include "XmlElement.mqh"
//+------------------------------------------------------------------+
//| CXmlDocument                                                     |
//+------------------------------------------------------------------+
class CXmlDocument
{
private:
          void              DoElementTrimText(CXmlElement &aXmlItem);

public:
          CXmlElement       FDocumentElement;

          void              CXmlDocument() {};
          void             ~CXmlDocument() { Clear(); };
          void              Clear();
          void              CopyTo(CXmlDocument &xmlDoc);

          bool              CreateFromText(const string &xml, string &err);
          bool              CreateFromFile(const string filename, string &err);
          bool              SaveToFile(const string filename);

          string            GetXml()    { return(FDocumentElement.GetXml(0)); };; //
};
 
//+------------------------------------------------------------------+
//| Clear                                                            |
//+------------------------------------------------------------------+
void CXmlDocument::Clear()
{         /*  if (DocumentElement!=NULL) {
              delete DocumentElement;
              DocumentElement=NULL;
            }*/
          FDocumentElement.Clear(); };
//+------------------------------------------------------------------+
//| CopyTo                                                           |
//+------------------------------------------------------------------+
void CXmlDocument::CopyTo(CXmlDocument &aDst)
{         aDst.Clear();
          FDocumentElement.CopyTo(aDst.FDocumentElement); };
//+------------------------------------------------------------------+
//| CreateFromText                                                   |
//+------------------------------------------------------------------+
bool CXmlDocument::CreateFromText(const string &text, string &err)
{         /* the content of XML document is placed to text
               - tranformed to UNICODE
               - free of BOM header UTF-8 */
// #define _PubidChar   _WhiteSpace+_LatinLetter+_Digit+"\'" + "-()+,./:=?;!*#@$_%"
// #define Utf8BOM    "\xEF\xBB\xBF"
          const string  WhiteSpace  = " \r\n\t";
          const string  LatinLetter = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
          const string  ANSIILetter = "\xC0\xC1\xC2\xC3\xC4\xC5\xC6\xC7\xC8\xC9\xCA\xCB\xCC\xCD\xCE\xCF\xD0\xD1\xD2\xD3\xD4\xD5\xD6\xD8\xD9\xDA\xDB\xDC\xDD\xDE\xDF\xE0\xE1\xE2\xE3\xE4\xE5\xE6\xE7\xE8\xE9\xEA\xEB\xEC\xED\xEE\xEF\xF0\xF1\xF2\xF3\xF4\xF5\xF6\xF8\xF9\xFA\xFB\xFC\xFD\xFE\xFF";
          const string  Digit       = "0123456789";
          const string  QuoteChar   = "\'\"";
          string  Letter      = LatinLetter + ANSIILetter;
          string  NameChar    = Letter + Digit + ".-_:\xB7";
          string  NameStart   = Letter + "_:";
          Clear();
          int p = 0;
          CXmlElement *CurElement = NULL;
          do
          {         if(p >= StringLen(text))
                    {         err = "Unexpected end of document, position" + IntegerToString(p);
                              return(false); }
                    if((StringSubstr(text, p, 5) == "<?xml") && StringFind(WhiteSpace, StringSubstr(text, p + 5, 1)) >= 0)
                    {         // Prolog
                              p = StringFind(text, "?>", p + StringLen("<?xml"));
                              if(p < 0)
                              {         err = "Not found ?> starting from position " + IntegerToString(p);
                                        return(false); }
                              p += StringLen("?>"); }
                    else if(StringSubstr(text, p, StringLen("<?")) == "<?")
                    {         // PI
                    }
                    else if(StringSubstr(text, p, StringLen("<!--")) == "<!--")
                    {         // Comment
                              p = StringFind(text, "-->", p + StringLen("<!--"));
                              if(p < 0)
                              {         err = "Not found --> starting from position " + IntegerToString(p);
                                        return(false); }
                              p += 3; }
                    else if(StringSubstr(text, p, StringLen("<!DOCTYPE")) == "<!DOCTYPE")
                    {         // Dtdc
                    }
                    else if(StringSubstr(text, p, StringLen("<![CDATA[")) == "<![CDATA[")
                    {         // Cdata
                              p = StringFind(text, "]]>", p + StringLen("<![CDATA["));
                              if(p < 0)
                              {         err = "Not found ]]> starting from position " + IntegerToString(p);
                                        return(false); }
                              p += StringLen("]]>"); }
                    else if(StringSubstr(text, p, StringLen("</")) == "</")
                    {         // End tag
                              p += 2;
                              string name = "";
                              if(StringFind(NameStart, StringSubstr(text, p, 1)) < 0)
                              {         err = "Invalid symbol at position" + IntegerToString(p);
                                        return(false); }
                              StringAdd(name, StringSubstr(text, p++, 1));
                              while(p < StringLen(text) && StringFind(NameChar, StringSubstr(text, p, 1)) >= 0)
                                        StringAdd(name, StringSubstr(text, p++, 1));
                              while(p < StringLen(text) && StringFind(WhiteSpace, StringSubstr(text, p, 1)) >= 0)
                                        p++;
                              if(CurElement == NULL || CurElement.GetName() != name || StringSubstr(text, p, 1) != ">")
                              {         err = "Invalid closing tag at position" + IntegerToString(p);
                                        return(false); }
                              p++;
                              if(CurElement == GetPointer(FDocumentElement))
                                        CurElement = NULL;
                              else
                              {         CXmlElement *parent = GetPointer(FDocumentElement);
                                        while(parent != NULL && parent.GetChildCount() > 0 && parent.GetChild(parent.GetChildCount() - 1) != CurElement)
                                                  parent = parent.GetChild(parent.GetChildCount() - 1);
                                        if(parent.GetChild(parent.GetChildCount() - 1) != CurElement)
                                        {         err = "Error in nested elements at position" + IntegerToString(p);
                                                  return(false); }
                                        CurElement = parent; }; }
                    else if(StringSubstr(text, p, StringLen("<")) == "<")
                    {         // Start tag
                              p++;
                              CXmlElement *element = NULL;
                              if(CurElement != NULL)
                              {         element = new CXmlElement;
                                        CurElement.ChildAdd(element); }
                              else
                              {         element = GetPointer(FDocumentElement); };
                              // Tag name
                              if(StringFind(NameStart, StringSubstr(text, p, 1)) < 0)
                              {         err = "ddd";
                                        return(false); }
                              element.SetName(element.GetName() + StringSubstr(text, p++, 1));
                              while(p < StringLen(text) && StringFind(NameChar, StringSubstr(text, p, 1)) >= 0)
                                        element.SetName(element.GetName() + StringSubstr(text, p++, 1));
                              while(p < StringLen(text) && StringFind(WhiteSpace, StringSubstr(text, p, 1)) >= 0)
                                        p++;
                              // Attributes
                              while(p < StringLen(text) && StringSubstr(text, p, 2) != "/>" && StringSubstr(text, p, 1) != ">")
                              {         // Attribute's name
                                        while(p < StringLen(text) && StringFind(WhiteSpace, StringSubstr(text, p, 1)) >= 0)
                                                  p++;
                                        if(StringFind(NameStart, StringSubstr(text, p, 1)) < 0)
                                        {         err = "dfg";
                                                  return(false); }
                                        CXmlAttribute *attribute = new CXmlAttribute;
                                        element.AttributeAdd(attribute);
                                        attribute.SetName(attribute.GetName() + StringSubstr(text, p++, 1));
                                        while(p < StringLen(text) && StringFind(NameChar, StringSubstr(text, p, 1)) >= 0)
                                                  attribute.SetName(attribute.GetName() + StringSubstr(text, p++, 1));
                                        // =
                                        while(p < StringLen(text) && StringFind(WhiteSpace, StringSubstr(text, p, 1)) >= 0)
                                                  p++;
                                        if(StringSubstr(text, p, 1) != "=")
                                        {         err = "dlk;lk";
                                                  return(false); }
                                        p++;
                                        // Value
                                        while(p < StringLen(text) && StringFind(WhiteSpace, StringSubstr(text, p, 1)) >= 0)
                                                  p++;
                                        if(StringFind(QuoteChar, StringSubstr(text, p, 1)) < 0)
                                        {         err = "ddd";
                                                  return(false); }
                                        string quote = StringSubstr(text, p++, 1);
                                        while(p < StringLen(text) && StringSubstr(text, p, 1) != quote)
                                                  attribute.SetValue(attribute.GetValue() + StringSubstr(text, p++, 1));
                                        p++;
                                        while(p < StringLen(text) && StringFind(WhiteSpace, StringSubstr(text, p, 1)) >= 0)
                                                  p++; }
                              if(StringSubstr(text, p, 2) == "/>")
                                        p += 2;
                              else if(StringSubstr(text, p, 1) == ">")
                              {         p++;
                                        CurElement = element; }
                              else
                              {         err = "[pot";
                                        return(false); } }
                    else
                    {         // Text
                              if(CurElement != NULL)
                                        CurElement.SetText(CurElement.GetText() + StringSubstr(text, p++, 1));
                              else if(p < StringLen(text) && StringFind(WhiteSpace, StringSubstr(text, p, 1)) >= 0)
                                        p++;
                              else
                                        return(false); } }
          while(p < StringLen(text));
          DoElementTrimText(FDocumentElement);
          return(true); };
//+------------------------------------------------------------------+
//| DoElementTrimText                                                |
//+------------------------------------------------------------------+
void CXmlDocument::DoElementTrimText(CXmlElement &aXmlItem)
{         string s = aXmlItem.GetText();
          StringTrimLeft(s);
          StringTrimRight(s);
          aXmlItem.SetText(s);
          for(int i = 0; i < aXmlItem.GetChildCount(); ++i)
                    DoElementTrimText(aXmlItem.GetChild(i)); }

//+------------------------------------------------------------------+
//| CreateFromFile                                                   |
//+------------------------------------------------------------------+
bool CXmlDocument::CreateFromFile(const string filename, string &err)
{         ResetLastError();
          Print("Load");
          int h = FileOpen(filename, FILE_BIN | FILE_READ | FILE_COMMON);
          if(h != INVALID_HANDLE)
          {         uchar data[];
                    bool complete = (FileReadArray(h, data) == FileSize(h));
                    FileClose(h);
                    if(complete)
                    {         string text = CharArrayToString(data);
                              return(CreateFromText(text, err)); } };
          err = "File open error: " + IntegerToString(GetLastError());
          return(false); };
//+------------------------------------------------------------------+
//| SaveToFile                                                       |
//+------------------------------------------------------------------+
bool CXmlDocument::SaveToFile(const string filename)
{         ResetLastError();
          int h = FileOpen(filename, FILE_BIN | FILE_WRITE);
          if(h != INVALID_HANDLE)
          {         uchar data[];
                    int c = StringToCharArray(GetXml(), data);
                    bool complete = (FileWriteArray(h, data, 0, c - 1) == (ArraySize(data) - 1));
                    FileClose(h);
                    return(complete); };
//  err="File write error: "+IntegerToString(GetLastError());
          return(false); };
//+------------------------------------------------------------------+
