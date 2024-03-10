import 'dart:convert';
import 'dart:developer';

import 'package:fake_store_app/consts/api_consts.dart';
import 'package:fake_store_app/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductsService {
  
  static Future<void> getAllProducts() async {
    Uri uri = Uri.https(
    BASE_URL,
    'api/v1/products',
  );
    List<ProductModel> products = [];
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      List<dynamic> productsList = jsonDecode(response.body);
      for (int i = 0; i < productsList.length; i++) {
        products.add(ProductModel.fromJson(productsList[i]));
      }
      log(products.toString());
    } else {
      throw Exception('404 error');
    }
  }
}
