

import 'dart:convert';

import 'package:fake_store_app/consts/api_consts.dart';
import 'package:http/http.dart' as http;

class Api{

  static Future<List> get({required String target}) async {
    Uri uri = Uri.https(
      BASE_URL,
      target,
    );
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      return  jsonDecode(response.body);
    } else {
      throw Exception('404 error ${response.statusCode}');
    }
  }
}