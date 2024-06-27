import 'package:flutter/material.dart';
import '../constants.dart';

class ProductResponeCard extends StatelessWidget {
  const ProductResponeCard({Key? key, this.width = 300, this.aspectRetio = .66})
      : super(key: key);

  final double width, aspectRetio;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: .66,
            child: Container(
              decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                height: double.infinity,
                color: Theme.of(context).colorScheme.background,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
