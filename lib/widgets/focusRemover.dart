import 'package:flutter/material.dart';

///makes sure when you tap outside any input field it loses focus
class FocusRemover extends StatelessWidget 
{
  final Widget _child;
  FocusRemover({@required Widget child})
  :
  _child = child;
  
  @override
  Widget build(BuildContext context) 
  {
    return GestureDetector(
      child: _child,
      onTap: ()
      {        
        FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
        }
      },
    );
  }
}