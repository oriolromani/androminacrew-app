// @dart=2.9
import 'package:andromina_crew_app/src/services/local_notification_service.dart';
import 'package:flutter/material.dart';
import 'src/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

//Receive message when app is in background
Future<void> backgroundHandler(RemoteMessage message) async{
  print(message.data.toString());
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationService.initialize();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  runApp(App());
}