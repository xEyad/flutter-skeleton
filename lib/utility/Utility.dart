part of '../models/operations.dart';

///contain simple functions which are useful in many different scenarios
class Utility
{
  static bool isNullOrEmpty(String val)
  {
    return val == null || val.isEmpty || val == 'null';
  }
  static bool inBetween(value,start,end)
  {
    return value > start && value < end;
  }
  static DateTime extractDateTime(int y,int m,int d,[DateTime nullReplace])
  {
    if(nullReplace == null)
      nullReplace =  DateTime.now();

    if( d == null || m == null || y== null)
      return nullReplace;
    else 
    return DateTime.utc(y,m,d);
  }
  static String extractString(String s,[String nullReplace ="N/A"])
  {
    return s == null || s == "null" ? nullReplace  : s;
  }

  static extractObject(Object obj,[String nullReplace ="N/A"])
  {
    return obj == null ? nullReplace  : obj;
  }
  static Future<bool> isURLValid(String url) async
  {
    var n = _Network();
    if(url==null )
      return false;

    var resp  = await n.getRequest(url);
    if(resp.statusCode == 200)
      return true;
    else
      return false;
  }
}
