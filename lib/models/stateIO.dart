import 'dart:io';
import 'package:path_provider/path_provider.dart';
///Responsible for all I/O on mobile
class Disk
{
  static Future<Directory> getStorageDirectory()
  {
    return getTemporaryDirectory();
  }
  
}