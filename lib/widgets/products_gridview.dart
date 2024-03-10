import 'package:fake_store_app/models/product_model.dart';
import 'package:fake_store_app/widgets/product_item.dart';
import 'package:flutter/material.dart';

class ProductsGridViewWidget extends StatelessWidget {
  const ProductsGridViewWidget({
    super.key,
    this.showAllItems,
    required this.itemsCount,
    required this.isScrollable,
    required this.products, this.controller,
  });
  final bool? showAllItems;
  final int itemsCount;
  final bool isScrollable;
  final List<ProductModel> products;
  final dynamic controller;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      shrinkWrap: showAllItems ?? false,
      physics: isScrollable
          ? const AlwaysScrollableScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      itemCount: itemsCount,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (context, index) => products.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ProductItemWidget(
              product: products[index],
            ),
    );
  }
}
