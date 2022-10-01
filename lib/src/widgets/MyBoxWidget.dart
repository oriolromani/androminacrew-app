import 'dart:async';

import 'package:andromina_crew_app/responsive/responsive_layout.dart';
import 'package:andromina_crew_app/responsive/task_detail/desktop_task_detail.dart';
import 'package:flutter/material.dart';

import '../../responsive/task_detail/mobile_task_detail.dart';
import '../datamodels/tasks_model.dart';
import '../screens/task_detail_screen_1.dart';
import '../screens/task_detail_screen_2.dart';
import '../services/task_service.dart';

class MyBox extends StatelessWidget {
  final int index;

  MyBox({
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: TaskService().getFutureTask(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data != null) {
            List<Task> task = snapshot.data as List<Task>;
            if (index<task.length){
              return Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(task[index].gig!.name,
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),),
                    Text("("+task[index].name+")"),
                    SizedBox(
                      height: 10,
                    ),
                    Text(task[index].date),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ResponsiveLayout(
                                          mobileScaffold: MobileTaskDetail(task: task[index]),
                                          tabletScaffold: MobileTaskDetail(task: task[index]),
                                          desktopScaffold: DesktopTaskDetail(task: task[index])
                              ),
                            ));
                          },
                          icon: Icon(Icons.add_circle_outline,
                          color: Colors.black),
                        ),
                      ),
                    )
                  ],
                ),
                color: Colors.blue,
              );
            }else{
              return Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Next TASK",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white24
                    ),)
                  ],
                ),
                color: Colors.grey,
              );
            }

          }else{
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
              ),
            );
          }
        }
    );
  }
}