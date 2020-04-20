// import 'package:validate/validate.dart' ;

///used as validation functions for fields
class PerciseValidate
{
  static bool isNumeric(String value) 
  {
    if(value == null) {
      return false;
    }
    return double.tryParse(value) == null? false : true;
  }
}