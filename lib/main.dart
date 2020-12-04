import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:global_configuration/global_configuration.dart';
import 'root.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  final cfg = await GlobalConfiguration().loadFromAsset("configuration");
  runApp(Root());
}