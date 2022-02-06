import 'package:flutter/material.dart';
import 'package:andromina_crew_app/src/datamodels/tasks_model.dart';
import 'package:andromina_crew_app/src/widgets/StatusBarWidget.dart';
import 'package:andromina_crew_app/src/widgets/StatusBarWidget_1.dart';
import 'package:andromina_crew_app/src/widgets/TaskDetailButtonWidget.dart';
import 'package:andromina_crew_app/src/widgets/PostedTimesWidget.dart';
import 'package:timeline_tile/timeline_tile.dart';

Widget taskDetailWidget(Task task, Function refresh) {

  var status = task.status;
  return SingleChildScrollView(
    child: Container(
        //color: Colors.grey,
        //alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(50,10,50,10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //StatusBarWidget(task.status),
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
            SizedBox(height: 20),
            TaskDetailButtonWidget(task, refresh),
            //SizedBox(height: 20),
            //PostedTimesWidget(task,refresh),
          ],
        )
    ),
  );
}