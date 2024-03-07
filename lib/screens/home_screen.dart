import 'package:fake_store_app/widgets/appbar_icon.dart';
import 'package:fake_store_app/widgets/latest_products_widget.dart';
import 'package:fake_store_app/widgets/product_item.dart';
import 'package:fake_store_app/widgets/search_field_widget.dart';
import 'package:fake_store_app/widgets/swiper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _textEditingController;
  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

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
            function: () {},
            icon: IconlyBold.category,
          ),
          title: const Text('Home'),
          centerTitle: true,
          actions: [
            AppBarIcons(
              function: () {},
              icon: IconlyBold.user3,
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
                    textEditingController: _textEditingController),
                SwiperWidget(size: size),
                LatestProducts(function: () {}),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    childAspectRatio: 0.6,
                  ),
                  itemBuilder: (context, index) => const ProductItemWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
