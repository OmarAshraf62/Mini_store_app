
import 'package:fake_store_app/helpers/api_helper.dart';
import 'package:fake_store_app/models/category_model.dart';
import 'package:fake_store_app/models/product_model.dart';

class ProductsService {

  static Future<List<ProductModel>> getAllProducts({required String limit}) async {
    List temp = await Api.get(target: 'products',limit: limit);
    return ProductModel.productsFromSnapShot(temp);
  }
  static Future<ProductModel> getProductDetials(id) async {
    var temp = await Api.get(target: 'products',id:id.toString());
    return ProductModel.fromJson(temp);
  }

  static Future<List<CategoryModel>> getAllCategories() async {
    List temp = await Api.get(target: 'categories');
    return CategoryModel.productsFromSnapShot(temp);
  }
}
