import 'package:fake_store_app/models/product_model.dart';
import 'package:fake_store_app/screens/all_users_screen.dart';
import 'package:fake_store_app/screens/categories_screen.dart';
import 'package:fake_store_app/screens/latest_products_screen.dart';
import 'package:fake_store_app/services/products_service.dart';
import 'package:fake_store_app/widgets/appbar_icon.dart';
import 'package:fake_store_app/widgets/latest_products_widget.dart';
import 'package:fake_store_app/widgets/products_gridview.dart';
import 'package:fake_store_app/widgets/search_field_widget.dart';
import 'package:fake_store_app/widgets/swiper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _textEditingController;
  // List<ProductModel> products = [];
  @override
  void initState() {
    _textEditingController = TextEditingController();
    // getProducts();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  // @override
  // void didChangeDependencies() {
  //   getProducts();
  //   super.didChangeDependencies();
  // }

  // Future<void> getProducts() async {
  //   products = await ProductsService.getAllProducts();
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: AppBarIcons(
            function: () {
              Navigator.push(
                context,
                PageTransition(
                  child: const CategoriesScreen(),
                  type: PageTransitionType.fade,
                ),
              );
            },
            icon: IconlyBold.category,
          ),
          title: const Text('Home'),
          centerTitle: true,
          actions: [
            AppBarIcons(
              icon: IconlyBold.user3,
              function: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: const AllUsersScreen(),
                    type: PageTransitionType.fade,
                  ),
                );
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 18,
                ),
                SearchFieldWidget(
                  textEditingController: _textEditingController,
                ),
                const SizedBox(
                  height: 18,
                ),
                SwiperWidget(
                  size: size,
                ),
                LatestProducts(onPress: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: const LatestProductsScreen(),
                    ),
                  );
                }),
                FutureBuilder<List<ProductModel>>(
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
                        itemsCount: 4,
                        showAllItems: true,
                        isScrollable: false,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
