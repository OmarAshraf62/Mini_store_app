import 'dart:convert';

import 'package:fake_store_app/consts/api_consts.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<dynamic> get(
      {required String target, String id=''}) async {
    Uri uri = Uri.https(
      BASE_URL,
      id.isNotEmpty?
      'api/v1/$target/$id':'api/v1/$target',

    );
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('404 error with Code: ${response.statusCode} & Error: ${jsonDecode(response.body)['message']}');
    }
  }
}
