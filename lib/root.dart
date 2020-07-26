import './widgets/fcmMessagesHandler.dart';
import './views/mainScreen.dart';
import './widgets/focusRemover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'localization/localeDelegate.dart';

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FocusRemover(
      child: MaterialApp(
          title: 'Skeleton',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Arial',
            canvasColor: Colors.white,
          ),
          debugShowCheckedModeBanner: false,
          home: MainScreen(),
          localizationsDelegates: [
              const LocDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale:const Locale('en', 'US'), 
            supportedLocales: [
              const Locale('ar', 'EG'), 
              const Locale('en', 'US'), 
            ],
            localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocales) {
            return locale;
          },
          ),
    );
  }
}
