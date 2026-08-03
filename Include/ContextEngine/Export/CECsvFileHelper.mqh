#ifndef __CE_CSV_FILE_HELPER_MQH__
#define __CE_CSV_FILE_HELPER_MQH__

class CECsvFileHelper
{
public:

   static bool Exists(
      const string fileName)
   {
      int handle =
         FileOpen(
            fileName,
            FILE_READ | FILE_CSV);

      if(handle == INVALID_HANDLE)
         return false;

      FileClose(handle);

      return true;
   }

   static int OpenAppend(
      const string fileName,
      bool &newFile)
   {
      newFile = !Exists(fileName);

      int handle =
         FileOpen(
            fileName,
            FILE_READ |
            FILE_WRITE |
            FILE_CSV |
            FILE_SHARE_READ);

      if(handle == INVALID_HANDLE)
         return INVALID_HANDLE;

      if(newFile)
      {
         FileSeek(handle,0,SEEK_SET);
      }
      else
      {
         FileSeek(handle,0,SEEK_END);
      }

      return handle;
   }

   static void Close(
      const int handle)
   {
      if(handle != INVALID_HANDLE)
         FileClose(handle);
   }
};

#endif