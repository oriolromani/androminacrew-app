import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api.dart';
import 'package:andromina_crew_app/src/datamodels/tasks_model.dart';
import 'package:intl/intl.dart';

class TaskService {
  static final SESSION = FlutterSession();

  Future <List<Task>> getTask() async {
    dynamic _token = await FlutterSession().get("tokens");
    String url = Api.baseUrl+'/tasks/';
    var response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json; charset=utf-8",
      "Access-Control-Allow-Origin": "*",
      'authorization': 'Token '+_token['token']
    }).timeout(const Duration(seconds: 15));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      return jsonResponse.map((data) => new Task.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occurred!');
    }
  }

  Future<dynamic> acceptTask(Task task) async {
    task.status='confirmed';
    DateFormat format = new DateFormat("MMMM dd, yyyy");
    DateTime date = format.parse(task.start_date);
    task.start_date = DateFormat("yyyy-MM-dd").format(date);
    var body = json.encode(task.toJson());
    dynamic _token = await FlutterSession().get("tokens");
    String url = Api.baseUrl+'/tasks/'+task.uid.toString();
    var response = await http.put(Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          'authorization': 'Token '+_token['token']
        },
        body: body)
        .timeout(const Duration(seconds: 15));
    if (response.statusCode == 200) {
      return Task.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
    } else {
      return 'ERROR: Could not update the status';
    }
  }

  Future<dynamic> rejectTask(Task task) async {
    task.status='rejected';
    DateFormat format = new DateFormat("MMMM dd, yyyy");
    DateTime date = format.parse(task.start_date);
    task.start_date = DateFormat("yyyy-MM-dd").format(date);
    var body = json.encode(task.toJson());
    dynamic _token = await FlutterSession().get("tokens");
    String url = Api.baseUrl+'/tasks/'+task.uid.toString();
    var response = await http.put(Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          'authorization': 'Token '+_token['token']
        },
        body: body)
        .timeout(const Duration(seconds: 15));
    if (response.statusCode == 200) {
      return Task.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
    } else {
      return 'ERROR: Could not update the status';
    }
  }

}