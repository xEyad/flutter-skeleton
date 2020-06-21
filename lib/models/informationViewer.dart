
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///responsible for showing information to the user it maybe dialogs,snackbars,notification,toast
///this should be the only interface to handle such widgets so that the interface be similar regardless of implementation
abstract class InformationViewer
{
  static showToast({@required String msg, double fontSize = 16.0,Color backgroundColor, Color textColor})
  {
    Fluttertoast.showToast(msg: msg,backgroundColor: backgroundColor,textColor: textColor,timeInSecForIos: 3,fontSize: fontSize);
  }
  static showErrorToast({@required String msg, double fontSize = 16.0, Color textColor = Colors.white})
  {
    Fluttertoast.showToast(msg: msg,backgroundColor: Colors.red,textColor: textColor,timeInSecForIos: 3,fontSize: fontSize);
  }
  static showSuccessToast({@required String msg, double fontSize = 16.0, Color textColor = Colors.white})
  {
    Fluttertoast.showToast(msg: msg,backgroundColor: Colors.green,textColor: textColor,timeInSecForIos: 3,fontSize: fontSize);
  }
}