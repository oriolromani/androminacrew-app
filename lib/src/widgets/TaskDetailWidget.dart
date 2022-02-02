import 'package:flutter/material.dart';
import 'package:andromina_crew_app/src/datamodels/tasks_model.dart';
import 'package:andromina_crew_app/src/widgets/StatusBarWidget.dart';
import 'package:andromina_crew_app/src/widgets/TaskDetailButtonWidget.dart';
import 'package:andromina_crew_app/src/widgets/PostedTimesWidget.dart';

Widget taskDetailWidget(Task task, Function refresh) {

  var status = task.status;
  return SingleChildScrollView(
    child: Container(
        color: Colors.grey,
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(50),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StatusBarWidget(task.status),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.access_time),
                Text(" "+task.start_date),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.radio_button_on),
                Text(" "+task.company)
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.alarm),
                Text("Worked Time: "+(task.time.hours).toString()+" hours and "+(task.time.minutes).toString()+" minutes")
              ],
            ),
            SizedBox(height: 50),
            TaskDetailButtonWidget(task, refresh),
            SizedBox(height: 50),
            PostedTimesWidget(task,refresh),
          ],
        )
    ),
  );
}