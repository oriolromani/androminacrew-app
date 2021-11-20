import 'package:flutter/material.dart';
import 'package:andromina_crew_app/src/services/auth_service.dart';

class MyDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.redAccent,
            ),
            child: Text('AndrominaCrewAPP'),
          ),
          ListTile(
            title: const Text('Events'),
            onTap: () {
              // Update the state of the app
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            title: const Text('Historical'),
            onTap: () {
              // Update the state of the app
              Navigator.pushNamed(context, '/old');
            },
          ),
          ListTile(
            title: const Text('Credentials'),
            onTap: () {
              Navigator.pushNamed(context, '/credentials');
            },
          ),
          ListTile(
            title: const Text('LogOut'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/login');
              AuthService.removeToken();
            },
          ),
        ],
      ),
    );
  }
}