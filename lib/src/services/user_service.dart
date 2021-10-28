import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api.dart';
import 'package:andromina_crew_app/src/services/auth_service.dart';
import 'package:andromina_crew_app/src/datamodels/user_model.dart';

class UserService {
  static final SESSION = FlutterSession();

  Future<User> getUser() async {
    dynamic _token = await FlutterSession().get("tokens");
    String url = Api.baseUrl+'/users/detail/';
    var response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json; charset=utf-8",
      "Access-Control-Allow-Origin": "*",
      'authorization': 'Token '+_token['token']
    }).timeout(const Duration(seconds: 15));
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw response.statusCode;
    }

  }
}

/*
class _UserData {
  String token, refreshToken, clientId;
  _AuthData(this.token, this.refreshToken, {this.clientId});

  // toJson
  // required by Session lib
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['token'] = token;
    data['refreshToken'] = refreshToken;
    data['clientId'] = clientId;
    return data;
  }
}
*/