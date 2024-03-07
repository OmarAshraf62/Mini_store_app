import 'package:fake_store_app/consts/global_colors.dart';
import 'package:fake_store_app/widgets/appbar_icon.dart';
import 'package:fake_store_app/widgets/latest_products_widget.dart';
import 'package:fake_store_app/widgets/search_field_widget.dart';
import 'package:fake_store_app/widgets/swiper_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/foundation.dart';
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
          child: Column(
            children: [
              const SizedBox(
                height: 18,
              ),
              SearchFieldWidget(textEditingController: _textEditingController),
              SwiperWidget(size: size),
              LatestProducts(function: () {}),
              SizedBox(
                width: 180,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).cardColor,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {},
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 5, right: 5, top: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: RichText(
                                      text: TextSpan(
                                        text: "\$",
                                        style: const TextStyle(
                                          color:
                                              Color.fromRGBO(33, 150, 243, 1),
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '169.00',
                                              style: TextStyle(
                                                color: lightTextColor,
                                                fontWeight: FontWeight.w600,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Icon(IconlyBold.heart),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: FancyShimmerImage(
                                imageUrl: 'https://i.ibb.co/vwB46Yq/shoes.png',
                                height: size.height * 0.2,
                                width: double.infinity,
                                boxFit: BoxFit.fill,
                                errorWidget: const Icon(
                                  IconlyBold.danger,
                                  color: Colors.red,
                                  size: 22,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Titiel',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.001,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
