import 'package:andromina_crew_app/responsive/constants.dart';
import 'package:andromina_crew_app/src/widgets/CalendarWidget.dart';
import 'package:flutter/material.dart';
import 'package:andromina_crew_app/src/screens/drawer.dart';

class MobileCalendar extends StatefulWidget {
  const MobileCalendar({Key? key}) : super(key: key);

  @override
  _MobileCalendarState createState() => _MobileCalendarState();
}

class _MobileCalendarState extends State<MobileCalendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      drawer: MyDrawer(),
      backgroundColor: myDefaultBackground,
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            child: CalendarWidget()),
        ),
      );
  }
}
