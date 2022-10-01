import 'package:flutter/material.dart';
import 'package:andromina_crew_app/src/datamodels/tasks_model.dart';
import 'package:andromina_crew_app/src/widgets/ListWorkTimeWidget.dart';


Widget PostedTimesWidget(Task task, Function refresh) {
  if (task.times.length>0){
    return  Container(
      color: Colors.indigo,
      padding: EdgeInsets.fromLTRB(50,10,50,10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("",
              style: TextStyle(
                fontSize: 70,
                color: Colors.indigo
              ),)
            ],
          ),
          Divider(
            color: Colors.black,
            height: 20,
            thickness: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Text("Posted Times:")
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 500,
                height:500,
                color: Colors.red,
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
              SingleChildScrollView(
              physics: ScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height:150,
                      child: const DecoratedBox(
                        decoration: const BoxDecoration(
                            color: Colors.red
                        ),
                      )
                    ),
                  ],
                ),
              )
              //ListView.builder(
              //    itemCount: task.times.length,
              //    itemBuilder: (BuildContext context, int index){
              //      return ListWorkTimeWidget(context, task, index, refresh);
              //        return Text("Hello");
              //    }
              //),
            ],
          ),
        ],
      ),
    );
  }else{
    return Container(
      padding: EdgeInsets.fromLTRB(50,10,50,10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("00:00",
                style: TextStyle(
                    fontSize: 70,
                    color: Colors.indigo
                ),)
            ],
          ),
          Divider(
            color: Colors.black,
            height: 20,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}