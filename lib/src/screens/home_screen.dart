import 'package:flutter/material.dart';
import 'package:andromina_crew_app/src/services/auth_service.dart';
import 'package:andromina_crew_app/src/datamodels/tasks_model.dart';
import 'package:andromina_crew_app/src/screens/drawer.dart';
import 'package:andromina_crew_app/src/services/task_service.dart';
import 'package:andromina_crew_app/src/screens/task_detail_screen_1.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Task>>? futureTask;
  Future<List<Task>>? todayTask;

  @override
  void initState(){
    super.initState();
    futureTask = TaskService().getFutureTask();
  }

  @override
  Widget build(BuildContext context) {
    futureTask = TaskService().getFutureTask();

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
        child: taskWidget(futureTask),
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
          if(task.length==0){
            return Container(
                alignment: Alignment.center,
                child: Text("No future tasks yet")
            );
          }else {
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
                              builder: (context) =>
                                  TaskDetailScreen1(task: task[index])
                          ),
                        );
                        print("Card Clicked named " + task[index].name);
                      },
                      child: Card(
                        margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                        elevation: 4.0,
                        color: Colors.white,
                        child: Column(
                          children: [
                            ListTile(
                              leading: StatusFlagWidget(task[index].status),
                              //onTap: () {},
                              title: Text(
                                task[index].name + " - " + task[index].company,
                                style: TextStyle(
                                  fontSize: 20,
                                ),),
                              subtitle: Row(
                                children: [
                                  Text(task[index].start_date != null
                                      ? task[index].start_date as String
                                      : ''),
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
          }
        } else if (snapshot.hasError) {
          return SizedBox.expand(
            child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Text("${snapshot.error}")
                    Text("Sorry, something went wrong:"),
                    Text("Please, check your internet connection")
                  ],
                )),
          );
        }
        return Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator()
        );

      },
    );
  }




}

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