import 'package:flutter/material.dart';
import 'package:andromina_crew_app/src/datamodels/tasks_model.dart';
import 'package:andromina_crew_app/src/widgets/ListWorkTimeWidget.dart';


Widget PostedTimesWidget(Task task, Function refresh) {
  if (task.times.length>0){
    return  Column(
      children: [
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
                return ListWorkTimeWidget(context, task, index, refresh);
              }
          ),
        ),
      ],
    );
  }else{
    return SizedBox(height: 20);
  }
}