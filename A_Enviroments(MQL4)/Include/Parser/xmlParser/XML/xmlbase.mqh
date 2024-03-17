//+------------------------------------------------------------------+
//|                                                      XmlBase.mqh |
//|                                                   yu-sha@ukr.net |
//+------------------------------------------------------------------+
//       The library can be used for parsing of XML documents
// Example:
// CXmlDocument doc;
// doc.CreateFromFile (...);
// doc.DocumentElement.Elements[i].Text - get content of the i-th element
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
#include "XmlAttribute.mqh"
#include "XmlElement.mqh"
#include "XmlDocument.mqh"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void xml_demo()
{         Print("----------------Start xml:----------------");
          CXmlDocument doc;
          string file = "File.xml";
          string err;
          if (doc.CreateFromText(file, err))
          {         CXmlElement * xmlItem = doc.FDocumentElement.GetChild(0);
                    for (int i = 0; i < xmlItem.GetChildCount(); i++)
                    {         if (xmlItem.GetChild(i).GetName() == "LAYER")
                              {         CXmlElement* layer = xmlItem.GetChild(i);
                                        for (int j = 0; j < layer.GetChildCount(); ++j)
                                        {         if (layer.GetChild(j).GetName() == "NEURON")
                                                  {         /* .... */
                                                  }//
                                        }//
                              }//
                    }//
          }//
          Print("----------------End xml:----------------"); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
