import 'dart:io';
import 'package:path_provider/path_provider.dart';
///Responsible for all I/O on mobile
class Disk
{
  Disk._default();
  factory Disk()
  {
    return _instance;
  }
  Future<Directory> getStorageDirectory()
  {
    return getApplicationDocumentsDirectory();
  }
  
  ///gets only the first occurence of the key if it is duplicated.
  ///returns null if doesn't exist
  Future<String> getEntry(String key) async
  {
    if(!await isKeyExists(key))
      return null;
    List<String> lines = await _read();    
    final index = lines.indexWhere((String line) => line.contains(_createKey(key)));
    return lines[index].replaceAll(_keyPattern, "");
  }
  
  Future<bool> deleteAllData() async
  {
    final directory = await getStorageDirectory();
    final file = File('${directory.path}/$_storageFileName');

    try{file.delete();}
    catch(e){return false;}

    print('DELETED ALL DISK DATA!');
    return true;    
  }


  ///will duplicate the key if it already exists
  Future<bool> save(String key,String data) async 
  {
    try{
      final directory = await getStorageDirectory();
      final file = File('${directory.path}/$_storageFileName');
      final String entry = '${_createKey(key)}$data\n';
      await file.writeAsString(entry,mode:FileMode.append,flush: true);
      print('saved key: $key with $data');
      return true;
    }
    catch(e)
    {
      return false;
    }    
  }

  ///creates key if doesn't exist
  Future<bool> overwrite(String key,String newData) async
  {
    if(!await isKeyExists(key))
    {
      await save(key,newData);
      return true;
    }
    try{
      List<String> lines = await _read();
      final index = lines.indexWhere((String line) => line.contains(_createKey(key)));
      final entryLine = lines[index];
      if(index == -1)
      {
        await save(key,newData);
        return true;
      }

      final lastIndex = entryLine.lastIndexOf(_keyPattern) + _createKey(key).length;
      lines[index] = entryLine.replaceRange(lastIndex,null,newData);
      
      final directory = await getStorageDirectory();
      final file = File('${directory.path}/$_storageFileName');      
      await file.writeAsString(lines.join("\n"),mode:FileMode.writeOnly);
      print('overwrite key: $key with $newData');
      return true;
    }
    catch(e)
    {
      return false;
    }
  }

  Future<bool> isKeyExists(String key) async
  {
    
    List<String> lines = await _read();
    if(lines == null)
      return false;
    final index = lines.indexWhere((String line) => line.contains(_createKey(key)));
    return index != -1;
  }

  ///null = error
  Future<List<String>> _read() async 
  {
    final directory = await getStorageDirectory();
    final file = File('${directory.path}/$_storageFileName');
    final exists = await file.exists();
    try {
      if(!exists)
        return null;
      List<String> text = await file.readAsLines();
      print('file contents:\n${await file.readAsString()}');
      return text;
    } catch (e) {
      if(!exists)
        print('file doesn\'t exist');
      else
        print("Couldn't read file: $_storageFileName");
    }
    return null;
  }  
  String _createKey(String key)
  {
    return '╞$key╞';
  }
  final String _storageFileName = "eyad-app-data.txt";
  final RegExp  _keyPattern = new RegExp(r"╞\w*╞");
  static final  Disk _instance = Disk._default();
}