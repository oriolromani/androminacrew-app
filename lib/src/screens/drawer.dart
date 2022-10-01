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
            child: Text('AndrominaCrewAPP'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: const Text('Dashboard'),
            onTap: () {
              // Update the state of the app
              Navigator.pushNamed(context, '/dashboard');
            },
          ),
          ListTile(
            leading: Icon(Icons.calendar_month),
            title: const Text('Calendar'),
            onTap: () {
              // Update the state of the app
              Navigator.pushNamed(context, '/calendar');
            },
          ),
          ListTile(
            leading: Icon(Icons.apps_outlined),
            title: const Text('Gigs'),
            onTap: () {
              // Update the state of the app
              Navigator.pushNamed(context, '/gigs');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: const Text('Credentials'),
            onTap: () {
              Navigator.pushNamed(context, '/credentials');
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
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