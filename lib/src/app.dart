import 'package:andromina_crew_app/responsive/calendar/mobile_calendar.dart';
import 'package:andromina_crew_app/responsive/credentials/mobile_credentials.dart';
import 'package:andromina_crew_app/responsive/responsive_layout.dart';
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
import 'package:andromina_crew_app/src/screens/dashboard_screen.dart';
import 'package:andromina_crew_app/src/services/auth_service.dart';
import  'package:andromina_crew_app/responsive/mobile_scaffold.dart';
import  'package:andromina_crew_app/responsive/tablet_scaffold.dart';
import  'package:andromina_crew_app/responsive/desktop_scaffold.dart';


import 'package:flutter/foundation.dart' show kIsWeb;

import '../responsive/calendar/desktop_calendar.dart';
import '../responsive/credentials/desktop_credentials.dart';
import '../responsive/gigs/mobile_gigs.dart';

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
        title: "AndrominaCrew APP",
        home: FutureBuilder(
          future: AuthService.getToken(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasData) {
              //return Calendar();
              return ResponsiveLayout(
                  mobileScaffold: MobileScaffold(),
                  tabletScaffold: TabletScaffold(),
                  desktopScaffold: DesktopScaffold()
              );
            } else {
              return LoginScreen();
            }
          },
        ),
        routes: {
          '/home': (_) => ResponsiveLayout(
            mobileScaffold: MobileScaffold(),
            tabletScaffold: TabletScaffold(),
            desktopScaffold: DesktopScaffold(),
          ),
          //'/home': (_) => Calendar(),
          '/old': (_) => new OldTaskScreen(),
          '/login': (_) => new LoginScreen(),
          '/signup': (_) => new SignupScreen(),
          '/forgot_password': (_) => new ForgotPassword(),
          '/credentials': (_) => new ResponsiveLayout(
            mobileScaffold: MobileCredentials(),
            tabletScaffold: MobileCredentials(),
            desktopScaffold: DesktopCredentials(),
          ),
          //'/calendar': (_) => new Calendar(),
          '/calendar': (_) => new ResponsiveLayout(
            mobileScaffold: MobileCalendar(),
            tabletScaffold: MobileCalendar(),
            desktopScaffold: DesktopCalendar(),
          ),
          '/gigs': (_) => new ResponsiveLayout(
            mobileScaffold: MobileGigs(),
            tabletScaffold: MobileGigs(),
            desktopScaffold: MobileGigs(),
          ),
          //'/dashboard': (_) => new DashboardScreen(),
          '/dashboard': (_) => new ResponsiveLayout(
            mobileScaffold: MobileScaffold(),
            tabletScaffold: TabletScaffold(),
            desktopScaffold: DesktopScaffold(),
          ),
          //'/calendar': (_) => new HomeScreen(),
          //'/calendar': (_) => new TableEventsExample(),
          //'/task_detail': (_) => new TaskDetailScreen(),
        },
      ),
    );
  }
}