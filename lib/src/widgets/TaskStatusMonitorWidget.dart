import 'package:flutter/material.dart';

Widget TaskStatusMonitorWidget(String status){
  if (status == "not started"){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(
          Icons.circle,
          color: Colors.red,
          size: 15,
        ),
        Icon(
          Icons.circle,
          color: Colors.grey,
          size: 15,
        ),
        Icon(
          Icons.circle,
          color: Colors.grey,
          size: 15,
        ),
      ],
    );
  }else if (status == "in process"){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(
          Icons.circle,
          color: Colors.grey,
          size: 15,
        ),
        Icon(
          Icons.circle,
          color: Colors.orange,
          size: 15,
        ),
        Icon(
          Icons.circle,
          color: Colors.grey,
          size: 15,
        ),
      ],
    );
  }else if (status == "stopped"){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(
          Icons.circle,
          color: Colors.grey,
          size: 15,
        ),
        Icon(
          Icons.circle,
          color: Colors.grey,
          size: 15,
        ),
        Icon(
          Icons.circle,
          color: Colors.green,
          size: 15,
        ),
      ],
    );
  }
  return Container();
}