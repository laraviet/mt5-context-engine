#ifndef __CE_LOGGER_MQH__
#define __CE_LOGGER_MQH__

#include <ContextEngine/Core/CELogLevel.mqh>

class CELogger
{

private:

   static CELogLevel m_level;
   
   static string Format(
   const string level,
   const string module,
   const string message)
   {
      return StringFormat(
         "[%-5s][%-12s] %s",
         level,
         module,
         message);
   }
   
public:

   static void SetLevel(
      CELogLevel level)
   {
      m_level = level;
   }

   static void Info(
      const string module,
      const string message)
   {
      if(m_level < LOG_INFO)
         return;
      Print(
         Format(
            "INFO",
            module,
            message));
   }
   
   static void Info(
   const string module,
   const string format,
   const string value)
   {
      Info(
         module,
         StringFormat(format, value));
   }
   
   static void Info(
   const string module,
   const string format,
   const int value)
   {
      Info(
         module,
         StringFormat(format, value));
   }
   
   static void Info(
   const string module,
   const string format,
   const double value)
   {
      Info(
         module,
         StringFormat(format, value));
   }

   static void Warn(
      const string module,
      const string message)
   {
      if(m_level < LOG_WARN)
         return;
         
      Print(
         Format(
            "WARN",
            module,
            message));
   }

   static void Error(
      const string module,
      const string message)
   {
      if(m_level < LOG_ERROR)
         return;
         
      Print(
         Format(
            "ERROR",
            module,
            message));
   }

#ifdef _DEBUG

   static void Debug(
      const string module,
      const string message)
   {
      if(m_level < LOG_DEBUG)
         return;
         
      Print(
         Format(
            "DEBUG",
            module,
            message));
   }

#else

   static void Debug(
      const string module,
      const string message)
   {
   }

#endif

};

CELogLevel CELogger::m_level = LOG_INFO;

#endif