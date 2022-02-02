import 'package:flutter/material.dart';
import 'package:andromina_crew_app/src/services/task_service.dart';
import 'package:andromina_crew_app/src/datamodels/tasks_model.dart';
import 'package:andromina_crew_app/src/widgets/TaskDetailWidget.dart';

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
    return FutureBuilder<Task>(
      future: TaskService().getTask(widget.task.uid), // function where you call your api
      builder: (BuildContext context, AsyncSnapshot<Task> snapshot) {  // AsyncSnapshot<Your object type>
        if(snapshot.hasData){
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
                backgroundColor: Colors.redAccent[100],
                bottom: TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.adjust)),
                    Tab(icon: Icon(Icons.construction)),
                    Tab(icon: Icon(Icons.group)),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  Container(
                    color: Colors.grey,
                    alignment: Alignment.topCenter,
                    /*decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.grey,
                            Colors.white,
                          ],
                        )
                    ),*/
                    child: taskDetailWidget(task, refresh),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.grey,
                            Colors.white,
                          ],
                        )
                    ),
                    //child: materialDetailWidget(),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.grey,
                            Colors.white,
                          ],
                        )
                    ),
                    //child: crewDetailWidget(),
                  ),
                ],
              ),
            ),
          );
        }else{
          return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator()
          );
        }
      },
    );
  }

}
