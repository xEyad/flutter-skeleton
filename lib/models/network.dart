import 'dart:io';
import './informationViewer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

///Responsible for all interactions with internet. All functions return HTTP.Response
class Network
{
  Future<void> setActiveToken(String token) async
  {
    ///most likely you will need to implement this if you are working with decent API
    _currentToken = token;
  } 
  
  Future<http.Response> getRequest(String url) async
  {
    try{
      print('get request to $url');
      var response = await http.get(url,headers:_headers);
      return response;
    }
    catch(e)
    {
      _noConnectionHandler(e);
      return http.Response('',noInternetConnectionCode);
    }
  }

  Future<http.Response> postRequest(String url,String payload) async
  {
    try{
      print('post request to $url\npayload: $payload');
      var response = await http.post(url,headers:_headers,body: payload);    
      return response;
    }
    catch(e)
    {
      _noConnectionHandler(e);
      return http.Response('',noInternetConnectionCode);
    }
  }

  Future<http.Response> putRequest(String url,[String payload]) async
  {
    try{
      http.Response response = await http.put(url,headers:_headers,body: payload);
      return response;
    }
    catch(e)
    {
      _noConnectionHandler(e);
      return http.Response('',noInternetConnectionCode);
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

  void _noConnectionHandler(dynamic e)
  {
    //TODO IMPLEMENT _noConnectionHandler() of Network class
    print('Error in Network class: $e');
    InformationViewer.showErrorToast(msg:'Error in network: $e',textColor: Colors.white,);
  }

  static final int noInternetConnectionCode = 418;
  static String _currentToken;
  static get _headers => {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader:'application/json',
      };
}
