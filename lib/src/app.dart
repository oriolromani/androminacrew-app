import 'package:flutter/material.dart';
import 'package:andromina_crew_app/src/providers/provider.dart';
import 'package:andromina_crew_app/src/screens/forgot_password.dart';
import 'package:andromina_crew_app/src/screens/home_screen.dart';
import 'package:andromina_crew_app/src/screens/login_screen.dart';
import 'package:andromina_crew_app/src/screens/signup_screen.dart';
import 'package:andromina_crew_app/src/screens/credentials_screen.dart';
import 'package:andromina_crew_app/src/screens/old_task_screen.dart';
import 'package:andromina_crew_app/src/screens/task_detail_screen.dart';
import 'package:andromina_crew_app/src/services/auth_service.dart';

class App extends StatelessWidget {
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
          //'/task_detail': (_) => new TaskDetailScreen(),
        },
      ),
    );
  }
}
