import 'dart:math';

import 'package:flutter/material.dart';
import 'package:andromina_crew_app/src/services/task_service.dart';
import 'package:andromina_crew_app/src/datamodels/tasks_model.dart';
import 'package:time_range_picker/time_range_picker.dart';

class TimeWorkButtonWidget extends StatefulWidget {
  const TimeWorkButtonWidget({Key? key, required this.task, required this.notifyParent}) : super(key: key);
  final Task task;
  final Function notifyParent;


  @override
  _TimeWorkButtonWidgetState createState() => _TimeWorkButtonWidgetState();
}

class _TimeWorkButtonWidgetState extends State<TimeWorkButtonWidget> {
  TimeOfDay initialTime = TimeOfDay.now();
  final List<dynamic> myTimes = [];
  @override
  Widget build(BuildContext context) {
    myTimes.addAll(widget.task.times);
    return TextButton(
      onPressed: () async{
        TimeRange? pickedTime = await CustomShowTimePicker(myTimes);
        if (pickedTime != null){
          final now = new DateTime.now();
          if(pickedTime.startTime.hour.toInt()<=pickedTime.endTime.hour.toInt()){
            //EndTime is the same day as startTime
            final startTime = new DateTime(now.year,now.month, now.day, pickedTime.startTime.hour, pickedTime.startTime.minute);
            final endTime = new DateTime(now.year,now.month, now.day, pickedTime.endTime.hour, pickedTime.endTime.minute);
            TaskService().createWorkTime(widget.task, startTime.toString(), endTime.toString());
          }else if (pickedTime.startTime.hour.toInt()>pickedTime.endTime.hour.toInt()){
            //EndTime is the day after of StartTime
            final startTime = new DateTime(now.year,now.month, now.day, pickedTime.startTime.hour, pickedTime.startTime.minute);
            final endTime = new DateTime(now.year,now.month, now.day+1, pickedTime.endTime.hour, pickedTime.endTime.minute);
            TaskService().createWorkTime(widget.task, startTime.toString(), endTime.toString());
          }
          widget.notifyParent();
        }},
      child: Container(
        decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Icon(Icons.access_time,
            size:100),
      ),
    );
  }

  Future<dynamic> CustomShowTimePicker(List<dynamic> myTimes){
    final List<DateTime> end_time = [];
    final List<DateTime> start_time = [];
    DateTime maxT = new DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,0,0,0,0,0);
    DateTime minT = new DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,23,59,0,0);
    for (var t in myTimes) {
      DateTime Tmax = DateTime.parse(t.end_time);
      DateTime Tmin = DateTime.parse(t.start_time);
      end_time.add(Tmax);
      start_time.add(Tmin);
      if (end_time.length >= 1) {
        if (end_time.last.isAfter(maxT)) {
          maxT = Tmax;
        }
      }else{
        maxT = Tmax;
      }
      if (start_time.length >= 1) {
         if (start_time.last.isBefore(minT)) {
          minT = Tmin;
        }
      }else{
        minT = Tmin;
      }
    }
    if (end_time.isEmpty){
      return showTimeRangePicker(
        context: context,
        paintingStyle: PaintingStyle.stroke,
        labels: [
          "24 h",
          "3 h",
          "6 h",
          "9 h",
          "12 h",
          "15 h",
          "18 h",
          "21 h"
        ].asMap().entries.map((e) {
          return ClockLabel.fromIndex(
              idx: e.key, length: 8, text: e.value);
        }).toList(),
        backgroundColor: Colors.grey.withOpacity(0.2),
        disabledColor: Colors.red.withOpacity(0.5),
        start: TimeOfDay(hour: DateTime.now().hour-3, minute:DateTime.now().minute),
        disabledTime: TimeRange(
            startTime: TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute),
            endTime: TimeOfDay(hour:0, minute: 0)),
      );
    }else {
      return showTimeRangePicker(
        context: context,
        paintingStyle: PaintingStyle.stroke,
        labels: [
          "24 h",
          "3 h",
          "6 h",
          "9 h",
          "12 h",
          "15 h",
          "18 h",
          "21 h"
        ].asMap().entries.map((e) {
          return ClockLabel.fromIndex(
              idx: e.key, length: 8, text: e.value);
        }).toList(),
        start: TimeOfDay(hour: maxT.hour, minute:maxT.minute),
        end: TimeOfDay(hour: DateTime.now().hour, minute:DateTime.now().minute),
        disabledTime: TimeRange(
            startTime: TimeOfDay(hour: minT.hour, minute: minT.minute),
            endTime: TimeOfDay(hour: maxT.hour, minute: maxT.minute)),
      );
    }
  }
}