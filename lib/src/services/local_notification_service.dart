import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService{
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize(){

    final InitializationSettings initializationSettings =
      InitializationSettings(android: AndroidInitializationSettings("@mipmap/ic_launcher")); //InitializationSettings

    _notificationsPlugin.initialize(initializationSettings);
  }

  static void display(RemoteMessage message) async{

    final id = DateTime.now().microsecondsSinceEpoch ~/1000;

    try {
      final NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails(
            "androminacrew",
            "androminacrew channel",
            importance: Importance.max,
            priority: Priority.high,
        )
      ); //NotificationDetails

      await _notificationsPlugin.show(
          id,
          message.notification!.title,
          message.notification!.body,
          notificationDetails);
    } on Exception catch (e) {
        print(e);
    }
  }
}