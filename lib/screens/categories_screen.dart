import 'dart:developer';

import 'package:fake_store_app/models/category_model.dart';
import 'package:fake_store_app/services/products_service.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FutureBuilder<List<CategoryModel>>(
          future: ProductsService.getAllCategories(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text("Error happened ${snapshot.error}");
            } else if (snapshot.hasError) {
              return const Text("No Data yet");
            } else {
              log("users ${snapshot.data}");
              return GridView.builder(
                itemCount: 5,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.99,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) => CategoryItem(
                  category: snapshot.data![index],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
  });
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: FancyShimmerImage(
            errorWidget: const Icon(
              IconlyBold.danger,
              color: Colors.red,
              size: 22,
            ),
            imageUrl: category.image!,
            height: size.height * 0.45,
            width: size.width * 0.45,
            boxFit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              category.name!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                backgroundColor: Colors.white30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
