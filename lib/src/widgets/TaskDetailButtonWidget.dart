import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:andromina_crew_app/src/widgets/ConfirmTaskButtonWidget.dart';
import 'package:andromina_crew_app/src/widgets/RejectTaskButtonWidget.dart';
import 'package:andromina_crew_app/src/widgets/TimeWorkButtonWidget.dart';
import 'package:andromina_crew_app/src/widgets/FakeTimeWorkButtonWidget.dart';
import 'package:andromina_crew_app/src/widgets/AddWorkTimeButtonWidget.dart';
import 'package:andromina_crew_app/src/widgets/StopWorkTimeButtonWidget.dart';

Widget TaskDetailButtonWidget(task, Function refresh) {
  //var format = DateFormat("yyyy-MM-dd");
  var today = DateFormat.yMMMMd('en_US').format(DateTime.now()).toString();
  if (task.status == "proposed") {
    //Status equal to proposed, return buttons for accept or refuse
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

        ConfirmTaskButtonWidget(task: task),
        RejectTaskButtonWidget(task: task),
      ],
    );
  }else if(task.status == "confirmed"){
    //Status equal to confirmed, return buttons for time management
    //if (task.date == today){
    if (true){
      if(task.times.length>=1){
        final index = task.times.length - 1;
        //find unfinished time
        var unfinished_time_index = 0;
        for (var i = 0; i < task.times.length; i++) {
          if(task.times[i].end_time==null){
            unfinished_time_index = i;
          }
        }
        if(task.times[unfinished_time_index].end_time==null){
          //print(task.times[0].end_time);
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //TimeWorkButtonWidget(task: task, notifyParent: refresh),
              StopWorkTimeButtonWidget(task: task, notifyParent: refresh, unfinished_id: unfinished_time_index)
            ],
          );
        }else{
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //TimeWorkButtonWidget(task: task, notifyParent: refresh),
              AddWorkTimeButtonWidget(task: task, notifyParent: refresh)
             ],
          );
        }
      }else{
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //TimeWorkButtonWidget(task: task, notifyParent: refresh),
            AddWorkTimeButtonWidget(task: task, notifyParent: refresh)
          ],
        );
      }
    }else{
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FakeTimeWorkButtonWidget(),
        ],
      );
    }
  }else {
    //Status equal to refused, return no buttons
    return Row();
  }
}