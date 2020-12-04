part of 'operations.dart';

///Responsible for all interactions with internet. All functions return HTTP.Response
class _Network
{
  Future<void> setActiveToken(String token) async
  {
    ///most likely you will need to implement this if you are working with decent API
    _currentToken = token;
  } 
  
  Future<http.Response> getRequest(String url,{Map<String,String> queryParameters}) async
  {   
    try{
      if(queryParameters!=null)
        url = _parameterizedURL(url,queryParameters);
      print('get request to $url');
      var response = await http.get(url,headers:_headers);
      return response;
    }
    catch(e)
    {
      _noConnectionHandler(e);
      return http.Response('{}',noInternetConnectionCode);
    }
  }
  
  Future<http.Response> postRequest(String url,String payload,{Map<String,String> queryParameters}) async
  {
    try{
      if(queryParameters!=null)
        url = _parameterizedURL(url,queryParameters);
      print('post request to $url\npayload: $payload');
      var response = await http.post(url,headers:_headers,body: payload);    
      return response;
    }
    catch(e)
    {
      _noConnectionHandler(e);
      return http.Response('{}',noInternetConnectionCode);
    }
  }

  Future<http.Response> putRequest(String url,{String payload,Map<String,String> queryParameters}) async
  {
    try{
      if(queryParameters!=null)
        url = _parameterizedURL(url,queryParameters);
      print('put request to $url');
      if(payload != null)
        print('payload: $payload');
      http.Response response = await http.put(url,headers:_headers,body: payload);
      return response;
    }
    catch(e)
    {
      _noConnectionHandler(e);
      return http.Response('{}',noInternetConnectionCode);
    }
  }
  
  Future<http.Response> deleteRequest(String url,{Map<String,String> queryParameters}) async
  {
    try{
      if(queryParameters!=null)
        url = _parameterizedURL(url,queryParameters);
      print('delete request to $url');
      http.Response response = await http.delete(url,headers:_headers);
      return response;
    }
    catch(e)
    {
      _noConnectionHandler(e);
      return http.Response('{}',noInternetConnectionCode);
    }
  }
  
  static Future<bool> isInternetWorking() async
  {
    try 
    {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) 
        return true;

    } on SocketException catch (_) 
    {
      return false;
    }
    throw 'Unknown network error.';
  }
  
  static bool isSuccess(http.Response response)
  {
    return response.statusCode >= 200 && response.statusCode < 300;
  }

  String _parameterizedURL(String url,Map<String,String> queryParameters)
  {
    String baseUrl = url.replaceFirst(new RegExp(r'(https|http):?\/*'), '');
    int i = baseUrl.indexOf(r'/');
    String domain = baseUrl.substring(0,i,);
    String authority = baseUrl.substring(i+1);
    if(url.contains('https'))
      return Uri.https(domain,authority,queryParameters).toString();
    else
      return Uri.http(domain,authority,queryParameters).toString();
  }

  void _noConnectionHandler(dynamic e)
  {
    print('Error in network: $e');
    InformationViewer.showErrorToast(msg:'Error in network: $e',textColor: Colors.white,);
  }
  
  static String _platform()
  {
    if(Platform.isAndroid)
      return "android";
    else if(Platform.isIOS)
      return "ios";
    else
      return "platform-error";
  }
  
  static final int noInternetConnectionCode = 418;
  static String _currentToken;
  static get _headers => {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader:'application/json',
      HttpHeaders.acceptLanguageHeader:'en',
      // HttpHeaders.authorizationHeader:'Bearer $_currentToken', //TODO: implement or remove this
      "Platform":_platform()
      };
}
