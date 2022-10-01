import 'dart:async';
import 'dart:ui';

import 'package:andromina_crew_app/responsive/constants.dart';
import 'package:andromina_crew_app/src/screens/drawer.dart';
import 'package:andromina_crew_app/src/services/task_service.dart';
import 'package:andromina_crew_app/src/widgets/TotalTimeWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../src/datamodels/tasks_model.dart';
import '../../src/widgets/ListWorkTimeWidget.dart';
import '../../src/widgets/TaskDetailButtonWidget.dart';
import '../../src/widgets/TaskStatusMonitorWidget.dart';
import '../../src/widgets/TimeWorkButtonWidget.dart';

class MobileGigDetail extends StatefulWidget {
  final gig;
  const MobileGigDetail({Key? key, required this.gig}) : super(key: key);

  @override
  _MobileGigDetailState createState() => _MobileGigDetailState();
}

class _MobileGigDetailState extends State<MobileGigDetail> {
  refresh(){
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    var gig_tasks_count = 0;
    if (widget.gig.tasks != null){
      gig_tasks_count = widget.gig.tasks.length;
    }else{
      gig_tasks_count = 0;
    }

    return Scaffold(
      appBar: myAppBar,
      backgroundColor: myDefaultBackground,
      body: SingleChildScrollView(
        child: Column(
            children: [
            Text(widget.gig.name),
            Text("Associated tasks:"),
            ListView.builder(
                shrinkWrap: true,
                itemCount: gig_tasks_count,
                itemBuilder: (context, index){
                  return FutureBuilder(
                  future: TaskService().getTask(widget.gig.tasks[index]),
                  builder: (BuildContext context,
                  AsyncSnapshot snapshot) {
                    if (snapshot.hasData){
                      Task task = snapshot.data as Task;
                      return Container(
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                  children:[
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Task: "+task.name),
                                        Text("Responsible: "+ task.user_name),
                                      ],
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.all(8),
                                        alignment: Alignment.centerRight,
                                        child: TaskStatusMonitorWidget(task.working_status)
                                      ),
                                    ),
                                  ]
                              ),
                            ),
                          )
                      );
                    }else{
                      return Container();
                    }
                  }

                  );
                }
            )
            ]
      ),
    )
    );
  }
}
