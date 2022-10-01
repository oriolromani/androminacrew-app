import 'package:flutter/material.dart';
import 'package:andromina_crew_app/src/services/task_service.dart';
import 'package:andromina_crew_app/src/datamodels/tasks_model.dart';
import 'package:intl/intl.dart';

class AddWorkTimeButtonWidget extends StatefulWidget {
  const AddWorkTimeButtonWidget({Key? key, required this.task, required this.notifyParent}) : super(key: key);
  final Task task;
  final Function notifyParent;

  @override
  _AddWorkTimeButtonWidgetState createState() => _AddWorkTimeButtonWidgetState();
}

class _AddWorkTimeButtonWidgetState extends State<AddWorkTimeButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () =>
          showDialog<String>(
            context: context,
            builder: (BuildContext context) =>
                AlertDialog(
                  title: Text('Task is Started at '+DateTime.now().hour.toString()+':'+DateTime.now().minute.toString()),
                  content: const Text('It is Correct?'),
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
                          final now = new DateTime.now();
                          //final start_time = new DateTime(now.year,now.month, now.day, now.hour, now.minute);
                          final start_time = new DateTime(now.year,now.month,now.day,now.hour, now.minute, now.second).toUtc();
                          TaskService().createWorkTime(widget.task,start_time.toString(),'').then((value) => widget.notifyParent());
                          Navigator.pop(context, 'Ok');
                        });
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
          ),
      child: Container(
        decoration: BoxDecoration(
            //color: Colors.green,
            //borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Icon(Icons.play_circle_fill,
            color: Colors.amber,
            size:100),
      ),
    );
  }
}