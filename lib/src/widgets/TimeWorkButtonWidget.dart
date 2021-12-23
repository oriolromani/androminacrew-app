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
  final List<TimeRange> myTimes = [];
  @override
  Widget build(BuildContext context) {
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

  Future<dynamic> CustomShowTimePicker(List<TimeRange> myTimes){
    print(myTimes.length);
    if (myTimes.isEmpty){
      return showTimeRangePicker(
        context: context,
      );
    }else {
      return showTimeRangePicker(
        context: context,
        disabledTime: TimeRange(
            startTime: TimeOfDay(hour: 22, minute: 0),
            endTime: TimeOfDay(hour: 5, minute: 0)),
      );
    }
  }
}