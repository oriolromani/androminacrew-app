import 'package:flutter/material.dart';
import 'package:andromina_crew_app/src/services/task_service.dart';
import 'package:andromina_crew_app/src/datamodels/tasks_model.dart';

class FakeTimeWorkButtonWidget extends StatefulWidget {
  const FakeTimeWorkButtonWidget({Key? key}) : super(key: key);

  @override
  _FakeTimeWorkButtonWidgetState createState() => _FakeTimeWorkButtonWidgetState();
}

class _FakeTimeWorkButtonWidgetState extends State<FakeTimeWorkButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () =>
          showDialog<String>(
            context: context,
            builder: (BuildContext context) =>
                AlertDialog(
                  title: const Text('TimeRecord will be available the day of the task'),
                  //content: const Text('Are you sure?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        setState(() {
                          //TaskService().rejectTask(widget.task);
                          Navigator.pop(context, 'ok');
                        });
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
          ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Icon(Icons.access_time,
            size:100),
      ),
    );
  }
}