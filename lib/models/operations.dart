library operations;
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'operationReply.dart';
import 'package:global_configuration/global_configuration.dart';

part 'api.dart';
part 'network.dart';
part 'disk.dart';
part '../utility/Utility.dart';
part '../utility/diskKeys.dart';

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
