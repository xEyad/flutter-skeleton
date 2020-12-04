part of 'operations.dart';
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
    return GetStorage().read(key);
  }
  
  Future<bool> deleteAllData() async
  {
    try{
      GetStorage().erase();
      print('DELETED ALL DISK DATA!');
    }
    catch(e){return false;}

    return true;    
  }

  
  ///returns null if doesn't exist
  Future<String> getEntryUnique(DiskKey key) async
  {
    return getEntry(key.toString());
  }

  ///depends on enums instead of raw strings
  Future<bool> saveUnique(DiskKey key,String data) async
  {
    return save(key.toString(),data);
  }
  ///depends on enums instead of raw strings
  ///creates key if doesn't exist
  Future<bool> overwriteUnique(DiskKey key,String data) async
  {
    return overwrite(key.toString(),data);
  }
  
  ///depends on enums instead of raw strings
  Future<bool> isUniqueKeyExists(DiskKey key) async
  {
    return isKeyExists(key.toString());
  }



  Future<bool> save(String key,String data) async 
  {
    try{
      await GetStorage().write(key, data);
      print('saved key: $key with value: $data');
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
    try{
      await GetStorage().write(key,newData);
      print('overwritten key: $key with value: $newData');
      return true;
    }
    catch(e)
    {
      return false;
    }
  }

  Future<bool> isKeyExists(String key) async
  {    
    return GetStorage().getKeys<String>().contains(key);
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
  final RegExp  _keyPattern = new RegExp(r"╞.*╞");
  static final  Disk _instance = Disk._default();
}