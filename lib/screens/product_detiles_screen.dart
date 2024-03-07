import 'package:card_swiper/card_swiper.dart';
import 'package:fake_store_app/consts/global_colors.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProductDetials extends StatelessWidget {
  const ProductDetials({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 18,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(IconlyBroken.arrowLeft)),
                const SizedBox(
                  height: 18,
                ),
                const Text(
                  'Shoes',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(
                      flex: 3,
                      child: Text(
                        'Addidasee shoo',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: RichText(
                        text: TextSpan(
                          text: "\$",
                          style: const TextStyle(
                            fontSize: 23,
                            color: Color.fromRGBO(33, 150, 243, 1),
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: '169',
                                style: TextStyle(
                                  color: lightTextColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: size.height * 0.4,
                  child: Swiper(
                    itemCount: 3,
                    
                    autoplay: true,
                    pagination: const SwiperPagination(
                        alignment: Alignment.bottomCenter,
                        builder: DotSwiperPaginationBuilder(
                          color: Colors.white,
                          activeColor: Colors.red,
                        )),
                    itemBuilder: (context, index) => FancyShimmerImage(
                      imageUrl: 'https://i.ibb.co/vwB46Yq/shoes.png',
                      boxFit: BoxFit.fill,
                      errorWidget: const Icon(
                        IconlyBold.danger,
                        color: Colors.red,
                        size: 22,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.0),
                  child: Text(
                    "Description",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                const Text(
                  "sdfjkajfkjadjfkljkavlkanklvndanewjnfnjadnjavndjvnandvnmsdfjkajfkjadjfkljkavlkanklvndanewjnfnjadnjavndjvnandvnmsdfjkajfkjadjfkljkavlkanklvndanewjnfnjadnjavndjvnandvnmsdfjkajfkjadjfkljkavlkanklvndanewjnfnjadnjavndjvnandvnmsdfjkajfkjadjfkljkavlkanklvndanewjnfnjadnjavndjvnandvnmsdfjkajfkjadjfkljkavlkanklvndanewjnfnjadnjavndjvnandvnmsdfjkajfkjadjfkljkavlkanklvndanewjnfnjadnjavndjvnandvnm,dvnmanj",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
