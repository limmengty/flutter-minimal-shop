import 'package:ass_minimal_shop/services/cache_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

class Cart extends StatelessWidget {
  const Cart({
    Key? key,
    required this.title,
    required this.image,
    required this.price,
  }) : super(key: key);

  final String title;
  final String image;
  final String price;

  @override
  Widget build(BuildContext context) {
    // final cart = context.watch<CacheLogic>().cart;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: SizedBox(
                width: 88,
                child: AspectRatio(
                  aspectRatio: 0.88,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.network(image),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              // Add Expanded to ensure Column takes available space
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: kDefaultFontSize,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis, // Add overflow handling
                  ),
                  const SizedBox(height: 8),
                  Text.rich(
                    TextSpan(
                      text: price,
                      style: titleStyle,
                      children: const [
                        TextSpan(
                          text: " x 1",
                          style: titleStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
