import '../models/disk.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:io' show Platform;


///follow this steps to enable it https://pub.dev/packages/firebase_messaging
///kotlin equivalent code https://stackoverflow.com/questions/59984162/firebase-messaging-handle-background-message-in-kotlin
///firebase cloud messaging handler. wrap any widget with this and handle the messages that comes while the app in foreground
class FCMMessageHandler extends StatefulWidget 
{
  final Widget child;
  FCMMessageHandler({this.child = const SizedBox.shrink()});
  @override
  _MessageHandlerState createState() => _MessageHandlerState();
}

class _MessageHandlerState extends State<FCMMessageHandler> {
  final FirebaseMessaging _fcm = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    _fcm.requestNotificationPermissions(IosNotificationSettings());
    _saveDeviceToken();

    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        //implement what happens when you get message while the app in foreground
        _handleMessage(message);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        //implement what happens when you get message while the app in background
        _handleMessage(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        //implement what happens when you get message while the app in background
        _handleMessage(message);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
  
  //TODO: implement this to handle incoming messages
  void _handleMessage(Map<String, dynamic> message) {
  }

  
  void _saveDeviceToken() async {
    String fcmToken = await _fcm.getToken();
    Disk().overwrite('fcmToken',fcmToken);
    print(fcmToken);
  }
}

class _Notification
{
  String title;
  String body;
  _NotificationData data;
  _Notification(Map<String, dynamic> fcmMessage)
  {
    if (Platform.isAndroid) {
      title = fcmMessage['notification']['title'];
      body = fcmMessage['notification']['body'];
      if(fcmMessage['data']['data'] != null)
        data = _NotificationData(json.decode(fcmMessage['data']['data']));
    } else if (Platform.isIOS) {
      title = fcmMessage['aps']['alert']['title'];
      body = fcmMessage['aps']['alert']['body'];
    }
  }
}
class _NotificationData
{
  dynamic type;
  dynamic id;
  _NotificationData(Map<String, dynamic> msgData)
  {
    type = msgData['type'];
    id = msgData['id'];
  }
}