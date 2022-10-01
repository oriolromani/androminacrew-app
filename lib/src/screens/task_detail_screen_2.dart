import 'package:andromina_crew_app/responsive/constants.dart';
import 'package:andromina_crew_app/src/screens/drawer.dart';
import 'package:flutter/material.dart';

import '../datamodels/tasks_model.dart';

class TaskDetailScreen2 extends StatelessWidget {
  final Task task;

  TaskDetailScreen2({
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      body: Container(
        child: Text(task.name),
      )
    );
  }
}