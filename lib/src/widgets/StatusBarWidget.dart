import 'package:flutter/material.dart';

Widget StatusBarWidget(status) {
  if (status == "confirmed") {
    return Container(
        decoration: BoxDecoration(
            color: Colors.lightGreen,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.fromLTRB(0,0,0,20),
        child: Column(
          children: [
            Text("CONFIRMED")
          ],
        )
    );
  }else if (status == "proposed"){
    return Container(
        decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.fromLTRB(0,0,0,20),
        child: Column(
          children: [
            Text("PROPOSED")
          ],
        )
    );
  }else{
    return Container(
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.fromLTRB(0,0,0,20),
        child: Column(
          children: [
            Text("REJECTED")
          ],
        )
    );
  }
}