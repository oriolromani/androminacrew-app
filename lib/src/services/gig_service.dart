import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api.dart';
import 'package:andromina_crew_app/src/datamodels/gig_model.dart';
import 'package:intl/intl.dart';

class GigService {
  static final SESSION = FlutterSession();

  Future <List<GigModel>> getAllGig() async {
    dynamic _token = await FlutterSession().get("tokens");
    String url = Api.baseUrl+'/gigs/';
    var response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json; charset=utf-8",
      //"Access-Control-Allow-Origin": "*",
      'authorization': 'Token '+_token['token']
    }).timeout(const Duration(seconds: 15));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      return jsonResponse.map((data) => new GigModel.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occurred!');
    }
  }

  Future <GigModel> getGig(String id) async {
    dynamic _token = await FlutterSession().get("tokens");
    String url = Api.baseUrl+'/gigs/'+id;
    var response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json; charset=utf-8",
      //"Access-Control-Allow-Origin": "*",
      'authorization': 'Token '+_token['token']
    }).timeout(const Duration(seconds: 15));
    if (response.statusCode == 200) {
      var gig = GigModel.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      return gig;
    } else {
      throw Exception('Unexpected error occurred!');
    }
  }

}