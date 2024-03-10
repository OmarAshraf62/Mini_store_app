import 'package:fake_store_app/models/category_model.dart';

class ProductModel {
  final int id;
  String? title;
  int? price;
  String? description;
  List<String>? images;
  final String creationAt;
  String? updatedAt;
  CategoryModel? category;

  ProductModel(
      {required this.id,
      required this.creationAt,
      this.title,
      this.price,
      this.description,
      this.images,
      this.updatedAt,
      this.category});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    List<String>? extractedImages =
        (json['images'] as List<dynamic>).map((image) {
      // Removing unnecessary characters and spaces
      String imageUrl = image.replaceAll(RegExp(r'["\[\],\s]'), '');
      return imageUrl;
    }).toList();
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      images: extractedImages,
      creationAt: json['creationAt'],
      updatedAt: json['updatedAt'],
      category: json['category'] != null
          ? CategoryModel.fromJson(json['category'])
          : null,
    );
  }
  static List<ProductModel> productsFromSnapShot(List productsFromSnapShot) {
    return productsFromSnapShot.map((data) {
      return ProductModel.fromJson(data);
    }).toList();
  }
}
