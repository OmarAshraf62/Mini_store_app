import 'package:fake_store_app/models/product_model.dart';
import 'package:fake_store_app/services/products_service.dart';
import 'package:fake_store_app/widgets/products_gridview.dart';
import 'package:flutter/material.dart';

class LatestProductsScreen extends StatefulWidget {
  const LatestProductsScreen({super.key});
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
            child: FutureBuilder<List<ProductModel>>(
              future: ProductsService.getAllProducts(),
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
                  return ProductsGridViewWidget(
                    products: snapshot.data!,
                    itemsCount: snapshot.data!.length,
                    isScrollable: true,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
