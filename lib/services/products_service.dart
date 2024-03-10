import 'dart:convert';

import 'package:fake_store_app/consts/api_consts.dart';
import 'package:fake_store_app/models/category_model.dart';
import 'package:fake_store_app/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductsService {
  static Future<dynamic> getService({required String target}) async {
    Uri uri = Uri.https(
      BASE_URL,
      'api/v1/$target',
    );
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('404 error');
    }
  }

  static Future<List<ProductModel>> getAllProducts() async {
    List temp = await getService(target: 'products');
    List<ProductModel> products = [];
    for (var data in temp) {
      products.add(ProductModel.fromJson(data));
    }
    return products;
  }

  static Future<List<CategoryModel>> getAllCategories() async {
    List temp = await getService(target: 'categories');
List<CategoryModel> category = [];
    for (var data in temp) {
      category.add(CategoryModel.fromJson(data));
    }
    return category;
  }

}
