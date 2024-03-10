import 'package:fake_store_app/models/product_model.dart';
import 'package:fake_store_app/widgets/products_gridview.dart';
import 'package:flutter/material.dart';

class LatestProductsScreen extends StatefulWidget {
  const LatestProductsScreen({super.key, required this.products});
  final List<ProductModel> products;
  @override
  State<LatestProductsScreen> createState() => _LatestProductsScreenState();
}

class _LatestProductsScreenState extends State<LatestProductsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latest Products'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: widget.products.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ProductsGridViewWidget(
                    products: widget.products,
                    itemsCount: widget.products.length,
                    isScrollable: true,
                  ),
          ),
        ],
      ),
    );
  }
}
