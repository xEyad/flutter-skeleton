part of 'operations.dart';

///Responsible for communication with api endpoints and transforming Network Responses to entities
class _API {
  _API._default();
  factory _API() {
    return _api;
  }

  ///Don't forget to cast it to function return type using [as] method
  OperationReply _handleCommonNetworkCases(http.Response resp) 
  {
    Map body;
    try {
      body = jsonDecode(resp.body);      
    } catch (e) {}

    return _handleCommonNetworkCasesFromMap(body,resp?.statusCode??_Network.noInternetConnectionCode);
  }
  
  OperationReply _handleCommonNetworkCasesForDio(dio.Response resp)
  {
    return _handleCommonNetworkCasesFromMap(resp.data,resp.statusCode??_Network.noInternetConnectionCode);
  }

  OperationReply _handleCommonNetworkCasesFromMap(Map body,int statusCode)
  {
    try{
      if(statusCode == _Network.noInternetConnectionCode)
        return OperationReply(Status.connectionDown, message: 'No internet connection.'); 
      else if (body != null && body['errors'] != null)
        return OperationReply(Status.failed, message: body['errors']); 
      else if (body != null && statusCode == 500 && body['message'] != null)
      {
        log('',error:'error in api:\n${jsonEncode(body)}',name: 'API');
        return OperationReply(Status.failed, message: 'Network error occured!'); 
      }
      else if(body != null && statusCode == 400)
      {
        log('',error:'error in api:\n${body['error']}',name: 'API');
        return OperationReply(Status.failed, message: body['error']); 
      }
      else if(body != null && statusCode == 403)
      {
        log('',error:'error in api:\n${body['message']}',name: 'API');
        return OperationReply(Status.userNotVerified, message: body['message']); 
      }
      else if (body != null && body['message'] != null)
      {
        log('',error:'error in api:\n${body['message']}',name: 'API');
        return OperationReply(Status.failed, message: body['message']); 
      }
      else
      {
        log('',error:'error in api:\n$body',name: 'API');
        return OperationReply(Status.error, message: 'Api error occurred');
      }
    }
    catch(e)
    {
      log('',error:'error in api:\n$body',name: 'API');
      return OperationReply(Status.error, message: 'Api error occurred');
    }    
  }
  

  final _Network _network = _Network();
  final _baseUrl =  GlobalConfiguration().get('backend')['liveUrl'];
  static final _API _api = new _API._default();
}
