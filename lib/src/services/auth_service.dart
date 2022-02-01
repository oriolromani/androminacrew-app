import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AuthService {
  static final SESSION = FlutterSession();

  Future<dynamic> login(userName, userPassword) async {
    //return UserCredentials.fake();
    Map data = {"username": userName, "password": userPassword,};
    //var body = json.encode(data);
    var body = jsonEncode(data);

    ///Capture FCM Token
    /*if(!kIsWeb) {
      late FirebaseMessaging messaging;
      messaging = FirebaseMessaging.instance;
      messaging.getToken().then((value){
        print(value);
      });
    }*/
    //var body = utf8.encode(jsonEncode(data));

    //String url = 'https://andromina-crew.herokuapp.com/users/api-token-auth/';
    //String url = 'http://andromina-crew.herokuapp.com/users/detail/';
    String url = Api.baseUrl+'/users/api-token-auth/';
    var response = await http.post(Uri.parse(url), headers: {
      "Content-Type": "application/json; charset=utf-8",
      "Access-Control-Allow-Origin": "*",
    }, body: body).timeout(const Duration(seconds: 15));
     if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }

  }


  static setToken(String token, String refreshToken) async {

    _AuthData data = _AuthData(token, refreshToken);
    await SESSION.set('tokens', data);
  }


  static Future<Map<String, dynamic>> getToken() async {
    return await SESSION.get('tokens');
  }

  static removeToken()async {
    await SESSION.prefs.clear();
  }
}

class _AuthData {
  String token, refreshToken;
  _AuthData(this.token, this.refreshToken);

  // toJson
  // required by Session lib
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['token'] = token;
    data['refreshToken'] = refreshToken;
    return data;
  }
}
