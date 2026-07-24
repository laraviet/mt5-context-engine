//+------------------------------------------------------------------+
//| Context Engine                                                   |
//| Class    : CEChartObject                                         |
//| Version  : 0.2.0                                                 |
//| Author   : Thanh & ChatGPT                                       |
//+------------------------------------------------------------------+
#ifndef __CE_CHART_OBJECT_MQH__
#define __CE_CHART_OBJECT_MQH__

class CEChartObject
{
protected:

   long   m_chartId;
   string m_name;

public:

   CEChartObject(void);
   virtual ~CEChartObject(void);

   void SetName(const string name);
   string Name(void) const;

   bool Exists(void) const;
   bool Destroy(void);
};

//------------------------------------------------------------------
// Constructor
//------------------------------------------------------------------

CEChartObject::CEChartObject(void)
{
   m_chartId = ChartID();
   m_name    = "";
}

//------------------------------------------------------------------

CEChartObject::~CEChartObject(void)
{
}

//------------------------------------------------------------------

void CEChartObject::SetName(const string name)
{
   m_name = name;
}

//------------------------------------------------------------------

string CEChartObject::Name(void) const
{
   return m_name;
}

//------------------------------------------------------------------

bool CEChartObject::Exists(void) const
{
   if(m_name == "")
      return false;

   return ObjectFind(m_chartId, m_name) >= 0;
}

//------------------------------------------------------------------

bool CEChartObject::Destroy(void)
{
   if(!Exists())
      return true;

   return ObjectDelete(m_chartId, m_name);
}

#endif