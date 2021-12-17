import 'package:flutter/material.dart';
import 'package:andromina_crew_app/src/services/auth_service.dart';
import 'package:andromina_crew_app/src/datamodels/tasks_model.dart';
import 'package:andromina_crew_app/src/screens/drawer.dart';
import 'package:andromina_crew_app/src/services/task_service.dart';
import 'package:andromina_crew_app/src/screens/task_detail_screen.dart';

class OldTaskScreen extends StatefulWidget {
  @override
  _OldTaskScreenState createState() => _OldTaskScreenState();
}

class _OldTaskScreenState extends State<OldTaskScreen> {
  Future<List<Task>>? futureTask;

  @override
  void initState(){
    super.initState();
    futureTask = TaskService().getOldTask();
  }

  @override
  Widget build(BuildContext context) {
    futureTask = TaskService().getOldTask();

    return Scaffold(
      appBar: AppBar(
        title: Text('Historical',
        style: TextStyle(
          color: Colors.black,
        ),
        ),
        elevation: 4,
        backgroundColor: Colors.redAccent[100],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.grey,
                Colors.grey,
              ],
            )
        ),
        child: taskWidget(futureTask)

      ),
      drawer: MyDrawer(),
    );
  }

  Widget taskWidget(futureTask) {
      return FutureBuilder <List<Task>>(
      future: futureTask,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Task> task = snapshot.data as List<Task>;
          return
            ListView.builder(
                itemCount: task.length,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TaskDetailScreen(task: task[index])
                          ),
                      );
                      print("Card Clicked named "+task[index].name);
                    },
                    child: Card(
                      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                      elevation: 4.0,
                      color: Colors.amber[100],
                      child: Column(
                        children: [
                          ListTile(
                            //leading: StatusFlagWidget(task[index].status),
                            /*leading: Icon(Icons.check_circle,
                            color: Colors.green,
                            size: 40),*/
                            //onTap: () {},
                            title: Text(task[index].name + " - " + task[index].company,
                            style: TextStyle(
                              fontSize: 20,
                            ),),
                            subtitle: Row(
                              children:[
                                Text(task[index].start_date!=null?task[index].start_date as String:''),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.add_circle_rounded,
                                size: 30,
                                color: Colors.redAccent[100],
                              ),
                              SizedBox(width: 8),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }
            );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator()
        );

      },
    );
  }




}
/*
Widget StatusFlagWidget(status) {
  if (status == "proposed") {
    //Status equal to Pending, return buttons for accept or refuse
    return Icon(Icons.radio_button_on,
      color: Colors.amber,
      size: 40,
    );
  }else if(status == "confirmed"){
    //Status equal to accepted, return buttons for time management
    return Icon(Icons.radio_button_on,
      color: Colors.green,
      size: 40,
    );
  }else if(status == "rejected") {
    //Status equal to accepted, return buttons for time management
    return Icon(Icons.radio_button_on,
      color: Colors.red,
      size: 40,
    );
  }else{
    return Icon(Icons.flag_rounded,
      color: Colors.grey,
      size: 40,
    );
  }
}
*/
