part of 'operations.dart';

///Responsible for communication with api endpoints and transforming Network Responses to entities
class _API {
  _API._default();
  factory _API() {
    return _api;
  }

  ///Don't forget to cast it to function return type using [as] method
  OperationReply _handleCommonNetworkCases(http.Response resp) {
    Map body;
    try {
      body = jsonDecode(resp.body);      
    } catch (e) {}

    if(resp.statusCode == _Network.noInternetConnectionCode)
      return OperationReply(Status.connectionDown, message: 'No internet connection.'); 
    else if (body != null && body['errors'] != null)
      return OperationReply(Status.failed, message: body['errors']); 
    else
    {
      log('',error:'error in api:\n${resp.body}',name: 'API');
      return OperationReply(Status.error, message: 'Api error occurred');
    }
  }

  final _Network _network = _Network();
  final _baseUrl =  GlobalConfiguration().get('backend')['liveUrl'];
  static final _API _api = new _API._default();
}
