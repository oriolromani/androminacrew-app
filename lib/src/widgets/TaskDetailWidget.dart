import 'package:flutter/material.dart';
import 'package:andromina_crew_app/src/datamodels/tasks_model.dart';
import 'package:andromina_crew_app/src/widgets/StatusBarWidget.dart';
import 'package:andromina_crew_app/src/widgets/StatusBarWidget_1.dart';
import 'package:andromina_crew_app/src/widgets/TaskDetailButtonWidget.dart';
import 'package:andromina_crew_app/src/widgets/PostedTimesWidget.dart';
import 'package:timeline_tile/timeline_tile.dart';

Widget taskDetailWidget(Task task, Function refresh) {

  var status = task.status;
  var gig_name = '';
  return Expanded(
    child: Container(
      color: Colors.white,
      margin: EdgeInsets.all(30),
      child: SingleChildScrollView(
          child: Column(
            children: [
              Table(
                border: TableBorder(
                  horizontalInside: BorderSide(width: 0, color: Colors.grey, style: BorderStyle.solid),
                  //verticalInside: BorderSide(width: 1, color: Colors.grey, style: BorderStyle.solid),
                  //borderRadius: BorderRadius.circular(10)
                ),
                columnWidths: const <int, TableColumnWidth>{
                  0: FixedColumnWidth(150),
                  1: FlexColumnWidth(),
                  //1: FixedColumnWidth(250),
                },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: <TableRow>[
                    TableRow(
                      children: <Widget>[
                        Container(
                          height: 70,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(task.gig!.name,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child:Align(
                          alignment: Alignment.centerLeft,
                          child: Text(task.date),
                        ),
                      ),
                    ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Name"),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child:Align(
                            alignment: Alignment.centerLeft,
                            child: Text(task.name),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Category"),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child:Align(
                            alignment: Alignment.centerLeft,
                            child: Text(task.category ?? ''),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Gig's Name"),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child:Align(
                            alignment: Alignment.centerLeft,
                            child: Text(task.gig!.name ?? ''),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Gig's Venue"),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child:Align(
                            alignment: Alignment.centerLeft,
                            child: Text(task.gig!.venue ?? ''),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Date"),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child:Align(
                                alignment: Alignment.centerLeft,
                                child: Text(task.date),
                              ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Start Time"),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child:Align(
                            alignment: Alignment.centerLeft,
                            child: Text(task.start_time ?? ''),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("End Time"),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child:Align(
                            alignment: Alignment.centerLeft,
                            child: Text(task.end_time ?? ''),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("€"),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child:Align(
                            alignment: Alignment.centerLeft,
                            child: Text(task.pay_per_day.toString()+ " €/Day - "+task.pay_per_hour.toString() +" €/hour"),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("User UID"),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child:Align(
                            alignment: Alignment.centerLeft,
                            child: Text(task.user),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Company"),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child:Align(
                            alignment: Alignment.centerLeft,
                            child: Text(task.company.name),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Status"),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child:Align(
                            alignment: Alignment.centerLeft,
                            child: Text(task.status),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
              SizedBox(height: 20),
              TaskDetailButtonWidget(task, refresh)
            ],
          ),
          ),


        /*Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("JOB OFFER"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.access_time),
                  Text(" "+task.date),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.radio_button_on),
                  Text(" "+task.company.name)
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.alarm),
                  Text("Worked Time: "+(task.time.hours).toString()+" hours and "+(task.time.minutes).toString()+" minutes")
                ],
              ),
              SizedBox(height: 100),
              TaskDetailButtonWidget(task, refresh),
            ],
          )*/
      ),
  );
  //);
}