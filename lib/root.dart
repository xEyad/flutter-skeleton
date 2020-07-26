import './widgets/fcmMessagesHandler.dart';
import './views/mainScreen.dart';
import './widgets/focusRemover.dart';
import 'package:flutter/material.dart';

class Root extends StatefulWidget 
{
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> 
{
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FocusRemover(
      child: FCMMessageHandler(
              child: MaterialApp(
          title: 'Equity',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Arial',
            canvasColor: Colors.white,
          ),
          debugShowCheckedModeBanner: false,
          home: MainScreen() 
        ),
      ),
    );
  }

 
}
