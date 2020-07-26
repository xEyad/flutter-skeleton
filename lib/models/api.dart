part of 'operations.dart';

///Responsible for communication with api endpoints and transforming Network Responses to entities
class _API
{
  _API._default();
  factory _API()
  {
    return _api;
  }

  
  final _Network _network = _Network();
  final _baseUrl = '';
  static final _API _api = new _API._default();
}