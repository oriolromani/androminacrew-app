import 'package:flutter/material.dart';
import 'package:andromina_crew_app/src/datamodels/tasks_model.dart';
import 'package:andromina_crew_app/src/widgets/ListWorkTimeWidget.dart';


Widget PostedTimesWidget(Task task, Function refresh) {
  if (task.times.length>0){
    return  Container(
      padding: EdgeInsets.fromLTRB(50,10,50,10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(task.time.hours.toString()+":"+task.time.minutes.toString(),
              style: TextStyle(
                fontSize: 70,
                color: Colors.indigo
              ),)
            ],
          ),
          Divider(
            color: Colors.black,
            height: 20,
            thickness: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Text("Posted Times:")
            ],
          ),
          Expanded(
            //height: 300,
            child: ListView.builder(
                itemCount: task.times.length,
                itemBuilder: (BuildContext context, int index){
                  return ListWorkTimeWidget(context, task, index, refresh);
                }
            ),
          ),
        ],
      ),
    );
  }else{
    return Container(
      padding: EdgeInsets.fromLTRB(50,10,50,10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("00:00",
                style: TextStyle(
                    fontSize: 70,
                    color: Colors.indigo
                ),)
            ],
          ),
          Divider(
            color: Colors.black,
            height: 20,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}