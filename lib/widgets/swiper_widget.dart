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
        itemCount: 3,
        autoplay: true,
        pagination: const SwiperPagination(
            builder: DotSwiperPaginationBuilder(
          color: Color.fromARGB(186, 229, 225, 225),
          activeColor: Colors.red,
        )),
        itemBuilder: (context, index) => const SaleWidget(),
      ),
    );
  }
}
