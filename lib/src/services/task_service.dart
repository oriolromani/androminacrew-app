import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api.dart';
import 'package:andromina_crew_app/src/datamodels/tasks_model.dart';

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
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => new Task.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occurred!');
    }
  }
}