import './network.dart';
import './operationReply.dart';


///Responsible for communication with api endpoints and transforming Network Responses to entities
class API
{
   API._default();
  factory API()
  {
    return _api;
  }

  
  final Network _network = Network();
  final _baseUrl = '';
  static final API _api = new API._default();
}