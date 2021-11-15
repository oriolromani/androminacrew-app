import 'package:flutter/material.dart';
import 'package:andromina_crew_app/src/datamodels/tasks_model.dart';

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({Key? key, required this.task}) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: Text(task.name,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              backgroundColor: Colors.redAccent[100],
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.adjust)),
                  Tab(icon: Icon(Icons.construction)),
                  Tab(icon: Icon(Icons.group)),
                ],
              ),
            ),
            body: TabBarView(
                children: [
                  Container(
                    child: taskDetailWidget(),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.grey,
                            Colors.white,
                          ],
                        )
                    ),
                    child: materialDetailWidget(),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.grey,
                            Colors.white,
                          ],
                        )
                    ),
                    child: crewDetailWidget(),
                  ),
                ],
            ),
        ),
        );
  }

  Widget taskDetailWidget() {
    var status = 3;
    return Container(
        color: Colors.grey,
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Icon(Icons.access_time),
              Text(task.start_date),
              Icon(Icons.arrow_forward,
                size: 20),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.location_on),
              ],
            ),
            SizedBox(height: 50),
            TaskDetailButtonWidget(status)
          ],
        )
    );
  }

  Widget materialDetailWidget() {
    return Container(
        color: Colors.grey,
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            Text("MATERIAL")
          ],
        )
    );
  }

  Widget crewDetailWidget() {
    return Container(
        color: Colors.grey,
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            Text("CREW")
          ],
        )
    );
  }

  Widget TaskDetailButtonWidget(status) {
    if (status == 0) {
      //Status equal to Pending, return buttons for accept or refuse
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: Icon(Icons.check,
                size:100),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: Icon(Icons.close_rounded,
                size:100),
          ),
        ],
      );
    }else if(status == 1){
      //Status equal to accepted, return buttons for time management
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: Icon(Icons.access_time,
                size:100),
          ),
        ],
      );
    }else {
      //Status equal to refused, return no buttons
      return AlertButtonWidget();
    }
  }

  /// This is the stateless widget that the main application instantiates.

}

class AlertButtonWidget extends StatelessWidget {
  const AlertButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () =>
          showDialog<String>(
            context: context,
            builder: (BuildContext context) =>
                AlertDialog(
                  title: const Text('Are You Sure?'),
                  content: const Text('This action can not be undone'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                ),
          ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.lightGreen,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Icon(Icons.check,
            size:100),
      ),
    );
  }
}