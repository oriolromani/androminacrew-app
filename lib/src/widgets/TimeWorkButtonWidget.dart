import 'dart:math';

import 'package:flutter/material.dart';
import 'package:andromina_crew_app/src/services/task_service.dart';
import 'package:andromina_crew_app/src/datamodels/tasks_model.dart';

class TimeWorkButtonWidget extends StatefulWidget {
  const TimeWorkButtonWidget({Key? key, required this.task}) : super(key: key);
  final Task task;

  @override
  _TimeWorkButtonWidgetState createState() => _TimeWorkButtonWidgetState();
}

class _TimeWorkButtonWidgetState extends State<TimeWorkButtonWidget> {
  TimeOfDay initialTime = TimeOfDay.now();
  DateTime initialDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async{
        TimeOfDay? pickedTime = await showTimePicker(context: context,
            initialEntryMode: TimePickerEntryMode.input,
            initialTime: initialTime);
        if (pickedTime != null){
          final now = new DateTime.now();
          final pickedDate = new DateTime(now.year,now.month, now.day, pickedTime.hour, pickedTime.minute);
          TaskService().createWorkTime(widget.task, pickedDate.toString());
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
}