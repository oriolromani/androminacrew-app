import 'package:flutter/material.dart';
import 'package:andromina_crew_app/src/datamodels/tasks_model.dart';
import 'package:andromina_crew_app/src/services/task_service.dart';

Widget ListWorkTimeWidget(context, Task task, int index, Function refresh){

  Future selectedTime(BuildContext context, Task task, int id, String datetime, bool startTime) async{
    String time = datetime.substring(11,16);
    String date = datetime.substring(0,10);
    TimeOfDay _time = TimeOfDay(hour:int.parse(time.split(":")[0]),minute: int.parse(time.split(":")[1]));
    var _pickedTime = await showTimePicker(
        context: context,
        initialTime: _time);
    if (_pickedTime != null){
      String _pickedDateTime = date +" "+ _pickedTime.toString().substring(10,15);
      //String _pickedDateTime = date +" "+ _pickedTime.toString();
      DateTime _formatTime = DateTime.parse(_pickedDateTime);
      if(startTime){
        TaskService().updateWorkTime(task, id, _formatTime.toString(), "");
        refresh();
      }else{
        TaskService().updateWorkTime(task, id, "", _formatTime.toString());
        refresh();
      }
    }
  }

  if (task.times[index].end_time!=null) {
    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("from: " + task.times[index].start_time.substring(11, 16)),
          SizedBox(
            width: 5,
          ),
          IconButton(
              icon: Icon(Icons.edit,
                  size: 15),
              onPressed: () {
                selectedTime(context, task, task.times[index].id,
                    task.times[index].start_time, true);
              }
          ),
          SizedBox(
            width: 20,
          ),
          Text(task.times[index].end_time != null ? " to: " +
              task.times[index].end_time.substring(11, 16) : ''),
          IconButton(
              icon: Icon(Icons.edit,
                  size: 15),
              onPressed: () {
                selectedTime(context, task, task.times[index].id,
                    task.times[index].end_time, false);
              }
          )
        ],
      ),
    );
  }else{
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("from: "+task.times[index].start_time.substring(11,16))
      ],
    );
  }
}