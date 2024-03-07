import 'package:fake_store_app/widgets/product_item.dart';
import 'package:flutter/material.dart';

class ProductsGridViewWidget extends StatelessWidget {
  const ProductsGridViewWidget({
    super.key,
    this.showAllItems,
    required this.itemsCount,
    required this.isScrollable,
  });
  final bool? showAllItems;
  final int itemsCount;
  final bool isScrollable;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: showAllItems ?? false,
      physics: isScrollable
          ? const AlwaysScrollableScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      itemCount: itemsCount,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        childAspectRatio: 0.65,
      ),
      itemBuilder: (context, index) => const ProductItemWidget(),
    );
  }
}
