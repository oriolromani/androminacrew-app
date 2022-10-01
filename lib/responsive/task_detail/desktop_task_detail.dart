import 'package:andromina_crew_app/responsive/constants.dart';
import 'package:andromina_crew_app/src/widgets/CalendarWidget.dart';
import 'package:flutter/material.dart';
import 'package:andromina_crew_app/src/screens/drawer.dart';

import '../../src/datamodels/tasks_model.dart';
import '../../src/services/task_service.dart';
import '../../src/widgets/ListWorkTimeWidget.dart';
import '../../src/widgets/TaskDetailButtonWidget.dart';
import '../../src/widgets/TotalTimeWidget.dart';


class DesktopTaskDetail extends StatefulWidget {
  final task;
  const DesktopTaskDetail({Key? key, required this.task}) : super(key: key);

  @override
  _DesktopTaskDetailState createState() => _DesktopTaskDetailState();
}

class _DesktopTaskDetailState extends State<DesktopTaskDetail> {
  refresh(){
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myDefaultBackground,
      appBar: myAppBar,
      body: Row(
        children: [
          //Open Drawer
          SizedBox(
            width: 240,
            child: MyDrawer(),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                children: [
                  FutureBuilder(
                    future: TaskService().getTask(widget.task.uid),
                    builder: (BuildContext context,
                        AsyncSnapshot snapshot) {
                      if (snapshot.hasData){
                        Task task = snapshot.data as Task;
                        return Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Container(
                                    padding: EdgeInsets.all(8.0),
                                    color: Colors.blue,
                                    alignment:Alignment.topCenter,
                                    child:StreamBuilder(
                                      stream: Stream.periodic(const Duration(seconds: 1)),
                                      builder: (context, snapshot) {
                                        return Center(
                                            child: TotalTimeWidget(task)
                                        );
                                      },
                                    ),
                                    width: double.infinity,
                                    height: 80,
                                  ),
                                ),
                                TaskDetailButtonWidget(task,refresh)
                              ],
                            )
                        );
                      }else{
                        return Container(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator()
                        );
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      color: Colors.blue,
                      alignment:Alignment.center,
                      child:Table(
                        border: TableBorder(
                          horizontalInside: BorderSide(width: 0, color: Colors.white60, style: BorderStyle.solid),
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
                                  child: Text(widget.task.name),
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
                                  child: Text(widget.task.category ?? ''),
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
                                  child: Text(widget.task.gig!.name ?? ''),
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
                                  child: Text(widget.task.gig!.venue ?? ''),
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
                                  child: Text(widget.task.date),
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
                                  child: Text(widget.task.start_time ?? ''),
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
                                  child: Text(widget.task.end_time ?? ''),
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
                                  child: Text(widget.task.pay_per_day.toString()+ " €/Day - "+widget.task.pay_per_hour.toString() +" €/hour"),
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
                                  child: Text(widget.task.user),
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
                                  child: Text(widget.task.company.name),
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
                                  child: Text(widget.task.status),
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                      width: double.infinity,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: TaskService().getTask(widget.task.uid),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if (snapshot.hasData) {
                  Task task = snapshot.data as Task;
                  return Container(
                    color: Colors.grey[350],
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Container(
                            child: Text("PRESENCE",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Container(
                            width: 500,
                            height:500,
                            child:SingleChildScrollView(
                              child: ListView.builder(
                                  itemCount: task.times.length,
                                  shrinkWrap: true,
                                  itemBuilder: (BuildContext context, int index){
                                    return ListWorkTimeWidget(context, task, index, refresh);
                                    //return ListTile();
                                  }
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }else {
                  return Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator()
                  );
                }
              }
            )
          )

        ],
      ),

    );
  }
}
