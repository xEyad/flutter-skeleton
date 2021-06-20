library operations;
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'operationReply.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:dio/dio.dart' as dio;
import 'package:package_info_plus/package_info_plus.dart';

part 'api.dart';
part 'network.dart';
part 'disk.dart';
part '../utility/Utility.dart';
part '../utility/diskKeys.dart';

///Responsible for all Domain-related actions and the only class interacting with the Routes
class Operations 
{
  Operations._default()
  {
    _initialize();
  }

  void _initialize() async
  {
    _packageInfo = await PackageInfo.fromPlatform();
  }

  factory Operations()
  {
    return _oi;
  }
  
  
  static final Operations _oi = Operations._default();
  static final _API _api = _API();  
  static String get version => _packageInfo.version;
  static PackageInfo _packageInfo;
}

enum AppMode{
  debugWithLiveUrl,
  debugWithStagingUrl,
  //release
  live,
  //release
  staging
}
