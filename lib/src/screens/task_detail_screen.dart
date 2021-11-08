import 'package:flutter/material.dart';
import 'package:andromina_crew_app/src/datamodels/tasks_model.dart';

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({Key? key, required this.task}) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task.name,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.redAccent[100],

      ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.grey,
                  Colors.grey,
                ],
              )
          ),
          child: taskDetailWidget(),
        )
    );
  }

  Widget taskDetailWidget() {
    return Container(
        color: Colors.grey,
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            Text(task.name),
            Text(task.start_time),
            SizedBox(height: 20),
            Text(task.end_time),
            SizedBox(height: 20),
            Icon(Icons.access_time,
                size: 100)
          ],
        )
    );
  }
}