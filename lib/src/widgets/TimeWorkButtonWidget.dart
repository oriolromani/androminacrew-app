import 'package:flutter/material.dart';
import 'package:andromina_crew_app/src/services/task_service.dart';
import 'package:andromina_crew_app/src/datamodels/tasks_model.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class TimeWorkButtonWidget extends StatefulWidget {
  const TimeWorkButtonWidget({Key? key, required this.task}) : super(key: key);
  final Task task;

  @override
  _TimeWorkButtonWidgetState createState() => _TimeWorkButtonWidgetState();
}

class _TimeWorkButtonWidgetState extends State<TimeWorkButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        DatePicker.showTime12hPicker(context, showTitleActions: true,
            onChanged: (date) {
              print('change $date in time zone ' +
                  date.timeZoneOffset.inHours.toString());
            }, onConfirm: (date) {
              print('confirm $date');
              TaskService().createWorkTime(widget.task, date.toString());
            }, currentTime: DateTime.now());
      },

          /*
          showDialog<String>(
            context: context,
            builder: (BuildContext context) =>
                AlertDialog(
                  title: const Text('You are about to ENTER a time'),
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
                          //TaskService().rejectTask(widget.task);
                          Navigator.pop(context, 'ok');
                        });
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
          ),
          */
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