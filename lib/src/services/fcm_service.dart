
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api.dart';
import 'package:andromina_crew_app/src/datamodels/fcm_device_model.dart';

class FCMService {
  static final SESSION = FlutterSession();

  Future<dynamic> registerFCM(FCMDevice fcmdevice) async {
    Map data = {
      'name':  fcmdevice.name,
      'registration_id': fcmdevice.registration_id,
      'device_id': fcmdevice.device_id,
      'active': fcmdevice.active,
      'type': fcmdevice.type,
    };
    var body = json.encode(data);
    dynamic _token = await FlutterSession().get("tokens");
    String url = Api.baseUrl+'/devices/';
    var response = await http.post(Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          'authorization': 'Token '+_token['token']
        },
        body: body)
        .timeout(const Duration(seconds: 15));
    print(response.body);
    if (response.statusCode == 200) {
      return FCMDevice.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
    } else {
      return 'ERROR: Could not create fcm device';
    }
  }
}