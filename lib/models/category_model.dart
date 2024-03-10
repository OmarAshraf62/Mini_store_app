class CategoryModel {
  final int? id;
  String? name;
  String? image;
  final String? creationAt;
  String? updatedAt;

  CategoryModel(
      {this.id, this.name, this.image, this.creationAt, this.updatedAt});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      creationAt: json['creationAt'],
      updatedAt: json['updatedAt'],
    );
  }
  static List<CategoryModel> productsFromSnapShot(List categoryFromSnapShot) {
    return categoryFromSnapShot.map((data) {
      return CategoryModel.fromJson(data);
    }).toList();
  }
}
