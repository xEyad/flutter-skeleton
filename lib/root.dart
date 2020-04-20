import 'package:equity_new_app/views/mainScreen.dart';
import 'package:equity_new_app/widgets/focusRemover.dart';
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
    );
  }

 
}
