import 'package:card_swiper/card_swiper.dart';
import 'package:fake_store_app/widgets/sale_widget.dart';
import 'package:flutter/material.dart';

class SwiperWidget extends StatelessWidget {
  const SwiperWidget({
    super.key,
    required this.size,
    required this.images,
  });

  final Size size;
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.25,
      child: Swiper(
        itemCount: images.length,
        autoplay: true,
        pagination: const SwiperPagination(
            builder: DotSwiperPaginationBuilder(
          color: Color.fromARGB(186, 229, 225, 225),
          activeColor: Colors.red,
        )),
        itemBuilder: (context, index) => SaleWidget(
          imageUrl: images[index],
        ),
      ),
    );
  }
}
