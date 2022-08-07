//import 'dart:ffi';

import 'date_model.dart';
import 'task_times_model.dart';
import 'task_time_model.dart';
import 'gig_model.dart';
import 'company_model.dart';
import 'dart:convert';

class Task {
  //final int id;
  String uid;
  String name;
  GigModel? gig;
  String allocation_line_uid;
  int task_time_type;
  String date;
  String start_time;
  String end_time;
  String status;
  double pay_per_day;
  double pay_per_hour;
  String category;
  DateTime created_at;
  DateTime updated_at;
  CompanyModel company;
  String user;
  List<TaskTimesModel> times;


  Task(
      {required this.uid,
        required this.name,
        required this.gig,
        required this.allocation_line_uid,
        required this.task_time_type,
        required this.date,
        required this.start_time,
        required this.end_time,
        required this.status,
        required this.pay_per_day,
        required this.pay_per_hour,
        required this.category,
        required this.created_at,
        required this.updated_at,
        required this.company,
        required this.user,
        required this.times});


  Task.fromJson(Map<String, dynamic> json) :
        uid = json['uid'],
        name = json['name'],
        gig = GigModel.fromJson(json['gig']),
        allocation_line_uid = json['allocation_line_uid'],
        task_time_type = json['task_time_type'],
        date = DateModel.formatDate(json['date']),
        start_time = json['start_time'],
        end_time = json['end_time'],
        status = json['status'],
        pay_per_day = json['pay_per_day'],
        pay_per_hour = json['pay_per_hour'],
        category = json['category'],
        created_at = DateTime.parse(json['created_at']),
        updated_at = DateTime.parse(json['updated_at']),
        company = CompanyModel.fromJson(json['company']),
        user = json['user'],
        times = (json['times'] as List).map((e) => TaskTimesModel.fromJson(e)).toList();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['gig'] = this.gig;
    data['date'] = this.date == null ? null : this.date.toString();
    data['company'] = this.company;
    data['status'] = this.status;
    data['user'] = this.user;
    data['times'] =
      json.encode(this.times.map((e) => e.toJson()).toList());
    return data;
  }
}