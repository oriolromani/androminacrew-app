import 'package:flutter/material.dart';
import 'package:andromina_crew_app/responsive/constants.dart';
import 'package:andromina_crew_app/src/screens/drawer.dart';
import 'package:intl/intl.dart';

import '../src/services/task_service.dart';
import '../src/widgets/MyBoxWidget.dart';

class TabletScaffold extends StatelessWidget {
  const TabletScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      drawer: MyDrawer(),
      backgroundColor: myDefaultBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(8.0),
                color: Colors.blue,
                alignment:Alignment.centerLeft,
                child:Text("Welcome",
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    )
                ),
                width: double.infinity,
                height: 40,
              ),
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
                        crossAxisCount: 4),
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MyBox(index: index),
                      );
                    }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
