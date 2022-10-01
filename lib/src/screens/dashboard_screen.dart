import 'package:flutter/material.dart';
import 'package:andromina_crew_app/src/screens/drawer.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    const breakpoint = 600.0;
    if (screenWidth >= breakpoint) {
      return Row(
        children: [
          SizedBox(width: 240, child: MyDrawer(),),
          Container(width:0.5,color: Colors.black),
        ],
      );
    } else {
      return Container(
        child: Text("DashBoard_SMALL"),
      );
    }
  }
}