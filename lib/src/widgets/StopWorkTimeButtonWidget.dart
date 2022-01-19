import 'package:flutter/material.dart';
import 'package:andromina_crew_app/src/services/task_service.dart';
import 'package:andromina_crew_app/src/datamodels/tasks_model.dart';

class StopWorkTimeButtonWidget extends StatefulWidget {
  const StopWorkTimeButtonWidget({Key? key, required this.task, required this.notifyParent}) : super(key: key);
  final Task task;
  final Function notifyParent;

  @override
  _StopWorkTimeButtonWidgetState createState() => _StopWorkTimeButtonWidgetState();
}

class _StopWorkTimeButtonWidgetState extends State<StopWorkTimeButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () =>
          showDialog<String>(
            context: context,
            builder: (BuildContext context) =>
                AlertDialog(
                  title: Text('Task is Stopped at '+DateTime.now().hour.toString()+':'+DateTime.now().minute.toString()),
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
                          final end_time = new DateTime(now.year,now.month, now.day, now.hour, now.minute);
                          final index = widget.task.times.length-1;
                          TaskService().updateWorkTime(widget.task,widget.task.times[index].id,"",end_time.toString());
                          widget.notifyParent();
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
            //borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Icon(Icons.pause_circle_filled,
            color: Colors.amber,
            size:180),
      ),
    );
  }
}