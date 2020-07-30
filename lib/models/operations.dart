library operations;
import 'dart:io';
import './informationViewer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'operationReply.dart';

part 'api.dart';
part 'network.dart';
part '../utility/Utility.dart';
///Responsible for all Domain-related actions and the only class interacting with the Routes
class Operations 
{
  Operations._default();
  factory Operations()
  {
    return _oi;
  }
  
  static final Operations _oi = Operations._default();
  static final _API _api = _API();
}
