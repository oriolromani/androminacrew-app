
import 'package:flutter/material.dart';


Widget TotalTimeWidget(task) {
    //Count Finished Time Slots
    int ttime = 0;
    int index = 0;
    int d, h, m, s;
    if (task.times.length>0) {
      for (var i = 0; i < task.times.length; i++) {
        if (task.times[i].end_time != null) {
          DateTime start = DateTime.parse(task.times[i].start_time);
          DateTime end = DateTime.parse(task.times[i].end_time);
          ttime = ttime + end
              .difference(start)
              .inSeconds;
        }else {
          index = i;
        }
      }

      //Count unfinished Time Slots
      if (task.times[index].end_time == null) {
        DateTime start = DateTime.parse(
            task.times[index].start_time);
        DateTime end = DateTime.now();
        ttime = ttime + end
            .difference(start)
            .inSeconds;
      }
    }


    h = ttime ~/ 3600;

    d = h ~/ 24;
    if (d>0){
      h = h - d * 24;
    }

    m = ((ttime - (h * 3600) - (d * 86400))) ~/ 60;

    s = ttime - (h * 3600) - (m * 60) - (d * 86400);

    String daysLeft = d.toString();
    String hourLeft = h.toString().length < 2 ? "0" + h.toString() : h.toString();
    String minuteLeft = m.toString().length < 2 ? "0" + m.toString() : m.toString();
    String secondsLeft = s.toString().length < 2 ? "0" + s.toString() : s.toString();

    return Text(d!=0?"Total Time: "+daysLeft+"D + "+hourLeft+":"+minuteLeft+":"+secondsLeft:"Total Time: "+hourLeft+":"+minuteLeft+":"+secondsLeft,
        //DateFormat('dd/MM/yy  |  HH:mm:ss').format(DateTime.now()),
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        )
    );
}