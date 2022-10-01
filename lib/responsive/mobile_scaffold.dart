import 'package:andromina_crew_app/responsive/constants.dart';
import 'package:andromina_crew_app/src/widgets/CalendarWidget.dart';
import 'package:andromina_crew_app/src/widgets/MyBoxWidget.dart';
import 'package:flutter/material.dart';
import 'package:andromina_crew_app/src/screens/drawer.dart';
import 'package:intl/intl.dart';

import '../src/datamodels/tasks_model.dart';
import '../src/datamodels/user_model.dart';
import '../src/services/task_service.dart';
import '../src/services/user_service.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({Key? key}) : super(key: key);

  @override
  _MobileScaffoldState createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      drawer: MyDrawer(),
      backgroundColor: myDefaultBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
            future: UserService().getUser(),
            builder: (BuildContext context,
                AsyncSnapshot snapshot){
              if (snapshot.hasData){
                User user = snapshot.data as User;
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    color: Colors.blue,
                    alignment:Alignment.centerLeft,
                    child:Text("Welcome "+user.username,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )
                    ),
                    width: double.infinity,
                    height: 40,
                  ),
                );
              }else{
                return Container();
              }
            },
          ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(8.0),
                color: Colors.blue,
                alignment:Alignment.center,
                child:StreamBuilder(
                    stream: Stream.periodic(const Duration(seconds: 1)),
                    builder: (context, snapshot) {
                    return Center(
                      child: Text(
                      DateFormat('dd/MM/yy  |  HH:mm:ss').format(DateTime.now()),
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                    },
                    ),
                width: double.infinity,
                height: 80,
              ),
            ),
            AspectRatio(
              aspectRatio: 1,
              child: SizedBox(
                width: double.infinity,
                child: GridView.builder(
                    itemCount: 4,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MyBox(index: index),
                      );
                    }
                ),
              ),
            )],
        ),
      ),
    );
  }
}
