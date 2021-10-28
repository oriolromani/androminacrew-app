import 'package:flutter/material.dart';
import 'package:andromina_crew_app/src/services/auth_service.dart';
import 'package:andromina_crew_app/src/datamodels/tasks_model.dart';
import 'package:andromina_crew_app/src/screens/drawer.dart';
import 'package:andromina_crew_app/src/services/task_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Task>>? futureTask;

  @override
  void initState(){
    super.initState();
    futureTask = TaskService().getTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events',
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
        child: taskWidget(),
      ),
      drawer: MyDrawer(),
    );
  }

  Widget taskWidget() {
    return FutureBuilder <List<Task>>(
      future: futureTask,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Task> task = snapshot.data as List<Task>;
          return
            ListView.builder(
                itemCount: task.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      print("Card Clicked named "+task[index].name);
                    },
                    child: Card(
                      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                      elevation: 4.0,
                      color: Colors.white,
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(Icons.warning,
                              color: Colors.red,
                              size: 40,
                            ),
                            //onTap: () {},
                            title: Text(task[index].name,
                            style: TextStyle(
                              fontSize: 20,
                            ),),
                            subtitle: Text(task[index].start_date!=null?task[index].start_date as String:''),
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
        return CircularProgressIndicator();
      },
    );
  }
}