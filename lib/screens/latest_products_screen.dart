import 'dart:developer';

import 'package:fake_store_app/helpers/api_helper.dart';
import 'package:fake_store_app/models/product_model.dart';
import 'package:fake_store_app/widgets/products_gridview.dart';
import 'package:flutter/material.dart';

class LatestProductsScreen extends StatefulWidget {
  const LatestProductsScreen({super.key});
  @override
  State<LatestProductsScreen> createState() => _LatestProductsScreenState();
}

class _LatestProductsScreenState extends State<LatestProductsScreen> {
  final ScrollController scrollController = ScrollController();
  List<ProductModel> productList = [];
  bool isLimit = false;
  bool isLoading = false;
  int limit = 10;
  @override
  void initState() {
    getProducts();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> getProducts() async {
    List temp = await Api.get(target: 'products', limit: limit.toString());
    productList = ProductModel.productsFromSnapShot(temp);
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        isLoading = true;
        limit += 10;
        if (limit == 50) {
          isLimit = true;
          setState(() {});
          return;
        }
        log('limit ${limit.toString()}');
        await getProducts();
        isLoading = false;
        setState(() {});
      }
    });
  }

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
            child: productList.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      children: [
                        ProductsGridViewWidget(
                          showAllItems: true,
                          isScrollable: false,
                          products: productList,
                          itemsCount: productList.length,
                        ),
                        if (!isLimit)
                          const Center(
                            child: CircularProgressIndicator(),
                          ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
