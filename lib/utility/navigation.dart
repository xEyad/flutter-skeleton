import 'package:flutter/material.dart';

///a simple wrapper on navigation
Future<dynamic> navigateTo(BuildContext context, Widget route) async
{
  return await Navigator.push(context,MaterialPageRoute(builder: (context) => route));
}