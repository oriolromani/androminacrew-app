import 'package:flutter/material.dart';
import 'package:andromina_crew_app/src/services/task_service.dart';
import 'package:andromina_crew_app/src/services/gig_service.dart';
import 'package:andromina_crew_app/src/datamodels/tasks_model.dart';
import 'package:andromina_crew_app/src/datamodels/gig_model.dart';
import 'package:andromina_crew_app/src/widgets/TaskDetailWidget.dart';
import 'package:andromina_crew_app/src/widgets/TaskDetailButtonWidget.dart';
import 'package:andromina_crew_app/src/widgets/TaskDetailWidgetWide.dart';
import 'package:andromina_crew_app/src/widgets/StatusBarWidget_1.dart';
import 'package:andromina_crew_app/src/widgets/PostedTimesWidget.dart';
import 'package:andromina_crew_app/src/screens/drawer.dart';

import 'package:timeline_tile/timeline_tile.dart';

class TaskDetailScreen1 extends StatefulWidget {
  final Task task;
  const TaskDetailScreen1({Key? key, required this.task}) : super(key: key);

  @override
  _TaskDetailScreen1State createState() => _TaskDetailScreen1State();
}

class _TaskDetailScreen1State extends State<TaskDetailScreen1> {
  Future<Task>? futureTask;

  @override
  void initState(){
    super.initState();
    futureTask = TaskService().getTask(widget.task.uid);
  }

  refresh(){
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const breakpoint = 600.0;
    if (screenWidth >= breakpoint){
      return Row(
        children: [
        SizedBox(width: 240, child: MyDrawer(),),
        Container(width:0.5,color: Colors.black),
        Expanded(child:FutureBuilder<Task>(
          future: TaskService().getTask(widget.task.uid),
          // function where you call your api
          builder: (BuildContext context,
              AsyncSnapshot<Task> snapshot) { // AsyncSnapshot<Your object type>
            if (snapshot.hasData) {
              Task task = snapshot.data as Task;
              return Column(
                children: [
                  Row(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width*0.8,
                          color: Colors.orange,
                          height: MediaQuery.of(context).size.height*0.05 ,
                          child: Text(task.name,style: TextStyle(
                            fontSize: 20,
                          ),)),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        height: MediaQuery.of(context).size.height*0.7,
                        child: DefaultTextStyle(
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            child: PostedTimesWidget(task, refresh)
                        ),
                      ),

                      Column(
                        children: [
                          Container(
                            color: Colors.green,
                            width: MediaQuery.of(context).size.width*0.3,
                            height: MediaQuery.of(context).size.height*0.7,
                            child:DefaultTextStyle(
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                                child: taskDetailWidgetWide(task, refresh)
                            ),
                              /*FutureBuilder<GigModel>(
                                future: GigService().getGig(widget.task.gig!.uid),
                                // function where you call your api
                                builder: (BuildContext context,
                                AsyncSnapshot<GigModel> snapshot) { // AsyncSnapshot<Your object type>
                                if (snapshot.hasData) {
                                  return Column(
                                    children: [
                                      Text("Gig's info",
                                      style: TextStyle(
                                        fontSize: 20,
                                      )),
                                    ],
                                  );
                                }else{
                                  return CircularProgressIndicator();
                                }
                              }
                          )*/
                          ),
                          
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        color: Colors.blue,
                        width: MediaQuery.of(context).size.width*0.8,
                        height: MediaQuery.of(context).size.height*0.2,
                        child: TaskDetailButtonWidget(task, refresh),
                      )
                    ],
                  )
                ],
              );
            } else {
              return Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator()
              );
            }
          },
        ))]
      );
    }else {
      return FutureBuilder<Task>(
        future: TaskService().getTask(widget.task.uid),
        // function where you call your api
        builder: (BuildContext context,
            AsyncSnapshot<Task> snapshot) { // AsyncSnapshot<Your object type>
          if (snapshot.hasData) {
            Task task = snapshot.data as Task;
            return DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                  title: Text(task.name,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  flexibleSpace: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[Colors.redAccent, Colors.red]),
                    ),
                  ),
                  //backgroundColor: Colors.redAccent[100],
                  bottom: TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.adjust)),
                      Tab(icon: Icon(Icons.alarm)),
                      Tab(icon: Icon(Icons.group)),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    Container(
                      //color: Colors.grey,
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.blueGrey,
                              Colors.grey,
                            ],
                          )
                      ),
                      child:
                      Column(
                        children: [
                          //StatusBarWidget1(task),
                          taskDetailWidget(task, refresh),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Colors.blueGrey,
                              Colors.grey,
                            ],
                          )
                      ),
                      child: PostedTimesWidget(task, refresh),
                      //child: materialDetailWidget(),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.blueGrey,
                              Colors.grey
                            ],
                          )
                      ),
                      //child: crewDetailWidget(),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator()
            );
          }
        },
      );
    }
  }

}
