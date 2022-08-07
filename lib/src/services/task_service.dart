import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api.dart';
import 'package:andromina_crew_app/src/datamodels/tasks_model.dart';
import 'package:intl/intl.dart';

class TaskService {
  static final SESSION = FlutterSession();

  Future <List<Task>> getAllTask() async {
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

  Future <Task> getTask(String id) async {
    dynamic _token = await FlutterSession().get("tokens");
    String url = Api.baseUrl+'/tasks/'+id;
    var response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json; charset=utf-8",
      "Access-Control-Allow-Origin": "*",
      'authorization': 'Token '+_token['token']
    }).timeout(const Duration(seconds: 15));
    if (response.statusCode == 200) {
      var task = Task.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      return task;
    } else {
      throw Exception('Unexpected error occurred!');
    }
  }

  Future <List<Task>> getFutureTask() async {
    dynamic _token = await FlutterSession().get("tokens");
    //dynamic _FCMtoken = await FlutterSession().get("FCMtokens");
    //print("ESTOY EN GET TASK Y IMPRIMO TOKENN");
    //print(_FCMtoken['token']);
    var formatter = new DateFormat('yyyy-MM-dd');
    String url = Api.baseUrl+'/tasks/?start_date__gte='+formatter.format(DateTime.now())+'&ordering=start_date';
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

  Future <List<Task>> getOldTask() async {
    dynamic _token = await FlutterSession().get("tokens");
    var formatter = new DateFormat('yyyy-MM-dd');
    String url = Api.baseUrl+'/tasks/?start_date__lt='+formatter.format(DateTime.now())+'&ordering=-start_date';
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

  Future <List<Task>> getTodayTask() async {
    dynamic _token = await FlutterSession().get("tokens");
    var formatter = new DateFormat('yyyy-MM-dd');
    String url = Api.baseUrl+'/tasks/?start_date='+formatter.format(DateTime.now())+'&status=2';
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
    DateTime c_date = format.parse(task.date);
    task.date = DateFormat("yyyy-MM-dd").format(c_date);
    var body = json.encode(task.toJson());
    print(body);
    dynamic _token = await FlutterSession().get("tokens");
    String url = Api.baseUrl+'/tasks/'+task.uid.toString()+'/';
    var response = await http.put(Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          'authorization': 'Token '+_token['token']
        },
        body: body)
        .timeout(const Duration(seconds: 15));
    print("HEELLO 2022");
    print(response.body);
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
    DateTime date = format.parse(task.date);
    task.date = DateFormat("yyyy-MM-dd").format(date);
    var body = json.encode(task.toJson());
    dynamic _token = await FlutterSession().get("tokens");
    String url = Api.baseUrl+'/tasks/'+task.uid.toString()+'/';
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

  Future<dynamic> createWorkTime(Task task, String startTime, String endTime) async {
    Map data = {
      'start_time':  startTime
    };
    if (endTime != ""){
      data['end_time']=endTime;
    }
    var body = json.encode(data);
    print(body);
    dynamic _token = await FlutterSession().get("tokens");
    String url = Api.baseUrl+'/tasks/'+task.uid.toString()+'/work-time-creation/';
    var response = await http.post(Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          'authorization': 'Token '+_token['token']
        },
        body: body)
        .timeout(const Duration(seconds: 15));
    print(response.body);
    if (response.statusCode == 200) {
      return Task.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
    } else {
      return 'ERROR: Could not update the status';
    }
  }

  Future<dynamic> updateWorkTime(Task task, int id, String startTime, String endTime) async {
    Map data = {
    };
    if (endTime != ""){
      data['end_time']=endTime;
    }
    if (startTime != ""){
      data['start_time']=startTime;
    }
    var body = json.encode(data);
    dynamic _token = await FlutterSession().get("tokens");
    String url = Api.baseUrl+'/tasks/'+task.uid.toString()+'/work-time/'+id.toString()+'/';
    var response = await http.put(Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          'authorization': 'Token '+_token['token']
        },
        body: body)
        .timeout(const Duration(seconds: 15));
    print(response.body);
    if (response.statusCode == 200) {
      return Task.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
    } else {
      return 'ERROR: Could not update the status';
    }
  }

}