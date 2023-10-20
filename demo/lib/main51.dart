import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class Notification{
  final FlutterLocalNotificationsPlugin notify = FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings ais = AndroidInitializationSettings('assets/images/leo.jpg');

  void intialnotification () async
  {
    InitializationSettings ins = InitializationSettings(android: ais);

    notify.initialize(ins);

  }
}