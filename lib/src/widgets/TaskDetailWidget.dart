import 'package:flutter/material.dart';
import 'package:andromina_crew_app/src/datamodels/tasks_model.dart';
import 'package:andromina_crew_app/src/widgets/StatusBarWidget.dart';
import 'package:andromina_crew_app/src/widgets/TaskDetailButtonWidget.dart';

Widget taskDetailWidget(Task task, Function refresh) {
  var status = task.status;
  return SingleChildScrollView(
    child: Container(
        color: Colors.grey,
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(50),
        child: Column(
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
            TaskDetailButtonWidget(status, task, refresh),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Posted Times:")
              ],
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                  itemCount: task.times.length,
                  itemBuilder: (BuildContext context, int index){
                    return Text("Start: "+task.times[index].start_time+(task.times[index].end_time!=null?" End: " +task.times[index].end_time:''));
                  }
              ),
            ),
          ],
        )
    ),
  );
}