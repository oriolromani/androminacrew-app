// @dart=2.9
import 'package:andromina_crew_app/src/services/local_notification_service.dart';
import 'package:flutter/material.dart';
import 'src/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:workmanager/workmanager.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


void callbackDispatcher(){
  Workmanager().executeTask((task, inputData) {
      //var response = await http.get(Uri.parse('https://reqres.in/api/users/2'));
      //Map dataComingFromTheServer = json.decode(response.body);
      print("HelloMyWorkManager");
      //LocalNotificationService.initialize();
      LocalNotificationService.ShowOneTimeNotification(DateTime.now());
      return Future.value(true);
  });
}

//Receive message when app is in background
Future<void> backgroundHandler(RemoteMessage message) async{
  print(message.data.toString());
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(
      callbackDispatcher,
      isInDebugMode: true);
  Workmanager().registerOneOffTask(
      "1",
      "simpleTask",
      initialDelay: Duration(minutes: 1));
  //Workmanager().registerPeriodicTask("uniqueKey", "taskName",
  //    frequency: Duration(minutes: 15),
  //    inputData: {"data1":"value1", "data2":"value2"});
  LocalNotificationService.initialize();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  runApp(App());
}