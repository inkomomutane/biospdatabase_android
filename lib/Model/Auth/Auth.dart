import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class Auth {
  static Future<bool> connection() async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'GET', Uri.parse('https://www.biosp.sumburero.org/api/connected'));
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var connected = await response.stream.bytesToString();
        if ("1" == connected) return true;
        return false;
      }
    } catch (e) {
      return false;
    }

    return false;
  }

  static Future<bool> session(String email, String password) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'POST', Uri.parse('https://www.biosp.sumburero.org/api/login'));
    request.body = json.encode({"email": email, "password": password});
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var token = await response.stream.bytesToString();
        Hive.box("token").put("token", (json.decode(token)['token'] as String));
        return true;
      }
    } catch (e) {
      return false;
    }

    return false;
  }
}
