import 'dart:async';

import 'package:andromina_crew_app/responsive/task_detail/desktop_task_detail.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:connectivity/connectivity.dart';
import 'package:andromina_crew_app/src/datamodels/tasks_model.dart';
import 'package:andromina_crew_app/src/services/task_service.dart';
import 'package:andromina_crew_app/src/screens/task_detail_screen_1.dart';

import '../../responsive/responsive_layout.dart';
import '../../responsive/task_detail/mobile_task_detail.dart';


class CalendarWidget extends StatefulWidget {

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  String? _networkStatusMsg;
  final Connectivity _internetConnectivity = new Connectivity();

  @override
  void initState() {
    _checkNetworkStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return Container(
        child: FutureBuilder(
          future: TaskService().getAllTask(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data != null) {
              return SafeArea(
                child: Container(
                    padding: EdgeInsets.all(16),
                    child: SfCalendar(
                      view: CalendarView.month,
                      onTap: calendarTapped,
                      monthViewSettings: MonthViewSettings(
                        showAgenda: true,
                        agendaItemHeight: 60,
                        //appointmentDisplayMode: MonthAppointmentDisplayMode.appointment
                      ),
                      initialDisplayDate: DateTime.now(),
                      initialSelectedDate: DateTime.now(),
                      firstDayOfWeek: 1,
                      showNavigationArrow: true,
                      dataSource: MeetingDataSource(snapshot.data),
                    )),
              );
            } else {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      );
  }

  void calendarTapped(CalendarTapDetails details){
    if (details.targetElement == CalendarElement.appointment){
      final Task meetingDetails = details.appointments![0];
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                //TaskDetailScreen1(task: meetingDetails)
            ResponsiveLayout(
                mobileScaffold: MobileTaskDetail(task: meetingDetails),
                tabletScaffold: MobileTaskDetail(task: meetingDetails),
                desktopScaffold: DesktopTaskDetail(task: meetingDetails)
            )
        ),
      //).then(onGoBack);
      );
    }
  }

  FutureOr onGoBack(dynamic value){
    setState((){});
  }

  void _checkNetworkStatus() {
    _internetConnectivity.onConnectivityChanged
        .listen((ConnectivityResult result) {
      setState(() {
        _networkStatusMsg = result.toString();
        if (_networkStatusMsg == "ConnectivityResult.mobile") {
          _networkStatusMsg =
          "You are connected to mobile network, loading calendar data ....";
        } else if (_networkStatusMsg == "ConnectivityResult.wifi") {
          _networkStatusMsg =
          "You are connected to wifi network, loading calendar data ....";
        } else {
          _networkStatusMsg =
          "Internet connection may not be available. Connect to another network";
        }
      });
    });
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Task> source) {
    appointments = source;
  }
  Color _initializeStatusColor(String status) {
    if(status=="proposed"){
      return Colors.amber;
    }else if(status=="confirmed"){
      return Colors.green;
    }else if(status=="rejected"){
      return Colors.red;
    }else{
      return Colors.indigoAccent;
    }
  }

  @override
  DateTime getStartTime(int index) {
    DateTime _date = new DateFormat.yMMMMd('en_US').parse(appointments![index].date);
    return _date;
  }

  @override
  DateTime getEndTime(int index) {
    DateTime _date = new DateFormat.yMMMMd('en_US').parse(appointments![index].date);
    return _date;
  }

  @override
  String getSubject(int index) {
    return appointments![index].name+" ("+appointments![index].company.name+")";
  }


  @override
  Color getColor(int index) {
    return _initializeStatusColor(appointments![index].status);
  }

  @override
  bool isAllDay(int index) {
    return true;
  }
}