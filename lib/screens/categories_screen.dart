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
        child: GridView.builder(
          itemCount: 8,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.99,
            crossAxisSpacing: 15,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) => const CategoryItem(),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
  });

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
            imageUrl:
                'https://media.istockphoto.com/id/955641488/photo/clothes-shop-costume-dress-fashion-store-style-concept.jpg?s=2048x2048&w=is&k=20&c=8CBZ5nB9gJO1Y5rfsYx-xR4Lkb8TCHQz8BpHT5rm31c=',
            height: size.height * 0.45,
            width: size.width * 0.45,
            boxFit: BoxFit.cover,
          ),
        ),
        const Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "Clothes",
              style: TextStyle(
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
