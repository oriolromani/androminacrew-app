import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

var myDefaultBackground = Colors.grey[300];

var myAppBar = AppBar(
  backgroundColor: Colors.grey[900],
);

var myClock = StreamBuilder(
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
);