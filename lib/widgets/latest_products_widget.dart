import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class LatestProducts extends StatelessWidget {
  const LatestProducts({
    super.key,
    required this.function,
  });
  final  Function()? function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 3),
      child: Row(
        children: [
          const Text(
            'Latest Products',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: function,
            icon: const Icon(
              IconlyBold.arrowRightSquare,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
