import 'package:fake_store_app/widgets/products_gridview.dart';
import 'package:flutter/material.dart';

class LatestProductsScreen extends StatelessWidget {
  const LatestProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latest Products'),
        centerTitle: true,
      ),
      body: const Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: ProductsGridViewWidget(
              itemsCount: 10,
              isScrollable: true,
            ),
          ),
        ],
      ),
    );
  }
}
