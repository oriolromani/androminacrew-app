import 'date_model.dart';
import 'task_times_model.dart';
import 'dart:convert';

class Task {
  //final int id;
  String uid;
  String name;
  String start_date;
  String company;
  String status;
  String user;
  List<TaskTimesModel> times;
  int time;


  Task(
      {required this.uid,
        required this.name,
        required this.start_date,
        required this.company,
        required this.status,
        required this.user,
        required this.times,
        required this.time});
/*
  Task.initial() :
        id = 0,
        name = '',
        start_date = DateModel(dateTime: DateTime.now()),
        end_date = DateModel(dateTime: DateTime.now());
*/
  Task.fromJson(Map<String, dynamic> json) :
        uid = json['uid'],
        name = json['name'],
        start_date = DateModel.formatDate(json['start_date']),
        company = json['company'],
        status = json['status'],
        user = json['user'],
        times = (json['times'] as List).map((e) => TaskTimesModel.fromJson(e)).toList(),
        time = json['time'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['start_date'] = this.start_date == null ? null : this.start_date.toString();
    data['company'] = this.company;
    data['status'] = this.status;
    data['user'] = this.user;
    data['times'] =
      json.encode(this.times.map((e) => e.toJson()).toList());
    data['time'] = this.time;
    return data;
  }
}