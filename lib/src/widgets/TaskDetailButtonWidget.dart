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
    if (task.date == today){
      if(task.times.length>=1){
        final index = task.times.length - 1;
        if(task.times[index].end_time==null){
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //TimeWorkButtonWidget(task: task, notifyParent: refresh),
              StopWorkTimeButtonWidget(task: task, notifyParent: refresh)
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