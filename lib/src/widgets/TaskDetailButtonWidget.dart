import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:andromina_crew_app/src/widgets/ConfirmTaskButtonWidget.dart';
import 'package:andromina_crew_app/src/widgets/RejectTaskButtonWidget.dart';
import 'package:andromina_crew_app/src/widgets/TimeWorkButtonWidget.dart';
import 'package:andromina_crew_app/src/widgets/FakeTimeWorkButtonWidget.dart';

Widget TaskDetailButtonWidget(status, task, Function refresh) {
  //var format = DateFormat("yyyy-MM-dd");
  var today = DateFormat.yMMMMd('en_US').format(DateTime.now()).toString();
  if (status == "proposed") {
    //Status equal to proposed, return buttons for accept or refuse
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

        ConfirmTaskButtonWidget(task: task),
        RejectTaskButtonWidget(task: task),
      ],
    );
  }else if(status == "confirmed"){
    //Status equal to confirmed, return buttons for time management
    if (task.start_date == today){
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TimeWorkButtonWidget(task: task, notifyParent: refresh),
        ],
      );
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