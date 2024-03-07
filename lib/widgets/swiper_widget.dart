import 'package:card_swiper/card_swiper.dart';
import 'package:fake_store_app/widgets/sale_widget.dart';
import 'package:flutter/material.dart';

class SwiperWidget extends StatelessWidget {
  const SwiperWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.25,
      child: Swiper(
        itemCount: 2,
        autoplay: true,
        autoplayDelay: 1,
        pagination: const SwiperPagination(
            builder: DotSwiperPaginationBuilder(
          color: Color.fromARGB(255, 85, 54, 54),
          activeColor: Colors.redAccent,
        )),
        itemBuilder: (context, index) => const SaleWidget(),
      ),
    );
  }
}
