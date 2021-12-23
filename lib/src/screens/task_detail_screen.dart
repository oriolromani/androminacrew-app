// import 'package:flutter/material.dart';
// import 'package:andromina_crew_app/src/datamodels/tasks_model.dart';
// import 'package:andromina_crew_app/src/widgets/ConfirmTaskButtonWidget.dart';
// import 'package:andromina_crew_app/src/widgets/RejectTaskButtonWidget.dart';
// import 'package:andromina_crew_app/src/widgets/TimeWorkButtonWidget.dart';
// import 'package:andromina_crew_app/src/widgets/FakeTimeWorkButtonWidget.dart';
// import 'package:intl/intl.dart';
// import 'package:andromina_crew_app/src/services/task_service.dart';
//
// class TaskDetailScreen extends StatelessWidget {
//   TaskDetailScreen({Key? key, required this.task}) : super(key: key);
//   Task task;
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//         length: 3,
//         child: Scaffold(
//             appBar: AppBar(
//               title: Text(task.name,
//                 style: TextStyle(
//                   color: Colors.black,
//                 ),
//               ),
//               backgroundColor: Colors.redAccent[100],
//               bottom: TabBar(
//                 tabs: [
//                   Tab(icon: Icon(Icons.adjust)),
//                   Tab(icon: Icon(Icons.construction)),
//                   Tab(icon: Icon(Icons.group)),
//                 ],
//               ),
//             ),
//             body: TabBarView(
//                 children: [
//                   Container(
//                     child: taskDetailWidget(task),
//                   ),
//                   Container(
//                     alignment: Alignment.topCenter,
//                     decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                           colors: [
//                             Colors.grey,
//                             Colors.white,
//                           ],
//                         )
//                     ),
//                     child: materialDetailWidget(),
//                   ),
//                   Container(
//                     alignment: Alignment.topCenter,
//                     decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                           colors: [
//                             Colors.grey,
//                             Colors.white,
//                           ],
//                         )
//                     ),
//                     child: crewDetailWidget(),
//                   ),
//                 ],
//             ),
//         ),
//         );
//   }
//
//   Widget taskDetailWidget(Task task) {
//     var status = task.status;
//     return Container(
//         color: Colors.grey,
//         alignment: Alignment.topCenter,
//         padding: EdgeInsets.all(50),
//         child: Column(
//           children: [
//             StatusBarWidget(task.status),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//               Icon(Icons.access_time),
//               Text(" "+task.start_date),
//               ],
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Icon(Icons.radio_button_on),
//                 Text(" "+task.company)
//               ],
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Icon(Icons.alarm),
//                 Text("Worked Time: "+(task.time).toString()+" minutes")
//               ],
//             ),
//             SizedBox(height: 50),
//             TaskDetailButtonWidget(status, task),
//             SizedBox(height: 50),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text("Posted Times:")
//               ],
//             ),
//             SizedBox(
//               height: 100,
//               child: ListView.builder(
//                   itemCount: task.times.length,
//                   itemBuilder: (BuildContext context, int index){
//                     return Text("from "+task.times[index].start_time+" to "+task.times[index].end_time);
//                   }
//               ),
//             ),
//           ],
//         )
//     );
//   }
//
//   Widget materialDetailWidget() {
//     return Container(
//         color: Colors.grey,
//         alignment: Alignment.topCenter,
//         padding: EdgeInsets.all(50),
//         child: Column(
//           children: [
//             Text("MATERIAL")
//           ],
//         )
//     );
//   }
//
//   Widget crewDetailWidget() {
//     return Container(
//         color: Colors.grey,
//         alignment: Alignment.topCenter,
//         padding: EdgeInsets.all(50),
//         child: Column(
//           children: [
//             Text("CREW")
//           ],
//         )
//     );
//   }
//   Widget StatusBarWidget(status) {
//     if (status == "confirmed") {
//       return Container(
//           decoration: BoxDecoration(
//               color: Colors.lightGreen,
//               borderRadius: BorderRadius.all(Radius.circular(20))
//           ),
//           alignment: Alignment.topCenter,
//           padding: EdgeInsets.all(10),
//           margin: EdgeInsets.fromLTRB(0,0,0,20),
//           child: Column(
//             children: [
//               Text("CONFIRMED")
//             ],
//           )
//       );
//     }else if (status == "proposed"){
//       return Container(
//           decoration: BoxDecoration(
//               color: Colors.amber,
//               borderRadius: BorderRadius.all(Radius.circular(20))
//           ),
//           alignment: Alignment.topCenter,
//           padding: EdgeInsets.all(10),
//           margin: EdgeInsets.fromLTRB(0,0,0,20),
//           child: Column(
//             children: [
//               Text("PROPOSED")
//             ],
//           )
//       );
//     }else{
//       return Container(
//           decoration: BoxDecoration(
//               color: Colors.red,
//               borderRadius: BorderRadius.all(Radius.circular(20))
//           ),
//           alignment: Alignment.topCenter,
//           padding: EdgeInsets.all(10),
//           margin: EdgeInsets.fromLTRB(0,0,0,20),
//           child: Column(
//             children: [
//               Text("REJECTED")
//             ],
//           )
//       );
//     }
//   }
//
//   Widget TaskDetailButtonWidget(status, task) {
//     //var format = DateFormat("yyyy-MM-dd");
//     var today = DateFormat.yMMMMd('en_US').format(DateTime.now()).toString();
//     if (status == "proposed") {
//       //Status equal to proposed, return buttons for accept or refuse
//       return Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//
//           ConfirmTaskButtonWidget(task: task),
//           RejectTaskButtonWidget(task: task),
//         ],
//       );
//     }else if(status == "confirmed"){
//       //Status equal to confirmed, return buttons for time management
//       if (task.start_date == today){
//         return Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             TimeWorkButtonWidget(task: task),
//           ],
//         );
//       }else{
//         return Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             FakeTimeWorkButtonWidget(),
//           ],
//         );
//       }
//     }else {
//       //Status equal to refused, return no buttons
//       return Row();
//     }
//   }
// }