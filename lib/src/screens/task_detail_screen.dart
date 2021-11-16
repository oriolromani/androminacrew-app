import 'package:flutter/material.dart';
import 'package:andromina_crew_app/src/datamodels/tasks_model.dart';
import 'package:andromina_crew_app/src/widgets/ConfirmTaskButtonWidget.dart';

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
                    child: taskDetailWidget(task),
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

  Widget taskDetailWidget(Task task) {
    var status = task.status;
    return Container(
        color: Colors.grey,
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Icon(Icons.access_time),
              Text(" "+task.start_date),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.radio_button_on),
                Text(" "+task.status)
              ],
            ),
            SizedBox(height: 50),
            TaskDetailButtonWidget(status, task)
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

  Widget TaskDetailButtonWidget(status, task) {
    if (status == "proposed") {
      //Status equal to proposed, return buttons for accept or refuse
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          ConfirmTaskButtonWidget(task: task),
          RefuseButtonWidget(),
        ],
      );
    }else if(status == "confirmed"){
      //Status equal to confirmed, return buttons for time management
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TimeButtonWidget(),
        ],
      );
    }else {
      //Status equal to refused, return no buttons
      return Row();
    }
  }

  /// This is the stateless widget that the main application instantiates.

}

class ConfirmButtonWidget extends StatelessWidget {
  const ConfirmButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () =>
          showDialog<String>(
            context: context,
            builder: (BuildContext context) =>
                AlertDialog(
                  title: const Text('You are about to ACCEPT a proposal'),
                  content: const Text('Are you sure?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => {
                        Navigator.pop(context, 'Cancel'),
                      },
                    child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => {
                        Navigator.pop(context, 'OK')
                      },
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

class RefuseButtonWidget extends StatelessWidget {
  const RefuseButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () =>
          showDialog<String>(
            context: context,
            builder: (BuildContext context) =>
                AlertDialog(
                  title: const Text('You are about to REFUSE a proposal'),
                  content: const Text('Are you sure?'),
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
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Icon(Icons.close_rounded,
            size:100),
      ),
    );
  }
}

class TimeButtonWidget extends StatelessWidget {
  const TimeButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () =>
          showDialog<String>(
            context: context,
            builder: (BuildContext context) =>
                AlertDialog(
                  title: const Text('You are about to Enter a Time'),
                  content: const Text('Are you sure?'),
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
            color: Colors.orange,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Icon(Icons.access_time,
            size:100),
      ),
    );
  }
}