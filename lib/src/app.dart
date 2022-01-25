import 'package:andromina_crew_app/src/services/local_notification_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:andromina_crew_app/src/providers/provider.dart';
import 'package:andromina_crew_app/src/screens/forgot_password.dart';
import 'package:andromina_crew_app/src/screens/home_screen.dart';
import 'package:andromina_crew_app/src/screens/login_screen.dart';
import 'package:andromina_crew_app/src/screens/signup_screen.dart';
import 'package:andromina_crew_app/src/screens/credentials_screen.dart';
import 'package:andromina_crew_app/src/screens/old_task_screen.dart';
import 'package:andromina_crew_app/src/screens/calendar_screen.dart';
import 'package:andromina_crew_app/src/screens/task_detail_screen.dart';
import 'package:andromina_crew_app/src/services/auth_service.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// gives you the meessage on which user taps
    FirebaseMessaging.instance.getInitialMessage().then((message){
      if(message!=null){
        final routeFromMessage = message.data["route"];
        print(routeFromMessage);
      }
    });

    /// forground work
    FirebaseMessaging.onMessage.listen((message) {
      if(message.notification != null) {
        print(message.notification!.body);
        print(message.notification!.title);
      }
      
      LocalNotificationService.display(message);
    });

    /// App background but open
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage = message.data["route"];
      print(routeFromMessage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: "Rest Auth",
        home: FutureBuilder(
          future: AuthService.getToken(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasData) {
              return HomeScreen();
            } else {
              return LoginScreen();
            }
          },
        ),
        routes: {
          '/home': (_) => HomeScreen(),
          '/old': (_) => new OldTaskScreen(),
          '/login': (_) => new LoginScreen(),
          '/signup': (_) => new SignupScreen(),
          '/forgot_password': (_) => new ForgotPassword(),
          '/credentials': (_) => new CredentialsScreen(),
          '/calendar': (_) => new TableEventsExample(),
          //'/calendar': (_) => new CalendarScreen(),
          //'/task_detail': (_) => new TaskDetailScreen(),
        },
      ),
    );
  }
}