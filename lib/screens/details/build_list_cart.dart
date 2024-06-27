import 'package:ass_minimal_shop/models/product_model.dart';
import 'package:ass_minimal_shop/screens/details/components/color_dots.dart';
import 'package:ass_minimal_shop/screens/details/components/product_description.dart';
import 'package:ass_minimal_shop/screens/details/components/product_images.dart';
import 'package:ass_minimal_shop/screens/details/components/top_rounded_container.dart';
import 'package:flutter/material.dart';

class BuildListCart extends StatelessWidget {
  const BuildListCart({required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: product),
        TopRoundedContainer(
          color: Colors.transparent.withOpacity(.2),
          child: Column(
            children: [
              ProductDescription(
                product: product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Colors.transparent.withOpacity(.2),
                child: Column(
                  children: [
                    ColorDots(product: product),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
