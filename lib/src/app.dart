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
import 'package:andromina_crew_app/src/screens/calendar_screen_1.dart';
import 'package:andromina_crew_app/src/services/auth_service.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  late FirebaseMessaging messaging;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(!kIsWeb) {
      /// print FCM Token
      messaging = FirebaseMessaging.instance;
      messaging.getToken().then((value) {
        print(value);
      });

      /// gives you the meessage on which user taps
      FirebaseMessaging.instance.getInitialMessage().then((message) {
        if (message != null) {
          final routeFromMessage = message.data["route"];
          print(routeFromMessage);
        }
      });

      /// forground work
      FirebaseMessaging.onMessage.listen((message) {
        if (message.notification != null) {
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
              return Calendar();
            } else {
              return LoginScreen();
            }
          },
        ),
        routes: {
          //'/home': (_) => HomeScreen(),
          '/home': (_) => Calendar(),
          '/old': (_) => new OldTaskScreen(),
          '/login': (_) => new LoginScreen(),
          '/signup': (_) => new SignupScreen(),
          '/forgot_password': (_) => new ForgotPassword(),
          '/credentials': (_) => new CredentialsScreen(),
          '/calendar': (_) => new Calendar(),
          //'/calendar': (_) => new HomeScreen(),
          //'/calendar': (_) => new TableEventsExample(),
          //'/task_detail': (_) => new TaskDetailScreen(),
        },
      ),
    );
  }
}