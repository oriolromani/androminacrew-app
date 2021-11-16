import 'package:flutter/material.dart';
import 'package:andromina_crew_app/src/services/task_service.dart';
import 'package:andromina_crew_app/src/datamodels/tasks_model.dart';

class ConfirmTaskButtonWidget extends StatefulWidget {
  const ConfirmTaskButtonWidget({Key? key, required this.task}) : super(key: key);
  final Task task;

  @override
  _ConfirmTaskButtonWidgetState createState() => _ConfirmTaskButtonWidgetState();
}

class _ConfirmTaskButtonWidgetState extends State<ConfirmTaskButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () =>
          showDialog<String>(
            context: context,
            builder: (BuildContext context) =>
                AlertDialog(
                  title: const Text('You are about to ACCEPT a proposal'),
                  content: const Text('Are you sure?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => {
                        Navigator.pop(context, 'Cancel'),
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          TaskService().acceptTask(widget.task);
                          Navigator.pushNamed(context, '/home');
                        });
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
          ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.lightGreen,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Icon(Icons.check,
            size:100),
      ),
    );
  }
}