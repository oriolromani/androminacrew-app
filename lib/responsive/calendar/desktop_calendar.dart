import 'package:andromina_crew_app/responsive/constants.dart';
import 'package:andromina_crew_app/src/widgets/CalendarWidget.dart';
import 'package:flutter/material.dart';
import 'package:andromina_crew_app/src/screens/drawer.dart';

class DesktopCalendar extends StatefulWidget {
  const DesktopCalendar({Key? key}) : super(key: key);

  @override
  _DesktopCalendarState createState() => _DesktopCalendarState();
}

class _DesktopCalendarState extends State<DesktopCalendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      backgroundColor: myDefaultBackground,
      body: Row(
        children: [
          SizedBox(
            width: 240,
            child: MyDrawer(),
          ),
          Expanded(
          child: Container(
              height: MediaQuery.of(context).size.height,
              child: CalendarWidget()),
          ),
        ],
      ),
    );
  }
}