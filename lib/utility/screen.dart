import 'package:flutter/material.dart';


/// have some utility functions regarding screen numbers
class Screen 
{
  static double width(BuildContext context, [double percentage=1])
  {
    return MediaQuery.of(context).size.width * percentage;
  }
  static double height(BuildContext context, [double percentage=1])
  {
    return MediaQuery.of(context).size.height * percentage;
  }
  

  ///ignores top of screen(notch), status bar and lower end of screen
  static double heightOfSafeArea(BuildContext context, [double percentage=1])
  {
    var padding = MediaQuery.of(context).padding;
    double theHeight = height(context) - padding.top - padding.bottom; 
    return theHeight * percentage;
  }

  static double heightWithoutStatusBar(BuildContext context, [double percentage=1])
  {
    var padding = MediaQuery.of(context).padding;
    double theHeight = height(context) - padding.top; 
    return theHeight * percentage;
  }

  static double heightWithoutToolbar(BuildContext context, [double percentage=1])
  {
    var padding = MediaQuery.of(context).padding;
    double theHeight = height(context) - padding.top - padding.bottom; 
    return theHeight * percentage;
  }
}