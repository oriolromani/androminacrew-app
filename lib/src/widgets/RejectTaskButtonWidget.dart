import 'package:flutter/material.dart';
import 'package:andromina_crew_app/src/services/task_service.dart';
import 'package:andromina_crew_app/src/datamodels/tasks_model.dart';

class RejectTaskButtonWidget extends StatefulWidget {
  const RejectTaskButtonWidget({Key? key, required this.task}) : super(key: key);
  final Task task;

  @override
  _RejectTaskButtonWidgetState createState() => _RejectTaskButtonWidgetState();
}

class _RejectTaskButtonWidgetState extends State<RejectTaskButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () =>
          showDialog<String>(
            context: context,
            builder: (BuildContext context) =>
                AlertDialog(
                  title: const Text('You are about to REJECT a proposal'),
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
                          TaskService().rejectTask(widget.task);
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
            color: Colors.redAccent,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Icon(Icons.close_rounded,
            size:100),
      ),
    );
  }
}